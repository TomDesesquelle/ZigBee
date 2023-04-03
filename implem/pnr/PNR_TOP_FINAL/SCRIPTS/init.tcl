source ../SCRIPTS/vars.tcl
source ../SCRIPTS/amsSetup.tcl
source ../SCRIPTS/tool_box.tcl

set init_layout_view ""
set init_abstract_name ""

#A corriger pour avoir les IOs
#set init_verilog "./INPUT_DATA/filter_io.v"
set init_verilog "../INPUT_DATA/TOP_netlist.v ../INPUT_DATA/top_io.v"

set init_mmmc_file "../SCRIPTS/view_definition.tcl"

#set init_lef_file "../SCRIPTS/c35b4_A.lef /softslin/AMS_410_ISR15/cds/HK_C35/LEF/c35b4/CORELIB.lef /softslin/AMS_410_ISR15/cds/HK_C35/LEF/c35b4/IOLIB_4M.lef"

set init_lef_file "/softslin/AMS_410_ISR15/cds/HK_C35/LEF/c35b4/c35b4.lef_back /softslin/AMS_410_ISR15/cds/HK_C35/LEF/c35b4/CORELIB.lef /softslin/AMS_410_ISR15/cds/HK_C35/LEF/c35b4/IOLIB_4M.lef"


#A corriger pour avoir les IOs
#set init_top_cell "filter_io"
set init_top_cell "top_io"


set init_gnd_net "gnd! gnd3r! gnd3o!"
set init_pwr_net "vdd! vdd3r1! vdd3r2! vdd3o!"
set cts_cell_list "CLKIN0 CLKIN1 CLKIN2 CLKIN3 CLKIN4 CLKIN6 CLKIN8 CLKIN10 CLKIN12 CLKIN15 CLKBU2 CLKBU4 CLKBU6 CLKBU8 CLKBU12 CLKBU15"

