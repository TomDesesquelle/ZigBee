module cdr (
	input 		i_clk,
	input 		i_rst,
	input 		i_dir,
	output reg	o_data,

	input  		i_flag,
	output reg	o_flag
	);

reg [3:0] cnt_in; //permet de compter les i_flag
reg [1:0] cnt_d;
reg [2:0] cnt;
logic flag; //flag en entree du bloc de decision 
logic dir, dir_d, dir_m, dir_f; //w_mux_phase;
wire w_sT, w_sE;
wire [5:0] w_nb_P;

always_ff@(posedge i_clk) begin
	if(i_rst == 1'b0) begin
		cnt_in <= 1'b0;
		cnt_d <= 1'b0;
		cnt <= 1'b0;
		flag <= 1'b0;
		dir <= 1'b0;
		dir_d <= 1'b0;
		dir_m <= 1'b0;
		dir_f <= 1'b0;
	end
	else begin
		if(i_flag) begin
			flag <= 1'b0;
			if(cnt_in == 0) begin
				flag <= i_flag;
				if(cnt_d != 3) begin
					cnt_d <= cnt_d + 1;
				end
			end	
			if(cnt_in == 1) begin
				dir_d <= i_dir;
			end
			if(cnt_in == 2) begin
				dir_m <= i_dir;
			end
			if(cnt_in == 3) begin
				dir_f <= i_dir;
			end
			if(cnt_in == 4) begin
				dir <= ((dir_d & dir_m) | (dir_m & dir_f) | (dir_d & dir_f));
				flag <= 1'b1;
				if(cnt_d != 3) begin
					cnt_d <= cnt_d + 1;
				end
			end
			if(cnt_in == 5) begin
				cnt_in <= 1'b1;
			end
			else begin
				cnt_in <= cnt_in + 1;
			end
		end

		if (cnt == 4) begin
			flag <= 1'b0;
		end
		if (flag == 0) begin
			cnt <= 0;
		end
		else begin
			if((cnt_d == 3) && (flag)) begin
				cnt <= cnt + 1;
			end
		end
	end
end

div div1 (i_clk, i_rst, w_sT, w_sE, w_nb_P, cnt_d);
phase_detector phd1 (dir, w_nb_P, cnt_d, i_clk, i_rst, w_sT, w_sE);
decision dec1 (dir, i_rst, i_clk, w_nb_P, cnt_d, o_data, flag, o_flag);

endmodule






