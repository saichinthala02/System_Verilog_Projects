onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top/pif/wr_clk
add wave -noupdate /top/pif/rd_clk
add wave -noupdate /top/pif/rst
add wave -noupdate /top/pif/wr_en
add wave -noupdate /top/pif/rd_en
add wave -noupdate /top/pif/wdata
add wave -noupdate /top/pif/rdata
add wave -noupdate /top/pif/full
add wave -noupdate /top/pif/empty
add wave -noupdate /top/pif/overflow
add wave -noupdate /top/pif/underflow
add wave -noupdate /top/pif/wr_bfm_cb/full
add wave -noupdate /top/pif/wr_bfm_cb/overflow
add wave -noupdate /top/pif/wr_bfm_cb/wr_en
add wave -noupdate /top/pif/wr_bfm_cb/wdata
add wave -noupdate /top/pif/wr_bfm_cb/wr_bfm_cb_event
add wave -noupdate /top/pif/rd_bfm_cb/underflow
add wave -noupdate /top/pif/rd_bfm_cb/rdata
add wave -noupdate /top/pif/rd_bfm_cb/empty
add wave -noupdate /top/pif/rd_bfm_cb/rd_en
add wave -noupdate /top/pif/rd_bfm_cb/rd_bfm_cb_event
add wave -noupdate /top/pif/wr_mon_cb/overflow
add wave -noupdate /top/pif/wr_mon_cb/wr_en
add wave -noupdate /top/pif/wr_mon_cb/wdata
add wave -noupdate /top/pif/wr_mon_cb/full
add wave -noupdate /top/pif/wr_mon_cb/wr_mon_cb_event
add wave -noupdate /top/pif/rd_mon_cb/underflow
add wave -noupdate /top/pif/rd_mon_cb/rd_en
add wave -noupdate /top/pif/rd_mon_cb/rdata
add wave -noupdate /top/pif/rd_mon_cb/empty
add wave -noupdate /top/pif/rd_mon_cb/rd_mon_cb_event
add wave -noupdate /top/uut/RESET
add wave -noupdate /top/uut/WDATA
add wave -noupdate /top/uut/RDATA
add wave -noupdate /top/uut/OVERFLOW
add wave -noupdate /top/uut/UNDERFLOW
add wave -noupdate /top/uut/FULL_EMPTY
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
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
WaveRestoreZoom {250 ns} {1250 ns}
