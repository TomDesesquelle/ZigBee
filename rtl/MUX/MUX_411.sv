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

module MUX411 (    
    input	[3 : 0]		inData  ,
    input	[1 : 0]		inSel   ,      
    output				outData  
) ;
 
reg s_qout;

assign outData   =  s_qout ;

always_comb begin : MUX

	case(inSel) 

		2'b00   : begin
			s_qout <= inData[0];
		end		
		2'b01   : begin
			s_qout <= inData[1];
		end
		2'b10   : begin
			s_qout <= inData[2];
		end
		2'b11   : begin
			s_qout <= inData[3];
		end

	endcase
    
end

endmodule

