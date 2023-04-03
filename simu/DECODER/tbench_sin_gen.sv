module tbench ();

timeunit      1ns;
timeprecision 1ns;

//bit clk ;
logic  clk = 1'b0;
bit reset_n;        
logic [3:0] sin_out;
   

   sin_gen sinus_dig(clk, reset_n, sin_out);
   




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
	#(`PERIOD);
        reset_n = 0;  @(posedge clk) 
	reset_n = 1;

  end
   
//behavior for the sinus   
initial forever
begin
     
  
end
//END of the SINUS part

endmodule
