###################################################################

# Created by write_sdc on Fri Jun 24 18:48:06 2022

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
set_operating_conditions WORST -library c35_CORELIB_TYP
create_clock [get_ports inClock]  -period 20  -waveform {0 10}
