set_clock_latency -source -early -min -rise  -2.5771 [get_pins {io_inClock/Y}] -clock inClock 
set_clock_latency -source -early -min -fall  -2.60691 [get_pins {io_inClock/Y}] -clock inClock 
set_clock_latency -source -early -max -rise  -2.5771 [get_pins {io_inClock/Y}] -clock inClock 
set_clock_latency -source -early -max -fall  -2.60691 [get_pins {io_inClock/Y}] -clock inClock 
set_clock_latency -source -late -min -rise  -2.5771 [get_pins {io_inClock/Y}] -clock inClock 
set_clock_latency -source -late -min -fall  -2.60691 [get_pins {io_inClock/Y}] -clock inClock 
set_clock_latency -source -late -max -rise  -2.5771 [get_pins {io_inClock/Y}] -clock inClock 
set_clock_latency -source -late -max -fall  -2.60691 [get_pins {io_inClock/Y}] -clock inClock 
