##################################################################################
#                           PRE-POST_ROUTE_SI PLUG-IN 
##################################################################################
#
# This plug-in script is called before timeDesign -signoff -si from the 
# run_signoff.tcl flow script.
#
##################################################################################

set lefDefOutVersion 5.7

setExtractRCMode -relative_c_th 0.01 -total_c_th 5.0 -reduce 5

setXCapThresholds -totalCThreshold 5.0 -relativeCThreshold 0.01
