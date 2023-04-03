module counter(
	input 			i_clk,
	input 			i_rst,
	input reg [5:0] 	i_nb_P,
	input reg [1:0]		i_cnt_d,
	output reg 		o_en_d,		//1st sampling
	output reg 		o_en_m,		//2nd sampling
	output reg 		o_en_f,		//3rd sampling
	output reg 		o_en,       	//en : to enable sampling of T and E signals in phase detector
	output reg 		o_en_freq_synch,	//to enable modification of i_nb_P in divN
	output reg		o_en_dec
	);

reg [5:0] cnt;

always_ff@(posedge i_clk) begin
	
	if (i_rst == 1'b0) begin
		o_en_d <= 1'b0;
		o_en_m <= 1'b0;
		o_en_f <= 1'b0;
		o_en <= 1'b0;
		o_en_freq_synch <= 1'b0;
		o_en_dec <= 1'b0;
		cnt <= 1'b0;
	end
	else begin
		o_en <= 1'b0;
		o_en_m <= 1'b0;
		o_en_d <= 1'b0;
		o_en_f <=1'b0;
		o_en_freq_synch <= 1'b0;
		o_en_dec <= 1'b0;

		if (cnt == 1'b1) begin //1
			o_en_d <= 1'b1; //debut
		end
		

		if (cnt == (((i_nb_P-1)/2)-1)) begin //11
			o_en_m <= 1'b1; //milieu
		end

		if (cnt == (i_nb_P-1)/2) begin
			o_en_dec <= 1'b1;
		end

		if (cnt == i_nb_P-4) begin //21
			o_en_f <= 1'b1; //fin
		end

		if (cnt == i_nb_P-3) begin //22
			o_en <= 1'b1; // to enable sampling of T and E signals (=outputs of phase detector)
		end

		if (cnt == i_nb_P-2) begin //23
			o_en_freq_synch <= 1'b1;
		end
		
		if (cnt == i_nb_P-1) begin //24
			cnt <= 1'b0;
		end

		if((i_cnt_d == 3) && (cnt != i_nb_P-1)) begin
			cnt <= cnt + 1;
		end
	end
end
endmodule
