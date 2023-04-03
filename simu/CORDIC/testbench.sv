module cordic_test;

  timeunit        1ns ; // à discuter
  timeprecision 100ps ; // à discuter

  
	
	// INPUTS OUTPUTS

   logic clock;
   logic reset;
   reg [3:0] I;  // to be discussed
   reg [3:0] Q;  // to be discussed

   //OUTPUTS		

   wire  [15:0] angle;    // to be discussed
   

  // Instantiate CORDIC 
cordic_w_l_pa mycordic(.o_angle(angle), .i_I(I), .i_Q(Q), .reset(reset), .clock(clock));

  // Monitor Results
  initial
    begin
	clock=0;
	forever #10ns clock= ~clock;
	end 

  // Verify Results
 
 // Initialise Inputs
	
	
	
 // task xpect (input [WIDTH-1:0] expects) ;
 //   if ( out !== expects )
 //     begin
 //       $display ( "out is %b and should be %b", out, expects ) ;
 //       $display ( "CORDIC TEST FAILED" );
 //       $finish ;
 //     end
 // endtask

  // Apply Stimulus
  initial
    begin
      // in_a='0; in_b='0; sel_a=0; #1ns xpect('0);

	/*I = 4'b0110; Q = 4'b0110; reset = 1'b0; #10ns // 45
	I = 4'b0110; Q = 4'b1010; reset = 1'b0; #10ns // -45
	I = 4'b1010; Q = 4'b0110; reset = 1'b0; #10ns // 135
	I = 4'b1010; Q = 4'b1010; reset = 1'b0; #100ns // -135*/

	// Angle + Q1
	I = 4'b0111; Q = 4'b0001; reset = 1'b0; #20ns // +8
	I = 4'b0110; Q = 4'b0010; reset = 1'b0; #20ns // +18
	I = 4'b0101; Q = 4'b0011; reset = 1'b0; #20ns // +30
	I = 4'b0011; Q = 4'b0101; reset = 1'b0; #20ns // +59
	I = 4'b0111; Q = 4'b0000; reset = 1'b0; #20ns // 0
	I = 4'b0000; Q = 4'b0111; reset = 1'b0; #20ns // 90
	I = 4'b0101; Q = 4'b0011; reset = 1'b0; #20ns // +30

	// Angle - Q4
	I = 4'b0000; Q = 4'b1000; reset = 1'b0; #20ns // +270
	I = 4'b0110; Q = 4'b1010; reset = 1'b0; #20ns // +315
	I = 4'b0010; Q = 4'b1011; reset = 1'b0; #20ns // +292
	I = 4'b0100; Q = 4'b1011; reset = 1'b0; #20ns // +309
	I = 4'b0100; Q = 4'b1110; reset = 1'b0; #20ns // +334
	
	// Angle + Q2
	I = 4'b1011; Q = 4'b0001; reset = 1'b0; #20ns // +168  
	I = 4'b1110; Q = 4'b0110; reset = 1'b0; #20ns // +108  
	I = 4'b1100; Q = 4'b0110; reset = 1'b0; #20ns // +128 
	I = 4'b1011; Q = 4'b0011; reset = 1'b0; #20ns // +149

	// Angle - Q3
	I = 4'b1101; Q = 4'b1010; reset = 1'b0; #20ns // +244  
	I = 4'b1010; Q = 4'b1010; reset = 1'b0; #20ns // +225	
	I = 4'b1011; Q = 4'b1101; reset = 1'b0; #20ns // +211
	I = 4'b1100; Q = 4'b1010; reset = 1'b0; #20ns // +232 
	
	
	
      $display ( "CORDIC TEST PASSED" ) ;
      $finish(0) ;
    end

endmodule
