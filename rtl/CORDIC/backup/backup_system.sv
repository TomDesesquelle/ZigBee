module system(i_enable_in, i_I, i_Q, o_enable_out, o_dir, reset, clock);

   	input logic clock;
   	input logic reset;
	input logic   i_enable_in;
   	input logic [3:0] i_I;     
   	input logic [3:0] i_Q;

	output logic o_enable_out;
	output logic o_dir;

	wire unsigned [15:0] cordic_to_rotation;

	reg signed [3:0] I;
	reg signed [3:0] Q;

	typedef enum bit[1:0]{ IDLE, WAIT_ENABLE_IN, ACTIVATE_ENABLE_OUT} STATE; 
	STATE present_state, next_state;

	//////////////////////////////////////////////////// The system is composed of cordic block & rotation block

	cordic_block mycordic (
		.o_angle(cordic_to_rotation), 
		.i_I    (I                 ), 
		.i_Q    (Q                 ), 
		.reset  (reset             ), 
		.clock  (clock             )
	);

	rotation my_rotation (
		.i_angle(cordic_to_rotation), 
		.o_dir  (o_dir             ), 
		.reset  (reset             ), 
		.clock  (clock             )
	);
	
	//////////////////////////////////////////////////// FINITE STATE MACHINE TO GENERATE ENABLE_OUT

	always_ff@(posedge clock) begin

		if(reset) begin
			present_state <= IDLE; 			
		end else begin
			present_state <= next_state;
		end

	end

	always @(posedge clock) begin

		next_state=present_state;

		case(present_state)
			IDLE: begin
				//o_enable_out = 1'b0;
				I = 1'b0;
				Q = 1'b0;
				next_state = WAIT_ENABLE_IN;
			end

			WAIT_ENABLE_IN: begin
				//o_enable_out = 1'b0;
				if(i_enable_in == 1'b1) begin
					I = i_I;
					Q = i_Q;
					next_state = ACTIVATE_ENABLE_OUT;
				end else begin
					next_state = WAIT_ENABLE_IN;
				end
			end

			ACTIVATE_ENABLE_OUT: begin
				//o_enable_out = 1'b1;
				next_state = WAIT_ENABLE_IN;
			end

			default: begin
				//o_enable_out = 1'b0;
				I = 1'b0;
				Q = 1'b0;
				next_state = IDLE;
			end

		endcase

		assign o_enable_out = (present_state==ACTIVATE_ENABLE_OUT);
	end

endmodule
