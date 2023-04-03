
source ${::IMEX::libVar}/mmmc/constraints_variables.sdc

#---------------------------------------------------------
# Input
#---------------------------------------------------------

set_input_transition $input_transition_min_best -min [get_ports "clk"]
set_input_transition $input_transition_min_best -min [get_ports "reset"]
set_input_transition $input_transition_min_best -min [get_ports "i_data"]
set_input_transition $input_transition_min_best -min [get_ports "i_empty"]

set_input_transition $input_transition_max_best -max [get_ports "clk"]
set_input_transition $input_transition_max_best -max [get_ports "reset"]
set_input_transition $input_transition_max_best -max [get_ports "i_data"]
set_input_transition $input_transition_max_best -max [get_ports "i_empty"]

set_load -pin_load $std_load_best [get_ports "clk"]
set_load -pin_load $std_load_best [get_ports "reset"]
set_load -pin_load $std_load_best [get_ports "i_data"]
set_load -pin_load $std_load_best [get_ports "i_empty"]


##---------------------------------------------------------
## Output
##---------------------------------------------------------
set_max_capacitance $max_cap_best  [get_ports "o_sinI"]
set_max_capacitance $max_cap_best  [get_ports "o_sinQ"]
set_max_capacitance $max_cap_best  [get_ports "o_ready"]
