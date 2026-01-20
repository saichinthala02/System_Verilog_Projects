vlog list.svh
vsim -novopt -suppress 12110 top -assertdebug \
+test_name=UNDERFLOW
#add wave -r sim:/top/pif/*
do wave.do
run -all
