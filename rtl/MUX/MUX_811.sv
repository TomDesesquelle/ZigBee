//////////////////////////////////////////////////////////////////////////////////
//School: PHELMA
// Engineer: Tom Désesquelle / Axel Baldacchino
//
// Create Date: 21.03.2022 10:55:04
// Design Name: DFF model
// Module Name: MUX_1bit
// Project Name: zigbee_project
// Tool Versions: VIVADO 2018.3
// Description: MUX 8:1 (1 bit)
//
//
// Revision:
// Revision 0.01 - First Commit
//
//////////////////////////////////////////////////////////////////////////////////

module MUX811 (    
    input	[7 : 0]		inData  ,
    input	[2 : 0]		inSel   ,      
    output				outData  
) ;
 
reg s_qout;

assign outData   =  s_qout ;

always_comb begin : MUX

    	case(inSel) 
    	
    		3'b000   : begin
    			s_qout <= inData[0];
    		end		
    		3'b001   : begin
    			s_qout <= inData[1];
    		end
    		3'b010   : begin
    			s_qout <= inData[2];
    		end
    		3'b011   : begin
    			s_qout <= inData[3];
    		end
    		3'b100   : begin
    			s_qout <= inData[4];
    		end		
    		3'b101   : begin
    			s_qout <= inData[5];
    		end
    		3'b110   : begin
    			s_qout <= inData[6];
    		end
    		3'b111   : begin
    			s_qout <= inData[7];
    		end

    	endcase
    
end

endmodule

