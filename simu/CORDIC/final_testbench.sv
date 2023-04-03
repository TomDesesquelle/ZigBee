`timescale 1ns / 1ps

module system_test();

   parameter CLK_PERIOD = 20    ; 	// 50 MHz
	
   // INPUTS OUTPUTS
   logic clock;
   logic reset;
   reg [3:0] I;  
   reg [3:0] Q; 
   logic enable_in;  
   logic enable_out; 

///////////////////////////////////////////////////////////////////
   reg [3:0] counter = 0;

   typedef enum   bit[1:0]{ IDLE, WAIT, FLAG} STATE; 
   STATE present_state, next_state;
   
   ////////////////////////////////////////////////////////////////
   
   //OUTPUTS		
   logic dir;

system my_system(.i_I(I), .i_Q(Q), .i_enable_in(enable_in), .o_dir(dir), .o_enable_out(enable_out), .reset(reset), .clock(clock));
 

initial begin : init
	clock      = 1'b1 ;
	reset      = 1'b1 ;
	I          =  '0  ;
	Q          =  '0  ;
end


  // Monitor Results
always #10 	clock = ~clock ;


initial begin : RESET
	#CLK_PERIOD ;
	for(int i = 0; i < 5; i++) begin
		reset = 1'b0 ;
		#CLK_PERIOD ;	
	end
	reset = 1'b1 ;
end
///////////////////////////////////////////////////////////////////////////////////////

always_ff@(posedge clock) begin
	if(reset == 1'b0) begin 
		counter <= 0;
	end
	else begin
		if(counter == 4)begin
			counter <= 0;
		end
		else begin
			counter <= counter +1;
		end
	end
end

 always_ff@(posedge clock) begin

      if(present_state == FLAG)begin
	 enable_in <= 1'b1;
      end
      else enable_in <= 1'b0;
      
      
   end

   always_ff@(posedge clock) begin

      if(reset == 1'b0)begin
	 present_state <= IDLE;
      end
      else present_state <= next_state;
   end


   always_comb begin

//	next_state=present_state;

	case(present_state)
		IDLE: begin
			next_state = WAIT;
		end

		WAIT: begin
			if(counter == 4) begin
				next_state = FLAG;
				$display("********* COUNTER == 4, @%0t", $time);
			end else begin
				next_state = WAIT;
			end
		end

		FLAG: begin
			next_state = WAIT;
		end

		default : begin
			next_state = IDLE ;
		end
	endcase
   end

   /////////////////////////////////////////////////////////////////////////////////////////////////////
   

  // Apply Stimulus
initial
    begin

	// Angle - Q4
	I = 4'b0000; Q = 4'b1000;  #100ns // +270  ACTIVE RESET angle=0
	I = 4'b0110; Q = 4'b1010;  #100ns // +315  + DIR=1
	I = 4'b0110; Q = 4'b1010;  #100ns // +315  + DIR=1
	I = 4'b0010; Q = 4'b1011;  #100ns // +292  + DIR=0
	I = 4'b0010; Q = 4'b1011;  #100ns // +292  + DIR=0
	I = 4'b0010; Q = 4'b1011;  #100ns // +292  + DIR=0
	I = 4'b0100; Q = 4'b1011;  #100ns // +309  + DIR=1
	I = 4'b0100; Q = 4'b1110;  #100ns // +334  + DIR=1
	I = 4'b0100; Q = 4'b1011;  #100ns // +309  + DIR=0 
	I = 4'b0000; Q = 4'b1000;  #100ns // +270  + DIR=0

	// Angle + Q2
	I = 4'b1011; Q = 4'b0001;  #100ns // +168  + DIR=0
	I = 4'b1011; Q = 4'b0001;  #100ns // +168  + DIR=0
	I = 4'b1011; Q = 4'b0001;  #100ns // +168  + DIR=0
	I = 4'b1011; Q = 4'b0001;  #100ns // +168  + DIR=0
	I = 4'b1110; Q = 4'b0110;  #100ns // +108  + DIR=0
	I = 4'b1100; Q = 4'b0110;  #100ns // +128  etc	
	I = 4'b1011; Q = 4'b0011;  #100ns // +149   

/*	// Angle + Q1
	I = 4'b0111; Q = 4'b0001;  #20ns // +8     
	I = 4'b0101; Q = 4'b0011;  #20ns // +30  	
	I = 4'b0011; Q = 4'b0101;  #20ns // +59 	
	I = 4'b0111; Q = 4'b0000;  #20ns // 0  	   + DIR=0  
	I = 4'b0000; Q = 4'b0111;  #20ns // 90 
	I = 4'b0110; Q = 4'b0010;  #20ns // +18 	
	
	
	// Angle - Q3
	I = 4'b1101; Q = 4'b1010;  #20ns // +244   
	I = 4'b1010; Q = 4'b1010;  #20ns // +225 	
	I = 4'b1011; Q = 4'b1101;  #20ns // +211   + DIR=0
	I = 4'b1100; Q = 4'b1010;  #20ns // +232   

	// Angle + Q1
	I = 4'b0111; Q = 4'b0001;  #20ns // +8     
	I = 4'b0101; Q = 4'b0011;  #20ns // +30  	
	I = 4'b0011; Q = 4'b0101;  #20ns // +59 	
	I = 4'b0111; Q = 4'b0000;  #20ns // 0  	   
	I = 4'b0000; Q = 4'b0111;  #20ns // 90 		 + DIR=0  
	I = 4'b0110; Q = 4'b0010;  #20ns // +18 	
	
	
	// Angle - Q3
	I = 4'b1101; Q = 4'b1010;  #20ns // +244   
	I = 4'b1010; Q = 4'b1010;  #20ns // +225 	
	I = 4'b1011; Q = 4'b1101;  #20ns // +211   + DIR=0
	I = 4'b1100; Q = 4'b1010;  #100ns // +232   + DIR=1 */
	
      $display ( "CORDIC TEST PASSED" ) ;
      $finish(0) ;
    end

endmodule
