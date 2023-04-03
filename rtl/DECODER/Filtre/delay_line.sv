//==============================================================================
//  Filename    : Delay Line                                              
//  Designer    : Sylvain ENGELS - DIALLO, REBOUD
//  Description : Simple Delay line. Depth of the delay line is 
//                configurable using p_depth parameter.
//==============================================================================
module delay_line #(parameter
  integer            p_depth = 9       // Number of element in delay line 
  )(
  input  logic                       clk,           // Main Clock
  input  logic                       reset,         // Synchronous Active High Reset (More Robust mapping on FPGA)
  input  logic                 [7:0] data_in,       // Input Byte
  input  logic                       data_shift_en, // Shift New byte in Delay Chain
  input  logic [$clog2(p_depth)-1:0] data_index,    // Index of the element in delay chain propagated to data_out
  output logic                 [7:0] data_out       // Data Register  
);

// == Variables Declaration ====================================================
logic [p_depth-1:0][7:0] data_line ;// tab of 9 lines and 8 columns, to stock 9 values of 8 bits from the ADC
// == Main Code ================================================================
always_ff @(posedge clk)
  if      (reset)         data_line <= '{default:8'h00}; //reset all the values of tab to 0
  else if (data_shift_en) begin
                            data_line[p_depth-1]   <= data_in;                // We add the incoming byte sample in MSB of tab
     data_line[p_depth-2:0] <= data_line[p_depth-1:1]; // we shift all the values by one in the tab (the last value is lost) 
                          end

assign data_out = data_line[data_index]; //outputs the Byte at index "data_index"

endmodule
