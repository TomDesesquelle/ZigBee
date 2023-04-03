module first_iteration_cordic( clock, reset, o_angle, i_I, i_Q);
  
	input logic clock;
	input logic reset;
	output logic [15:0] o_angle;
	input logic [3:0] i_I;      
	input logic [3:0] i_Q;      
	
	reg [3:0] r_I_k; 
	reg [3:0] r_Q_k;
	reg [15:0]  r_alpha;
	reg [3:0] r_next_I;
	reg [3:0] r_next_Q;

	wire signed [15:0] atan_table [0:5];
		// ATAN TABLE 
	   assign atan_table[0] = 45; // 45.000 degrees -> atan(2^0)
	   assign atan_table[1] = 27; // 26.565 degrees -> atan(2^-1)
	   assign atan_table[2] = 14; // 14.036 degrees -> atan(2^-2)
	   assign atan_table[3] = 7;  // 7.018	 degrees -> atan(2^-3)
	   assign atan_table[4] = 3;  // 3.509  degrees -> atan(2^-4)
	   assign atan_table[5] = 2;  // 1.7545 degrees -> atan(2^-5)

	typedef enum { IDLE, CALCUL, END} STATE; 
	STATE present_state = IDLE;
	STATE next_state = IDLE;

	/////////////////////////////////////////////////////////////////////////////////////////////////

	always_ff@(posedge clock,posedge reset)

	begin //always_ff
		if( reset)
			present_state <= IDLE;
		else
			present_state <= next_state;
	end //always_ff

	///////////////////////////////////////////////////////////////////////////////////////////////

	always_comb 
	
	begin //always_comb

	unique case(present_state)

	IDLE: begin
		
		o_angle=16'h00;
		r_I_k = i_I;
		r_Q_k = i_Q;

		next_state = CALCUL;
	
	end

	CALCUL: begin

	if(i_Q[3]==1'b0) begin
		r_next_I = i_I - r_Q_k;
		r_next_Q = i_Q + r_I_k;
		r_alpha  = -atan_table[0];
		end

	else begin
		r_next_I = i_I + r_Q_k;
		r_next_Q = i_Q - r_I_k;
		r_alpha  = atan_table[0];
		end

	next_state = END;

	end

	END: begin
		o_angle = r_alpha;
	end

	endcase
end //always_comb
	

endmodule
