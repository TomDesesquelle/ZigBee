//////////////////////////////////////////////////////////////////////////////////
//School: PHELMA
// Engineer: Tom Désesquelle / Axel Baldacchino
//
// Create Date: 21.03.2022 10:55:04
// Design Name: DFF model
// Module Name: MUX_1bit
// Project Name: zigbee_project
// Tool Versions: VIVADO 2018.3
// Description: DEMUX 1:4 (1 bit)
//
//
// Revision:
// Revision 0.01 - First Commit
//
//////////////////////////////////////////////////////////////////////////////////

module DEMUX121 (
    input               inData  ,
    input 				inSel   ,      
    output	[1 : 0]		outData  
) ;
 
reg [1 : 0] s_qout;

assign outData   =  s_qout ;

always_comb begin : MUX

	case(inSel) 

		1'b0   : begin
			s_qout <= {1'b0, inData};
		end		
		1'b1   : begin
			s_qout <= {inData, 1'b0};
		end
		
	endcase
end

endmodule

