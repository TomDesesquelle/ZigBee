set_clock_latency -source -early -max -rise  -0.768333 [get_pins {io_clk/Y}] -clock clk 
set_clock_latency -source -early -max -fall  -0.776123 [get_pins {io_clk/Y}] -clock clk 
set_clock_latency -source -late -max -rise  -0.768333 [get_pins {io_clk/Y}] -clock clk 
set_clock_latency -source -late -max -fall  -0.776123 [get_pins {io_clk/Y}] -clock clk 
