set_clock_latency -source -early -min -rise  -1.95252 [get_pins {io_inClock/Y}] -clock inClock 
set_clock_latency -source -early -min -fall  -1.96507 [get_pins {io_inClock/Y}] -clock inClock 
set_clock_latency -source -early -max -rise  -1.95252 [get_pins {io_inClock/Y}] -clock inClock 
set_clock_latency -source -early -max -fall  -1.96507 [get_pins {io_inClock/Y}] -clock inClock 
set_clock_latency -source -late -min -rise  -1.95252 [get_pins {io_inClock/Y}] -clock inClock 
set_clock_latency -source -late -min -fall  -1.96507 [get_pins {io_inClock/Y}] -clock inClock 
set_clock_latency -source -late -max -rise  -1.95252 [get_pins {io_inClock/Y}] -clock inClock 
set_clock_latency -source -late -max -fall  -1.96507 [get_pins {io_inClock/Y}] -clock inClock 
