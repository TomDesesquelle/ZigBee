`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 02.06.2022 16:05:32
// Design Name:
// Module Name: tb_TOP
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

 
module tb_TOP();

parameter	CLK_PERIOD = 20	;

reg 			inClock			;
reg 			inReset			;
reg		[3:0]	inData			;
reg 			inReadEnable	;
reg		 		inDEMUX1		;
reg 			inDEMUX2		;
reg 	[3:0]	inDEMUX17		;
reg 	[3:0]	inDEMUX18		;
reg		[2:0]	inSEL1			;
reg		[2:0]	inSEL2			;
reg 			inSEL3			;
reg 	[1:0]	inSEL6			;
reg 	[1:0]	inSEL9			;
reg 			inSEL11			;
reg 			inSEL12			;
reg 	[2:0]	inSEL15			;
reg 			inSEL17			;
reg 	[3:0]	outMUX9			;
reg 	[3:0]	outMUX10		;
reg 			outMUX15		;
reg 			outMUX16		;


initial begin : init
	inClock			=	1'b1	;
	inReset			=	1'b1	;
	inData			=	4'b0	;
	inReadEnable	=	1'b0	;
	inDEMUX1		=	1'b0	;
	inDEMUX2		=	1'b0	;
	inDEMUX17		=	4'b0	;
	inDEMUX18		=	4'b0	;
	inSEL1			=	3'b0	;
	inSEL2			=	3'b0	;
	inSEL3			=	1'b0	;
	inSEL6			=	2'b0	;
	inSEL9			=	2'b0	;
	inSEL11			=	1'b0	;
	inSEL12			=	1'b0	;
	inSEL15			=	2'b0	;
	inSEL17			=	1'b0	;
end
 
//////////////////////////////////////////////////////////////////////////////////
//  CLOCK
//////////////////////////////////////////////////////////////////////////////////
always #10 	inClock = ~inClock ;
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
//  RESET
//////////////////////////////////////////////////////////////////////////////////
initial begin : RESET
	#CLK_PERIOD ;	
	for(int i = 0; i < 5; i++) begin
		inReset = 1'b0 ;
		#CLK_PERIOD ;	
	end
	inReset = 1'b1 ;
end
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
//  SEL
//////////////////////////////////////////////////////////////////////////////////
initial begin : SELECT
	for(int i = 0; i < 5; i++) begin
		#CLK_PERIOD ;	
	end

	for(int i = 0; i < 8; i++) begin  // SEL1
		for(int j = 0; j < 8; j++) begin // SEL2
			for(int k = 0; k < 4; k++) begin // SEL15
				for(int l = 0; l < 4; l++) begin // SEL6
					for(int m = 0; m < 4; m++) begin // SEL9
						for(int n = 0; n < 2; n++) begin // SEL11
							for(int o = 0; o < 2; o++) begin // SEL12
								for(int p = 0; p < 2; p++) begin // SEL3
									for(int q = 0; q < 2; q++) begin // SEL17
										
										inSEL1			=	i	;
										inSEL2			=	j	;
										inSEL3			=	p	;
										inSEL6			=	l	;
										inSEL9			=	m	;
										inSEL11			=	n	;
										inSEL12			=	o	;
										inSEL15			=	k	;
										inSEL17			=	q	;

										for(int r = 0; r < 500; r++) begin
											#CLK_PERIOD ;	
										end

									end
								end
							end
						end
					end
				end
			end
		end
	end
	
end
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
//  TOP
//////////////////////////////////////////////////////////////////////////////////
TOP u_top (
	.inClock					(inClock		) ,
	.inReset					(inReset		) ,
	.in_inFIFO_inData			(inData			) , 
	.in_outFIFO_inReadEnable	(inReadEnable	) , 

	.in_DEMUX_inDEMUX1			(inDEMUX1		) ,
	.in_DEMUX_inDEMUX2			(inDEMUX2		),
	.in_DEMUX_inDEMUX17			(inDEMUX17		) ,   
	.in_DEMUX_inDEMUX18			(inDEMUX18		) ,   

	.in_DEMUX_inSEL1			(inSEL1			) , 
	.in_DEMUX_inSEL2			(inSEL2			) , 
	.in_MUX_inSEL3				(inSEL3			) , 
	.in_MUX_inSEL6				(inSEL6			) , 
	.in_MUX_inSEL9				(inSEL9			) , 
	.in_MUX_inSEL11				(inSEL11		) , 
	.in_MUX_inSEL12				(inSEL12		) , 
	.in_MUX_inSEL15				(inSEL15		) , 
	.in_DEMUX_inSEL17			(inSEL17		) ,  

	.out_MUX_outMUX9			(outMUX9		) ,	
	.out_MUX_outMUX10			(outMUX10		) ,	
	.out_MUX_outMUX15			(outMUX15		) ,	
	.out_MUX_outMUX16			(outMUX16		)
);
//////////////////////////////////////////////////////////////////////////////////


endmodule

