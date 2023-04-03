#////////////////////////////////////////////////////
#SCRIPT DE PLACEMENT DES CELLULES
#Modified : 20 May 2022
#////////////////////////////////////////////////////

#Utilisation d'un noeud technologique supérieur ou égal à 130 nm
setDesignMode -process 250

#Placement des capa de découplage entre les rails d'alimentation vdd! gnd!
setEndCapMode -prefix ENDCAP -leftEdge ENDCAPL -rightEdge ENDCAPR
addEndCap -prefix ENDCAP
#addEndCap -preCap ENDCAPL -postCap ENDCAPR -prefix ENDCAP

#Cellules accolées en respectant les règles DRC
setPlaceMode -padForPinNearBorder true

#Placement automatique des standard cells
setRouteMode -earlyGlobalMaxRouteLayer 4
setRouteMode -earlyGlobalMinRouteLayer 1

#Création des group paths
set_interactive_constraint_modes [all_constraint_modes -active]
reset_path_group -all
reset_path_exception

set input_ports [all_inputs -no_clocks]
set output_ports [all_outputs]
set rams [get_cells -quiet -hierarchical * -filter "is_memory_cell==true"]

set gated_all [filter_collection [all_registers] "is_integrated_clock_gating_cell == true"]
set gated_rtl [get_cells -quiet -hierarchical * -filter "hierarchical_name =~ *GATED"]
set gated_synth [remove_from_collection $gated_all $gated_rtl]

set seqs [all_registers]
set tmp1 [remove_from_collection $seqs $gated_all]
set regs [remove_from_collection $tmp1 $rams]

#Registers
group_path -name reg2reg 	-from $regs 		-to $regs
group_path -name in2reg 	-from  $input_ports 	-to $regs
group_path -name reg2out 	-from $regs 		-to $output_ports
group_path -name in2out 	-from $input_ports 	-to $output_ports
group_path -name reg2gated 	-from $regs 		-to $gated_all
group_path -name in2gated 	-from $input_ports 	-to $gated_all



#RAMs
#Pas de rams dans notre circuit

#Custom
group_path -name my_path -from t_op/u_cdr/div1/o_nb_P_reg[2]/QN -to t_op/u_cdr/phd1/cnt_phd/cnt_reg[5]/D


#Options for path_groups
set_interactive_constraint_modes {}
setPathGroupOptions reg2reg 	-effortLevel high -slackAdjustment 0
setPathGroupOptions in2reg 	-effortLevel high -slackAdjustment 0
setPathGroupOptions reg2out 	-effortLevel high -slackAdjustment 0
setPathGroupOptions in2out 	-effortLevel high -slackAdjustment 0
setPathGroupOptions reg2gated 	-effortLevel high -slackAdjustment 0
setPathGroupOptions in2gated 	-effortLevel high -slackAdjustment 0
setPathGroupOptions my_path 	-effortLevel high -slackAdjustment 0

place_opt_design
#setPlaceMode -fp false
#placeDesign -noPrePlaceOpt



setOptMode -fixCap true -fixTran  true -fixFanoutLoad false
optDesign -preCTS	


#routeDesign -globalDetail

#setAnalysisMode -analysisType onChipVariation -cppr both
#setOptMode -fixCap true -fixTran true -fixFanoutLoad false











