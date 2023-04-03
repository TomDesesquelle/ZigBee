onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider MUX811
add wave -noupdate -color Gold -radix binary /tb_MUX/inData811
add wave -noupdate -color Gold /tb_MUX/inSel811
add wave -noupdate -color Gold /tb_MUX/outData811
add wave -noupdate -divider MUX414
add wave -noupdate -color Salmon /tb_MUX/inData414
add wave -noupdate -color Salmon /tb_MUX/inSel414
add wave -noupdate -color Salmon /tb_MUX/outData414
add wave -noupdate -divider MUX211
add wave -noupdate -color Magenta /tb_MUX/inData211
add wave -noupdate -color Magenta /tb_MUX/inSel211
add wave -noupdate -color Magenta /tb_MUX/outData211
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {660000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {2688 ns}
