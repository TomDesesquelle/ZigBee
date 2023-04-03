
module cordic( clock, o_angle, i_I, i_Q, reset, o_dir);
  
   input logic clock;
   input logic reset;
   output logic [15:0] o_angle; // to be discussed
   input logic [3:0] i_I;      // to be discussed
   input logic [3:0] i_Q;      // to be discussed
   output logic o_dir;
   
   //Iterations nb 
	logic c1; // logic variable active high when translation to quadrant 1 
	logic c2; // logic variable active high when translation to quadrant 1 
	logic  it; // logic variable for nb iterations
	reg [3:0] r_I_k; 
	reg [3:0] r_Q_k;
	reg [3:0] r_next_I; //add PA
	reg [3:0] r_next_Q; //add PA
	logic k;
	reg [15:0]  r_alpha;
	parameter itmax = 6;

	wire signed [15:0] atan_table [0:5];
		// ATAN TABLE 
	   assign atan_table[0] = 45; // 45.000 degrees -> atan(2^0)
	   assign atan_table[1] = 27; // 26.565 degrees -> atan(2^-1)
	   assign atan_table[2] = 14; // 14.036 degrees -> atan(2^-2)
	   assign atan_table[3] = 7;  // 7.018	 degrees -> atan(2^-3)
	   assign atan_table[4] = 3;  // 3.509  degrees -> atan(2^-4)
	   assign atan_table[5] = 2;  // 1.7545 degrees -> atan(2^-5)
	   
	typedef enum { IDLE, BEGIN_I, BEGIN_Q, SHIFT_REGISTER, CORDIC_ALGO, ITERATION_MAX, ADDER_SOUSTRACTOR} STATE; 
	STATE present_state = IDLE;
	STATE next_state = IDLE;

always_ff@(posedge clock,posedge reset)

begin
	if( reset)
		present_state <= IDLE;
	else
		present_state <= next_state;
end

always_comb
	begin

	unique case(present_state)
		
	IDLE:	begin
		//Instatiation of inputs, outputs
		o_angle=16'h00;
		r_alpha=16'h00;
		r_I_k = i_I;
		r_Q_k = i_Q;
		
		o_dir=1'b0;
		it=1'b0;
		c1=1'b0;
		c2=1'b0;
		k=1'b0;

		next_state=BEGIN_I;
		end
		
	BEGIN_I: begin
		if ( i_I==4'b0000) 
			begin
				if( i_Q[3]==0) begin
					o_angle= 90;
					end
				else if (i_Q[3]==1) begin
					o_angle=-90;// ou o_angle=270;
					end
				
				next_state= IDLE;
			end
		else
			begin
				if( i_I[3]==0)
				next_state = ITERATION_MAX;
				
				else if (i_I[3]==1)
				next_state = BEGIN_Q;
			end
		end	

	BEGIN_Q: begin
		if ( i_Q==4'b0000)
			begin
				if( i_I[3]==0)
					o_angle= 0;
				else if (i_I[3]==1)
					o_angle=180;
				
				next_state= IDLE;
			end
		else if(i_Q[3]==1)begin
				c1=1;
				end
				
		else if(i_Q[3]==0)begin	
				c2=1;	
				end
		
				next_state=ITERATION_MAX;
				// Inversion of I, Q values
 				r_I_k= (~r_I_k)+1 ; // modification   i_I= (~i_I)+1
				r_Q_k= (~r_Q_k)+1 ; // modification   i_Q= (~i_Q)+1
			
				
		end

	ITERATION_MAX: begin
		
		if(it > itmax) begin

			if(c1==1 ||c2==1)
			begin
				o_angle=r_alpha + 180;
			end
			else
			begin
			 	o_angle=r_alpha;	
			end

			next_state = IDLE;
		end
		else begin
			r_I_k = i_I;
			r_Q_k = i_Q;
			next_state = SHIFT_REGISTER;
		     end
	end
			
	SHIFT_REGISTER: begin
			if (k<it)
			begin
				r_I_k = r_I_k >> 1;
				r_Q_k = r_Q_k >> 1;
				k = k + 1;
				next_state = SHIFT_REGISTER;
			end
			else begin
				k = 0;
				next_state = ADDER_SOUSTRACTOR;
			end
	end	
	
	ADDER_SOUSTRACTOR: begin
			if(i_Q[3] == 1'b0) 
				begin
				r_next_I= i_I - r_Q_k;
				r_next_Q= i_Q + r_I_k;
				// r_alpha ? ==> utilisation du tableau arctan o_angle
				r_alpha = r_alpha - atan_table[it];
				end
			else 
				begin
				r_next_I= i_I + r_Q_k;
				r_next_Q= i_Q - r_I_k;
				// r_alpha ? ==> utilisation du tableau arctan o_angle
				r_alpha = r_alpha + atan_table[it];
				end
		it = it + 1;
		next_state = ITERATION_MAX;
		end
	endcase
end
endmodule

	

