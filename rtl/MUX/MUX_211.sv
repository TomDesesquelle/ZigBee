//////////////////////////////////////////////////////////////////////////////////
//School: PHELMA
// Engineer: Tom Désesquelle / Axel Baldacchino
//
// Create Date: 21.03.2022 10:55:04
// Design Name: DFF model
// Module Name: MUX_1bit
// Project Name: zigbee_project
// Tool Versions: VIVADO 2018.3
// Description: MUX 4:1 (1 bit)
//
//
// Revision:
// Revision 0.01 - First Commit
//
//////////////////////////////////////////////////////////////////////////////////

module MUX211 (    
    input	[1 : 0]	inData  ,
    input			inSel   ,      
    output			outData  
) ;
 
reg s_qout;

assign outData   =  s_qout ;

always_comb begin : MUX

	case(inSel) 

		1'b0   : begin
			s_qout <= inData[0];
		end		
		
		1'b1   : begin
			s_qout <= inData[1];
		end

	endcase
    
end

endmodule

