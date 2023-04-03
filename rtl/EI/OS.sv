//////////////////////////////////////////////////////////////////////////////////

//School: PHELMA
// Engineer: Tom Désesquelle / Axel Baldacchino
//
// Create Date: 21.03.2022 10:55:04
// Design Name: One Shot model
// Module Name: OS
// Project Name: zigbee_project
// Tool Versions: VIVADO 2018.3
// Description: One Shot for detecting leading & trailing edges
//
//
// Revision:
// Revision 0.01 - First Commit
//
//////////////////////////////////////////////////////////////////////////////////
 
module OS(
    input                   i_CLK     ,
    input                   i_RST     ,    
    input                   i_DATA    ,      
    output                  o_QOUT_LE 
) ;

reg sigQout1   ;
reg sigQout2   ;


DFF dff1(
            .i_CLK      (i_CLK )    ,
            .i_RST      (i_RST )    ,
            .i_DATA     (i_DATA)    ,
            .o_QOUT     (sigQout1)  
            ) ;

           

DFF dff2(
            .i_CLK      (i_CLK )    ,
            .i_RST      (i_RST )    ,
            .i_DATA     (sigQout1)  ,
            .o_QOUT     (sigQout2)  
            ) ;        

assign o_QOUT_LE = sigQout1 && (~ sigQout2) ;
 
endmodule
