onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_TOP/u_top/inClock
add wave -noupdate /tb_TOP/u_top/inReset
add wave -noupdate -expand -group DATA /tb_TOP/u_top/in_inFIFO_inData
add wave -noupdate -expand -group DATA /tb_TOP/u_top/in_outFIFO_inReadEnable
add wave -noupdate -expand -group DATA /tb_TOP/u_top/in_DEMUX_inDEMUX1
add wave -noupdate -expand -group DATA /tb_TOP/u_top/in_DEMUX_inDEMUX2
add wave -noupdate -expand -group DATA /tb_TOP/u_top/in_DEMUX_inDEMUX17
add wave -noupdate -expand -group DATA /tb_TOP/u_top/in_DEMUX_inDEMUX18
add wave -noupdate -expand -group SEL /tb_TOP/u_top/in_DEMUX_inSEL1
add wave -noupdate -expand -group SEL /tb_TOP/u_top/in_DEMUX_inSEL2
add wave -noupdate -expand -group SEL /tb_TOP/u_top/in_MUX_inSEL3
add wave -noupdate -expand -group SEL /tb_TOP/u_top/in_MUX_inSEL6
add wave -noupdate -expand -group SEL /tb_TOP/u_top/in_MUX_inSEL9
add wave -noupdate -expand -group SEL /tb_TOP/u_top/in_MUX_inSEL11
add wave -noupdate -expand -group SEL /tb_TOP/u_top/in_MUX_inSEL12
add wave -noupdate -expand -group SEL /tb_TOP/u_top/in_MUX_inSEL15
add wave -noupdate -expand -group SEL /tb_TOP/u_top/in_DEMUX_inSEL17
add wave -noupdate -expand -group OUT /tb_TOP/u_top/out_MUX_outMUX9
add wave -noupdate -expand -group OUT /tb_TOP/u_top/out_MUX_outMUX10
add wave -noupdate -expand -group OUT /tb_TOP/u_top/out_MUX_outMUX15
add wave -noupdate -expand -group OUT /tb_TOP/u_top/out_MUX_outMUX16
add wave -noupdate -expand -group DEBUG /tb_TOP/u_top/u_inFIFO/outEmpty
add wave -noupdate -expand -group DEBUG /tb_TOP/u_top/u_inFIFO/outData
add wave -noupdate -expand -group DEBUG /tb_TOP/u_top/sig_MUX_inMUX9
add wave -noupdate -expand -group DEBUG /tb_TOP/u_top/sig_MUX_inMUX3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7408595253 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 202
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
WaveRestoreZoom {0 ps} {27748556767 ps}
