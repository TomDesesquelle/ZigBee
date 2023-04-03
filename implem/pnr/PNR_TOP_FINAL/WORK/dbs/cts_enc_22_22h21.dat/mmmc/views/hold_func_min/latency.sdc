set_clock_latency -source -early -min -rise  -0.465995 [get_pins {io_inClock/Y}] -clock inClock 
set_clock_latency -source -early -min -fall  -0.477615 [get_pins {io_inClock/Y}] -clock inClock 
set_clock_latency -source -early -max -rise  -0.465995 [get_pins {io_inClock/Y}] -clock inClock 
set_clock_latency -source -early -max -fall  -0.477615 [get_pins {io_inClock/Y}] -clock inClock 
set_clock_latency -source -late -min -rise  -0.465995 [get_pins {io_inClock/Y}] -clock inClock 
set_clock_latency -source -late -min -fall  -0.477615 [get_pins {io_inClock/Y}] -clock inClock 
set_clock_latency -source -late -max -rise  -0.465995 [get_pins {io_inClock/Y}] -clock inClock 
set_clock_latency -source -late -max -fall  -0.477615 [get_pins {io_inClock/Y}] -clock inClock 
