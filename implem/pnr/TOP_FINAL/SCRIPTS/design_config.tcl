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
#floorPlan -site standard -r 1 0.7 80 80 80 80
floorPlan -site standard -d {2400.8 2400.8 80 80 80 80} -noSnapToGrid -coreMarginsBy io


#deleteTrack

#add_tracks -offsets {M4 horiz 420.4 M4 vert 420.4 M3 horiz 420.4 M3 vert 420.4 M2 horiz 420.4 M2 vert 420.4 M1 horiz 0 M1 vert 0.7} -pitches {M4 horiz 1.6 M4 vert 1.6 M3 horiz 1.6 M3 vert 1.6 M2 horiz 1.6 M2 vert 1.6 M1 horiz 1.3 M1 vert 1.4}
#add_tracks -offsets {M4 horiz 420.4 M4 vert 420.4 M3 horiz 420.4 M3 vert 420.4 M2 horiz 420.4 M2 vert 420.4 M1 horiz 420.4 M1 vert 420.4} -pitches {M4 horiz 1.6 M4 vert 1.6 M3 horiz 1.6 M3 vert 1.6 M2 horiz 1.6 M2 vert 1.6 M1 horiz 1.1 M1 vert 1.8}
#add_tracks -offsets {M4 horiz 420.4 M4 vert 420.4 M3 horiz 420.4 M3 vert 420.4 M2 horiz 420.4 M2 vert 420.4 M1 horiz 420.4 M1 vert 420.4} -pitches {M4 horiz 1.6 M4 vert 1.6 M3 horiz 1.6 M3 vert 1.6 M2 horiz 1.6 M2 vert 1.6 M1 horiz 1.1 M1 vert 1.8}

#add_tracks -offsets {M4 horiz 420.4 M4 vert 420.4 M3 horiz 420.4 M3 vert 420.4 M2 horiz 420.4 M2 vert 420.4 M1 horiz 420.4 M1 vert 420.4} -pitches {M4 horiz 2.8 M4 vert 2.6 M3 horiz 2.8 M3 vert 2.6 M2 horiz 2.8 M2 vert 2.6}

#add_tracks -offsets {M4 horiz 0 M4 vert 0 M3 horiz 0 M3 vert 0 M2 horiz 0 M2 vert 0 M1 horiz 0 M1 vert 0} -pitches {M4 horiz 2.8 M4 vert 2.6 M3 horiz 2.8 M3 vert 2.6 M2 horiz 2.8 M2 vert 2.6 M1 horiz 1.3 M1 vert 1.4}


setEdit -layer_horizontal {MET1}
setEdit -layer_horizontal {MET3}
setEdit -layer_vertical  {MET2} 
setEdit -layer_vertical  {MET4}

setEdit -spacing 0.45 -layer MET1
setEdit -spacing 0.5 -layer MET2
setEdit -spacing 0.6 -layer MET3
setEdit -spacing 0.6 -layer MET4

setViaEdit -x_size 0.6 -y_size 0.6 -viacell *VIA1*
setViaEdit -x_size 0.6 -y_size 0.6 -viacell *VIA2*
setViaEdit -x_size 0.65 -y_size 0.65 -viacell *VIA3*


setMetalFill -gapSpacing 0.45 	-layer MET1
setMetalFill -gapSpacing 0.5 	-layer MET2
setMetalFill -gapSpacing 0.6	-layer MET3
setMetalFill -gapSpacing 0.6	-layer MET4


#add_ndr -name rule_of_toto -width "M1 0.5 M2 0.6 M3 0.6 M4 0.6" -spacing "M1 0.45 M2 0.5 M3 0.6 M4 0.6"
#setViaGenMode -optimize_cross_via true
#setAttribute -net * -non_default_rule rule_of_toto

#add_ndr -name testwidth -width {M1 0.8} 
#editChangeWidth -width_horizontal 0.8

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
set x [expr $size_of_partition / 125]
set nb_of_sets [expr int($x) - 1]

#Valeurs spécifique à la techno (NE PAS CHANGER !!!)
set stripe_spacing 0.5
set stripe_width 5
set stripe_direction vertical
set stripe_layer MET2
set stripe_start_offset 80
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

globalNetConnect vdd3r1! -type pgpin -pin vdd3r1! -inst io_* -module {}
globalNetConnect vdd3r2! -type pgpin -pin vdd3r2! -inst io_* -module {}
globalNetConnect vdd3o! -type pgpin -pin vdd3o! -inst io_* -module {}
globalNetConnect gnd3r! -type pgpin -pin gnd3r! -inst io_* -module {}
globalNetConnect gnd3o! -type pgpin -pin gnd3o! -inst io_* -module {}

globalNetConnect vdd3r1! -type pgpin -pin vdd3r1! -inst CORNER* -module {}
globalNetConnect vdd3r2! -type pgpin -pin vdd3r2! -inst CORNER* -module {}
globalNetConnect vdd3o! -type pgpin -pin vdd3o! -inst CORNER* -module {}
globalNetConnect gnd3r! -type pgpin -pin gnd3r! -inst CORNER* -module {}
globalNetConnect gnd3o! -type pgpin -pin gnd3o! -inst CORNER* -module {}

globalNetConnect vdd3r1! -type pgpin -pin vdd3r1! -inst pfill* -module {}
globalNetConnect vdd3r2! -type pgpin -pin vdd3r2! -inst pfill* -module {}
globalNetConnect vdd3o! -type pgpin -pin vdd3o! -inst pfill* -module {}
globalNetConnect gnd3r! -type pgpin -pin gnd3r! -inst pfill* -module {}
globalNetConnect gnd3o! -type pgpin -pin gnd3o! -inst pfill* -module {}

globalNetConnect vdd3r1! -type pgpin -pin vdd3r1! -inst PWR1 -module {}
globalNetConnect vdd3r2! -type pgpin -pin vdd3r2! -inst PWR1 -module {}
globalNetConnect vdd3o! -type pgpin -pin vdd3o! -inst PWR1 -module {}
globalNetConnect gnd3r! -type pgpin -pin gnd3r! -inst PWR1 -module {}
globalNetConnect gnd3o! -type pgpin -pin gnd3o! -inst PWR1 -module {}


globalNetConnect gnd3r! -type pgpin -pin gnd3r! -inst GND1 -module {}
globalNetConnect gnd3o! -type pgpin -pin gnd3o! -inst GND1 -module {}
globalNetConnect vdd3r1! -type pgpin -pin vdd3r1! -inst GND1 -module {}
globalNetConnect vdd3r2! -type pgpin -pin vdd3r2! -inst GND1 -module {}
globalNetConnect vdd3o! -type pgpin -pin vdd3o! -inst GND1 -module {}

globalNetConnect vdd3r1! -type pgpin -pin vdd3r1! -inst PWR2 -module {}
globalNetConnect vdd3r2! -type pgpin -pin vdd3r2! -inst PWR2 -module {}
globalNetConnect vdd3o! -type pgpin -pin vdd3o! -inst PWR2 -module {}
globalNetConnect gnd3r! -type pgpin -pin gnd3r! -inst PWR2 -module {}
globalNetConnect gnd3o! -type pgpin -pin gnd3o! -inst PWR2 -module {}


globalNetConnect gnd3r! -type pgpin -pin gnd3r! -inst GND2 -module {}
globalNetConnect gnd3o! -type pgpin -pin gnd3o! -inst GND2 -module {}
globalNetConnect vdd3r1! -type pgpin -pin vdd3r1! -inst GND2 -module {}
globalNetConnect vdd3r2! -type pgpin -pin vdd3r2! -inst GND2 -module {}
globalNetConnect vdd3o! -type pgpin -pin vdd3o! -inst GND2 -module {}

globalNetConnect gnd3r! -type pgpin -pin gnd3r! -inst PWR3 -module {}
globalNetConnect gnd3o! -type pgpin -pin gnd3o! -inst PWR3 -module {}
globalNetConnect vdd3r1! -type pgpin -pin vdd3r1! -inst PWR3 -module {}
globalNetConnect vdd3r2! -type pgpin -pin vdd3r2! -inst PWR3 -module {}
globalNetConnect vdd3o! -type pgpin -pin vdd3o! -inst PWR3 -module {}


globalNetConnect vdd! -type pgpin -pin A -inst PWR1 -module {}
globalNetConnect vdd! -type pgpin -pin A -inst PWR2 -module {}
globalNetConnect vdd! -type pgpin -pin A -inst PWR3 -module {}
globalNetConnect gnd! -type pgpin -pin A -inst GND1 -module {}
globalNetConnect gnd! -type pgpin -pin A -inst GND2 -module {}

#////////////////////////////////////////////////////



#////////////////////////////////////////////////////
#Special_route
#////////////////////////////////////////////////////

#Pour faire les stripe d'alimentation à l'horizontal
setSrouteMode -viaConnectToShape { noshape }

sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { MET1 MET4 } -blockPinTarget {nearestRingStripe nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { MET1 MET4 } -nets { gnd! vdd! } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { MET1 MET4 }

editPowerVia -add_vias 1

#////////////////////////////////////////////////////








