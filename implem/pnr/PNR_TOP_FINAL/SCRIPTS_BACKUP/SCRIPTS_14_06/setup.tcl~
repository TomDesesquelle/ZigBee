###############################################################################
#                       CADENCE COPYRIGHT NOTICE
#         © 2008-2013 Cadence Design Systems, Inc. All rights reserved.
#------------------------------------------------------------------------------
#
# This Foundation Flow is provided as an example of how to perform specialized
# tasks.
#
# This work may not be copied, re-published, uploaded, or distributed in any way,
# in any medium, whether in whole or in part, without prior written permission
# from Cadence. Notwithstanding any restrictions herein, subject to compliance
# with the terms and conditions of the Cadence software license agreement under
# which this material was provided, this material may be copied and internally
# distributed solely for internal purposes for use with Cadence tools.
#
# This work is Cadence intellectual property and may under no circumstances be
# given to third parties, neither in original nor in modified versions, without
# explicit written permission from Cadence. The information contained herein is
# the proprietary and confidential information of Cadence or its licensors, and
# is supplied subject to, and may be used only by Cadence's current customers
# in accordance with, a previously executed license agreement between Cadence
# and its customer.
#
#------------------------------------------------------------------------------
# THIS MATERIAL IS PROVIDED BY CADENCE "AS IS" AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
# IN NO EVENT SHALL CADENCE BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL
# OR CONSEQUENTIAL DAMAGES HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT  (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS  MATERIAL, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
###############################################################################

global vars

###############################################################################
# Define some variables to point to data, libraries, and scripts
###############################################################################
set vars(design_dir)  "."
set vars(data_dir)    $vars(design_dir)/INPUT_DATA
set vars(library_dir) /softslin/AMS_410_ISR15
#set vars(script_dir)  SCRIPTS

###############################################################################
# The following variables define the design data
# --------------------------------------------------------------------
# vars(design)       <design name> REQUIRED
# vars(netlist)      <verilog netlist file> REQUIRED
# vars(cts_spec)     <cts spec file list > REQUIRED
# --------------------------------------------------------------------
# Either fp_file, def_files or both MUST be defined
# --------------------------------------------------------------------
# vars(fp_file)      <floorplan file>
# vars(fp_file)      <floorplan TCL file>
# vars(def_files)     <floorplan DEF file>
# --------------------------------------------------------------------
set vars(design)     filter_io
set vars(netlist)    $vars(data_dir)/$vars(design).v
#set vars(fp_tcl_file) "$vars(data_dir)/floorplan.tcl"
#set vars(cts_spec)  "$vars(data_dir)/dtmf_recvr_core.ctstch"
#set vars(def_files) "$vars(data_dir)/dtmf_recvr_core.scan.def.gz"
# --------------------------------------------------------------------
# vars(cpf_file)    <REQUIRED for LP flows>
# --------------------------------------------------------------------
#set vars(cpf_file)   $vars(data_dir)/dtmf_recvr_core.cpf

###############################################################################
# The following are for the ILM based hierarchical flow
# vars(partition_list)                     <ptn1> <ptn2> ... REQUIRED
# vars(<ptn1>,cts_spec)                    <cts spec for ptn1> 
# vars(<ptn1>,latency_sdc)                 <latency sdc for ptn1> 
# vars(<ptn1>,incr_cts_sdc)                <post cts incr sdc for ptn1> OPTIONAL
# vars(<ptn1>,post_cts_sdc)                <post cts (full) sdc for ptn1> OPTIONAL
###############################################################################
#set vars(partition_list)                   "tdsp_core results_conv"
#set vars(dtmf_recvr_core,cts_spec)         $vars(data_dir)/dtmf_recvr_core.ctstch
#set vars(dtmf_recvr_core,latency_sdc)      $vars(data_dir)/dtmf_recvr_core.latency.sdc
#set vars(tdsp_core,cts_spec)               $vars(data_dir)/tdsp_core.ctstch
#set vars(tdsp_core,setup_func,latency_sdc) $vars(data_dir)/tdsp_core.latency.sdc
#set vars(results_conv,cts_spec)            $vars(data_dir)/results_conv.ctstch
#set vars(results_conv,latency_sdc)         $vars(data_dir)/results_conv.latency.sdc

###############################################################################
# The following are REQUIRED
# --------------------------------------------------------------------
# vars(process)                            <process node> (65nm, 90nm, e.g.)
# vars(max_route_layers)                   <top routing layer>
###############################################################################
set vars(process)                          250nm
set vars(max_route_layer)                  3

###############################################################################
# Define library sets ...
# --------------------------------------
# set vars(library_sets) "<set1> <set2> ..."
# set vars(<set1>,timing) <list of lib files> (REQUIRED)
# set vars(<set1>,si)     <list of cdb/udn files> (OPTIONAL)
###############################################################################
set vars(library_sets) "slow_libs typ_libs fast_libs"

set vars(slow_libs,timing) "\
      $vars(library_dir)/liberty/c35_3.3V/c35_CORELIB_WC.lib \
      $vars(library_dir)/liberty/c35_3.3V/c35_IOLIB_WC.lib \
"

set vars(fast_libs,timing) "\
      $vars(library_dir)/liberty/c35_3.3V/c35_CORELIB_BC.lib \
      $vars(library_dir)/liberty/c35_3.3V/c35_IOLIB_BC.lib \
"

set vars(typ_libs,timing) "\
      $vars(library_dir)/liberty/c35_3.3V/c35_CORELIB_TYP.lib \
      $vars(library_dir)/liberty/c35_3.3V/c35_IOLIB_TYP.lib \
"

set vars(lef_files) "\
      $vars(library_dir)/cds/HK_C35/LEF/c35b4/c35b4.lef \
      $vars(library_dir)/cds/HK_C35/LEF/c35b4/CORELIB.lef \
      $vars(library_dir)/cds/HK_C35/LEF/c35b4/IOLIB_4M.lef \
"


###############################################################################
# Define rc corners ...
# --------------------------------------
# set vars(rc_corners)          "<corner1> <corner2> ..."
# set vars(<corner1>,T)          <temperature>
# set vars(<corner1>,cap_table)  <cap table for corner1>
###############################################################################
# Optionally define QRC technology information
# --------------------------------------
# set vars(<corner>,qx_tech_file) <qx_tech_file for corner1>
# set vars(<corner>,qx_lib_file)  <qx_lib_file for corner1>
# set vars(<corner>,qx_conf_file) <qx_conf_file for corner1>
###############################################################################
set vars(rc_corners)          "rc_best rc_typ rc_worst"
set vars(rc_worst,T)          125
set vars(rc_typ,T)            25
set vars(rc_best,T)           -25
set vars(rc_worst,cap_table)    $vars(library_dir)/cds/HK_C35/LEF/encounter/c35b4_thick-worst.capTable
set vars(rc_typ,cap_table)    $vars(library_dir)/cds/HK_C35/LEF/encounter/c35b4_thick-typical.capTable
set vars(rc_best,cap_table)    $vars(library_dir)/cds/HK_C35/LEF/encounter/c35b4_thick-best.capTable
set vars(rc_worst,qx_tech_file) $vars(library_dir)/assura/c35b4/c35b4thickall/RCX-worst/qrcTechFile
set vars(rc_typ,qx_tech_file) $vars(library_dir)/assura/c35b4/c35b4thickall/RCX-typical/qrcTechFile
set vars(rc_best,qx_tech_file) $vars(library_dir)/assura/c35b4/c35b4thickall/RCX-best/qrcTechFile
#set vars(qx_layer_map_file)   $vars(design_dir)/LIBS/N45/qrc/layer.map
#set vars(qx_layer_map) "$vars(library_dir)/cds/HK_C35/LEF/c35b4/qrclay.map"
set vars(qrc_layer_map) "$vars(data_dir)/qrclay.map"
#set vars(qrc_layer_map) "$vars(library_dir)/cds/HK_C35/LEF/c35b4/qrclay.map"
#set vars(qx_layer_map_file) "$vars(design_dir)/cds/HK_C35/LEF/c35b4/qrclay.map"
set vars(signoff_extraction_engine) qrc

########################################################################################
# Scale factors are also optional but are strongly encouraged for pre_route optimization 
# in order to obtain the best flow convergence and QoR.  Scaling factors are applied per
# rc corner by setting the individual values OR via a scale_tcl file which must contain
# syntactically correct update_rc_corner commands for a given rc_corner
#---------------------------------------------------------------------------------------
# set vars(<rc_corner>,scale_tcl)                 <file>
#---------------------------------------------------------------------------------------
# set vars(<rc_corner>,pre_route_res_factor)      <pre-route resistance scale factor>
# set vars(<rc_corner>,pre_route_clk_res_factor)  <pre-route clock resistance scale factor>
# set vars(<rc_corner>,post_route_res_factor)     <post-route resistance scale factor (triplets)>
# set vars(<rc_corner>,post_route_clk_res_factor) <post-route clock resistance scale factor>
# set vars(<rc_corner>,pre_route_cap_factor)      <pre-route capacitance scale factor>
# set vars(<rc_corner>,pre_route_clk_cap_factor)  <pre-route clock capacitance scale factor>
# set vars(<rc_corner>,post_route_cap_factor)     <post-route capacitance scale factor (triplets)>
# set vars(<rc_corner>,post_route_clk_cap_factor) <post-route clock capacitance scale factor>
# set vars(<rc_corner>,post_route_xcap_factor)    <post-route coupling capacitance scale factor (triplets)>
########################################################################################
set vars(rc_worst,pre_route_res_factor)      1.0
set vars(rc_worst,pre_route_clk_res_factor)  1.0
set vars(rc_worst,post_route_res_factor)     1.0
set vars(rc_worst,post_route_clk_res_factor) 1.0
set vars(rc_worst,pre_route_cap_factor)      1.0
set vars(rc_worst,pre_route_clk_cap_factor)  1.0
set vars(rc_worst,post_route_cap_factor)     1.0
set vars(rc_worst,post_route_clk_cap_factor) 1.0
set vars(rc_worst,post_route_xcap_factor)    1.0


set vars(rc_typ,pre_route_res_factor)      1.0
set vars(rc_typ,pre_route_clk_res_factor)  1.0
set vars(rc_typ,post_route_res_factor)     1.0
set vars(rc_typ,post_route_clk_res_factor) 1.0
set vars(rc_typ,pre_route_cap_factor)      1.0
set vars(rc_typ,pre_route_clk_cap_factor)  1.0
set vars(rc_typ,post_route_cap_factor)     1.0
set vars(rc_typ,post_route_clk_cap_factor) 1.0
set vars(rc_typ,post_route_xcap_factor)    1.0


set vars(rc_best,pre_route_res_factor)      1.0
set vars(rc_best,post_route_res_factor)     1.0
set vars(rc_best,pre_route_cap_factor)      1.0
set vars(rc_best,post_route_cap_factor)     1.0
set vars(rc_best,post_route_xcap_factor)    1.0


###############################################################################
# Define operating conditions (optional)
# --------------------------------------------------------------------
# set vars(opconds)                "<opcond1> <opcond2> ..."
# set vars(<opcond1>,library_file)  <library file >
# set vars(<opcond1>,process)       <process scale factor>
# set vars(<opcond1>,voltage)       <voltage>
# set vars(<opcond1>,temperature)   <temperature>
###############################################################################

#set vars(opconds)                  "BEST-MIL TYPICAL WORST-MIL"
#set vars(BEST-MIL,library_file)    "c35_CORELIB_BC"
#set vars(TYPICAL,library_file)     "c35_CORELIB_TYP"
#set vars(WORST-MIL,library_file)   "c35_CORELIB_WC"


###############################################################################
# Define delay corners ...
# --------------------------------------------------------------------
# set vars(delay_corners)          "<corner1> <corner2> ..."
# set vars(<corner1>,library_set)   <library_set> (previously defined)
# set vars(<corner1>,opcond)        <opcond> (previously defined) (optional)
# set vars(<corner1>,rc_corner)     <rc_corner> (previously defined)
###############################################################################
set vars(delay_corners)             "corner_min corner_typ corner_max"
set vars(corner_min,library_set)    "fast_libs"
#set vars(corner_min,opcond)         "BEST-MIL"
set vars(corner_min,rc_corner)      "rc_best"
set vars(corner_typ,library_set)    "typ_libs"
#set vars(corner_typ,opcond)         "TYPICAL"
set vars(corner_typ,rc_corner)      "rc_typ"
set vars(corner_max,library_set)    "slow_libs"
#set vars(corner_max,opcond)         "WORST-MIL"
set vars(corner_max,rc_corner)      "rc_worst"


###############################################################################
# Define constraints modes ... 
# --------------------------------------------------------------------
# set vars(constraint_modes)          "<mode1> <mode2> ..."
# set vars(<mode1>,pre_cts_sdc)        <pre cts constraint file>
# set vars(<mode1>,post_cts_sdc)       <post cts constraint file> (optional)
###############################################################################

set vars(constraint_modes)             "setup_func_mode hold_func_mode"
set vars(setup_func_mode,pre_cts_sdc)  "$vars(data_dir)/clock_def.sdc $vars(data_dir)/clock_uncertainty_prects.sdc $vars(data_dir)/constraints_def_worst.sdc"
set vars(setup_func_mode,post_cts_sdc) "$vars(data_dir)/clock_def.sdc $vars(data_dir)/clock_uncertainty_postcts.sdc $vars(data_dir)/constraints_def_worst.sdc"
#set vars(setup_func_mode,incr_cts_sdc)  $vars(data_dir)/postcts.sdc

set vars(hold_func_mode,pre_cts_sdc)    "$vars(data_dir)/clock_def.sdc $vars(data_dir)/clock_uncertainty_prects.sdc $vars(data_dir)/constraints_def_best.sdc"
set vars(hold_func_mode,post_cts_sdc)   "$vars(data_dir)/clock_def.sdc $vars(data_dir)/clock_uncertainty_postcts.sdc $vars(data_dir)/constraints_def_best.sdc"

###############################################################################
# Define analysis views ...
# --------------------------------------------------------------------
# set vars(setup_analysis_views)    "<view1> <view2>"
# set vars(hold_analysis_views)     "<view1> <view2>"
# set vars(<view1>,delay_corner)     <delay corner>
# set vars(<view1>,constraint_mode)  <constraint mode>
###############################################################################
set vars(setup_analysis_views)       "setup_func_min setup_func_typ setup_func_max"
set vars(hold_analysis_views)        "hold_func_min hold_func_typ hold_func_max"

set vars(setup_func_min,delay_corner)    "corner_min"
set vars(setup_func_min,constraint_mode) "setup_func_mode"
set vars(hold_func_min,delay_corner)     "corner_min"
set vars(hold_func_min,constraint_mode)  "hold_func_mode"
set vars(setup_func_typ,delay_corner)    "corner_typ"
set vars(setup_func_typ,constraint_mode) "setup_func_mode"
set vars(hold_func_typ,delay_corner)     "corner_typ"
set vars(hold_func_typ,constraint_mode)  "hold_func_mode"
set vars(setup_func_max,delay_corner)    "corner_max"
set vars(setup_func_max,constraint_mode) "setup_func_mode"
set vars(hold_func_max,delay_corner)     "corner_max"
set vars(hold_func_max,constraint_mode)  "hold_func_mode"


###############################################################################
# Define active setup and hold views and denote which are default
###############################################################################
set vars(default_setup_view) "setup_func_typ"
set vars(default_hold_view)  "hold_func_typ"
set vars(active_setup_views) "setup_func_max"
set vars(active_hold_views)  "hold_func_min"

###############################################################################
# Define derating factors for OCV here (clock and data). 
# Derating factors are applied per delay corner
###############################################################################
set vars(corner_max,data_cell_late)   1.03
set vars(corner_max,data_cell_early)  0.97
set vars(corner_max,data_net_late)    1.03
set vars(corner_max,data_net_early)   0.97
set vars(corner_max,clock_cell_late)  1.03
set vars(corner_max,clock_cell_early) 0.97
set vars(corner_max,clock_net_late)   1.03
set vars(corner_max,clock_net_early)  0.97

set vars(corner_typ,data_cell_late)   1
set vars(corner_typ,data_cell_early)  1
set vars(corner_typ,data_net_late)    1
set vars(corner_typ,data_net_early)   1
set vars(corner_typ,clock_cell_late)  1
set vars(corner_typ,clock_cell_early) 1
set vars(corner_typ,clock_net_late)   1
set vars(corner_typ,clock_net_early)  1


set vars(corner_min,data_cell_late)   1.05
set vars(corner_min,data_cell_early)  0.95
set vars(corner_min,data_net_late)    1.05
set vars(corner_min,data_net_early)   0.97
set vars(corner_min,clock_cell_late)  1.05
set vars(corner_min,clock_cell_early) 0.97
set vars(corner_min,clock_net_late)   1.05
set vars(corner_min,clock_net_early)  0.97

###############################################################################
# Define power/ground nets
###############################################################################
set vars(power_nets) "vdd! vdd3r1! vdd3r2! vdd3o!"
set vars(ground_nets) "gnd! gnd3r! gnd3o!"

Puts "<FF> Finished loading setup.tcl"
