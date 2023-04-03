

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

 
module tb_TOP3();

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
reg 	[1:0]	inSEL9			;
reg 	[1:0]	inSEL15			;


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
	inSEL9			=	2'b0	;
	inSEL15			=	2'b0	;
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

	for(int i = 0; i < 5; i++) begin
		inReset = 1'b0 ;
		#CLK_PERIOD ;	
	end

	inReset = 1'b1 ;
	
end
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
//  DATA
//////////////////////////////////////////////////////////////////////////////////
initial begin : DATA

	for(int i = 0; i < 5; i++) begin
		#CLK_PERIOD ;	
	end

	/////////////////////////////
	// TEST ALL
	/////////////////////////////
	for(int i = 0; i < 80; i++) begin
		#CLK_PERIOD ;	
	end

	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inData			=	4'b0110	;
	inReadEnable	=	1'b0	;
	inDEMUX1		=	1'b1	;
	inDEMUX2		=	1'b1	;
	inDEMUX17		=	4'b1101	;
	inDEMUX18		=	4'b1101	;	

	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end
	inDEMUX1		=	1'b0	;
	inDEMUX2		=	1'b0	;

	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inData			=	4'b1100	;
	inReadEnable	=	1'b0	;
	inDEMUX1		=	1'b1	;
	inDEMUX2		=	1'b1	;
	inDEMUX17		=	4'b1101	;
	inDEMUX18		=	4'b1101	;	

	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end
	inDEMUX1		=	1'b0	;
	inDEMUX2		=	1'b0	;
	
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inData			=	4'b0011	;
	inReadEnable	=	1'b0	;
	inDEMUX1		=	1'b1	;
	inDEMUX2		=	1'b1	;
	inDEMUX17		=	4'b1101	;
	inDEMUX18		=	4'b1101	;	

	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end
	inDEMUX1		=	1'b0	;
	inDEMUX2		=	1'b0	;
	
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inData			=	4'b1010	;
	inReadEnable	=	1'b0	;
	inDEMUX1		=	1'b1	;
	inDEMUX2		=	1'b1	;
	inDEMUX17		=	4'b1101	;
	inDEMUX18		=	4'b1101	;	

	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end
	inDEMUX1		=	1'b0	;
	inDEMUX2		=	1'b0	;
	
	for(int i = 0; i < 25; i++) begin
		#CLK_PERIOD ;	
	end

	inData			=	4'b1111	;
	inReadEnable	=	1'b0	;
	inDEMUX1		=	1'b1	;
	inDEMUX2		=	1'b1	;
	inDEMUX17		=	4'b1101	;
	inDEMUX18		=	4'b1101	;	

	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end
	inDEMUX1		=	1'b0	;
	inDEMUX2		=	1'b0	;
	
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end




	/////////////////////////////
	// inFIFO Stand Alone
	/////////////////////////////
	inSEL1			=	3'b001	;
	inSEL9			=	2'b0	;
	inSEL15			=	2'b0	;

	for(int i = 0; i < 5; i++) begin
		inReset  =  1'b0 ;
		#CLK_PERIOD ;	
	end

	inReset 		= 	1'b1	;
	inData			=	4'b0001	;
	inReadEnable	=	1'b0	;
	inDEMUX1		=	1'b0	; // ReadEnable
	inDEMUX2		=	1'b0	; // WriteEnable
	inDEMUX17		=	4'b0	; 
	inDEMUX18		=	4'b0	;
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end
	inDEMUX2		=	1'b1	; // WriteEnable
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	for(int i = 0; i < 10; i++) begin
		inDEMUX2 =	1'b0 ;
		#CLK_PERIOD ;	
	end

	inData			=	4'b0100	;
	inReadEnable	=	1'b0	;
	inDEMUX1		=	1'b0	; // ReadEnable
	inDEMUX2		=	1'b1	; // WriteEnable
	inDEMUX17		=	4'b0	; 
	inDEMUX18		=	4'b0	;
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	for(int i = 0; i < 10; i++) begin
		inDEMUX2 =	1'b0 ;
		#CLK_PERIOD ;	
	end

	inData			=	4'b1001	;
	inReadEnable	=	1'b0	;
	inDEMUX1		=	1'b0	; // ReadEnable
	inDEMUX2		=	1'b1	; // WriteEnable
	inDEMUX17		=	4'b0	; 
	inDEMUX18		=	4'b0	;
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	for(int i = 0; i < 10; i++) begin
		inDEMUX2 =	1'b0 ;
		#CLK_PERIOD ;	
	end

	inData			=	4'b000	;
	inReadEnable	=	1'b0	;
	inDEMUX1		=	1'b1	; // ReadEnable
	inDEMUX2		=	1'b0	; // WriteEnable
	inDEMUX17		=	4'b0	; 
	inDEMUX18		=	4'b0	;
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	for(int i = 0; i < 10; i++) begin
		inDEMUX1 =	1'b0 ;
		#CLK_PERIOD ;	
	end

	inData			=	4'b000	;
	inReadEnable	=	1'b0	;
	inDEMUX1		=	1'b1	; // ReadEnable
	inDEMUX2		=	1'b0	; // WriteEnable
	inDEMUX17		=	4'b0	; 
	inDEMUX18		=	4'b0	;
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	for(int i = 0; i < 10; i++) begin
		inDEMUX1 =	1'b0 ;
		#CLK_PERIOD ;	
	end

	inData			=	4'b000	;
	inReadEnable	=	1'b0	;
	inDEMUX1		=	1'b1	; // ReadEnable
	inDEMUX2		=	1'b0	; // WriteEnable
	inDEMUX17		=	4'b0	; 
	inDEMUX18		=	4'b0	;
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	for(int i = 0; i < 10; i++) begin
		inDEMUX1 =	1'b0 ;
		#CLK_PERIOD ;	
	end

	inData			=	4'b000	;
	inReadEnable	=	1'b0	;
	inDEMUX1		=	1'b1	; // ReadEnable
	inDEMUX2		=	1'b0	; // WriteEnable
	inDEMUX17		=	4'b0	; 
	inDEMUX18		=	4'b0	;
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	for(int i = 0; i < 10; i++) begin
		inDEMUX1 =	1'b0 ;
		#CLK_PERIOD ;	
	end

	inData			=	4'b000	;
	inReadEnable	=	1'b0	;
	inDEMUX1		=	1'b1	; // ReadEnable
	inDEMUX2		=	1'b0	; // WriteEnable
	inDEMUX17		=	4'b0	; 
	inDEMUX18		=	4'b0	;
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	for(int i = 0; i < 10; i++) begin
		inDEMUX1 =	1'b0 ;
		#CLK_PERIOD ;	
	end

	inData			=	4'b000	;
	inReadEnable	=	1'b0	;
	inDEMUX1		=	1'b1	; // ReadEnable
	inDEMUX2		=	1'b0	; // WriteEnable
	inDEMUX17		=	4'b0	; 
	inDEMUX18		=	4'b0	;
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	for(int i = 0; i < 10; i++) begin
		inDEMUX1 =	1'b0 ;
		#CLK_PERIOD ;	
	end

	inData			=	4'b000	;
	inReadEnable	=	1'b0	;
	inDEMUX1		=	1'b1	; // ReadEnable
	inDEMUX2		=	1'b0	; // WriteEnable
	inDEMUX17		=	4'b0	; 
	inDEMUX18		=	4'b0	;
	for(int i = 0; i < 10; i++) begin
		#CLK_PERIOD ;	
	end

	for(int i = 0; i < 10; i++) begin
		inDEMUX1 =	1'b0 ;
		#CLK_PERIOD ;	
	end

	inData			=	4'b000	;
	inReadEnable	=	1'b0	;
	inDEMUX1		=	1'b1	; // ReadEnable
	inDEMUX2		=	1'b0	; // WriteEnable
	inDEMUX17		=	4'b0	; 
	inDEMUX18		=	4'b0	;
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	for(int i = 0; i < 10; i++) begin
		inDEMUX1 =	1'b0 ;
		#CLK_PERIOD ;	
	end

	inData			=	4'b000	;
	inReadEnable	=	1'b0	;
	inDEMUX1		=	1'b1	; // ReadEnable
	inDEMUX2		=	1'b0	; // WriteEnable
	inDEMUX17		=	4'b0	; 
	inDEMUX18		=	4'b0	;
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end
	


	/////////////////////////////
	// CODER Stand Alone
	/////////////////////////////
	inSEL1			=	3'b010	;
	inSEL9			=	2'b0	;
	inSEL15			=	2'b1	;

	for(int i = 0; i < 5; i++) begin
		inDEMUX1		=	1'b0	; // inData
		inDEMUX2		=	1'b1	; // inEmpty
		inReset  =  1'b0 ;
		#CLK_PERIOD ;	
	end
	inReset = 1'b1 ;


	inDEMUX1		=	1'b0	; // inData
	inDEMUX2		=	1'b0	; // inEmpty
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b1	; // inData
	inDEMUX2		=	1'b0	; // inEmpty
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b1	; // inData
	inDEMUX2		=	1'b0	; // inEmpty
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b0	; // inData
	inDEMUX2		=	1'b0	; // inEmpty
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b0	; // inData
	inDEMUX2		=	1'b0	; // inEmpty
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b1	; // inData
	inDEMUX2		=	1'b0	; // inEmpty
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b1	; // inData
	inDEMUX2		=	1'b0	; // inEmpty
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b0	; // inData
	inDEMUX2		=	1'b0	; // inEmpty
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b0	; // inData
	inDEMUX2		=	1'b0	; // inEmpty
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b1	; // inData
	inDEMUX2		=	1'b0	; // inEmpty
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b1	; // inData
	inDEMUX2		=	1'b0	; // inEmpty
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b0	; // inData
	inDEMUX2		=	1'b0	; // inEmpty
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b0	; // inData
	inDEMUX2		=	1'b1	; // inEmpty
	for(int i = 0; i < 50; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b0	; // inData
	inDEMUX2		=	1'b0	; // inEmpty
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b1	; // inData
	inDEMUX2		=	1'b0	; // inEmpty
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b1	; // inData
	inDEMUX2		=	1'b0	; // inEmpty
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b0	; // inData
	inDEMUX2		=	1'b0	; // inEmpty
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b0	; // inData
	inDEMUX2		=	1'b0	; // inEmpty
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b1	; // inData
	inDEMUX2		=	1'b0	; // inEmpty
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b1	; // inData
	inDEMUX2		=	1'b0	; // inEmpty
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b0	; // inData
	inDEMUX2		=	1'b0	; // inEmpty
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b0	; // inData
	inDEMUX2		=	1'b0	; // inEmpty
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b1	; // inData
	inDEMUX2		=	1'b0	; // inEmpty
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b1	; // inData
	inDEMUX2		=	1'b0	; // inEmpty
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b0	; // inData
	inDEMUX2		=	1'b0	; // inEmpty
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b0	; // inData
	inDEMUX2		=	1'b1	; // inEmpty
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end


	/////////////////////////////
	// DECODER Stand Alone
	/////////////////////////////
	inSEL1			=	3'b111	;
	inSEL9			=	2'b10	;
	inSEL15			=	2'b01	;

	for(int i = 0; i < 5; i++) begin
		inDEMUX1		=	1'b0	; // inEOC
		inDEMUX2		=	1'b0	; // 
		inDEMUX17		=	4'b0	; // I
		inDEMUX18		=	4'b0	; // Q
		inReset  =  1'b0 ;
		#CLK_PERIOD ;	
	end
	inReset = 1'b1 ;

	inDEMUX1		=	1'b0	; // inEOC
	inDEMUX17		=	4'b1010	; // I
	inDEMUX18		=	4'b0101	; // Q
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end
	inDEMUX1		=	1'b1	; // inEOC
	inDEMUX17		=	4'b1010	; // I
	inDEMUX18		=	4'b0101	; // Q
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b0	; // inEOC
	inDEMUX17		=	4'b1010	; // I
	inDEMUX18		=	4'b0101	; // Q
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b1	; // inEOC
	inDEMUX17		=	4'b1110	; // I
	inDEMUX18		=	4'b1010	; // Q
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b0	; // inEOC
	inDEMUX17		=	4'b1110	; // I
	inDEMUX18		=	4'b1010	; // Q
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b1	; // inEOC
	inDEMUX17		=	4'b0010	; // I
	inDEMUX18		=	4'b1001	; // Q
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b0	; // inEOC
	inDEMUX17		=	4'b0010	; // I
	inDEMUX18		=	4'b1001	; // Q
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end


	/////////////////////////////
	// CORDIC Stand Alone
	/////////////////////////////
	inSEL1			=	3'b011	;
	inSEL9			=	2'b0	;
	inSEL15			=	2'b10	;

	for(int i = 0; i < 20; i++) begin
		inDEMUX1		=	1'b0	; // xxx
		inDEMUX2		=	1'b0	; // cordic_inEnable
		inDEMUX17		=	4'b0	; // cordic_I
		inDEMUX18		=	4'b0	; // cordic_Q
		inReset  =  1'b0 ;
		#CLK_PERIOD ;	
	end
	inReset = 1'b1 ;

	inDEMUX2		=	1'b0	; // cordic_inEnable
	inDEMUX17		=	4'b1101	; // cordic_I
	inDEMUX18		=	4'b1100	; // cordic_Q
	for(int i = 0; i < 1; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX2		=	1'b1	; // cordic_inEnable
	inDEMUX17		=	4'b1101	; // cordic_I
	inDEMUX18		=	4'b1100	; // cordic_Q
	for(int i = 0; i < 10; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX2		=	1'b0	; // cordic_inEnable
	inDEMUX17		=	4'b1101	; // cordic_I
	inDEMUX18		=	4'b1100	; // cordic_Q
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX2		=	1'b1	; // cordic_inEnable
	inDEMUX17		=	4'b0011	; // cordic_I
	inDEMUX18		=	4'b0110	; // cordic_Q
	for(int i = 0; i < 10; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX2		=	1'b0	; // cordic_inEnable
	inDEMUX17		=	4'b0011	; // cordic_I
	inDEMUX18		=	4'b0110	; // cordic_Q
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX2		=	1'b1	; // cordic_inEnable
	inDEMUX17		=	4'b1011	; // cordic_I
	inDEMUX18		=	4'b1011	; // cordic_Q
	for(int i = 0; i < 10; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX2		=	1'b0	; // cordic_inEnable
	inDEMUX17		=	4'b1011	; // cordic_I
	inDEMUX18		=	4'b1011	; // cordic_Q
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end




	/////////////////////////////
	// CDR Stand Alone
	/////////////////////////////
	inSEL1			=	3'b100	;
	inSEL9			=	2'b0	;
	inSEL15			=	2'b11	;

	for(int i = 0; i < 50; i++) begin
		inDEMUX1		=	1'b0	; 
		inDEMUX2		=	1'b0	; 
		inDEMUX17		=	4'b0	; 
		inDEMUX18		=	4'b0	; 
		inReset  =  1'b0 ;
		#CLK_PERIOD ;	
	end
	inReset = 1'b1 ;

	inDEMUX1		=	1'b1	; // CDR_inEnable
	inDEMUX2		=	1'b0	; // CDR_inDIR
	for(int i = 0; i < 10; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b0	; // CDR_inEnable
	inDEMUX2		=	1'b0	; // CDR_inDIR
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b1	; // CDR_inEnable
	inDEMUX2		=	1'b1	; // CDR_inDIR
	for(int i = 0; i < 10; i++) begin
		#CLK_PERIOD ;	
	end	

	inDEMUX1		=	1'b0	; // CDR_inEnable
	inDEMUX2		=	1'b1	; // CDR_inDIR
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end	




	/////////////////////////////
	// outFIFO Stand Alone
	/////////////////////////////
	inSEL1			=	3'b101	;
	inSEL9			=	2'b11	;
	inSEL15			=	2'b11	;

	for(int i = 0; i < 50; i++) begin
		inDEMUX1		=	1'b0	; 
		inDEMUX2		=	1'b0	; 
		inDEMUX17		=	4'b0	; 
		inDEMUX18		=	4'b0	; 
		inReset  =  1'b0 ;
		#CLK_PERIOD ;	
	end
	inReset = 1'b1 ;

	inDEMUX1		=	1'b0	; // WriteEnable
	inDEMUX2		=	1'b1	; // inData
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b1	; // WriteEnable
	inDEMUX2		=	1'b1	; // inData
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b0	; // WriteEnable
	inDEMUX2		=	1'b1	; // inData
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b1	; // WriteEnable
	inDEMUX2		=	1'b1	; // inData
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b0	; // WriteEnable
	inDEMUX2		=	1'b1	; // inData
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b1	; // WriteEnable
	inDEMUX2		=	1'b1	; // inData
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b0	; // WriteEnable
	inDEMUX2		=	1'b1	; // inData
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b1	; // WriteEnable
	inDEMUX2		=	1'b1	; // inData
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inDEMUX1		=	1'b0	; // WriteEnable
	inDEMUX2		=	1'b1	; // inData
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inReadEnable	=	1'b1;
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inReadEnable	=	1'b0;
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inReadEnable	=	1'b1;
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inReadEnable	=	1'b0;
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inReadEnable	=	1'b1;
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inReadEnable	=	1'b0;
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inReadEnable	=	1'b1;
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inReadEnable	=	1'b0;
	for(int i = 0; i < 200; i++) begin
		#CLK_PERIOD ;	
	end



	/////////////////////////////
	// CODER --> CORDIC
	/////////////////////////////

	inSEL1			=	3'b110	;
	inSEL9			=	2'b1	;
	inSEL15			=	2'b0	;

	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
		inData			=	4'b0	;
		inReadEnable	=	1'b0	;
		inDEMUX1		=	1'b0	;
		inDEMUX2		=	1'b0	;
		inDEMUX17		=	4'b0	;
		inDEMUX18		=	4'b0	;
		inReset  =  1'b0 ;
	end
	inReset  =  1'b1 ;

	inData			=	4'b0110	;
	inReadEnable	=	1'b0	;
	inDEMUX1		=	1'b1	;
	inDEMUX2		=	1'b1	;
	inDEMUX17		=	4'b1101	;
	inDEMUX18		=	4'b1101	;	

	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end
	inDEMUX1		=	1'b0	;
	inDEMUX2		=	1'b0	;

	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inData			=	4'b1100	;
	inReadEnable	=	1'b0	;
	inDEMUX1		=	1'b1	;
	inDEMUX2		=	1'b1	;
	inDEMUX17		=	4'b1101	;
	inDEMUX18		=	4'b1101	;	

	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end
	inDEMUX1		=	1'b0	;
	inDEMUX2		=	1'b0	;
	
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inData			=	4'b0011	;
	inReadEnable	=	1'b0	;
	inDEMUX1		=	1'b1	;
	inDEMUX2		=	1'b1	;
	inDEMUX17		=	4'b1101	;
	inDEMUX18		=	4'b1101	;	

	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end
	inDEMUX1		=	1'b0	;
	inDEMUX2		=	1'b0	;
	
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end

	inData			=	4'b1010	;
	inReadEnable	=	1'b0	;
	inDEMUX1		=	1'b1	;
	inDEMUX2		=	1'b1	;
	inDEMUX17		=	4'b1101	;
	inDEMUX18		=	4'b1101	;	

	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end
	inDEMUX1		=	1'b0	;
	inDEMUX2		=	1'b0	;
	
	for(int i = 0; i < 25; i++) begin
		#CLK_PERIOD ;	
	end

	inData			=	4'b1111	;
	inReadEnable	=	1'b0	;
	inDEMUX1		=	1'b1	;
	inDEMUX2		=	1'b1	;
	inDEMUX17		=	4'b1101	;
	inDEMUX18		=	4'b1101	;	

	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end
	inDEMUX1		=	1'b0	;
	inDEMUX2		=	1'b0	;
	
	for(int i = 0; i < 20; i++) begin
		#CLK_PERIOD ;	
	end	

	
end
//////////////////////////////////////////////////////////////////////////////////






//////////////////////////////////////////////////////////////////////////////////
//  TOP
//////////////////////////////////////////////////////////////////////////////////
TOP2 u_top (
	.inClock					(inClock		) ,
	.inReset					(inReset		) ,
	.in_inFIFO_inData			(inData			) , 
	.in_outFIFO_inReadEnable	(inReadEnable	) , 

	.in_DEMUX_inDEMUX1			(inDEMUX1		) ,
	.in_DEMUX_inDEMUX2			(inDEMUX2		) ,
	.in_DEMUX_inDEMUX17			(inDEMUX17		) ,   
	.in_DEMUX_inDEMUX18			(inDEMUX18		) ,   

	.in_DEMUX_inSEL1			(inSEL1			) , 
	.in_MUX_inSEL9				(inSEL9			) , 
	.in_MUX_inSEL15				(inSEL15		) , 

	.out_MUX_outMUX9			(outMUX9		) ,	
	.out_MUX_outMUX10			(outMUX10		) ,	
	.out_MUX_outMUX15			(outMUX15		) ,	
	.out_MUX_outMUX16			(outMUX16		)
);
//////////////////////////////////////////////////////////////////////////////////


endmodule

