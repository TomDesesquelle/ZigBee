
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

reg                     PCLK        ;
reg                     PRESETn     ;
reg                     PENABLE     ;
reg PDATA ;
reg POUT ;
reg POUTb;

initial begin

PCLK        = 1'b0      ;
PRESETn     = 1'b1      ;
PDATA       = 1'b1      ;
PENABLE     = 1'b0      ;

#100 PRESETn = 1'b0 ;
#500 PENABLE = 1'b1 ;

end

always #10  PCLK    = ~PCLK     ;

always begin
    #40 PDATA = 1'b1 ;
    #40 PDATA = 1'b0 ;
    #40 PDATA = 1'b0 ;
    #40 PDATA = 1'b0 ;
    #40 PDATA = 1'b1 ;
    #40 PDATA = 1'b1 ;
    #40 PDATA = 1'b1 ;
    #40 PDATA = 1'b0 ;
    #40 PDATA = 1'b1 ;
end

OS os(
            .i_CLK      (PCLK ),
            .i_RST      (PRESETn ),
            .i_EN       (PENABLE),
            .i_DATA     (PDATA),
            .o_QOUT_LE  (POUT),
            .o_QOUT_TE  (POUTb)
            ) ;

 

endmodule

