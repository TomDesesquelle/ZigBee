module counter_decision (
	input 		i_clk,
	input 		i_rst,
	input reg [5:0]	i_nb_P,
	input reg [1:0]	i_cnt_d,
	output logic	o_en_dec
	);

reg [5:0] cnt_dec;

always_ff@(posedge i_clk) begin
	
	if(i_rst == 1'b0) begin
		cnt_dec <= 1'b0;
		o_en_dec <= 1'b0;
	end
	else begin
		o_en_dec <= 1'b0;
		if(i_cnt_d == 3) begin
			cnt_dec <= cnt_dec + 1;
		end

		if (cnt_dec == (i_nb_P-1)/2) begin
			o_en_dec <= 1'b1;
		end
		if (cnt_dec == i_nb_P-1) begin
			cnt_dec <= 1'b0;
		end
	end

end

endmodule
