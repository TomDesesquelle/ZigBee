`include "../INPUT_DATA/TOP_netlist.v"

module top_io ( 
	input [3:0] in_inFIFO_inData,
  	input [3:0] in_DEMUX_inDEMUX17,
  	input [3:0] in_DEMUX_inDEMUX18,
  	input [2:0] in_DEMUX_inSEL1,
  	input [1:0] in_MUX_inSEL9,
  	input [1:0] in_MUX_inSEL15,
  	output [3:0] out_MUX_outMUX9,
  	output [3:0] out_MUX_outMUX10,
  	input inClock,
	input inReset,
	input in_outFIFO_inReadEnable,
	input in_DEMUX_inDEMUX1,
        input in_DEMUX_inDEMUX2,
 	output out_MUX_outMUX15,
	output out_MUX_outMUX16,
	output out_inFIFO_outWriteError,
        output out_inFIFO_outReadError,
	output out_inFIFO_outDone,
        output out_outFIFO_outWriteError,
	output out_outFIFO_outReadError,
        output out_outFIFO_outDone
);

wire [3:0] in_inFIFO_inData_P 	;
wire [3:0] in_DEMUX_inDEMUX17_P ;
wire [3:0] in_DEMUX_inDEMUX18_P ;
wire [2:0] in_DEMUX_inSEL1_P	;
wire [1:0] in_MUX_inSEL9_P 	;
wire [2:0] in_MUX_inSEL15_P	;

wire inClock_P 			;
wire inReset_P 			;
wire in_outFIFO_inReadEnable_P 	; 
wire in_DEMUX_inDEMUX1_P 	;
wire in_DEMUX_inDEMUX2_P	;
wire [3:0] out_MUX_outMUX9_P	;
wire [3:0] out_MUX_outMUX10_P	;
wire out_MUX_outMUX15_P 	; 
wire out_MUX_outMUX16_P 	;
wire out_inFIFO_outWriteError_P ;
wire out_inFIFO_outReadError_P  ;
wire out_inFIFO_outDone_P	;
wire out_outFIFO_outWriteError_P	;
wire out_outFIFO_outReadError_P	;
wire out_outFIFO_outDone_P	;


TOP t_op (
	.in_inFIFO_inData	(in_inFIFO_inData_P),
  	.in_DEMUX_inDEMUX17	(in_DEMUX_inDEMUX17_P),
  	.in_DEMUX_inDEMUX18	(in_DEMUX_inDEMUX18_P),
  	.in_DEMUX_inSEL1	(in_DEMUX_inSEL1_P),
  	.in_MUX_inSEL9 		(in_MUX_inSEL9_P),
  	.in_MUX_inSEL15 	(in_MUX_inSEL15_P),

  	.inClock 		(inClock_P), 
	.inReset 		(inReset_P), 
	.in_outFIFO_inReadEnable(in_outFIFO_inReadEnable_P), 
	.in_DEMUX_inDEMUX1 	(in_DEMUX_inDEMUX1_P),
	.in_DEMUX_inDEMUX2 	(in_DEMUX_inDEMUX2_P),
	.out_MUX_outMUX9 	(out_MUX_outMUX9_P),
  	.out_MUX_outMUX10 	(out_MUX_outMUX10_P),
  	.out_MUX_outMUX15 	(out_MUX_outMUX15_P), 
	.out_MUX_outMUX16 	(out_MUX_outMUX16_P),
	
	.out_inFIFO_outWriteError (out_inFIFO_outWriteError_P),
	.out_inFIFO_outReadError (out_inFIFO_outReadError_P),
	.out_inFIFO_outDone (out_inFIFO_outDone_P),
	.out_outFIFO_outWriteError (out_outFIFO_outWriteError_P),
	.out_outFIFO_outReadError (out_outFIFO_outReadError_P),
	.out_outFIFO_outDone (out_outFIFO_outDone_P)
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

	ITP io_MUX_inSEL9_1 		( .PAD(in_MUX_inSEL9[1]), .Y(in_MUX_inSEL9_P[1]) );	//
	ITP io_MUX_inSEL9_0 		( .PAD(in_MUX_inSEL9[0]), .Y(in_MUX_inSEL9_P[0]) );	//

	ITP io_MUX_inSEL15_1 	( .PAD(in_MUX_inSEL15[1]), .Y(in_MUX_inSEL15_P[1]) );	//
	ITP io_MUX_inSEL15_0 	( .PAD(in_MUX_inSEL15[0]), .Y(in_MUX_inSEL15_P[0]) );	//

	ITP io_inClock 			( .PAD(inClock), .Y(inClock_P) );					//ok

	ITP io_inReset 			( .PAD(inReset), .Y(inReset_P) );					//ok
		
	ITP io_outFIFO_inReadEnable 	( .PAD(in_outFIFO_inReadEnable), .Y(in_outFIFO_inReadEnable_P) );		//

	ITP io_DEMUX_inDEMUX1 	( .PAD(in_DEMUX_inDEMUX1), .Y(in_DEMUX_inDEMUX1_P) );		//
		
	ITP io_DEMUX_inDEMUX2 	( .PAD(in_DEMUX_inDEMUX2), .Y(in_DEMUX_inDEMUX2_P) );		//
	

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

	
	BU12SP io_out_inFIFO_outWriteError ( .A(out_inFIFO_outWriteError_P), .PAD(out_inFIFO_outWriteError) );
	BU12SP io_out_inFIFO_outReadError ( .A(out_inFIFO_outReadError_P), .PAD(out_inFIFO_outReadError) );
	BU12SP io_out_inFIFO_outDone ( .A(out_inFIFO_outDone_P), .PAD(out_inFIFO_outDone) );
	BU12SP io_out_outFIFO_outWriteError ( .A(out_outFIFO_outWriteError_P), .PAD(out_outFIFO_outWriteError) );
	BU12SP io_out_outFIFO_outReadError ( .A(out_outFIFO_outReadError_P), .PAD(out_outFIFO_outReadError) );
	BU12SP io_out_outFIFO_outDone ( .A(out_outFIFO_outDone_P), .PAD(out_outFIFO_outDone) );

endmodule
