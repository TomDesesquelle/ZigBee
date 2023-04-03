module rotation( clock, reset, i_angle, o_dir);
  
   	input logic clock;
   	input logic reset;
	input logic [15:0] i_angle; 
  	output logic o_dir; 
	reg signed [15:0] previous_angle;
	reg signed [15:0] present_angle [1:0];
	logic next_direction, present_direction;
	reg signed [15:0] present_delta, next_delta;
	reg signed [15:0] gamma;
	

always_ff@(posedge clock) 
begin
	if(reset == 1'b0) begin
			
		present_angle[0] <= 0;
		//o_dir<= present_direction <= 0;
		present_direction <= 1'b0;
		present_delta <= 16'b0000000000000000;
	end

	else begin
		present_angle[0] <= i_angle;
		present_angle[1] <= previous_angle;

		present_delta <= next_delta;

		present_direction <= next_direction;	
		//o_dir<= present_direction <= next_direction;	
	end
end

always_comb begin

	next_direction = 1'b0;
	next_delta = 16'b0000000000000000;

	next_delta=present_angle[0]-present_angle[1];

	if ( present_delta <0 )begin
		gamma= present_delta+360;
		
	end else begin
		gamma= present_delta;	
	end

	if (gamma<180) begin	
		if(gamma==0) begin
			next_direction=present_direction;
		end
		else begin		
			next_direction = 1'b1; // sens trigo
		end
	end
	else begin	
		next_direction=1'b0; // sens horaire
	end

	previous_angle = present_angle[0];
	o_dir=present_direction;

end 
endmodule

