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

 
module tb_AMBA();

    parameter DATA_WIDTH = 32 ;
    parameter ADDR_WIDTH =  2 ; 

    reg                   PCLK    ;
    reg                   PRESET  ;    
    reg                   PENABLE ;    
    reg                   PnR_W   ;    
    reg  [DATA_WIDTH-1:0] PWDATA  ;
    reg  [ADDR_WIDTH-1:0] PADDR   ; 
    reg                   PREADY  ;    
    reg  [DATA_WIDTH-1:0] PRDATA  ;


initial begin
   PCLK    	= 1'b1 	;
   PRESET 	= 1'b1 	;
   PENABLE 	= 1'b0 	;
   PnR_W   	= 1'b0 	;
   PWDATA  	=  'b0 	;
   PWDATA  	=  'b0 	;    
   PADDR        =    0  ;

   #5   PRESET  = 1'b0 	;
   #5   PENABLE = 1'b1	;
   #5   PENABLE = 1'b0  ;
   #40  PADDR   =    1  ;
        PENABLE = 1'b1  ;
   #5   PENABLE = 1'b0  ;
   #40  PADDR   =    2  ;
        PENABLE = 1'b1  ;	   
   #5   PENABLE = 1'b0  ;
   #40  PADDR   =    3  ;
        PENABLE = 1'b1  ;
   #5   PENABLE = 1'b0  ;
   #40  PADDR   =    0  ;
        PENABLE = 1'b1  ;
   #5   PENABLE = 1'b0  ;
	PnR_W   = 1'b1  ;
   #40  PADDR   =    0  ;
        PWDATA  =  'h35 ;
        PENABLE = 1'b1  ;
   #5   PENABLE = 1'b0  ;  
   #40  PADDR   =    1  ;
        PWDATA  =  'h72 ;
        PENABLE = 1'b1  ;
   #5   PENABLE = 1'b0  ;
   #40  PADDR   =    2  ;
        PWDATA  =  'h00 ;
        PENABLE = 1'b1  ;	   
   #5   PENABLE = 1'b0  ;
   #40  PADDR   =    3  ;
        PWDATA  =  'hAF ;
        PENABLE = 1'b1  ;
   #5   PENABLE = 1'b0  ;
	PnR_W   = 1'b0  ;
   #40  PADDR   =    2  ;
        PENABLE = 1'b1  ;
   #5   PENABLE = 1'b0  ;
   #40  PADDR   =    3  ;
        PENABLE = 1'b1  ;


end
 

always #1  PCLK = ~PCLK ;


 
AMBA #() cpu(
    .PCLK    (PCLK   ),
    .PRESET (PRESET),
    .PENABLE (PENABLE),
    .PnR_W   (PnR_W  ),
    .PWDATA  (PWDATA ),
    .PADDR   (PADDR  ),
    .PREADY  (PREADY ),
    .PRDATA  (PRDATA )
) ;


endmodule

