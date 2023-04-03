//////////////////////////////////////////////////////////////////////////////////
// School: PHELMA
// Engineer: Axel Baldacchino | Tom Désesquelle | Alexandre Scouarnec | Elisabeth Porret
//
// Create Date: 24.03.2022 14:11:44
// Design Name: EI CODER
// Module Name: wrapper_CDR_EI
// Project Name: zigbee_project
// Tool Versions: VIVADO 2018.3
// Description: Wrapper CDR + EI
//
//
// Revision:
// Revision 0.01 - First Commit
//////////////////////////////////////////////////////////////////////////////////


module wrapper_CDR_EI #(
 	parameter DATA_SIZE_BIT  	=    2,
	parameter DATA_WIDTH     	=    2**DATA_SIZE_BIT,  
	parameter FIFO_SIZE_BIT  	=    7,
	parameter FIFO_WIDTH 		=   2**FIFO_SIZE_BIT
)(
	//CDR INPUT
	input 				i_clk,
	input 				i_rst,
	input 				i_phase,
	input  				i_flag,

	//OUT FIFO OUTPUT
	input				inReadEnable   ,
	output [FIFO_SIZE_BIT	:0] 	outWriteCount  ,   
    	output [FIFO_SIZE_BIT-1 :0]   	outReadCount   ,
    	output                  	outReadError   ,
    	output                  	outWriteError  ,
    	output                  	outFull        ,
    	output                  	outEmpty       ,
    	output                  	outAlmostEmpty ,
    	output                  	outAlmostFull  ,
    	output                  	outDone        ,  	
    	output [DATA_WIDTH-1:0] 	outData		 // CPU
);


wire	w_data 		;
wire	w_flag 		;


///// FIFO INSTANCE

outFIFO #(
	.FIFO_SIZE_BIT  (2		)
) u_fifo (
	.inClock	(i_clk		),   	// (50 MHz)
    	.inReset	(i_rst		),    
    	.inReadEnable	(inReadEnable	), 	// Handcheck --> Antho & Bruno
    	.inWriteEnable	(w_flag		),   	// PREADY from CPU
    	.inData		(w_data		),    	// CDR --> Elisabeth et Alexandre
    
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
   

///// CDR INSTANCE
cdr u_cdr (
	.i_clk		  (i_clk		),
	.i_rst		  (i_rst		),
	.i_phase	  (i_phase		),
	.o_data		  (w_data		),

	.i_flag		  (i_flag		),
	.o_flag		  (w_flag		)
);





endmodule
