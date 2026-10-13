
vlib work
vlog ../*/*.*v

vsim -voptargs=+acc work.SYS_TOP_tb
add wave *
run -all