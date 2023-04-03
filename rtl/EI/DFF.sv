//////////////////////////////////////////////////////////////////////////////////
//School: PHELMA
// Engineer: Tom Désesquelle / Axel Baldacchino
//
// Create Date: 21.03.2022 10:55:04
// Design Name: DFF model
// Module Name: DFF
// Project Name: zigbee_project
// Tool Versions: VIVADO 2018.3
// Description: DFF
//
//
// Revision:
// Revision 0.01 - First Commit
//
//////////////////////////////////////////////////////////////////////////////////

module DFF (
    input                   i_CLK    ,
    input                   i_RST    ,    
    input                   i_DATA   ,      
    output                  o_QOUT      
) ;
 
logic s_qout;

assign o_QOUT   =  s_qout ;

always @(posedge i_CLK) begin : DFF
    if(i_RST == 1'b0) begin
        s_qout <= 1'b0;
    end
    else begin
            s_qout <= i_DATA;
    end
end
 

endmodule

