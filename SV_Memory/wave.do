onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top/pif/clk
add wave -noupdate /top/pif/rst
add wave -noupdate /top/pif/wr_rd
add wave -noupdate /top/pif/valid
add wave -noupdate /top/pif/ready
add wave -noupdate /top/pif/addr
add wave -noupdate /top/pif/wdata
add wave -noupdate /top/pif/rdata
add wave -noupdate /top/pif/bfm_cb/wr_rd
add wave -noupdate /top/pif/bfm_cb/addr
add wave -noupdate /top/pif/bfm_cb/wdata
add wave -noupdate /top/pif/bfm_cb/valid
add wave -noupdate /top/pif/bfm_cb/rdata
add wave -noupdate /top/pif/bfm_cb/ready
add wave -noupdate /top/pif/bfm_cb/bfm_cb_event
add wave -noupdate /top/pif/mon_cb/wr_rd
add wave -noupdate /top/pif/mon_cb/addr
add wave -noupdate /top/pif/mon_cb/wdata
add wave -noupdate /top/pif/mon_cb/valid
add wave -noupdate /top/pif/mon_cb/rdata
add wave -noupdate /top/pif/mon_cb/ready
add wave -noupdate /top/pif/mon_cb/mon_cb_event
add wave -noupdate -expand /top/uut/RESET
add wave -noupdate /top/uut/PRESET
add wave -noupdate /top/uut/HAND_SHAKING
add wave -noupdate /top/uut/WRITE_ENABLE
add wave -noupdate /top/uut/WRITES
add wave -noupdate /top/uut/READS
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 208
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ns} {235 ns}
