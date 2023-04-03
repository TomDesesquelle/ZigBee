
//////////////////////////////////////////////////////////////////////////////////
//School: PHELMA
// Engineer: Tom Désesquelle / Axel Baldacchino
//
// Create Date: 21.03.2022 10:55:04
// Design Name: DFF model
// Module Name: MUX_1bit
// Project Name: zigbee_project
// Tool Versions: VIVADO 2018.3
// Description: MUX 4:1 (4 bits)
//
//
// Revision:
// Revision 0.01 - First Commit
//
//////////////////////////////////////////////////////////////////////////////////

module MUX814 (    
    input	[31 : 0]	inData  ,
    input	[2 : 0]	    inSel   ,      
    output	[3 : 0]		outData  
) ;
 
reg s_data0;
reg s_data1;
reg s_data2;
reg s_data3;


/////////////////////////////////////////////////////
//  MUX 0
/////////////////////////////////////////////////////
MUX811 mux0(
            .inData  ( {inData[28], inData[24], inData[20], inData[16], inData[12], inData[8], inData[4], inData[0]}   ) ,
            .inSel   ( inSel                                            ) ,
            .outData ( s_data0                                          ) 
            ) ;
/////////////////////////////////////////////////////

/////////////////////////////////////////////////////
//  MUX 1
/////////////////////////////////////////////////////
MUX811 mux1(
            .inData  ( {inData[29], inData[25], inData[21], inData[17], inData[13], inData[9], inData[5], inData[1]}   ) ,
            .inSel   ( inSel                                            ) ,
            .outData ( s_data1                                          ) 
            ) ;
/////////////////////////////////////////////////////

/////////////////////////////////////////////////////
//  MUX 2
/////////////////////////////////////////////////////
MUX811 mux2(
            .inData  ( {inData[30], inData[26], inData[22], inData[18], inData[14], inData[10], inData[6], inData[2]}   ) ,
            .inSel   ( inSel                                            ) ,
            .outData ( s_data2                                          ) 
            ) ;
/////////////////////////////////////////////////////

/////////////////////////////////////////////////////
//  MUX 3
/////////////////////////////////////////////////////
MUX811 mux3(
            .inData  ( {inData[31], inData[27], inData[23], inData[19], inData[15], inData[11], inData[7], inData[3]}   ) ,
            .inSel   ( inSel                                            ) ,
            .outData ( s_data3                                          ) 
            ) ;
/////////////////////////////////////////////////////



assign outData = {s_data3, s_data2, s_data1, s_data0} ;

endmodule


