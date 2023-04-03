`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 17.03.2022 16:05:32
// Design Name:
// Module Name: tb_AMBA
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

 
module tb_FIFO2();

    parameter DATA_WIDTH =  4      ;
    parameter ADDR_WIDTH =  2      ; 
    parameter CLK_PERIOD = 20    ; 	// 50 MHz

    reg                   clk      ;
    reg			  reset	   ;
    reg			  readEN   ;
    reg			  writeEN  ;
    reg			  inData   ;


initial begin : init
	clk     = 1'b1 ;
	reset   = 1'b1 ;
	inData  = 1'b0 ;
	writeEN = 1'b0 ;
	readEN  = 1'b0 ;
end
 

always #10 	clk = ~clk ;


initial begin : RESET
	for(int i = 0; i < 5; i++) begin
		reset = 1'b0 ;
		#CLK_PERIOD ;	
	end
	reset = 1'b1 ;
end


initial begin : WRITE

	/////////////////////////////////////////////////////////// B5 value
	for(int i = 0; i < 6; i++) begin
		#CLK_PERIOD ;	
	end
	writeEN = 1'b1 ;
	inData  = 1'b1; 
	#CLK_PERIOD writeEN = 1'b0;
	
	for(int i = 0; i < 6; i++) begin
		#CLK_PERIOD ;	
	end
	writeEN = 1'b1 ;
	inData  = 1'b0;
	#CLK_PERIOD writeEN = 1'b0;

	for(int i = 0; i < 6; i++) begin
		#CLK_PERIOD ;	
	end
	writeEN = 1'b1 ;
	inData = 1'b1;
	#CLK_PERIOD writeEN = 1'b0;

	for(int i = 0; i < 6; i++) begin
		#CLK_PERIOD ;	
	end
	writeEN = 1'b1 ;
	inData = 1'b0;
	#CLK_PERIOD writeEN = 1'b0;

	for(int i = 0; i < 6; i++) begin
		#CLK_PERIOD ;	
	end
	writeEN = 1'b1 ;
	inData = 1'b1;
	#CLK_PERIOD writeEN = 1'b0;

	for(int i = 0; i < 6; i++) begin
		#CLK_PERIOD ;	
	end
	writeEN = 1'b1 ;
	inData = 1'b1;
	#CLK_PERIOD writeEN = 1'b0;

	for(int i = 0; i < 6; i++) begin
		#CLK_PERIOD ;	
	end
	writeEN = 1'b1 ;
	inData = 1'b0;
	#CLK_PERIOD writeEN = 1'b0;

	for(int i = 0; i < 6; i++) begin
		#CLK_PERIOD ;	
	end
	writeEN = 1'b1 ;
	inData = 1'b1;
	#CLK_PERIOD writeEN = 1'b0;


	////////////////////////////////////////////////////////// FE value

	for(int i = 0; i < 6; i++) begin
		#CLK_PERIOD ;	
	end
	writeEN = 1'b1 ;
	inData  = 1'b0; 
	#CLK_PERIOD writeEN = 1'b0;
	
	for(int i = 0; i < 6; i++) begin
		#CLK_PERIOD ;	
	end
	writeEN = 1'b1 ;
	inData  = 1'b1;
	#CLK_PERIOD writeEN = 1'b0;

	for(int i = 0; i < 6; i++) begin
		#CLK_PERIOD ;	
	end
	writeEN = 1'b1 ;
	inData = 1'b1;
	#CLK_PERIOD writeEN = 1'b0;

	for(int i = 0; i < 6; i++) begin
		#CLK_PERIOD ;	
	end
	writeEN = 1'b1 ;
	inData = 1'b1;
	#CLK_PERIOD writeEN = 1'b0;

	for(int i = 0; i < 6; i++) begin
		#CLK_PERIOD ;	
	end
	writeEN = 1'b1 ;
	inData = 1'b1;
	#CLK_PERIOD writeEN = 1'b0;

	for(int i = 0; i < 6; i++) begin
		#CLK_PERIOD ;	
	end
	writeEN = 1'b1 ;
	inData = 1'b1;
	#CLK_PERIOD writeEN = 1'b0;

	for(int i = 0; i < 6; i++) begin
		#CLK_PERIOD ;	
	end
	writeEN = 1'b1 ;
	inData = 1'b1;
	#CLK_PERIOD writeEN = 1'b0;

	for(int i = 0; i < 6; i++) begin
		#CLK_PERIOD ;	
	end
	writeEN = 1'b1 ;
	inData = 1'b1;
	#CLK_PERIOD writeEN = 1'b0;


end



initial begin : READ
	for(int i = 0; i < 150; i++) begin
		#CLK_PERIOD ;	
	end
	readEN = 1'b1 ;             
	#CLK_PERIOD readEN = 1'b0 ;


	for(int i = 0; i < 10; i++) begin
		#CLK_PERIOD ;	
	end
	readEN = 1'b1 ;          
	#CLK_PERIOD readEN = 1'b0 ;

end



outFIFO u_fifo (
    .inClock       (clk)   	,
    .inReset       (reset) 	,    
    .inReadEnable  (readEN)   	,
    .inWriteEnable (writeEN)  	, 
    .inData        (inData)     ,
    
    .outWriteCount ()  		,   
    .outReadCount  ()   	,
    .outReadError  ()   	,
    .outWriteError ()  		,
    .outFull       ()        	,
    .outEmpty      ()       	,
    .outAlmostEmpty() 		,
    .outAlmostFull ()  		,
    .outDone       ()        	,
    .outData       ()
    ) ;


/*
AMBA #() cpu(
    .PCLK    (PCLK   ),
    .PRESET  (PRESET ),
    .PENABLE (PENABLE),
    .PnR_W   (PnR_W  ),
    .PWDATA  (PWDATA ),
    .PADDR   (PADDR  ),
    .PREADY  (PREADY ),
    .PRDATA  (PRDATA )
) ;
*/

endmodule

