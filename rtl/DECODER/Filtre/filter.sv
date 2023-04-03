//==============================================================================
//  Filename    : Top Level of Filter                                              
//  Designer    : --
//  Description : Structural connection of IP block. This is version of filter
//                Including ADC and DAC Interface
//==============================================================================
module filter (
  input  logic       clk,               // Main Clock
  input  logic       reset,             // Synchronous Active High Reset (More Robust mapping on FPGA)

  // connection with ADC
  input  logic [7:0] filter_in,         // Input data of Filter
  input  logic       adc_eoc_n,  
  output logic       adc_convst_n, 
  output logic       adc_rd_n, 
  output logic       adc_cs_n, 
  
  // connection with DAC
  output logic       dac_cs_n,
  output logic       dac_wr_n,
  output logic       dac_load_n,
  output logic       dac_clear_n,
  output logic [7:0] filter_out
);

// == Variables Declaration ====================================================
logic  [7:0] coeff_filter;
logic [20:0] mac_data;
logic  [4:0] line_address;
logic  [4:0] rom_address;
logic  [7:0] sample_data;

logic        sample_shift;      // When high, shift new sample in delay line
logic        mac_init;          // When high, Re-initialise accumulateur
logic  [7:0] adc_data;          // Data from ADC to fill the filter

logic        dac_conv_req, dac_conv_ack;
logic        adc_conv_ready, adc_conv_valid;

// == Main Code ================================================================

// Filter FSM
fsm u_fsm (
  .clk            ( clk             ),         
  .reset          ( reset           ),       
  .sample_shift   ( sample_shift    ),
  .line_addr      ( line_address    ),
  .rom_addr       ( rom_address     ),
  .adc_conv_valid ( adc_conv_valid  ),
  .adc_conv_ready ( adc_conv_ready  ), 
  .mac_init       ( mac_init        ),  
  .dac_conv_req   ( dac_conv_req    ),
  .dac_conv_ack   ( dac_conv_ack    )
);

delay_line u_delay (
  .clk            ( clk             ),     
  .reset          ( reset           ),   
  .data_in        ( adc_data        ), 
  .data_shift_en  ( sample_shift    ),   
  .data_index     ( line_address    ),
  .data_out       ( sample_data     )
);

rom #(
  .p_depth        ( 32 )
  ) u_rom (
  .address        ( rom_address     ),
  .data_q         ( coeff_filter    )
);

mac u_mac (
  .clk           ( clk              ), // Main Clock
  .reset         ( reset            ), // Synchronous Active High Reset (More Robust mapping on FPGA)
  .init          ( mac_init         ), // Clear Accumulation 
  .data_a        ( coeff_filter     ), // Input Data A
  .data_b        ( sample_data      ), // Input Data B
  .data_q        ( mac_data         )  // Data Register  
);


endmodule
