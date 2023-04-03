//==============================================================================
//  Filename    : Testbench of Filter                                              
//  Designer    : --
//  Description : Bench of filter with some stimuli
//                 1 - Dirac   : Enable to see coeff on output (!! divider)
//                 2 - Echelon : Enable to see saturation of filter (output must be close to 255 (5V) at DAC output
//                 3 - Sinus   : Measure Cut-off Frequency 
//==============================================================================
module tbench ();

timeunit      1ns;
timeprecision 1ns;

//bit clk ;
logic  clk = 1'b0;
bit reset;        

logic [7:0] filter_in, filter_out;
logic       adc_eoc_n, adc_convst_n, adc_rd_n, adc_cs_n;
logic       dac_cs_n, dac_wr_n, dac_clear_n, dac_load_n;
real        adc_in;
// Other Variables Definition
real dac_out;// Analog output voltage with  DAC A selected.
real freq = 10 ; //frequency of the sinus wave (KHz)
real sinus ; // output sinus
   

// ADC
AD7822 u_adc (
  .DB           ( filter_in     ), // 8-bit Digital Data Output Lines
  .CONVST_n     ( adc_convst_n  ), // The convert start signal initiates an 8-bit analog-to-digital conversion on the falling edge of this signal
  .CS_n         ( adc_cs_n      ), // The chip select signal is used to enable the parallel port of the AD7822 (necessary if the ADC is sharing a common data bus with another device)
  .RD_n         ( adc_rd_n      ), // The read signal is used to take the output buffers out of their high impedance state
  .PD_n         ( 1'b1          ), // Power Down ADC if 0
  .EOC_n        ( adc_eoc_n     ), // The end-of-conversion signal indicates when a conversion has finished
  .Vin1         ( adc_in        ), // Analog Input Channels
  .Vmid         (               )  // if connected, is used to center the analog input span anywhere in the range of AGND to VDD
);

// DAC
AD7302 u_dac (
  .D            ( filter_out    ), // Parallel Data Inputs. Eight-bit data is loaded to the input register of the AD7302 under the control of CS and WR.
  .CS_n         ( dac_cs_n      ), // Chip Select. Active low logic input
  .WR_n         ( dac_wr_n      ), // Write Input. WR is an active low logic input used in conjunction with CS and A/B to write data to the selected DAC register
  .notA_B       ( 1'b0          ), // DAC Select. Address pin used to select writing to either DAC A (=0) or DAC B (=1)
  .PD_n         ( 1'b1          ), // Active low input used to put the part into low power mode 
  .CLR_n        ( dac_clear_n   ), // Asynchronous Clear Input (Active Low). When this input is taken low the DAC registers are loaded with all zeroes and the DAC outputs are cleared to zero volts
  .LDAC_n       ( dac_load_n    ), // Load DAC Logic Input
  .VoutA        ( dac_out    ), // Analog output voltage from DAC A.
  .VoutB        (               )  // Analog output voltage from DAC B.
);

//SIN WAVE
sin_wave u_sinus (
 .freq (freq),//frequency of the sinus wave
 .sinus (sinus) //the output sinus
  );
   
  
filter duv (
  .clk            ( clk          ),         
  .reset          ( reset        ),       

  // connection with ADC
  .filter_in      ( filter_in    ),     
  .adc_eoc_n      ( adc_eoc_n    ),
  .adc_convst_n   ( adc_convst_n ),
  .adc_rd_n       ( adc_rd_n     ),
  .adc_cs_n       ( adc_cs_n     ),
         
  // connection with DAC
  .filter_out     ( filter_out   ),
  .dac_cs_n       ( dac_cs_n     ),
  .dac_wr_n       ( dac_wr_n     ),
  .dac_load_n     ( dac_load_n   ),
  .dac_clear_n    ( dac_clear_n  )
);


// Clock and Reset Definitin
`define PERIOD 20  //clk sur 10ns
   always
     #(`PERIOD/2) clk = ~clk;

// Automatic checker to compare Filter value with expected Output
//Verify results
//   task checkit ( real expects);
//      begin
//	 $display("");
//	 if (dac_out < (expects -1) || dac_out > (expects + 1))
//	   begin
//	      $display("module test failed, value is %f , and should be %f", dac_out, expects);
//	      $display("FILTER TEST FAILED");
//	      $finish
//		end
 //     end
//   endtask // checkit
   
   
 // Monitor Results format
initial
  begin
     $timeformat ( -9, 1, " ns", 12 );
     $monitor ("time=%t reset=%b clk=%b filter_in=%h filter_out=%h", 
           $time, reset, clk, filter_in, filter_out);
     #(`PERIOD*30000);
     $display ("filter test timeout");
     $finish;
 end    

// Apply Stimulus on ADC inputs while respecting the control signals sequence 
// Verify filter behaviour for Dirac
/*
initial 
  begin
     reset = 1;  @(posedge clk) 
     reset = 0 ;adc_in = 0;@(negedge adc_eoc_n ) 

     reset = 0 ;adc_in = 5;@(negedge adc_eoc_n )

     reset = 0 ;adc_in = 0;@ (negedge adc_eoc_n )
     
    $display ("filter test passed");


end
//END of the DIRAC part
   
   
// Verify filter behaviour for step function (echelon)
   /*
initial 
  begin
     reset = 1;  @(posedge clk) 
     reset = 0 ;adc_in = 0;@(negedge adc_eoc_n ) 

     reset = 0 ;adc_in = 5;@(negedge adc_eoc_n )
     
    $display ("filter test passed");


end */
//END of the ECHELON part                                                                 

   
// Verify filter behaviour for a sinus
//Initialization loop  
initial 
  begin
     reset = 1;  @(posedge clk) 
     reset = 0;

  end
   
//behavior for the sinus   
initial forever
  begin
     @(negedge adc_eoc_n )
       freq = freq + 0.05;
     reset = 0 ;adc_in = sinus;
     if (freq == 100)
       begin
	freq = 10;
	end

     
    $display ("filter test passed");

end
//END of the SINUS part

endmodule
