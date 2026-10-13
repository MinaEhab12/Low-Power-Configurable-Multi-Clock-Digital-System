
############################  Search PATH ################################

#Add the path of the libraries and RTL files to the search_path variable

set System_Path /home/IC/Projects/System

lappend search_path /home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys

lappend search_path $System_Path/RTL/ALU
lappend search_path $System_Path/RTL/ASYNC_FIFO
lappend search_path $System_Path/RTL/CLK_DIV
lappend search_path $System_Path/RTL/CLK_GATING
lappend search_path $System_Path/RTL/DATA_SYNC
lappend search_path $System_Path/RTL/Reg_File
lappend search_path $System_Path/RTL/Pulse_Gen
lappend search_path $System_Path/RTL/RST_SYNC
lappend search_path $System_Path/RTL/SYS_CTRL
lappend search_path $System_Path/RTL/CLK_DIV_RX_MUX
lappend search_path $System_Path/RTL/UART
lappend search_path $System_Path/RTL/SYS_TOP

########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

######################### Formality Setup File ###########################

set synopsys_auto_setup true

set_svf "../syn/$top_module.svf"

####################### Read Reference tech libs ########################
 
set SSLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

###################  Read Reference Design Files ######################## 
read_verilog -container Ref "ALU.v"
read_verilog -container Ref "ASYNC_FIFO_TOP.v"
read_verilog -container Ref "CLK_DIV.v"
read_verilog -container Ref "CLK_DIV_RX_MUX.v"
read_verilog -container Ref "CLK_GATE.v"
read_verilog -container Ref "Data_Sampling.v"
read_verilog -container Ref "Data_sync.v"
read_verilog -container Ref "Deserializer.v"
read_verilog -container Ref "DF_SYNC.v"
read_verilog -container Ref "Edge_Bit_Counter.v"
read_verilog -container Ref "FIFO_MEM_CNTRL.v"
read_verilog -container Ref "FIFO_RD.v"
read_verilog -container Ref "FIFO_WR.v"
read_verilog -container Ref "Mux.v"
read_verilog -container Ref "Par_Check.v"
read_verilog -container Ref "parity_calc.v"
read_verilog -container Ref "Pulse_Gen.v"
read_verilog -container Ref "REG_FILE.v"
read_verilog -container Ref "RST_SYNC.v"
read_verilog -container Ref "Serializer.v"
read_verilog -container Ref "Start_Check.v"
read_verilog -container Ref "Stop_Check.v"
read_verilog -container Ref "UART_RX.v"
read_verilog -container Ref "UART_TX.v"
read_verilog -container Ref "SYS_TOP.v"
read_sverilog -container Ref "FSM.sv"
read_verilog -container Ref "TX_FSM.v"
read_verilog -container Ref "UART_TOP.v"
read_verilog -container Ref "SYS_CTRL.v"


######################## set the top Reference Design ######################## 

set_reference_design SYS_TOP
set_top SYS_TOP

####################### Read Implementation tech libs ######################## 

read_db -container Imp [list $SSLIB $TTLIB $FFLIB]

#################### Read Implementation Design Files ######################## 

read_verilog -container Imp -netlist "/home/IC/Projects/System/syn/netlists/SYS_TOP.v"

####################  set the top Implementation Design ######################

set_implementation_design SYS_TOP
set_top SYS_TOP

###################### Matching Compare points ####################

match

######################### Run Verification ########################

set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

########################### Reporting ############################# 
report_passing_points > "reports/passing_points_syn.rpt"
report_failing_points > "reports/failing_points_syn.rpt"
report_aborted_points > "reports/aborted_points_syn.rpt"
report_unverified_points > "reports/unverified_points_syn.rpt"



start_gui
#or
#exit

