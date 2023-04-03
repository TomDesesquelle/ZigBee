   module tbench ();


   timeunit      1ns;
   timeprecision 1ns;

   //bit clk ;
   logic  clk = 1'b0;
   bit 	  reset_n;

   logic [0:3] I_IF_tab[0:999];
   logic [0:3] Q_IF_tab[0:999];

   
   logic [3:0] I_IF;//Inputs
   logic [3:0] Q_IF;
   
   logic signed [3:0] I_BB_postfilter;//outputs
   logic signed [3:0] Q_BB_postfilter;
   
   //logic signed [3:0] 	I_BB_postfilter_masked;//outputs masked
   //logic signed [3:0]  Q_BB_postfilter_masked;

   integer 	      i;
   integer 	      j=1;
   integer 	      k=0;
   logic [2:0] 	      counter;

   integer 	      fileI;
   integer 	      fileQ;

   logic 	      eoc;
   logic [1:0]	      readEN;
   
   /*decoder_cordic_cdr_ei decoder_cordic_cdr_ei(clk, 
					       reset_n,
					       eoc,
					       I_IF,
					       Q_IF,
    readEN );*/


   decoder_cordic_cdr_ei decoder_cordic_cdr_ei(
					       .i_clk		(clk		),
					       .i_rst_n		(reset_n		),
					       .i_adc_eoc	(eoc	),
					       .i_I_if		(I_IF		),
					       .i_Q_if (Q_IF ),
					       .readEN	(readEN		),
					       .outWriteCount	(		),   
    					       .outReadCount	(		),
    					       .outReadError	(		),
    					       .outWriteError	(		),
    					       .outFull	(		),
    					       .outEmpty	(		),
    					       .outAlmostEmpty	(		),
    					       .outAlmostFull	(		),
    					       .outDone	(		),  	
    					       .outData	(		)
					       );
   




   


   // Clock and Reset Definition
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

	////////////// Read I_if and Q_if inputs data

	fileI=$fopen("I_IF_data_IMG_verif.txt","r");

	if (fileI)  $display("File was opened successfully : %0d", fileI);
	else       $display("File was NOT opened successfully : %0d", fileI);

	for (i=1; i<1000; i=i+1) begin  
	   $fscanf(fileI,"%b",I_IF_tab[i-1]);
	   j = j+1;
	end
	$fclose(fileI);
	j = 1;
	fileQ=$fopen("Q_IF_data_IMG_verif.txt","r");

	if (fileQ)  $display("File was opened successfully : %0d", fileQ);
	else       $display("File was NOT opened successfully : %0d", fileQ);

	for (i=1; i<1000; i=i+1) begin  
	   $fscanf(fileQ,"%b",Q_IF_tab[i-1]);
	   j = j+1;
	end
	$fclose(fileQ);
	
	//////// end reading 


	
	begin
		   reset_n = 1; 
	 	   #(`PERIOD);
		     reset_n = 0;

		  #(`PERIOD*2);
		reset_n = 1; 


	end
     end
   //behavior for simulation inputs
   initial forever
     begin

/*		begin
	   #(`PERIOD*1000);
           reset_n = 0;
	   #(`PERIOD*2);
	     reset_n = 1;

	end*/
	
     end
   //END


   
   always_ff @(posedge clk)begin
      if (~reset_n)	begin
	 I_IF <= 4'b0000;// Input reset
	 Q_IF <= 4'b0000;
	 counter <= 3'd0;
	 readEN <= 1'b0;

	 
      end
      else  begin
	 
	 I_IF <= 4'b0000;
	 Q_IF <= 4'b0000 ;
	 eoc <= 1'b0 ;
	 readEN <= 1'b0;


	 

	 
	 if (counter >=3'd4)begin
	    eoc <= 1'b1;
	    counter <= 3'd0;
	    
	    if((k > 500) && (k < 600))begin
	       readEN <= 1'b1;
	    end
	    
	    
	    if(k < 999) begin
	       
	       I_IF <= I_IF_tab[k];
	       Q_IF <= Q_IF_tab[k];
	       k <= k+1;

	    end
	    else begin
	       I_IF <= I_IF_tab[0];
	       Q_IF <= Q_IF_tab[0];
	       k <= 1;
	       //readEN <= 1'b1;

	    end 
	 end
	 else counter <= counter + 3'd1;
	 
      end
   end

   //assign Q_BB_postfilter_masked = Q_BB_postfilter[14:11];
   //assign I_BB_postfilter_masked = I_BB_postfilter[14:11];

  
   
   

endmodule
