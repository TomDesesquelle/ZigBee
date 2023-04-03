#////////////////////////////////////////////////////
#CREATION DE L'ARBRE D'HORLOGE
#Modified : 20 May 2022
#////////////////////////////////////////////////////

#Cette commande est obsolete mais fonctionne encore sur cette version pourrie d'Innovus alors on la laisse lol ;)
#Set les modes nécessaire à la création du clock_tree

#setup_func_mode hold_func_mode
#extract_clock_generator_skew_groups true
setCTSMode -engine ccopt
set_ccopt_property use_inverters auto
setCCOptMode -cts_opt_type full
create_ccopt_clock_tree_spec -file ccopt.spec
source ccopt.spec

ccopt_design -cts

