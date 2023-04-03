module rotation_test;

  timeunit        1ns ; // à discuter
  timeprecision 100ps ; // à discuter

  
	
	// INPUTS OUTPUTS

   logic clock;
   logic reset;
   reg [15:0] angle;    // to be discussed

   //OUTPUTS		

  logic dir;
   

  // Instantiate CORDIC 
rotation my_rotation(.i_angle(angle), .o_dir(dir), .reset(reset), .clock(clock));

  // Monitor Results
  initial
    begin
	clock=0;
	forever #10ns clock= ~clock;
	end 

  // Verify Results
 
 // Initialise Inputs


  // Apply Stimulus
  initial
    begin

	angle = 120; 	#20ns; // dir = ?
	angle = 140; 	#20ns; // dir = 1
	angle = 130; 	#20ns; // dir = 0
	angle = 80; 	#20ns; // dir = 0
	angle = 30; 	#20ns; // dir = 0
	angle = 330; 	#20ns; // dir = 0
	angle = 10; 	#40ns; // dir = 1

      $display ( "ROTATION TEST PASSED" ) ;
      $finish(0) ;
    end

endmodule
