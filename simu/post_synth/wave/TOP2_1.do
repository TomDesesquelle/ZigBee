onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider GENERAL
add wave -noupdate /tb_TOP2/u_top/inClock
add wave -noupdate /tb_TOP2/u_top/inReset
add wave -noupdate -divider IN
add wave -noupdate /tb_TOP2/u_top/in_outFIFO_inReadEnable
add wave -noupdate /tb_TOP2/u_top/in_inFIFO_inData
add wave -noupdate /tb_TOP2/u_top/in_DEMUX_inDEMUX1
add wave -noupdate /tb_TOP2/u_top/in_DEMUX_inDEMUX2
add wave -noupdate /tb_TOP2/u_top/in_DEMUX_inDEMUX17
add wave -noupdate /tb_TOP2/u_top/in_DEMUX_inDEMUX18
add wave -noupdate -divider SEL
add wave -noupdate /tb_TOP2/u_top/in_DEMUX_inSEL1
add wave -noupdate /tb_TOP2/u_top/in_MUX_inSEL6
add wave -noupdate /tb_TOP2/u_top/in_MUX_inSEL9
add wave -noupdate /tb_TOP2/u_top/in_MUX_inSEL11
add wave -noupdate /tb_TOP2/u_top/in_MUX_inSEL12
add wave -noupdate /tb_TOP2/u_top/in_MUX_inSEL15
add wave -noupdate /tb_TOP2/u_top/in_DEMUX_inSEL17
add wave -noupdate -divider OUT
add wave -noupdate /tb_TOP2/u_top/out_MUX_outMUX9
add wave -noupdate /tb_TOP2/u_top/out_MUX_outMUX10
add wave -noupdate /tb_TOP2/u_top/out_MUX_outMUX15
add wave -noupdate /tb_TOP2/u_top/out_MUX_outMUX16
add wave -noupdate -divider inFIFO
add wave -noupdate /tb_TOP2/u_top/u_inFIFO/inData
add wave -noupdate /tb_TOP2/u_top/u_inFIFO/inWriteEnable
add wave -noupdate /tb_TOP2/u_top/u_inFIFO/FIFO
add wave -noupdate /tb_TOP2/u_top/u_inFIFO/inReadEnable
add wave -noupdate /tb_TOP2/u_top/u_inFIFO/outData
add wave -noupdate /tb_TOP2/u_top/u_inFIFO/outEmpty
add wave -noupdate -divider CODER
add wave -noupdate /tb_TOP2/u_top/u_coder/i_empty
add wave -noupdate /tb_TOP2/u_top/u_coder/i_data
add wave -noupdate /tb_TOP2/u_top/u_coder/o_ready
add wave -noupdate /tb_TOP2/u_top/u_coder/o_sinI
add wave -noupdate /tb_TOP2/u_top/u_coder/o_sinQ
add wave -noupdate /tb_TOP2/u_top/u_coder/o_sinI_four
add wave -noupdate /tb_TOP2/u_top/u_coder/o_sinQ_four
add wave -noupdate -divider DECODER
add wave -noupdate -divider CORDIC
add wave -noupdate -divider CDR
add wave -noupdate -divider outFIFO
add wave -noupdate -divider MUX3
add wave -noupdate /tb_TOP2/u_top/u_mux3/s_qout
add wave -noupdate /tb_TOP2/u_top/u_mux3/outData
add wave -noupdate /tb_TOP2/u_top/u_mux3/inSel
add wave -noupdate -radix binary /tb_TOP2/u_top/u_mux3/inData
add wave -noupdate -divider MUX4
add wave -noupdate /tb_TOP2/u_top/u_mux4/s_qout
add wave -noupdate /tb_TOP2/u_top/u_mux4/outData
add wave -noupdate /tb_TOP2/u_top/u_mux4/inSel
add wave -noupdate -radix binary /tb_TOP2/u_top/u_mux4/inData
add wave -noupdate -divider MUX5
add wave -noupdate /tb_TOP2/u_top/u_mux5/s_qout
add wave -noupdate /tb_TOP2/u_top/u_mux5/outData
add wave -noupdate /tb_TOP2/u_top/u_mux5/inSel
add wave -noupdate -radix binary /tb_TOP2/u_top/u_mux5/inData
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {17 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 192
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
WaveRestoreZoom {0 ps} {105 ps}
