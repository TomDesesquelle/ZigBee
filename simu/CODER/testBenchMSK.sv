`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps


module msk_modulator_bench;
    
	
    

    logic clk=1'b1, reset, i_empty, i_data, o_ready, o_sinI, o_sinQ, o_sinI_four, o_sinQ_four;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;  

    
	initial // initial block executes only once
		begin
			// values for a and b
			reset = 1'b1;
			i_empty = 1;
			#period;
			reset = 1'b0 ;
			#(period*25); // wait for period 
			reset = 1'b1 ;
			i_empty = 0;
			i_data = 0;
			#(period*25);

			i_data = 0;
			#(period*25);

			i_data = 1;
			#(period*25);

			i_data = 1;
			#(period*25);

			i_data = 0;
			#(period*25);
		
			i_data = 1;
			#(period*25);

			i_data = 1;
			#(period*25);

			i_data = 1;
			#(period*25);

			i_data = 0;
			#(period*25);
			
			i_data = 0;
			#(period*25);

			i_data = 0;
			#(period*25);
			
			i_data = 0;
			#(period*25);

			// ________________________
			
			// values for a and b
			reset = 1'b1;
			i_empty = 1'bz;
			#period;
			reset = 1'b0 ;
			#(period*25); // wait for period 
			reset = 1'b1 ;
			//i_empty = 0;
			i_data = 1'bz;
			#(period*250);
			
			i_empty = 0;
			i_data = 0;
			#(period*25);

			i_data = 1;
			#(period*25);

			i_data = 1;
			#(period*25);

			i_data = 0;
			#(period*25);
		
			i_data = 1;
			#(period*25);

			i_data = 1;
			#(period*25);

			i_data = 1;
			#(period*25);
			reset = 1'b0 ;

			i_data = 0;
			#(period*25);
			reset = 1'b1 ;
			
			i_data = 0;
			#(period*25);
			
			i_data = 1;
			#(period*25);

			i_data = 0;
			#(period*25);
			
			i_data = 1;
			#(period*25);

			i_data = 1;
			#(period*25);
			
			
			i_data = 0;
			#(period*25);

			i_data = 1;
			#(period*25);

			i_data = 0;
			#(period*25);
			
			i_data = 0;
			#(period*25);

			i_data = 0;
			#(period*25);

			i_data = 0;
			#(period*25);
			
			i_data = 1;
			#(period*25);
			
			i_data = 0;
			#(period*25);

			i_data = 0;
			#(period*25);
			//reset = 1'b0 ;
			i_empty = 1;

			#(period*25);
			//reset = 1'b1;
			#(period*225);

			i_data = 1;
			#(period*25);
			
			
			i_data = 0;
			#(period*25);

			i_data = 1;
			#(period*25);

			i_data = 0;
			#(period*25);
			
			i_data = 0;
			#(period*25);

			i_data = 0;
			#(period*25);
			
			#(period*225);
			i_empty = 0;
			i_data = 0;
			#(period*25);

			i_data = 0;
			#(period*25);

			i_data = 1;
			#(period*25);

			i_data = 1;
			#(period*25);

			i_data = 0;
			#(period*25);
		
			i_data = 1;
			#(period*25);

			i_data = 1;
			#(period*25);

			i_data = 1;
			#(period*25);

			i_data = 0;
			#(period*25);
			
			i_data = 0;
			#(period*25);

			i_data = 0;
			#(period*25);
			
			
		end

		always begin
			#10 
			clk = !clk ;
		end	
	
		
	msk_modulator UUT (.clk(clk), .reset(reset), .i_empty(i_empty), .i_data(i_data), .o_ready(o_ready), .o_sinI(o_sinI), .o_sinQ(o_sinQ), .o_sinI_four(o_sinI_four), .o_sinQ_four(o_sinQ_four));
    
		
		
		
		
endmodule
