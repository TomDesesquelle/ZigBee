//==============================================================================
//  Filename    : Filter Finite-State Machine                                              
//  Designer    : --
//  Description : Main FSM Used to control The filter. 
//==============================================================================
module fsm (
  input  logic       clk,               // Main Clock
  input  logic       reset,             // Synchronous Active High Reset (More Robust mapping on FPGA)
  // Ready/Valid Interface with ADC FSM
  input  logic       adc_conv_valid,  
  output logic       adc_conv_ready,
  // Filter Control Signal
  output logic [4:0] line_addr,         // 32 address
  output logic [4:0] rom_addr,          // 32 address
  output logic       sample_shift,
  output logic       mac_init,
  // Req/Ack Interface with DAC FSM
  output logic       dac_conv_req,
  input  logic       dac_conv_ack       // Unused as always considered true
);

// == Variables Declaration ====================================================
  typedef enum  {Init,
		 get_sample, 
		 shift_sample,
		 mac_initialization,
		 mac_op, 
		 dac_conv} fsm_t;

   fsm_t       state, next_state;
   logic [4:0] counter;

// == Main Code ================================================================

// Simple Counter to control mac operation adresses affectation for rom and delay_line
always_ff @(posedge clk) 
    if      (reset)             counter <= 0;
    else if (state == mac_initialization)  counter <= counter + 1; //increment counter when in mac_init & mac_op state
    else if (state == mac_op)  counter <= counter + 1; //increment counter when in mac_init & mac_op state 
    else                        counter <= 0;

// FSM Splitted into sequential and combinational process.
always_ff @(posedge clk)
    if   (reset) state <= Init;
    else         state <= next_state;

always_comb  
  begin
    adc_conv_ready  = 1'b0;//outputs and state_variable intialization
    line_addr       = 0;
    rom_addr        = 0;
    sample_shift    = 1'b0;
    mac_init        = 1'b0;
    dac_conv_req    = 1'b0; 
   
    next_state      = state;
    
    case (state) 
      Init     :  begin // initial state
                    next_state   = (adc_conv_valid) ? get_sample : Init;// go in "get_sample" state if adc is ready
                  end
      get_sample:  begin // get result of conversion from adc
                    adc_conv_ready = 1'b1; 
                    next_state   = shift_sample;
                  end
      shift_sample: begin// shift the value in the delay_line table (at adress 31) 
	            sample_shift = 1'b1;
                    next_state   = mac_initialization;
                  end      
      mac_initialization: begin // initialization of the mac with the first operation (first rom coeff x last sample value acquired)
	 	    mac_init = 1'b1; // mac_init set to 1 to ignore previous accumulation 
                    line_addr = (31 - counter); //last sample value acquired, in adress 31 of delay_line table
	            rom_addr = counter; // first rom coeff
	 
                    next_state   = mac_op;
		   
                  end
      mac_op      :begin // mac operation state, accumulating multiplications (from adress 30 to 0 of delay_line tab)
 
                    line_addr = (31 - counter);
	            rom_addr = counter;
	 
                    if(counter == 31) begin
		       next_state = dac_conv;
		    end
                   end
      dac_conv    :begin// send dac_conv request, then return in initial state
 
                    dac_conv_req = 1'b1;
	            if(dac_conv_ack == 1'b1 ) begin
		       next_state = Init;
		    end
                   end
    endcase

 end
   
endmodule
