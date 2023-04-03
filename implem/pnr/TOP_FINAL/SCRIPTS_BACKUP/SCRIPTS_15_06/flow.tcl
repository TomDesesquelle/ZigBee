#////////////////////////////////////////////////////
#DEROULEMENT DU FLOW DE CONCEPTION
#Modified : 20 May 2022
#////////////////////////////////////////////////////

#Init le design (netlist, lef, alims, etc..)
source ../SCRIPTS/init.tcl
init_design
#Placement des pads + creation de la grille + connexion des pads d'alimentation a la grille
source ../SCRIPTS/design_config.tcl
#setAnalysisMode -analysisType onChipVariation

#saveDesign dbs/floorplan_enc

#Placement des standard cells
source ../SCRIPTS/placement.tcl

#saveDesign dbs/prects_enc
#Création du clock_tree
source ../SCRIPTS/clock_tree_synthesis.tcl
#saveDesign dbs/postcts_enc

#Ajout des fillers in core and pads
source ../SCRIPTS/add_fillers.tcl
#saveDesign dbs/addFiller_enc

#Useful skew
setOptMode -usefulSkewPostRoute true

routeDesign





optDesign -postRoute

#route_opt_design



pinAnalysis
#pinAlignment
fixVia -short

saveDesign dbs/route_enc

