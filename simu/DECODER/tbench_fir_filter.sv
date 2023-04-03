module tbench ();

   timeunit      1ns;
   timeprecision 1ns;

   //bit clk ;
   logic  clk = 1'b0;
   bit 	  reset_n;
   
   logic [7:0] I_IF;//Inputs
   logic [7:0] Q_IF;
   
   logic signed [3:0] I_BB_postfilter;//outputs
   logic signed [3:0]  Q_BB_postfilter;


   logic       postfilter_ready;
   logic       sample_ready ;
    

   fir_filter fir_filter(clk,
			   reset_n,
			   sample_ready,
			   I_IF,
			   Q_IF,
			   I_BB_postfilter,
			   Q_BB_postfilter,
			   postfilter_ready);
   


   // Clock and Reset Definitin
`define PERIOD 20 //50MHz
   always
     #(`PERIOD/2) clk = ~clk;
   
   // Monitor Results format
   initial
     begin
	$timeformat ( -9, 1, " ns", 12 );
	$monitor ("time=%t reset=%b clk=%b", 
		  $time, reset_n, clk);
	#(`PERIOD*30000);
	$display ("test timeout");
	$finish;
     end    


   //Initialization loop  
   initial
     begin


	begin
	   #(`PERIOD);
           reset_n = 0;
	   sample_ready = 0;
	   @(posedge clk) 
	     reset_n = 1;
	   sample_ready = 1;

	end

     end
   //behavior for simulation inputs
   initial forever
     begin

	
	I_IF = 8'b00000000; //0 VAL
	Q_IF = 8'b00000000;
	
//	#(`PERIOD*40);
//	I_IF = 8'b00000001;  //max val
//	Q_IF = 8'b00000001;
	
	
//	#(`PERIOD);
	
//	I_IF = 8'b00000000;  //max val
//	Q_IF = 8'b00000000;
	
	
	#(`PERIOD*30);
	
	I_IF = 8'b00111000;  //max val
	Q_IF = 8'b00111000;

	#(`PERIOD);

     end
   //END


   


   
   

endmodule
