###################################################################

# Created by write_sdc on Tue May 24 16:20:32 2022

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
set_operating_conditions TYPICAL -library c35_CORELIB_TYP
create_clock [get_ports i_clk]  -period 20  -waveform {0 10}
