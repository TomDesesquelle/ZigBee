onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider WRAPPER
add wave -noupdate /tb_wrapper_EI_CODER/DATA_WIDTH
add wave -noupdate /tb_wrapper_EI_CODER/ADDR_WIDTH
add wave -noupdate /tb_wrapper_EI_CODER/clk
add wave -noupdate /tb_wrapper_EI_CODER/reset
add wave -noupdate /tb_wrapper_EI_CODER/writeEN
add wave -noupdate -divider FIFO
add wave -noupdate /tb_wrapper_EI_CODER/u_EI_CODER/u_fifo/FIFO
add wave -noupdate -radix hexadecimal /tb_wrapper_EI_CODER/inData
add wave -noupdate /tb_wrapper_EI_CODER/u_EI_CODER/u_fifo/inReadEnable
add wave -noupdate /tb_wrapper_EI_CODER/u_EI_CODER/u_fifo/outEmpty
add wave -noupdate /tb_wrapper_EI_CODER/u_EI_CODER/u_fifo/outFull
add wave -noupdate /tb_wrapper_EI_CODER/u_EI_CODER/u_fifo/outWriteCount
add wave -noupdate /tb_wrapper_EI_CODER/u_EI_CODER/u_fifo/outReadCount
add wave -noupdate -color Gold /tb_wrapper_EI_CODER/u_EI_CODER/u_fifo/outData
add wave -noupdate /tb_wrapper_EI_CODER/u_EI_CODER/u_fifo/outDone
add wave -noupdate /tb_wrapper_EI_CODER/u_EI_CODER/u_fifo/currentState
add wave -noupdate -divider CODER
add wave -noupdate /tb_wrapper_EI_CODER/u_EI_CODER/u_coder/old_i_data
add wave -noupdate /tb_wrapper_EI_CODER/u_EI_CODER/u_coder/i_data
add wave -noupdate /tb_wrapper_EI_CODER/u_EI_CODER/u_coder/reset
add wave -noupdate /tb_wrapper_EI_CODER/u_EI_CODER/u_coder/clk
add wave -noupdate /tb_wrapper_EI_CODER/u_EI_CODER/u_coder/clk_10M
add wave -noupdate /tb_wrapper_EI_CODER/u_EI_CODER/u_coder/my_clk_10M
add wave -noupdate /tb_wrapper_EI_CODER/u_EI_CODER/u_coder/o_ready
add wave -noupdate /tb_wrapper_EI_CODER/u_EI_CODER/u_coder/IorQ
add wave -noupdate /tb_wrapper_EI_CODER/u_EI_CODER/u_coder/isPositiveI
add wave -noupdate /tb_wrapper_EI_CODER/u_EI_CODER/u_coder/isPositiveQ
add wave -noupdate /tb_wrapper_EI_CODER/u_EI_CODER/u_coder/sin_was_positiveI
add wave -noupdate /tb_wrapper_EI_CODER/u_EI_CODER/u_coder/sin_was_positiveQ
add wave -noupdate /tb_wrapper_EI_CODER/u_EI_CODER/u_coder/stateI
add wave -noupdate /tb_wrapper_EI_CODER/u_EI_CODER/u_coder/stateQ
add wave -noupdate /tb_wrapper_EI_CODER/u_EI_CODER/u_coder/next_stateI
add wave -noupdate /tb_wrapper_EI_CODER/u_EI_CODER/u_coder/next_stateQ
add wave -noupdate /tb_wrapper_EI_CODER/u_EI_CODER/u_coder/i_empty
add wave -noupdate -format Analog-Step -height 84 -max 7.0 -min -7.0 -radix decimal /tb_wrapper_EI_CODER/u_EI_CODER/u_coder/o_sinI
add wave -noupdate -format Analog-Step -height 84 -max 7.0 -min -7.0 -radix decimal /tb_wrapper_EI_CODER/u_EI_CODER/u_coder/o_sinQ
add wave -noupdate -format Analog-Step -height 84 -max 7.0 -min -7.0 -radix decimal -childformat {{{/tb_wrapper_EI_CODER/u_EI_CODER/u_coder/o_sinI_four[3]} -radix decimal} {{/tb_wrapper_EI_CODER/u_EI_CODER/u_coder/o_sinI_four[2]} -radix decimal} {{/tb_wrapper_EI_CODER/u_EI_CODER/u_coder/o_sinI_four[1]} -radix decimal} {{/tb_wrapper_EI_CODER/u_EI_CODER/u_coder/o_sinI_four[0]} -radix decimal}} -subitemconfig {{/tb_wrapper_EI_CODER/u_EI_CODER/u_coder/o_sinI_four[3]} {-height 16 -radix decimal} {/tb_wrapper_EI_CODER/u_EI_CODER/u_coder/o_sinI_four[2]} {-height 16 -radix decimal} {/tb_wrapper_EI_CODER/u_EI_CODER/u_coder/o_sinI_four[1]} {-height 16 -radix decimal} {/tb_wrapper_EI_CODER/u_EI_CODER/u_coder/o_sinI_four[0]} {-height 16 -radix decimal}} /tb_wrapper_EI_CODER/u_EI_CODER/u_coder/o_sinI_four
add wave -noupdate -format Analog-Step -height 84 -max 7.0 -min -7.0 -radix decimal /tb_wrapper_EI_CODER/u_EI_CODER/u_coder/o_sinQ_four
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6720000 ps} 0}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {36750 ns}
