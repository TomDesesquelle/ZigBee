   module decoder_cordic_cdr (input logic i_clk,
			      input logic 		   i_rst_n,
			      input logic 		   i_adc_eoc,// pulse when sample is ready
			      input logic [3:0] 	   i_I_if,
			      input logic [3:0] 	   i_Q_if,
			      output logic 		   o_data,
			      output logic 		   o_cdr_flag  );


   

   // == Variables Declaration ====================================================
   wire signed [3:0] 			   I_BB_postfilter;
   wire signed [3:0] 			   Q_BB_postfilter;
   wire 				   postfilter_ready;
   wire 				   dir;
   wire 				   cordic_ready;
   

      
      

   // == Instanciation ====================================================

   decoder_top decoder_top(i_clk,
			   i_rst_n,
			   i_adc_eoc,
			   i_I_if,
			   i_Q_if,
			   I_BB_postfilter,
			   Q_BB_postfilter,
			   postfilter_ready);



   system my_system(.i_I(I_BB_postfilter),
		    .i_Q(Q_BB_postfilter),
		    .i_enable_in(postfilter_ready),
		    .o_dir(dir),
		    .o_enable_out(cordic_ready),
		    .reset(i_rst_n),
		    .clock(i_clk));

   cdr cdr(i_clk,
	   i_rst_n,
	   dir,
	   o_data,
	   cordic_ready,
	   o_cdr_flag);
   
   


   // == Main Code ================================================================


   
endmodule
