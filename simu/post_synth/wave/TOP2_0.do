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
add wave -noupdate -format Analog-Step -height 84 -max 7.0 -min -7.0 -radix decimal /tb_TOP2/u_top/out_MUX_outMUX9
add wave -noupdate -format Analog-Step -height 84 -max 7.0 -min -7.0 -radix decimal /tb_TOP2/u_top/out_MUX_outMUX10
add wave -noupdate -radix binary /tb_TOP2/u_top/out_MUX_outMUX15
add wave -noupdate -radix binary /tb_TOP2/u_top/out_MUX_outMUX16
add wave -noupdate -divider inFIFO
add wave -noupdate -color Gold /tb_TOP2/u_top/u_inFIFO/inData
add wave -noupdate -color Gold /tb_TOP2/u_top/u_inFIFO/inWriteEnable
add wave -noupdate -color Gold -radix hexadecimal /tb_TOP2/u_top/u_inFIFO/FIFO
add wave -noupdate -color Gold /tb_TOP2/u_top/u_inFIFO/inReadEnable
add wave -noupdate -color Gold /tb_TOP2/u_top/u_inFIFO/outData
add wave -noupdate -color Gold /tb_TOP2/u_top/u_inFIFO/outEmpty
add wave -noupdate -divider CODER
add wave -noupdate -color Salmon /tb_TOP2/u_top/u_coder/i_empty
add wave -noupdate -color Salmon /tb_TOP2/u_top/u_coder/i_data
add wave -noupdate -color Salmon /tb_TOP2/u_top/u_coder/o_ready
add wave -noupdate -color Salmon -format Analog-Step -height 84 -max 7.0 -min -7.0 -radix decimal -childformat {{{/tb_TOP2/u_top/u_coder/o_sinI[3]} -radix decimal} {{/tb_TOP2/u_top/u_coder/o_sinI[2]} -radix decimal} {{/tb_TOP2/u_top/u_coder/o_sinI[1]} -radix decimal} {{/tb_TOP2/u_top/u_coder/o_sinI[0]} -radix decimal}} -subitemconfig {{/tb_TOP2/u_top/u_coder/o_sinI[3]} {-color Salmon -height 16 -radix decimal} {/tb_TOP2/u_top/u_coder/o_sinI[2]} {-color Salmon -height 16 -radix decimal} {/tb_TOP2/u_top/u_coder/o_sinI[1]} {-color Salmon -height 16 -radix decimal} {/tb_TOP2/u_top/u_coder/o_sinI[0]} {-color Salmon -height 16 -radix decimal}} /tb_TOP2/u_top/u_coder/o_sinI
add wave -noupdate -color Salmon -format Analog-Step -height 84 -max 7.0 -min -7.0 -radix decimal /tb_TOP2/u_top/u_coder/o_sinQ
add wave -noupdate -color Salmon -format Analog-Step -height 84 -max 7.0 -min -7.0 -radix decimal /tb_TOP2/u_top/u_coder/o_sinI_four
add wave -noupdate -color Salmon -format Analog-Step -height 84 -max 7.0 -min -7.0 -radix decimal /tb_TOP2/u_top/u_coder/o_sinQ_four
add wave -noupdate -divider DECODER
add wave -noupdate -color {Medium Violet Red} /tb_TOP2/u_top/u_decoder/i_adc_eoc
add wave -noupdate -color {Medium Violet Red} -format Analog-Step -height 84 -max 81.0 -min 1.0 -radix decimal /tb_TOP2/u_top/u_decoder/i_I_if
add wave -noupdate -color {Medium Violet Red} -format Analog-Step -height 84 -max 81.0 -min 1.0 -radix decimal /tb_TOP2/u_top/u_decoder/i_Q_if
add wave -noupdate -color {Medium Violet Red} -format Analog-Step -height 84 -max 7.0000000000000009 -min -8.0 -radix decimal /tb_TOP2/u_top/u_decoder/o_I_BB
add wave -noupdate -color {Medium Violet Red} -format Analog-Step -height 84 -max 7.0000000000000009 -min -8.0 -radix decimal -childformat {{{/tb_TOP2/u_top/u_decoder/o_Q_BB[3]} -radix decimal} {{/tb_TOP2/u_top/u_decoder/o_Q_BB[2]} -radix decimal} {{/tb_TOP2/u_top/u_decoder/o_Q_BB[1]} -radix decimal} {{/tb_TOP2/u_top/u_decoder/o_Q_BB[0]} -radix decimal}} -subitemconfig {{/tb_TOP2/u_top/u_decoder/o_Q_BB[3]} {-color {Medium Violet Red} -height 16 -radix decimal} {/tb_TOP2/u_top/u_decoder/o_Q_BB[2]} {-color {Medium Violet Red} -height 16 -radix decimal} {/tb_TOP2/u_top/u_decoder/o_Q_BB[1]} {-color {Medium Violet Red} -height 16 -radix decimal} {/tb_TOP2/u_top/u_decoder/o_Q_BB[0]} {-color {Medium Violet Red} -height 16 -radix decimal}} /tb_TOP2/u_top/u_decoder/o_Q_BB
add wave -noupdate -color {Medium Violet Red} /tb_TOP2/u_top/u_decoder/o_postfilter_ready
add wave -noupdate -divider CORDIC
add wave -noupdate -color {Medium Slate Blue} /tb_TOP2/u_top/u_cordic/i_enable_in
add wave -noupdate -color {Medium Slate Blue} -radix hexadecimal /tb_TOP2/u_top/u_cordic/i_I
add wave -noupdate -color {Medium Slate Blue} -radix hexadecimal /tb_TOP2/u_top/u_cordic/i_Q
add wave -noupdate -color {Medium Slate Blue} /tb_TOP2/u_top/u_cordic/o_dir
add wave -noupdate -color {Medium Slate Blue} /tb_TOP2/u_top/u_cordic/o_enable_out
add wave -noupdate -divider CDR
add wave -noupdate -color Orange /tb_TOP2/u_top/u_cdr/i_dir
add wave -noupdate -color Orange /tb_TOP2/u_top/u_cdr/i_flag
add wave -noupdate -color Orange /tb_TOP2/u_top/u_cdr/o_data
add wave -noupdate -color Orange /tb_TOP2/u_top/u_cdr/o_flag
add wave -noupdate -divider outFIFO
add wave -noupdate -color Turquoise /tb_TOP2/u_top/u_outFIFO/inData
add wave -noupdate -color Turquoise /tb_TOP2/u_top/u_outFIFO/inWriteEnable
add wave -noupdate -color Turquoise /tb_TOP2/u_top/u_outFIFO/FIFO
add wave -noupdate -color Turquoise /tb_TOP2/u_top/u_outFIFO/inReadEnable
add wave -noupdate -color Turquoise /tb_TOP2/u_top/u_outFIFO/outData
add wave -noupdate -divider DEMUX17
add wave -noupdate /tb_TOP2/u_top/u_demux17/inData
add wave -noupdate /tb_TOP2/u_top/u_demux17/inSel
add wave -noupdate /tb_TOP2/u_top/u_demux17/outData
add wave -noupdate -radix binary /tb_TOP2/u_top/u_demux17/s_data0
add wave -noupdate -radix binary /tb_TOP2/u_top/u_demux17/s_data1
add wave -noupdate -radix binary /tb_TOP2/u_top/u_demux17/s_data2
add wave -noupdate -radix binary /tb_TOP2/u_top/u_demux17/s_data3
add wave -noupdate /tb_TOP2/u_top/u_demux17/s_signal0
add wave -noupdate /tb_TOP2/u_top/u_demux17/s_signal1
add wave -noupdate -divider DEMUX18
add wave -noupdate /tb_TOP2/u_top/u_demux18/inData
add wave -noupdate /tb_TOP2/u_top/u_demux18/inSel
add wave -noupdate /tb_TOP2/u_top/u_demux18/outData
add wave -noupdate /tb_TOP2/u_top/u_demux18/s_data0
add wave -noupdate /tb_TOP2/u_top/u_demux18/s_data1
add wave -noupdate /tb_TOP2/u_top/u_demux18/s_data2
add wave -noupdate /tb_TOP2/u_top/u_demux18/s_data3
add wave -noupdate /tb_TOP2/u_top/u_demux18/s_signal0
add wave -noupdate /tb_TOP2/u_top/u_demux18/s_signal1
add wave -noupdate -divider MUX6
add wave -noupdate /tb_TOP2/u_top/u_mux6/inData
add wave -noupdate /tb_TOP2/u_top/u_mux6/inSel
add wave -noupdate /tb_TOP2/u_top/u_mux6/outData
add wave -noupdate /tb_TOP2/u_top/u_mux6/s_data0
add wave -noupdate /tb_TOP2/u_top/u_mux6/s_data1
add wave -noupdate /tb_TOP2/u_top/u_mux6/s_data2
add wave -noupdate /tb_TOP2/u_top/u_mux6/s_data3
add wave -noupdate -divider MUX7
add wave -noupdate /tb_TOP2/u_top/u_mux7/inData
add wave -noupdate /tb_TOP2/u_top/u_mux7/inSel
add wave -noupdate -radix binary /tb_TOP2/u_top/u_mux7/outData
add wave -noupdate /tb_TOP2/u_top/u_mux7/s_data0
add wave -noupdate /tb_TOP2/u_top/u_mux7/s_data1
add wave -noupdate /tb_TOP2/u_top/u_mux7/s_data2
add wave -noupdate /tb_TOP2/u_top/u_mux7/s_data3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {20380000 ps} 0}
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
WaveRestoreZoom {0 ps} {26250 ns}
