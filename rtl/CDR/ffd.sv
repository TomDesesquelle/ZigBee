module ffd (
	input		i_D,		//input data		
	input		i_clk,		//clock signal
	input 		i_rst,		//reset signal
	output	reg 	o_Q		//output data
	);

always_ff@(posedge i_clk)
begin
	if (i_rst == 1'b0) begin
		o_Q <= 1'b0;
	end
	else begin
		o_Q <= i_D ;
	end
end

endmodule
