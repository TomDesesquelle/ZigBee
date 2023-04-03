//////////////////////////////////////////////////////////////////////////////////
// School: PHELMA
// Engineer: Axel Baldacchino | Tom Désesquelle | Anthony Teissier 
//
// Create Date: 24.03.2022 14:11:44
// Design Name: EI CODER
// Module Name: wrapper_EI_CODER
// Project Name: zigbee_project
// Tool Versions: VIVADO 2018.3
// Description: Wrapper EI + CODER
//
//
// Revision:
// Revision 0.01 - First Commit
//////////////////////////////////////////////////////////////////////////////////


module wrapper_EI_CODER #(
	parameter      DATA_SIZE_BIT  	=    3			, 
    	parameter      DATA_WIDTH 	=    2**DATA_SIZE_BIT
)(
	//input EI
    	input inClock         					,
    	input inReset         					,
    	input inWriteEnable   					,
	input [DATA_WIDTH - 1 : 0] inCPUdata       		,
	
	//output CODER
	output reg[3:0] o_sinI					, 
	output reg[3:0] o_sinQ
);


// wires between the two blocs
wire 	w_Empty  						;
wire 	w_Done 							;
wire 	w_Data 				;
wire 	w_ReadEnable 						;		

///// FIFO INSTANCE

inFIFO #(
    .FIFO_SIZE_BIT(10) 
) u_fifo (
    .inClock  	   (inClock					),
    .inReset       (inReset					),    
    .inReadEnable  (w_ReadEnable				),
    .inWriteEnable (inWriteEnable				), 
    .inData        (inCPUdata					),
    
    .outWriteCount (						),   
    .outReadCount  (						),
    .outReadError  (						),
    .outWriteError (						),
    .outFull       (						),
    .outEmpty      (w_Empty					),
    .outAlmostEmpty(						),
    .outAlmostFull (						),
    .outDone       (						),
    .outData       (w_Data					)
) ;
   

///// CODER INSTANCE

msk_modulator u_coder (
   .clk		(inClock					), 
   .reset	(inReset					), 
   .i_empty	(w_Empty					), 
   .i_data	(w_Data						), 
   .o_ready	(w_ReadEnable					),
   .o_sinI	(o_sinI						),
   .o_sinQ	(o_sinQ						)
);




endmodule
