vlog list.svh
vopt top +cover=fcbest -o default
vsim -coverage default +test_name=1WR +N=12
coverage save -onexit default.ucdb
do exclusion.do
add wave -r sim:/top/pif/*
run -all
