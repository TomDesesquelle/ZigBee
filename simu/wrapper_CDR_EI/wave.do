onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_wrp_CDR_EI/i_clk
add wave -noupdate /tb_wrp_CDR_EI/i_rst
add wave -noupdate -divider CDR
add wave -noupdate /tb_wrp_CDR_EI/i_phase
add wave -noupdate /tb_wrp_CDR_EI/i_flag
add wave -noupdate /tb_wrp_CDR_EI/readEN
add wave -noupdate /tb_wrp_CDR_EI/u_wrp_CDR_EI/u_cdr/o_data
add wave -noupdate /tb_wrp_CDR_EI/u_wrp_CDR_EI/u_cdr/o_flag
add wave -noupdate -divider outFIFO
add wave -noupdate -color Gold /tb_wrp_CDR_EI/u_wrp_CDR_EI/u_fifo/inWriteEnable
add wave -noupdate -color Gold /tb_wrp_CDR_EI/u_wrp_CDR_EI/u_fifo/inData
add wave -noupdate -color Cyan -expand -subitemconfig {{/tb_wrp_CDR_EI/u_wrp_CDR_EI/u_fifo/FIFO[3]} {-color Cyan -height 16} {/tb_wrp_CDR_EI/u_wrp_CDR_EI/u_fifo/FIFO[2]} {-color Cyan -height 16} {/tb_wrp_CDR_EI/u_wrp_CDR_EI/u_fifo/FIFO[1]} {-color Cyan -height 16} {/tb_wrp_CDR_EI/u_wrp_CDR_EI/u_fifo/FIFO[0]} {-color Cyan -height 16}} /tb_wrp_CDR_EI/u_wrp_CDR_EI/u_fifo/FIFO
add wave -noupdate -color Magenta /tb_wrp_CDR_EI/u_wrp_CDR_EI/u_fifo/inReadEnable
add wave -noupdate -color Magenta /tb_wrp_CDR_EI/u_wrp_CDR_EI/u_fifo/outData
add wave -noupdate -color Magenta /tb_wrp_CDR_EI/u_wrp_CDR_EI/u_fifo/outDone
add wave -noupdate -color White /tb_wrp_CDR_EI/u_wrp_CDR_EI/u_fifo/outFull
add wave -noupdate -color White /tb_wrp_CDR_EI/u_wrp_CDR_EI/u_fifo/outEmpty
add wave -noupdate /tb_wrp_CDR_EI/u_wrp_CDR_EI/u_fifo/currentState
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2053506 ps} 0}
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
WaveRestoreZoom {0 ps} {8135839 ps}
