`include "../INPUT_DATA/TOP_netlist.v"

module top_io ( 
	input [3:0] in_inFIFO_inData,   //4
  	input [3:0] in_DEMUX_inDEMUX17, //4
  	input [3:0] in_DEMUX_inDEMUX18, //4
  	input [2:0] in_DEMUX_inSEL1,    //3
  	input [2:0] in_DEMUX_inSEL2,    //3
  	input [1:0] in_MUX_inSEL6,	//2
  	input [1:0] in_MUX_inSEL9,	//2
  	input [2:0] in_MUX_inSEL15,	//3

  	input inClock, 
	input inReset, 
	input in_outFIFO_inReadEnable, 
	input in_DEMUX_inDEMUX1,
	input in_DEMUX_inDEMUX2, 
	input in_MUX_inSEL3, 
	input in_MUX_inSEL11, 
	input in_MUX_inSEL12,
        input in_DEMUX_inSEL17,
	output [3:0] out_MUX_outMUX9,	//4
  	output [3:0] out_MUX_outMUX10,	//4
  	output out_MUX_outMUX15, 
	output out_MUX_outMUX16
);

wire [3:0] in_inFIFO_inData_P 	;
wire [3:0] in_DEMUX_inDEMUX17_P ;
wire [3:0] in_DEMUX_inDEMUX18_P ;
wire [2:0] in_DEMUX_inSEL1_P 	;
wire [2:0] in_DEMUX_inSEL2_P 	;
wire [1:0] in_MUX_inSEL6_P 	;
wire [1:0] in_MUX_inSEL9_P 	;
wire [2:0] in_MUX_inSEL15_P	;

wire inClock_P 			;
wire inReset_P 			;
wire in_outFIFO_inReadEnable_P 	; 
wire in_DEMUX_inDEMUX1_P 	;
wire in_DEMUX_inDEMUX2_P 	; 
wire in_MUX_inSEL3_P 		;
wire in_MUX_inSEL11_P 		; 
wire in_MUX_inSEL12_P 		;
wire in_DEMUX_inSEL17_P 	;
wire [3:0] out_MUX_outMUX9_P	;
wire [3:0] out_MUX_outMUX10_P	;
wire out_MUX_outMUX15_P 	; 
wire out_MUX_outMUX16_P 	;



TOP t_op (
	.in_inFIFO_inData	(in_inFIFO_inData_P),
  	.in_DEMUX_inDEMUX17	(in_DEMUX_inDEMUX17_P),
  	.in_DEMUX_inDEMUX18	(in_DEMUX_inDEMUX18_P),
  	.in_DEMUX_inSEL1	(in_DEMUX_inSEL1_P),
  	.in_DEMUX_inSEL2	(in_DEMUX_inSEL2_P),
  	.in_MUX_inSEL6 		(in_MUX_inSEL6_P),
  	.in_MUX_inSEL9 		(in_MUX_inSEL9_P),
  	.in_MUX_inSEL15 	(in_MUX_inSEL15_P),

  	.inClock 		(inClock_P), 
	.inReset 		(inReset_P), 
	.in_outFIFO_inReadEnable(in_outFIFO_inReadEnable_P), 
	.in_DEMUX_inDEMUX1 	(in_DEMUX_inDEMUX1_P),
	.in_DEMUX_inDEMUX2 	(in_DEMUX_inDEMUX2_P), 
	.in_MUX_inSEL3 		(in_MUX_inSEL3_P), 
	.in_MUX_inSEL11 	(in_MUX_inSEL11_P), 
	.in_MUX_inSEL12 	(in_MUX_inSEL12_P),
        .in_DEMUX_inSEL17 	(in_DEMUX_inSEL17_P),
	.out_MUX_outMUX9 	(out_MUX_outMUX9_P),
  	.out_MUX_outMUX10 	(out_MUX_outMUX10_P),
  	.out_MUX_outMUX15 	(out_MUX_outMUX15_P), 
	.out_MUX_outMUX16 	(out_MUX_outMUX16_P)
);

	//normal puis _P
	ITP io_inFIFO_inData_3 	( .PAD(in_inFIFO_inData[3]), .Y(in_inFIFO_inData_P[3]) );	///
	ITP io_inFIFO_inData_2 	( .PAD(in_inFIFO_inData[2]), .Y(in_inFIFO_inData_P[2]) );	//
	ITP io_inFIFO_inData_1 	( .PAD(in_inFIFO_inData[1]), .Y(in_inFIFO_inData_P[1]) );	//
	ITP io_inFIFO_inData_0 	( .PAD(in_inFIFO_inData[0]), .Y(in_inFIFO_inData_P[0]) );	//

	ITP io_DEMUX_inDEMUX17_3 	( .PAD(in_DEMUX_inDEMUX17[3]), .Y(in_DEMUX_inDEMUX17_P[3]) );	//
	ITP io_DEMUX_inDEMUX17_2 	( .PAD(in_DEMUX_inDEMUX17[2]), .Y(in_DEMUX_inDEMUX17_P[2]) );	//
	ITP io_DEMUX_inDEMUX17_1 	( .PAD(in_DEMUX_inDEMUX17[1]), .Y(in_DEMUX_inDEMUX17_P[1]) );	//
	ITP io_DEMUX_inDEMUX17_0 	( .PAD(in_DEMUX_inDEMUX17[0]), .Y(in_DEMUX_inDEMUX17_P[0]) );	//

	ITP io_DEMUX_inDEMUX18_3 	( .PAD(in_DEMUX_inDEMUX18[3]), .Y(in_DEMUX_inDEMUX18_P[3]) );	//
	ITP io_DEMUX_inDEMUX18_2 	( .PAD(in_DEMUX_inDEMUX18[2]), .Y(in_DEMUX_inDEMUX18_P[2]) );	//
	ITP io_DEMUX_inDEMUX18_1 	( .PAD(in_DEMUX_inDEMUX18[1]), .Y(in_DEMUX_inDEMUX18_P[1]) );	//
	ITP io_DEMUX_inDEMUX18_0 	( .PAD(in_DEMUX_inDEMUX18[0]), .Y(in_DEMUX_inDEMUX18_P[0]) );	//

	ITP io_DEMUX_inSEL1_2 	( .PAD(in_DEMUX_inSEL1[2]), .Y(in_DEMUX_inSEL1_P[2]) );		//
	ITP io_DEMUX_inSEL1_1 	( .PAD(in_DEMUX_inSEL1[1]), .Y(in_DEMUX_inSEL1_P[1]) );		//
	ITP io_DEMUX_inSEL1_0 	( .PAD(in_DEMUX_inSEL1[0]), .Y(in_DEMUX_inSEL1_P[0]) );		//
	
	ITP io_DEMUX_inSEL2_2 	( .PAD(in_DEMUX_inSEL2[2]), .Y(in_DEMUX_inSEL2_P[2]) );		//
	ITP io_DEMUX_inSEL2_1 	( .PAD(in_DEMUX_inSEL2[1]), .Y(in_DEMUX_inSEL2_P[1]) );		//
	ITP io_DEMUX_inSEL2_0 	( .PAD(in_DEMUX_inSEL2[0]), .Y(in_DEMUX_inSEL2_P[0]) );		//

	ITP io_MUX_inSEL6_1 		( .PAD(in_MUX_inSEL6[1]), .Y(in_MUX_inSEL6_P[1]) );	//
	ITP io_MUX_inSEL6_0 		( .PAD(in_MUX_inSEL6[0]), .Y(in_MUX_inSEL6_P[0]) );	//

	ITP io_MUX_inSEL9_1 		( .PAD(in_MUX_inSEL9[1]), .Y(in_MUX_inSEL9_P[1]) );	//
	ITP io_MUX_inSEL9_0 		( .PAD(in_MUX_inSEL9[0]), .Y(in_MUX_inSEL9_P[0]) );	//

	ITP io_MUX_inSEL15_1 	( .PAD(in_MUX_inSEL15[1]), .Y(in_MUX_inSEL15_P[1]) );	//
	ITP io_MUX_inSEL15_0 	( .PAD(in_MUX_inSEL15[0]), .Y(in_MUX_inSEL15_P[0]) );	//

	ITP io_inClock 			( .PAD(inClock), .Y(inClock_P) );					//ok

	ITP io_inReset 			( .PAD(inReset), .Y(inReset_P) );					//ok
		
	ITP io_outFIFO_inReadEnable 	( .PAD(in_outFIFO_inReadEnable), .Y(in_outFIFO_inReadEnable_P) );		//

	ITP io_DEMUX_inDEMUX1 	( .PAD(in_DEMUX_inDEMUX1), .Y(in_DEMUX_inDEMUX1_P) );		//
		
	ITP io_DEMUX_inDEMUX2 	( .PAD(in_DEMUX_inDEMUX2), .Y(in_DEMUX_inDEMUX2_P) );		//

	ITP io_MUX_inSEL3 		( .PAD(in_MUX_inSEL3), .Y(in_MUX_inSEL3_P) );		//

	ITP io_MUX_inSEL11 		( .PAD(in_MUX_inSEL11), .Y(in_MUX_inSEL11_P) );		//

	ITP io_MUX_inSEL12 		( .PAD(in_MUX_inSEL12), .Y(in_MUX_inSEL12_P) );		//

	ITP io_DEMUX_inSEL17 	( .PAD(in_DEMUX_inSEL17), .Y(in_DEMUX_inSEL17_P) );		//
	

	//_P puis normal
	BU12SP io_MUX_outMUX9_3 ( .A(out_MUX_outMUX9_P[3]), .PAD(out_MUX_outMUX9[3]) );	//
	BU12SP io_MUX_outMUX9_2 ( .A(out_MUX_outMUX9_P[2]), .PAD(out_MUX_outMUX9[2]) ); //
	BU12SP io_MUX_outMUX9_1 ( .A(out_MUX_outMUX9_P[1]), .PAD(out_MUX_outMUX9[1]) ); //
	BU12SP io_MUX_outMUX9_0 ( .A(out_MUX_outMUX9_P[0]), .PAD(out_MUX_outMUX9[0]) ); //

	BU12SP io_MUX_outMUX10_3 ( .A(out_MUX_outMUX10_P[3]), .PAD(out_MUX_outMUX10[3]) );
	BU12SP io_MUX_outMUX10_2 ( .A(out_MUX_outMUX10_P[2]), .PAD(out_MUX_outMUX10[2]) );
	BU12SP io_MUX_outMUX10_1 ( .A(out_MUX_outMUX10_P[1]), .PAD(out_MUX_outMUX10[1]) );
	BU12SP io_MUX_outMUX10_0 ( .A(out_MUX_outMUX10_P[0]), .PAD(out_MUX_outMUX10[0]) );

	BU12SP io_MUX_outMUX15 ( .A(out_MUX_outMUX15_P), .PAD(out_MUX_outMUX15) );

	BU12SP io_MUX_outMUX16 ( .A(out_MUX_outMUX16_P), .PAD(out_MUX_outMUX16) );

endmodule
