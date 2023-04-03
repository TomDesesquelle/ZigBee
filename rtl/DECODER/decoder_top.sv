module decoder_top (input logic i_clk,
		 input logic 		   i_rst_n,
		 input logic 		   i_adc_eoc,// pulse when sample is ready
		 input logic [3:0] 	   i_I_if,
		 input logic [3:0] 	   i_Q_if,
		 output logic signed [3:0] o_I_BB,
		 output logic signed [3:0] o_Q_BB,
		 output logic 		   o_postfilter_ready);


   

   // == Variables Declaration ====================================================
   wire signed [7:0] 			   I_prefilter;
   wire signed [7:0] 			   Q_prefilter;
   wire logic 				   sample_ready;


   
   

   // == sin/cos Instanciation ====================================================

 

   iq_demod iq_demod(i_clk,
		     i_rst_n,
		     i_adc_eoc,
		     i_I_if,
		     i_Q_if,
		     I_prefilter,
		     Q_prefilter,
		     sample_ready);

   fir_filter fir_filter(i_clk,
			 i_rst_n,
			 sample_ready,
			 I_prefilter,
			 Q_prefilter,
			 o_I_BB,
			 o_Q_BB,
			 o_postfilter_ready);

   // == Main Code ================================================================


   
endmodule
