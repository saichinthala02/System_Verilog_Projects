vlog list.svh
vsim -novopt -suppress 12110 top -assertdebug \
+test_name=NWR_NRD +N=16
#add wave -r sim:/top/pif/*
do wave.do 
run -all
