module zigbee_RX #(
 			       parameter DATA_SIZE_BIT  	=    2,
			       parameter DATA_WIDTH     	=    2**DATA_SIZE_BIT,  
			       parameter FIFO_SIZE_BIT  	=    7,
			       parameter FIFO_WIDTH 		=   2**FIFO_SIZE_BIT
			       )(input logic i_clk,
				 input logic 		   i_rst_n,
				 input logic 		   i_adc_eoc,// pulse when sample is ready
				 input logic [3:0] 	   i_I_if,
				 input logic [3:0] 	   i_Q_if,
				 input logic readEN,

				 //out fifo
				 output [FIFO_SIZE_BIT	:0] 	outWriteCount  ,   
				 output [FIFO_SIZE_BIT-1 :0]   	outReadCount   ,
				 output                  	outReadError   ,
				 output                  	outWriteError  ,
				 output                  	outFull        ,
				 output                  	outEmpty       ,
				 output                  	outAlmostEmpty ,
				 output                  	outAlmostFull  ,
				 output                  	outDone        ,  	
				 output [DATA_WIDTH-1:0] 	outData	);


   

   // == Variables Declaration ====================================================
   wire signed [3:0] 						I_BB_postfilter;
   wire signed [3:0] 						Q_BB_postfilter;
   wire 							postfilter_ready;
   wire 							dir;
   wire 							cordic_ready;
   wire 							cdr_data;
   wire 							cdr_flag;
   
   

   
   

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
	   cdr_data,
	   cordic_ready,
	   cdr_flag);
   
   outFIFO #(
	     .FIFO_SIZE_BIT  (7		)
	     ) u_fifo (
		       .inClock	(i_clk		),   	// (50 MHz)
    		       .inReset	(i_rst_n		),    
    		       .inReadEnable	(readEN	        ), 	// Handcheck --> Antho & Bruno
    		       .inWriteEnable	(cdr_flag		),   	// PREADY from CPU
    		       .inData		(cdr_data		),    	// CDR --> Elisabeth et Alexandre
		       
    		       .outWriteCount	(		),   
    		       .outReadCount	(		),
    		       .outReadError	(		),
    		       .outWriteError	(		),
    		       .outFull	(		),
    		       .outEmpty	(		),
    		       .outAlmostEmpty	(		),
    		       .outAlmostFull	(		),
    		       .outDone	(		),	  	
    		       .outData	(		)	// CPU
		       ) ;




   
endmodule
