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


################# Blockages arround stripes
createPlaceBlockage -type hard -box { { 522.2  421.2 534.8  1760.2 } }
createPlaceBlockage -type hard -box { { 624.4  421.2 637    1760.2 } }
createPlaceBlockage -type hard -box { { 728    421.2 740.6  1760.2 } }
createPlaceBlockage -type hard -box { { 831.6  421.2 844.2  1760.2 } }
createPlaceBlockage -type hard -box { { 933.8  421.2 946.4  1760.2 } }
createPlaceBlockage -type hard -box { { 1037.4 421.2 1050   1760.2 } }
createPlaceBlockage -type hard -box { { 1141   421.2 1153.6 1760.2 } }
createPlaceBlockage -type hard -box { { 1243.2 421.2 1257   1760.2 } }
createPlaceBlockage -type hard -box { { 1346.8 421.2 1359.4 1760.2 } }
createPlaceBlockage -type hard -box { { 1450.4 421.2 1463   1760.2 } }
createPlaceBlockage -type hard -box { { 1552.6 421.2 1566.6 1760.2 } }
createPlaceBlockage -type hard -box { { 1656.2 421.2 1668.8 1760.2 } }

#Placement automatique des standard cells
setRouteMode -earlyGlobalMaxRouteLayer 4
setRouteMode -earlyGlobalMinRouteLayer 1

#Corrige les erreurs de spacing pour certaines cellules
setPlaceMode -padForPinNearBorder true


#Setting useful skew
setOptMode -usefulSkew true

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
group_path -name my_path -from {t_op/u_decoder/fir_filter/Q_data_add_3_buff_reg[14]/D t_op/u_cdr/div1/o_nb_P_reg[0]/QN t_op/u_cdr/div1/o_nb_P_reg[0]/QN  t_op/u_cdr/div1/o_nb_P_reg[0]/QN t_op/u_cdr/div1/o_nb_P_reg[0]/QN t_op/u_cdr/div1/o_nb_P_reg[3]/QN t_op/u_cdr/div1/o_nb_P_reg[0]/Q  t_op/u_cdr/div1/o_nb_P_reg[0]/QN t_op/u_cdr/div1/o_nb_P_reg[0]/QN t_op/u_cdr/div1/o_nb_P_reg[0]/Q t_op/u_cdr/div1/o_nb_P_reg[0]/QN  t_op/u_cdr/div1/o_nb_P_reg[3]/QN  t_op/u_cdr/div1/o_nb_P_reg[0]/QN  t_op/u_cdr/div1/o_nb_P_reg[0]/QN  t_op/u_cdr/div1/o_nb_P_reg[0]/QN t_op/u_cdr/div1/o_nb_P_reg[3]/QN t_op/u_cdr/div1/o_nb_P_reg[3]/QN  t_op/u_cdr/div1/o_nb_P_reg[3]/QN  t_op/u_cdr/div1/o_nb_P_reg[0]/QN t_op/u_cdr/div1/o_nb_P_reg[0]/QN  t_op/u_cdr/div1/o_nb_P_reg[0]/QN t_op/u_cdr/div1/o_nb_P_reg[3]/QN t_op/u_cdr/div1/o_nb_P_reg[3]/QN t_op/u_cdr/div1/o_nb_P_reg[1]/Q  t_op/u_cdr/div1/o_nb_P_reg[1]/Q  t_op/u_cdr/div1/o_nb_P_reg[1]/Q t_op/u_cdr/div1/o_nb_P_reg[1]/Q t_op/u_cdr/div1/o_nb_P_reg[1]/Q t_op/u_cdr/div1/o_nb_P_reg[1]/Q  t_op/u_cdr/div1/o_nb_P_reg[2]/QN  t_op/u_cdr/div1/o_nb_P_reg[0]/Q  t_op/u_cdr/div1/o_nb_P_reg[2]/QN } -to {t_op/u_decoder/fir_filter/Q_data_add_4_buff_reg[3]/Q t_op/u_cdr/phd1/cnt_phd/cnt_reg[1]/D  t_op/u_cdr/phd1/cnt_phd/cnt_reg[3]/D t_op/u_cdr/phd1/cnt_phd/cnt_reg[0]/D t_op/u_cdr/phd1/cnt_phd/cnt_reg[5]/D t_op/u_cdr/dec/cnt_r_reg[4]/D t_op/u_cdr/phd1/cnt_phd/o_en_m_reg/D  t_op/u_cdr/phd1/cnt_phd/cnt_reg[4]/D t_op/u_cdr/phd1/cnt_phd/cnt_reg[2]/D  t_op/u_cdr/dec/o_flag_reg/D  t_op/u_cdr/div1/cnt_div/cnt_reg[3]/D  t_op/u_cdr/dec/cnt_r_reg[3]/D t_op/u_cdr/div1/cnt_div/cnt_reg[5]/D t_op/u_cdr/div1/cnt_div/cnt_reg[0]/D t_op/u_cdr/div1/cnt_div/cnt_reg[2]/D  t_op/u_cdr/dec/cnt_r_reg[1]/D  t_op/u_cdr/dec/cnt_r_reg[0]/D  t_op/u_cdr/phd1/cnt_phd/o_en_reg/D t_op/u_cdr/div1/cnt_div/cnt_reg[4]/D t_op/u_cdr/div1/cnt_div/cnt_reg[1]/D  t_op/u_cdr/div1/cnt_div/cnt_reg[1]/D t_op/u_cdr/dec/cnt_r_reg[5]/D t_op/u_cdr/dec/cnt_r_reg[2]/D  t_op/u_cdr/dec/cnt_dec/cnt_clk_reg[2]/D t_op/u_cdr/dec/cnt_dec/cnt_clk_reg[0]/D t_op/u_cdr/dec/cnt_dec/cnt_clk_reg[3]/D  t_op/u_cdr/dec/cnt_dec/cnt_clk_reg[4]/D t_op/u_cdr/dec/cnt_dec/cnt_clk_reg[5]/D  t_op/u_cdr/dec/cnt_dec/cnt_clk_reg[1]/D t_op/u_cdr/div1/cnt_div/o_en_freq_synch_reg/D  t_op/u_cdr/phd1/cnt_phd/o_en_f_reg/D t_op/u_cdr/dec/cnt_dec/o_en_reg/D }


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











