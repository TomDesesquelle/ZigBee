//////////////////////////////////////////////////////////////////////////////////
//School: PHELMA
// Engineer: Tom Désesquelle / Axel Baldacchino
//
// Create Date: 21.03.2022 10:55:04
// Design Name: DFF model
// Module Name: MUX_1bit
// Project Name: zigbee_project
// Tool Versions: VIVADO 2018.3
// Description: DEMUX 1:8 (1 bit)
//
//
// Revision:
// Revision 0.01 - First Commit
//
//////////////////////////////////////////////////////////////////////////////////

module DEMUX181 (  
    input				inData  ,
    input	[2 : 0]		inSel   ,      
    output	[7 : 0]		outData  
) ;
 
reg [7 : 0] s_qout;

assign outData   =  s_qout ;

always_comb begin : MUX

	case(inSel) 

		3'b000   : begin
			s_qout <= {7'b0, inData};
		end		
		3'b001   : begin
			s_qout <= {6'b0, inData, 1'b0};
		end
		3'b010   : begin
			s_qout <= {5'b0, inData, 2'b0};
		end
		3'b011   : begin
			s_qout <= {4'b0, inData, 3'b0};
		end
	
		3'b100   : begin
			s_qout <= {3'b0, inData, 4'b0};
		end		
		3'b101   : begin
			s_qout <= {2'b0, inData, 5'b0};
		end
		3'b110   : begin
			s_qout <= {1'b0, inData, 6'b0};
		end
		3'b111   : begin
			s_qout <= {inData, 7'b0};
		end
	endcase

end

endmodule

