onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group DEMUX121 /tb_DEMUX/inData121
add wave -noupdate -expand -group DEMUX121 /tb_DEMUX/inSel121
add wave -noupdate -expand -group DEMUX121 -expand /tb_DEMUX/outData121
add wave -noupdate -expand -group DEMUX124 /tb_DEMUX/outData124
add wave -noupdate -expand -group DEMUX124 /tb_DEMUX/inSel124
add wave -noupdate -expand -group DEMUX124 /tb_DEMUX/inData124
add wave -noupdate -expand -group DEMUX181 /tb_DEMUX/inData181
add wave -noupdate -expand -group DEMUX181 /tb_DEMUX/inSel181
add wave -noupdate -expand -group DEMUX181 /tb_DEMUX/outData181
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
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
WaveRestoreZoom {0 ps} {346500 ps}
