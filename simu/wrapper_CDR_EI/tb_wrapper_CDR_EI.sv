`timescale 1ns / 1ps

module tb_wrp_CDR_EI();

parameter DATA_WIDTH =  4      ;
parameter ADDR_WIDTH =  2      ;
parameter CLK_PERIOD = 20      ;


// Enumeration
logic   i_phase;
logic	expected;
logic   i_rst;
logic 	i_flag;
logic   readEN ;
logic 	i_clk = 1'b0;

// ------clock generation code begin------
`define PERIOD 10 //periode de 20ns => 50MHz
`define DELAY 500


always #(`PERIOD) i_clk = ~i_clk ;

// ------clock generation code end------

//INSTANCE WRAPPER CDR + EI
wrapper_CDR_EI u_wrp_CDR_EI (
	.i_clk		(i_clk		),
	.i_rst		(i_rst		),
	.i_phase	(i_phase	),
	.i_flag		(i_flag		),
	.inReadEnable	(readEN		),
	.outWriteCount	(		),   
    	.outReadCount	(		),
    	.outReadError	(		),
    	.outWriteError	(		),
    	.outFull	(		),
    	.outEmpty	(		),
    	.outAlmostEmpty	(		),
    	.outAlmostFull	(		),
    	.outDone	(		),  	
    	.outData	(		)	// CPU
);


//Apply Stimulus
initial begin

	i_flag = 1'b0;
	i_rst = 1'b0;
	i_phase = 1'b0;
	readEN = 1'b0;
	#20  i_rst = 1'b1;

	//#500 i_phase = 1'b0;
	#2000

	//1
	/////////////// 4 PREMIER BITS /////////////	
	for(int j = 0 ; j < 4 ; j++) begin
		i_flag = 1'b1;
		for(int i = 0 ; i < 5 ; i++) begin
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
		end
		i_phase = 1'b1; //0111 4+2+1 = 7
	end

	/////////////// 2 PROCHAINS BITS /////////////
	for(int j = 0 ; j < 2 ; j++) begin
		i_flag = 1'b1;
		for(int i = 0 ; i < 5 ; i++) begin
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
		end
		i_phase = 1'b1; //11
	end

	/////////////// 2 PROCHAINS BITS /////////////
	for(int j = 0 ; j < 2 ; j++) begin
		i_flag = 1'b1;
		for(int i = 0 ; i < 5 ; i++) begin
			#20 i_flag = 1'b0;
			#80 i_flag = 1'b1;
		end
		i_phase = 1'b0; //01
	end


	////////////////// ATTENTE /////////////////
	for(int i = 0; i < 50; i++) begin
			#CLK_PERIOD ;	
	end


	////////////////// READ ////////////////////
	for(int j = 0 ; j < 8 ; j++) begin
		for(int i = 0; i < 20; i++) begin
			#CLK_PERIOD ;	
		end
		readEN = 1'b1 ;          
		#CLK_PERIOD readEN = 1'b0 ;
	end


end


endmodule
