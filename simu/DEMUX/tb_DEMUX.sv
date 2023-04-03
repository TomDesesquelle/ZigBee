`timescale 1ns / 1ps
 
module tb_DEMUX();

parameter	CLK_PERIOD = 20 ; 

reg			inData181	;
reg	[2:0]	inSel181	;
reg	[7:0]	outData181	;

reg			inData121	;
reg			inSel121	;
reg	[1:0]	outData121	;

reg	[3:0]	inData124	;
reg			inSel124	;
reg	[7:0]	outData124	;


DEMUX181 u_demux181 (
	.inData			(inData181	), 
	.inSel			(inSel181	),
	.outData		(outData181	)
);

DEMUX124 u_demux124 (
	.inData			(inData124	), 
	.inSel			(inSel124	),
	.outData		(outData124	)
);

DEMUX121 u_demux121 (
	.inData			(inData121	), 
	.inSel			(inSel121	),
	.outData		(outData121	)
);

initial begin 
	inData181 = 1'b0;
	inSel181  = 3'b000;

	inData121 = 1'b0;
	inSel121  = 1'b0;

	inData124= 4'b0000;
	inSel124  = 1'b0;
end


always begin : SEL
	inSel181 = 3'b000; inSel121 = 1'b0; inSel124 = 1'b0;
	#CLK_PERIOD ; #CLK_PERIOD ; #CLK_PERIOD ; #CLK_PERIOD ;

	inSel181 = 3'b001; inSel121 = 1'b1; inSel124 = 1'b1;
	#CLK_PERIOD ; #CLK_PERIOD ; #CLK_PERIOD ; #CLK_PERIOD ;

	inSel181 = 3'b010; inSel121 = 1'b0; inSel124 = 1'b0;
	#CLK_PERIOD ; #CLK_PERIOD ; #CLK_PERIOD ; #CLK_PERIOD ;

	inSel181 = 3'b011; inSel121 = 1'b1; inSel124 = 1'b1;
	#CLK_PERIOD ; #CLK_PERIOD ; #CLK_PERIOD ; #CLK_PERIOD ;

	inSel181 = 3'b100; inSel121 = 1'b0; inSel124 = 1'b0;
	#CLK_PERIOD ; #CLK_PERIOD ; #CLK_PERIOD ; #CLK_PERIOD ;

	inSel181 = 3'b101; inSel121 = 1'b1; inSel124 = 1'b1;
	#CLK_PERIOD ; #CLK_PERIOD ; #CLK_PERIOD ; #CLK_PERIOD ;

	inSel181 = 3'b110; inSel121 = 1'b0; inSel124 = 1'b0;
	#CLK_PERIOD ; #CLK_PERIOD ; #CLK_PERIOD ; #CLK_PERIOD ;

	inSel181 = 3'b111; inSel121 = 1'b1; inSel124 = 1'b1;
	#CLK_PERIOD ; #CLK_PERIOD ; #CLK_PERIOD ; #CLK_PERIOD ;

end

always begin : DATA
	inData181 = 1'b0;
	inData121 = 1'b0;
	inData124 = 4'b0000;
	#CLK_PERIOD ;

	inData181 = 1'b1;
	inData121 = 1'b1;
	inData124 = 4'b0001;
	#CLK_PERIOD ;

	inData124 = 4'b0010;
	#CLK_PERIOD ;

	inData124 = 4'b0011;
	#CLK_PERIOD ;

	inData124 = 4'b0100;
	#CLK_PERIOD ;

	inData124 = 4'b0101;
	#CLK_PERIOD ;

	inData124 = 4'b0110;
	#CLK_PERIOD ;

	inData124 = 4'b0111;
	#CLK_PERIOD ;

	inData124 = 4'b1000;
	#CLK_PERIOD ;

	inData124 = 4'b1001;
	#CLK_PERIOD ;

	inData124 = 4'b1010;
	#CLK_PERIOD ;

	inData124 = 4'b1011;
	#CLK_PERIOD ;

	inData124 = 4'b1100;
	#CLK_PERIOD ;

	inData124 = 4'b1101;
	#CLK_PERIOD ;

	inData124 = 4'b1110;
	#CLK_PERIOD ;

	inData124 = 4'b1111;
	#CLK_PERIOD ;

end

endmodule









