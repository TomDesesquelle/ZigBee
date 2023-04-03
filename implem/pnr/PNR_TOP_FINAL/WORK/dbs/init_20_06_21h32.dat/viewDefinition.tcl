if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name fast_libs\
   -timing\
    [list ${::IMEX::libVar}/mmmc/c35_CORELIB_BC.lib\
    ${::IMEX::libVar}/mmmc/c35_IOLIB_BC.lib]
create_library_set -name slow_libs\
   -timing\
    [list ${::IMEX::libVar}/mmmc/c35_CORELIB_WC.lib\
    ${::IMEX::libVar}/mmmc/c35_IOLIB_WC.lib]
create_library_set -name typ_libs\
   -timing\
    [list ${::IMEX::libVar}/mmmc/c35_CORELIB_TYP.lib\
    ${::IMEX::libVar}/mmmc/c35_IOLIB_TYP.lib]
create_rc_corner -name rc_typ\
   -cap_table ${::IMEX::libVar}/mmmc/c35b4_thick-typical.capTable\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 1\
   -preRoute_clkcap 1\
   -postRoute_clkcap 1\
   -postRoute_clkres 1\
   -T 25\
   -qx_tech_file ${::IMEX::libVar}/mmmc/rc_typ/qrcTechFile
create_rc_corner -name rc_best\
   -cap_table ${::IMEX::libVar}/mmmc/c35b4_thick-best.capTable\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T -25\
   -qx_tech_file ${::IMEX::libVar}/mmmc/rc_best/qrcTechFile
create_rc_corner -name rc_worst\
   -cap_table ${::IMEX::libVar}/mmmc/c35b4_thick-worst.capTable\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 1\
   -preRoute_clkcap 1\
   -postRoute_clkcap 1\
   -postRoute_clkres 1\
   -T 125\
   -qx_tech_file ${::IMEX::libVar}/mmmc/rc_worst/qrcTechFile
create_delay_corner -name corner_typ\
   -library_set typ_libs\
   -rc_corner rc_typ
create_delay_corner -name corner_min\
   -library_set fast_libs\
   -rc_corner rc_best
create_delay_corner -name corner_max\
   -library_set slow_libs\
   -rc_corner rc_worst
create_constraint_mode -name setup_func_mode\
   -sdc_files\
    [list ${::IMEX::libVar}/mmmc/clock_def.sdc\
     ${::IMEX::libVar}/mmmc/clock_uncertainty_prects.sdc\
     ${::IMEX::libVar}/mmmc/constraints_def_worst.sdc]
create_constraint_mode -name hold_func_mode\
   -sdc_files\
    [list ${::IMEX::libVar}/mmmc/clock_def.sdc\
     ${::IMEX::libVar}/mmmc/clock_uncertainty_prects.sdc\
     ${::IMEX::libVar}/mmmc/constraints_def_best.sdc]
create_analysis_view -name hold_func_typ -constraint_mode hold_func_mode -delay_corner corner_typ
create_analysis_view -name hold_func_min -constraint_mode hold_func_mode -delay_corner corner_min
create_analysis_view -name hold_func_max -constraint_mode hold_func_mode -delay_corner corner_max
create_analysis_view -name setup_func_typ -constraint_mode setup_func_mode -delay_corner corner_typ
create_analysis_view -name setup_func_min -constraint_mode setup_func_mode -delay_corner corner_min
create_analysis_view -name setup_func_max -constraint_mode setup_func_mode -delay_corner corner_max
set_analysis_view -setup [list setup_func_max] -hold [list hold_func_min]
