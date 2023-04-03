set_clock_latency -source -early -min -rise  -0.201993 [get_pins {io_clk/Y}] -clock clk 
set_clock_latency -source -early -min -fall  -0.208746 [get_pins {io_clk/Y}] -clock clk 
set_clock_latency -source -late -min -rise  -0.201993 [get_pins {io_clk/Y}] -clock clk 
set_clock_latency -source -late -min -fall  -0.208746 [get_pins {io_clk/Y}] -clock clk 
