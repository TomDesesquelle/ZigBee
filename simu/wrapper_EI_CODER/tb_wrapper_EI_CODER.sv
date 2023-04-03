`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 17.03.2022 16:05:32
// Design Name:
// Module Name: tb_wrapper_EI_CODER
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

 
module tb_wrapper_EI_CODER();

    parameter DATA_WIDTH     =  4    ;
    parameter ADDR_WIDTH     =  2    ;  
    parameter halfCLK_PERIOD = 10    ;
    parameter CLK_PERIOD   = 20    ;

    reg                   clk      ;
    reg			  reset	   ;
    reg			  writeEN  ;
    reg	[DATA_WIDTH-1:0]  inData   ;




initial begin : init
	clk  	= 1'b1 ;
	reset   = 1'b1 ;
	inData  = '0   ;
	writeEN = 1'b0 ;
end
 

always #(halfCLK_PERIOD) 	clk = ~clk ;


initial begin : RESET
	for(int i = 0; i < 5; i++) begin
		reset = 1'b0 ;
		#CLK_PERIOD ;	
	end
	reset = 1'b1 ;
end


initial begin : WRITE
	for(int i = 0; i < 6; i++) begin
		#CLK_PERIOD ;	
	end
	writeEN = 1'b1 ;
	inData = 4'b1011;                                                                  // B
	#CLK_PERIOD writeEN = 1'b0;
	
	for(int i = 0; i < 85; i++) begin
		#CLK_PERIOD ;	
	end

	for(int i = 0; i < 6; i++) begin
		#CLK_PERIOD ;	
	end
	writeEN = 1'b1 ;
	inData = 4'b1111;                                                                  // F
	#CLK_PERIOD writeEN = 1'b0;

	for(int i = 0; i < 6; i++) begin
		#CLK_PERIOD ;	
	end
	writeEN = 1'b1 ;
	inData = 4'b1110;                                                                  // E
	#CLK_PERIOD writeEN = 1'b0;

	for(int i = 0; i < 6; i++) begin
		#CLK_PERIOD ;	
	end
	writeEN = 1'b1 ;
	inData = 4'b0101;                                                                  // 5
	#CLK_PERIOD writeEN = 1'b0;

	for(int i = 0; i < 6; i++) begin
		#CLK_PERIOD ;	
	end
	writeEN = 1'b1 ;
	inData = 4'b1010;                                                                  // A
	#CLK_PERIOD writeEN = 1'b0;

	for(int i = 0; i < 6; i++) begin
		#CLK_PERIOD ;	
	end
	writeEN = 1'b1 ;
	inData = 4'b1000;                                                                  // 8  --> ERROR raise
	#CLK_PERIOD writeEN = 1'b0;
end




wrapper_EI_CODER u_EI_CODER (
	//input EI
    	.inClock	(clk	),
    	.inReset	(reset	),    
    	
    	.inWriteEnable	(writeEN),
	.inCPUdata 	(inData	),
	
	//CODER
	.o_sinI		(	),
	.o_sinQ		(	)	
) ;


endmodule 




