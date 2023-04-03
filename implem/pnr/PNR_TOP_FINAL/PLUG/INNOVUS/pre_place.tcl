####################################################################################
#                          PRE-PLACE PLUG-IN
####################################################################################
#
# This plug-in script is called before placeDesign from the run_place.tcl flow
# script.
#
####################################################################################
# Example tasks include:
#          - Power planning related tasks which includes
#            - Power planning for power domains (ring/strap creations)
#            - Power Shut-off cell power hookup
############################################################################################
setPlaceMode -timingdriven true -reorderScan false -congEffort high -doCongOpt -modulePlan false
setCTSMode -routeTopPreferredLayer 4 \
   -routeLeafTopPreferredLayer 3 \
   -routeBottomPreferredLayer 1 \
   -routeLeafBottomPreferredLayer 1

