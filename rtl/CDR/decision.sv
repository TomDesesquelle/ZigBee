// Verilog: port and variable declarations in module definition
module decision(
	input    	i_dir,
	input 		i_rst,
	input		i_clk,
	input reg [5:0]	i_nb_P,
	input reg [1:0]	i_cnt_d,
	output logic	o_data,
	input logic 	i_flag,
	output logic 	o_flag
        );

reg [5:0] cnt_r;

//wire declaration
wire 	w_en_d, w_en_m, w_en_f, w_en, w_en_freq_synch; 
wire 	w_en_dec, w_s_r;	//counter out wire
wire 	w_m_r; 			//mux out wire


//retard sur flag
assign w_m_r = (i_flag || o_flag) ? i_flag : w_s_r;

ffd ffd_retard (w_m_r, i_clk, i_rst, w_s_r);

always_ff@(posedge i_clk) begin
	if (i_rst == 1'b0) begin
		o_flag <= 1'b0;
		cnt_r <= 1'b0;
	end
	else begin
		o_flag <= 1'b0;
		if((cnt_r == (((i_nb_P-1)/2)+2)) && (w_s_r == 1) && (i_cnt_d == 3)) begin
			o_flag <= 1'b1;
		end
		if(cnt_r == i_nb_P-1) begin
			cnt_r <= 1'b0;
		end
		else begin
			if(i_cnt_d == 3) begin
				cnt_r <= cnt_r + 1;
			end
		end
	end
end

//counter instanciation
counter cnt_dec (i_clk, i_rst, i_nb_P, i_cnt_d, w_en_d, w_en_m, w_en_f, w_en, w_en_freq_synch, w_en_dec);


always_ff @(posedge i_clk) // sur les fronts montants de i_clk
begin
	if (i_rst == 1'b0) begin // si le reset est actif
		o_data <= 1'b0;
	end
	else begin // si le reset est desactivé
		if (i_cnt_d == 1'b0) begin
			o_data <= 1'b0;
		end
		else begin 
			if (w_en_dec) begin // sur chaque front montant de la fréquence d'échantillonnage modifiée
				o_data <= ~i_dir; 
			end
		end
	end
	
end
endmodule
