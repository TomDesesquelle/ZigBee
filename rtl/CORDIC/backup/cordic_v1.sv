
module cordic( clock, o_angle, i_I, i_Q, reset, o_dir);
  
   input logic clock;
   input logic reset;
   output logic [15:0] o_angle; 
   input logic [3:0] i_I;     
   input logic [3:0] i_Q;      
   
   
   //Iterations nb 
	logic c1; // logic variable active high when translation to quadrant 1 
	logic c2; // logic variable active high when translation to quadrant 1 
	logic [2:0] counter, next_counter;
	logic [2:0] iteration, next_iteration;
	reg [3:0] r_I_k; 
	reg [3:0] r_Q_k;
	reg [3:0] r_next_I,r_present_I; 
	reg [3:0] r_next_Q,r_present_Q; 	
	reg [15:0] r_present_alpha, r_next_alpha;
	parameter itmax = 6;

	

	wire signed [15:0] atan_table [0:5];
		// ATAN TABLE 
	   assign atan_table[0] = 45; // 45.000 degrees -> atan(2^0)
	   assign atan_table[1] = 27; // 26.565 degrees -> atan(2^-1)
	   assign atan_table[2] = 14; // 14.036 degrees -> atan(2^-2)
	   assign atan_table[3] = 7;  // 7.018	 degrees -> atan(2^-3)
	   assign atan_table[4] = 3;  // 3.509  degrees -> atan(2^-4)
	   assign atan_table[5] = 2;  // 1.7545 degrees -> atan(2^-5)
	   
	typedef enum { IDLE, BEGIN_I, BEGIN_Q, SHIFT_REGISTER, CORDIC_ALGO, ITERATION_MAX, ADDER_SOUSTRACTOR,END} STATE; 
	STATE present_state = IDLE;
	STATE next_state = IDLE;

always_ff@(posedge clock,posedge reset)

begin
	if( reset) begin
		present_state <= IDLE; 
		counter<=0;
		r_present_I<=i_I;
		r_present_Q<=i_Q;
		iteration<=0;
		r_present_alpha<=0;
		end
	else begin
		iteration<=next_iteration;
		counter<=next_counter;
		r_present_I<= r_next_I;
		r_present_Q<= r_next_Q;
		r_present_alpha <=r_next_alpha;
		present_state <= next_state;
	 end

	
end

always_comb
	begin

	next_counter=counter;
	next_state=present_state;
	next_iteration=iteration;
	r_next_I= r_present_I;
	r_next_Q= r_present_Q;
	r_next_alpha= r_present_alpha;

	unique case(present_state)
		
	IDLE:	begin
		//Instatiation of inputs, outputs

		// I and Q input signals recuperation
		r_next_I=i_I;
		r_next_Q=i_Q;
		r_I_k = i_I;
		r_Q_k = i_Q;

		// Reset reg ans logic variables
		o_angle=16'hffff;
		r_next_alpha=16'h00;
		next_counter=0;
		next_iteration=0;
		o_dir=1'b0;
		c1=1'b0;
		c2=1'b0;

		next_state=BEGIN_I;

		end
		
	BEGIN_I: begin
		if ( r_present_I==4'b0000) 
			begin
				if( r_present_Q[3]==1) begin
					o_angle=-90;// ou o_angle=270;
					end
				else if (r_present_Q[3]==0) begin
					o_angle=90;
					end
				
				next_state= END;
			end
	
		else if ( r_present_Q==4'b0000)
			begin
				if( r_present_I[3]==1) begin
					o_angle=180; end
				else if (r_present_I[3]==0) begin
					o_angle=0; end
				next_state= END;
			end
	
 		else // Q=0 I=7=0111 angle =0
			begin
				if( r_present_I[3]==0)
					next_state = ITERATION_MAX;
				
				else if (r_present_I[3]==1)
					next_state = BEGIN_Q;
			end	
		end
	BEGIN_Q: begin
		
		if(r_present_Q[3]==1)begin
				c1=1;// quadrant 1
				next_state=ITERATION_MAX;
 				r_next_I= (~r_I_k)+1 ; // modification   i_I= (~i_I)+1
				r_next_Q= (~r_Q_k)+1 ; // modification   i_Q= (~i_Q)+1	
				end
				
		else if(r_present_Q[3]==0)begin	
				c2=1;	// quadrant 2
				next_state=ITERATION_MAX;
				// Inversion of I, Q values
		 		r_next_I= (~r_I_k)+1 ; // modification   i_I= (~i_I)+1
				r_next_Q= (~r_Q_k)+1 ; // modification   i_Q= (~i_Q)+1	
				end
		
		
				
		end

	ITERATION_MAX: begin
		
		if(iteration >= itmax) begin

			if(c1==1)
			begin
				o_angle = -180 + r_present_alpha; 
			end

			else if(c2==1) begin
				o_angle = 180 + r_present_alpha; 
			end

			else
			begin
			 	o_angle = r_present_alpha;	
			end

			next_state = END;
		end
		else begin
			r_I_k = r_present_I;
			r_Q_k = r_present_Q;
			//it=it+1; // it=0
			next_state = SHIFT_REGISTER;
		     end
	end
			
	SHIFT_REGISTER: begin
			if (counter<iteration) // counter varies from 0 to 5 
			begin
				r_I_k = r_I_k >> 1;
				r_Q_k = r_Q_k >> 1;
				next_counter = counter + 1; // OK
				next_state = SHIFT_REGISTER;
			end
			else if (counter>=iteration)begin
				next_counter=0;
				next_state = ADDER_SOUSTRACTOR;
			end
			
	end	
	
	ADDER_SOUSTRACTOR: begin
			if(r_present_Q[3] == 1'b0) 
				begin
				r_next_I= r_present_I + r_Q_k;
				r_next_Q= r_present_Q - r_I_k;
				// r_alpha ? ==> utilisation du tableau arctan o_angle
				r_next_alpha = r_present_alpha + atan_table[iteration];
				end
			else 
				begin
				r_next_I= r_present_I - r_Q_k;
				r_next_Q= r_present_Q + r_I_k;
				// r_alpha ? ==> utilisation du tableau arctan o_angle
				r_next_alpha = r_present_alpha - atan_table[iteration];
				end
		
		next_iteration = iteration + 1;
		next_state = ITERATION_MAX;
		end
	END: begin
		//o_angle = r_present_alpha;
		next_state=IDLE;
		end
	default: begin 
		next_state=END;
		end
	endcase
end
endmodule

	

