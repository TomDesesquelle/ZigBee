#floorPlan -site standard -r 1 0.7 80 80 80 80
loadIoFile ../INPUT_DATA/top_FILTER.io

set xMinStep 1.4
set yMinStep 13.0

set pretendedXsize 60
set pretendedYsize 30

#floorPlan -s [ expr ceil($pretendedXsize/$xMinStep)*$xMinStep ] [ expr ceil($pretendedYsize/$yMinStep)*$yMinStep ] 0 0 0 0
floorPlan -site standard -r 1 0.7 80 80 80 80

setPreference ConstraintUserXGrid 0.1
setPreference ConstraintUserXOffset 0.1
setPreference ConstraintUserYGrid 0.1
setPreference ConstraintUserYOffset 0.1
setPreference SnapAllCorners 1
setPreference BlockSnapRule 2


snapFPlanIO -usergrid

setAddRingMode -stacked_via_bottom_layer MET1 -stacked_via_top_layer MET4

addRing \
-layer {top MET1 bottom MET1 left MET2 right MET2} \
-offset {top 2.8 bottom 2.8 left 2.8 right 2.8} \
-spacing  {top 10 bottom 10 left 10 right 10} \
-width {top 20 bottom 20 left 20 right 20} \
-center 1 \
-jog_distance 2.8 \
-threshold 2.8 \
-nets {gnd! vdd!} \
-type core_rings


addStripe -block_ring_top_layer_limit MET3 -max_same_layer_jog_length 5.0 -padcore_ring_bottom_layer_limit MET1 -number_of_sets 4 -padcore_ring_top_layer_limit MET3 -spacing 0.5 -merge_stripes_value 2.8 -layer MET2 -width 5 -nets {gnd! vdd!} -stop_offset 100 -start_offset 100


clearGlobalNets
globalNetConnect vdd! -type pgpin -pin vdd! -inst * -module {}
globalNetConnect gnd! -type pgpin -pin gnd! -inst * -module {}
globalNetConnect vdd! -type pgpin -pin A -inst PWR1 -module {}
globalNetConnect gnd! -type pgpin -pin A -inst GND1 -module {}

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

globalNetConnect vdd3r1! -type pgpin -pin vdd3r1! -inst PWR1 -module {}
globalNetConnect vdd3r2! -type pgpin -pin vdd3r2! -inst PWR1 -module {}
globalNetConnect vdd3o! -type pgpin -pin vdd3o! -inst PWR1 -module {}
globalNetConnect gnd3r! -type pgpin -pin gnd3r! -inst PWR1 -module {}
globalNetConnect gnd3o! -type pgpin -pin gnd3o! -inst PWR1 -module {}

globalNetConnect vdd3r1! -type pgpin -pin vdd3r1! -inst GND1 -module {}
globalNetConnect vdd3r2! -type pgpin -pin vdd3r2! -inst GND1 -module {}
globalNetConnect vdd3o! -type pgpin -pin vdd3o! -inst GND1 -module {}
globalNetConnect gnd3r! -type pgpin -pin gnd3r! -inst GND1 -module {}
globalNetConnect gnd3o! -type pgpin -pin gnd3o! -inst GND1 -module {}



sroute -connect { blockPin padPin padRing corePin } -layerChangeRange { MET1 MET4 } -blockPinTarget { nearestRingStripe nearestTarget } -padPinPortConnect { allPort oneGeom } -blockPin useLef -allowJogging 1 -allowLayerChange 1 -targetViaLayerRange {MET1 MET4} -crossoverViaLayerRange {MET1 MET4} -nets { gnd! vdd! }

checkNetlist -outfile my_pr_netlist.net

checkDesign -floorplan

##-- add ENDCAP cells

setEndCapMode -reset
setEndCapMode \
    -prefix       ENDCAP \
    -leftBottomEdge   "ENDCAPL" \
    -leftTopEdge      "ENDCAPL" \
    -rightBottomEdge  "ENDCAPR" \
    -rightTopEdge     "ENDCAPR" \
    -leftEdge     "ENDCAPL" \
    -rightEdge    "ENDCAPR"


#setEndCapMode \
#    -prefix       ENDCAP \
#    -topBottomEdge    "C12T28SOI_LVTFILLERPCENDTB64 C12T28SOI_LVTFILLERPCENDTB32 C12T28SOI_LVTFILLERPCENDTB16 C12T28SOI_LVTFILLERPCENDTB8 C12T28SOI_LVTFILLERPCENDTB4 C12T28SOI_LVTFILLERPCENDTB2 C12T28SOI_LVTFILLERPCENDTB1" \
#    -bottomEdge       "C12T28SOI_LVTFILLERPCENDT64 C12T28SOI_LVTFILLERPCENDT32 C12T28SOI_LVTFILLERPCENDT16 C12T28SOI_LVTFILLERPCENDT8 C12T28SOI_LVTFILLERPCENDT4 C12T28SOI_LVTFILLERPCENDT2 C12T28SOI_LVTFILLERPCENDT1" \
#    -topEdge          "C12T28SOI_LVTFILLERPCENDB64 C12T28SOI_LVTFILLERPCENDB32 C12T28SOI_LVTFILLERPCENDB16 C12T28SOI_LVTFILLERPCENDB8 C12T28SOI_LVTFILLERPCENDB4 C12T28SOI_LVTFILLERPCENDB2 C12T28SOI_LVTFILLERPCENDB1" \
#    -leftBottomEdge   "C12T28SOI_LVTFILLERPCENDTR1" \
#    -leftTopEdge      "C12T28SOI_LVTFILLERPCENDBR1" \
#    -leftTopBottomCorner  "C12T28SOI_LVTFILLERPCENDTBL1" \
#    -rightBottomEdge      "C12T28SOI_LVTFILLERPCENDTL1" \
#    -rightTopEdge     "C12T28SOI_LVTFILLERPCENDBL1" \
#    -rightTopBottomCorner "C12T28SOI_LVTFILLERPCENDTBR1" \
#    -leftBottomCorner    "C12T28SOI_LL_FILLERPFOP2" \
#    -leftTopCorner   "C12T28SOI_LL_FILLERPFOP2" \
#    -rightBottomCorner   "C12T28SOI_LL_FILLERPFOP2" \
#    -rightTopCorner   "C12T28SOI_LL_FILLERPFOP2" \
#    -leftEdge     "C12T28SOI_LL_FILLERPFOP2" \
#    -rightEdge    "C12T28SOI_LL_FILLERPFOP2"

suppressMessage ENCSP-5160

addEndCap


foreach fillcell $vars(io_filler_list) {
	addIoFiller -cell PERI_SPACER_$fillcell -prefix pfill
}
