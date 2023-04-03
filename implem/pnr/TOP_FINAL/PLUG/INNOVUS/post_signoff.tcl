##################################################################################
#                           POST-SIGNOFF PLUG-IN 
##################################################################################
#
# This plug-in script is called after timeDesign -signoff from the run_signoff.tcl 
# flow script.
#
##################################################################################

defOut -floorplan -netlist -routing $vars(design).def
streamOut $vars(design).gds2 -mapFile $vars(data_dir)/gds2.map -libName DesignLib -structureName $vars(design) \
         -attachInstanceName 13 -attachNetName 13 -stripes 1 -units 1000 -mode ALL

##-- Verilog Netlist
saveNetlist $vars(design).v

##-- Verilog Netlist with FILLCAP cells
saveNetlist $vars(design)_fillcap.v -excludeLeafCell -includePhysicalInst \
                         -excludeCellInst { FILLRT1 FILLRT2 FILLRT5 FILLRT10 FILLRT25 FILL1 ENDCAPL ENDCAPR ENDCAP \
                                            PERI_SPACER_100_P PERI_SPACER_50_P PERI_SPACER_20_P PERI_SPACER_10_P PERI_SPACER_5_P PERI_SPACER_2_P PERI_SPACER_1_P PERI_SPACER_01_P CORNERP \

}

##-- QRC extraction File
rcOut -spef $vars(design)_qrc.spef


proc amsWriteSDF4View {viewList} {
   global topcellname

   set sdfver 2.1

   foreach view $viewList {
      set filename [format "SDF/%s_%s.sdf" $topcellname $view]
      print "---# Analysis View: $view\n"

      switch $sdfver {
         "2.1"  { write_sdf -version 2.1 -prec 3 -edges check_edge -average_typ_delays \
                     -remashold -splitrecrem -splitsetuphold -force_calculation \
                     -view $view $filename
                }
         "3.0"  { write_sdf -version 3.0 -prec 3 -edges check_edge \
                     -force_calculation -average_typ_delays \
                     -view $view $filename
         ##-- additional for verilog XL: -splitrecrem
                }
      }
      print "---# Created SDF: $filename\n"
   }
}

##--  write SDF for a specific analysis view
proc amsWriteSDFbtw {minview typview maxview} {
   global topcellname

   set sdfver 2.1

   set filename [format "SDF/%s_all.sdf" $topcellname]

   switch $sdfver {
         "2.1"  { write_sdf -version 2.1 -prec 3 -edges check_edge -average_typ_delays \
                     -remashold -splitrecrem -splitsetuphold -force_calculation \
                     -min_view $minview -typ_view $typview -max_view $maxview $filename
                }
         "3.0"  { write_sdf -version 3.0 -prec 3 -edges check_edge \
                     -force_calculation -average_typ_delays \
                     -min_view $minview -typ_view $typview -max_view $maxview $filename
         ##-- additional for verilog XL: -splitrecrem
                }
   }
      print "---# Created SDF: $filename\n"
}

write_sdf -ideal_clock_network $vars(design).sdf
