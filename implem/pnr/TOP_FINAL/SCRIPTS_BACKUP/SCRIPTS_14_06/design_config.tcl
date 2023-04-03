#////////////////////////////////////////////////////
#CONFIGURATION DU FLOORPLAN
#Modified : 30 May 2022
#////////////////////////////////////////////////////

#////////////////////////////////////////////////////
#Respect des règles de DRC
#////////////////////////////////////////////////////
#set min_MET1_width 0.5
#set min_MET1_spacing 0.45
#set min_MET1_to_WIDE_MET1_spacing 0.8
#set min_MET1_enclosure 0.15
#set min_MET1_density_area 30
#set min_MET1_to_KEPOUT_or_SFCDEF 0.45





#////////////////////////////////////////////////////
#Creation et placement des PADs
#////////////////////////////////////////////////////

set module_name top
loadIoFile ../CONSTRAINTS/${module_name}_pads.io
floorPlan -site standard -r 1 0.7 80 80 80 80 -coreMarginsBy io
#////////////////////////////////////////////////////



#////////////////////////////////////////////////////
#Creation de la grille d'alimentation
#////////////////////////////////////////////////////
	

#Set les modes de création de la grille
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer MET4 -stacked_via_bottom_layer MET1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }

#Ajoute la grille
addRing -nets {gnd! vdd!} -type core_rings -follow core -layer {top MET1 bottom MET1 left MET2 right MET2} -width {top 20 bottom 20 left 20 right 20} -spacing {top 10 bottom 10 left 10 right 10} -offset {top 0.7 bottom 0.7 left 0.7 right 0.7} -center 1 -extend_corner {} -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None


#Variables pour la création des stripes
#Calculs de l'offset de grille
set box_core  [get_db current_design .core_bbox]
set x1 [lindex $box_core 0 0]
set x2 [lindex $box_core 0 2]
set size_of_partition [expr $x2 - $x1]
set x [expr $size_of_partition / 100]
set nb_of_sets [expr int($x) - 1]

#Valeurs spécifique à la techno (NE PAS CHANGER !!!)
set stripe_spacing 0.5
set stripe_width 5
set stripe_direction vertical
set stripe_layer MET2
set stripe_start_offset 100
set stripe_stop_offset 100

#Set les modes pour les stripes
setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 5 -stripe_min_length 0 -stacked_via_top_layer MET4 -stacked_via_bottom_layer MET1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring }


addStripe -nets {gnd! vdd!} -layer $stripe_layer -direction $stripe_direction -width $stripe_width -spacing $stripe_spacing -number_of_sets $nb_of_sets -start_from left -start_offset $stripe_start_offset -stop_offset $stripe_stop_offset -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit MET4 -padcore_ring_bottom_layer_limit MET1 -block_ring_top_layer_limit MET4 -block_ring_bottom_layer_limit MET1 -use_wire_group 0 -snap_wire_center_to_grid None -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }

#////////////////////////////////////////////////////



#////////////////////////////////////////////////////
#ConnectGlobalNets
#////////////////////////////////////////////////////

clearGlobalNets
globalNetConnect vdd! -type pgpin -pin vdd! -inst * -module {}
globalNetConnect gnd! -type pgpin -pin gnd! -inst * -module {}
globalNetConnect vdd! -type pgpin -pin A -inst PWR1 -module {}
globalNetConnect vdd! -type pgpin -pin A -inst PWR2 -module {}
globalNetConnect gnd! -type pgpin -pin A -inst GND1 -module {}
globalNetConnect gnd! -type pgpin -pin A -inst GND2 -module {}

#////////////////////////////////////////////////////



#////////////////////////////////////////////////////
#Special_route
#////////////////////////////////////////////////////

#Pour faire les stripe d'alimentation à l'horizontal
setSrouteMode -viaConnectToShape { noshape }

sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { MET1(1) MET4(4) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { MET1(1) MET4(4) } -nets { gnd! vdd! } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { MET1(1) MET4(4) }

editPowerVia -add_vias 1

#////////////////////////////////////////////////////








