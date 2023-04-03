module cdr_test;


// Timeunit and time precision specification
timeunit 1ns;
timeprecision 10ps;

// Enumeration
logic   i_phase;
logic   i_rst;
logic 	i_flag;


// ------clock generation code begin------
`define PERIOD 10 //periode de 20ns => 50MHz
logic i_clk = 1'b0;

always
	#(`PERIOD) i_clk = ~i_clk ;

// ------clock generation code end------


cdr cdr1 (.i_clk(i_clk), .i_rst(i_rst), .i_phase(i_phase), .i_flag(i_flag));

`define DELAY 500

//Apply Stimulus
	initial
		begin
			i_flag = 1'b0;
			i_rst = 1'b0;
			i_phase = 1'b0;
			#20  i_rst = 1'b1;

			#500 i_phase = 1'b0;
/*
			#500 i_phase = 1'b0;
			#500 i_phase = 1'b1;
			#500 i_phase = 1'b1;
			#500 i_phase = 1'b0;
*/
			#500 i_phase = 1'b1;
			#500 i_phase = 1'b0;

			#500 i_phase = 1'b1;
			i_flag = 1'b1;	
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_phase = 1'b0;
			i_flag = 1'b1;	
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_phase = 1'b1;
			i_flag = 1'b1;	
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_phase = 1'b0;
			i_flag = 1'b1;	
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_phase = 1'b1;
			i_flag = 1'b1;	
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_phase = 1'b0;

			#500 i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			i_rst = 1'b0;
			#(`DELAY) i_phase = 1'b0;
			i_rst = 1'b1;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
	
			i_flag = 1'b1;	
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_phase = 1'b0;
			i_flag = 1'b1;	
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_phase = 1'b1;
			i_flag = 1'b1;	
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_phase = 1'b0;
			i_flag = 1'b1;	
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
			#20 i_flag = 1'b0;
			#80 i_phase = 1'b1;

			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;
			#(`DELAY) i_phase = 1'b0;
			#(`DELAY) i_phase = 1'b1;

			//$display ("Phase detector test passed");
			//$stop;
		end
endmodule
