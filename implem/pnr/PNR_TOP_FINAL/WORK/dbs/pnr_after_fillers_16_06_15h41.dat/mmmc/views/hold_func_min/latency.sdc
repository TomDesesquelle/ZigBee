set_clock_latency -source -early -min -rise  -0.466326 [get_pins {io_inClock/Y}] -clock inClock 
set_clock_latency -source -early -min -fall  -0.479387 [get_pins {io_inClock/Y}] -clock inClock 
set_clock_latency -source -late -min -rise  -0.466326 [get_pins {io_inClock/Y}] -clock inClock 
set_clock_latency -source -late -min -fall  -0.479387 [get_pins {io_inClock/Y}] -clock inClock 
