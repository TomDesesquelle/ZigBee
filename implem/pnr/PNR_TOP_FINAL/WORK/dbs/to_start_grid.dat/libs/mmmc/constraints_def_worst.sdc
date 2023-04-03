
source ${::IMEX::libVar}/mmmc/constraints_variables.sdc

#---------------------------------------------------------
# Input
#---------------------------------------------------------

set_input_transition $input_transition_min_worst -min [get_ports "clk"]
set_input_transition $input_transition_min_worst -min [get_ports "reset"]
set_input_transition $input_transition_min_worst -min [get_ports "i_data"]
set_input_transition $input_transition_min_worst -min [get_ports "i_empty"]

set_input_transition $input_transition_max_worst -max [get_ports "clk"]
set_input_transition $input_transition_max_worst -max [get_ports "reset"]
set_input_transition $input_transition_max_worst -max [get_ports "i_data"]
set_input_transition $input_transition_max_worst -max [get_ports "i_empty"]

set_load -pin_load $std_load_worst [get_ports "clk"]
set_load -pin_load $std_load_worst [get_ports "reset"]
set_load -pin_load $std_load_worst [get_ports "i_data"]
set_load -pin_load $std_load_worst [get_ports "i_empty"]


##---------------------------------------------------------
## Output
##---------------------------------------------------------
set_max_capacitance $max_cap_worst  [get_ports "o_sinI"]
set_max_capacitance $max_cap_worst  [get_ports "o_sinQ"]
set_max_capacitance $max_cap_worst  [get_ports "o_ready"]

