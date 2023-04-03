onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_FIFO/u_fifo/inClock
add wave -noupdate /tb_FIFO/u_fifo/inReset
add wave -noupdate /tb_FIFO/u_fifo/inWriteEnable
add wave -noupdate /tb_FIFO/u_fifo/inData
add wave -noupdate -color Gold -expand -subitemconfig {{/tb_FIFO/u_fifo/FIFO[3]} {-color Gold} {/tb_FIFO/u_fifo/FIFO[2]} {-color Gold} {/tb_FIFO/u_fifo/FIFO[1]} {-color Gold} {/tb_FIFO/u_fifo/FIFO[0]} {-color Gold}} /tb_FIFO/u_fifo/FIFO
add wave -noupdate /tb_FIFO/u_fifo/inReadEnable
add wave -noupdate /tb_FIFO/u_fifo/outData
add wave -noupdate /tb_FIFO/u_fifo/outDone
add wave -noupdate /tb_FIFO/u_fifo/currentState
add wave -noupdate -color White /tb_FIFO/u_fifo/outFull
add wave -noupdate -color White /tb_FIFO/u_fifo/outAlmostFull
add wave -noupdate -color White /tb_FIFO/u_fifo/outAlmostEmpty
add wave -noupdate -color White /tb_FIFO/u_fifo/outEmpty
add wave -noupdate -color Cyan /tb_FIFO/u_fifo/sigCurrentFilling
add wave -noupdate -color Cyan /tb_FIFO/u_fifo/outWriteCount
add wave -noupdate -color Cyan /tb_FIFO/u_fifo/outReadCount
add wave -noupdate -color Red /tb_FIFO/u_fifo/outWriteError
add wave -noupdate -color Red /tb_FIFO/u_fifo/outReadError
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1981310 ps} 0}
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
WaveRestoreZoom {0 ps} {4830 ns}
