source $vars(data_dir)/constraints_variables.sdc

#---------------------------------------------------------
# Input
#---------------------------------------------------------
set_interactive_constraint_modes [all_constraint_modes -active]


set_input_transition $input_transition_min_worst -min [get_ports "inClock"]
set_input_transition $input_transition_min_worst -min [get_ports "inReset"]
set_input_transition $input_transition_min_worst -min [get_ports "in_inFIFO_inData"]
set_input_transition $input_transition_min_worst -min [get_ports "in_DEMUX_inDEMUX17"]
set_input_transition $input_transition_min_worst -min [get_ports "in_DEMUX_inDEMUX18"]
set_input_transition $input_transition_min_worst -min [get_ports "in_DEMUX_inSEL1"]
set_input_transition $input_transition_min_worst -min [get_ports "in_MUX_inSEL6"]
set_input_transition $input_transition_min_worst -min [get_ports "in_MUX_inSEL9"]
set_input_transition $input_transition_min_worst -min [get_ports "in_MUX_inSEL15"]
set_input_transition $input_transition_min_worst -min [get_ports "in_outFIFO_inReadEnable"]
set_input_transition $input_transition_min_worst -min [get_ports "in_DEMUX_inDEMUX1"]
set_input_transition $input_transition_min_worst -min [get_ports "in_DEMUX_inDEMUX2"]


set_input_transition $input_transition_max_worst -max [get_ports "inClock"]
set_input_transition $input_transition_max_worst -max [get_ports "inReset"]
set_input_transition $input_transition_max_worst -max [get_ports "in_inFIFO_inData"]
set_input_transition $input_transition_max_worst -max [get_ports "in_DEMUX_inDEMUX17"]
set_input_transition $input_transition_max_worst -max [get_ports "in_DEMUX_inDEMUX18"]
set_input_transition $input_transition_max_worst -max [get_ports "in_DEMUX_inSEL1"]
set_input_transition $input_transition_max_worst -max [get_ports "in_MUX_inSEL6"]
set_input_transition $input_transition_max_worst -max [get_ports "in_MUX_inSEL9"]
set_input_transition $input_transition_max_worst -max [get_ports "in_MUX_inSEL15"]
set_input_transition $input_transition_max_worst -max [get_ports "in_outFIFO_inReadEnable"]
set_input_transition $input_transition_max_worst -max [get_ports "in_DEMUX_inDEMUX1"]
set_input_transition $input_transition_max_worst -max [get_ports "in_DEMUX_inDEMUX2"]


set_load -pin_load $std_load_worst -min [get_ports "inClock"]
set_load -pin_load $std_load_worst -min [get_ports "inReset"]
set_load -pin_load $std_load_worst -min [get_ports "in_inFIFO_inData"]
set_load -pin_load $std_load_worst -min [get_ports "in_DEMUX_inDEMUX17"]
set_load -pin_load $std_load_worst -min [get_ports "in_DEMUX_inDEMUX18"]
set_load -pin_load $std_load_worst -min [get_ports "in_DEMUX_inSEL1"]
set_load -pin_load $std_load_worst -min [get_ports "in_MUX_inSEL6"]
set_load -pin_load $std_load_worst -min [get_ports "in_MUX_inSEL9"]
set_load -pin_load $std_load_worst -min [get_ports "in_MUX_inSEL15"]
set_load -pin_load $std_load_worst -min [get_ports "in_outFIFO_inReadEnable"]
set_load -pin_load $std_load_worst -min [get_ports "in_DEMUX_inDEMUX1"]
set_load -pin_load $std_load_worst -min [get_ports "in_DEMUX_inDEMUX2"]



##---------------------------------------------------------
## Output
##---------------------------------------------------------
#set_max_capacitance $max_cap_worst  [get_ports "o_sinI"]
#set_max_capacitance $max_cap_worst  [get_ports "o_sinQ"]
#set_max_capacitance $max_cap_worst  [get_ports "o_ready"]


set_max_capacitance $max_cap_worst [get_ports "out_MUX_outMUX9"]
set_max_capacitance $max_cap_worst [get_ports "out_MUX_outMUX10"]
set_max_capacitance $max_cap_worst [get_ports "out_MUX_outMUX15"]
set_max_capacitance $max_cap_worst [get_ports "out_MUX_outMUX16"]
set_max_capacitance $max_cap_worst [get_ports "out_inFIFO_outWriteError"]
set_max_capacitance $max_cap_worst [get_ports "out_inFIFO_outReadError"]
set_max_capacitance $max_cap_worst [get_ports "out_inFIFO_outDone"]
set_max_capacitance $max_cap_worst [get_ports "out_outFIFO_outWriteError"]
set_max_capacitance $max_cap_worst [get_ports "out_outFIFO_outReadError"]
set_max_capacitance $max_cap_worst [get_ports "out_outFIFO_outDone"]

