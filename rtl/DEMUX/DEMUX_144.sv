//////////////////////////////////////////////////////////////////////////////////
// School: PHELMA
// Engineer: Tom Désesquelle / Axel Baldacchino
//
// Create Date: 21.03.2022 10:55:04
// Design Name: DFF model
// Module Name: MUX_1bit
// Project Name: zigbee_project
// Tool Versions: VIVADO 2018.3
// Description: DEMUX 1:4 (4 bits)
//
//
// Revision:
// Revision 0.01 - First Commit
//
//////////////////////////////////////////////////////////////////////////////////

module DEMUX144 (   
    input   [3 : 0]     inData  ,
    input   [1 : 0]     inSel   ,      
    output  [15 : 0]    outData       
) ;
 
reg [3 : 0] s_data0;
reg [3 : 0] s_data1;
reg [3 : 0] s_data2;
reg [3 : 0] s_data3;

reg [3 : 0] s_signal0 ;
reg [3 : 0] s_signal1 ;
reg [3 : 0] s_signal2 ;
reg [3 : 0] s_signal3 ;






/////////////////////////////////////////////////////
//  DEMUX 0
/////////////////////////////////////////////////////
DEMUX141 demux0(
            .inData  (inData[3]) ,
            .inSel   (inSel)     ,
            .outData (s_data0) 
            ) ;
/////////////////////////////////////////////////////

/////////////////////////////////////////////////////
//  DEMUX 1
/////////////////////////////////////////////////////
DEMUX141 demux1(
            .inData  (inData[2]) ,
            .inSel   (inSel)     ,
            .outData (s_data1) 
            ) ;
/////////////////////////////////////////////////////

/////////////////////////////////////////////////////
//  DEMUX 2
/////////////////////////////////////////////////////
DEMUX141 demux2(
            .inData  (inData[1]) ,
            .inSel   (inSel)     ,
            .outData (s_data2) 
            ) ;
/////////////////////////////////////////////////////

/////////////////////////////////////////////////////
//  DEMUX 3
/////////////////////////////////////////////////////
DEMUX141 demux3(
            .inData  (inData[0]) ,
            .inSel   (inSel)     ,
            .outData (s_data3) 
            ) ;
/////////////////////////////////////////////////////

always_comb begin
	s_signal0 <= {s_data0[0],s_data1[0],s_data2[0],s_data3[0]} ;
	s_signal1 <= {s_data0[1],s_data1[1],s_data2[1],s_data3[1]} ;
	s_signal2 <= {s_data0[2],s_data1[2],s_data2[2],s_data3[2]} ;
	s_signal3 <= {s_data0[3],s_data1[3],s_data2[3],s_data3[3]} ;
end

assign outData = {s_signal0, s_signal1, s_signal2, s_signal3} ;

endmodule

