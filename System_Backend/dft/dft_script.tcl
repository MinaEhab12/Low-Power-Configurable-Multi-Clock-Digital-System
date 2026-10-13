########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

##################### Define Working Library Directory ######################
                                                   
define_design_lib work -path ./work

############################# Formality Setup File ##########################
                                                   
set_svf SYS_TOP.svf

################## Design Compiler Library Files #setup ######################

puts "###########################################"
puts "#      #setting Design Libraries          #"
puts "###########################################"

#Add the path of the libraries and RTL files to the search_path variable

set System_Path /home/IC/Projects/System

lappend search_path /home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys

lappend search_path $System_Path/rtl/ALU
lappend search_path $System_Path/rtl/ASYNC_FIFO
lappend search_path $System_Path/rtl/CLK_DIV
lappend search_path $System_Path/rtl/CLK_GATING
lappend search_path $System_Path/rtl/DATA_SYNC
lappend search_path $System_Path/rtl/Reg_File
lappend search_path $System_Path/rtl/Pulse_Gen
lappend search_path $System_Path/rtl/RST_SYNC
lappend search_path $System_Path/rtl/SYS_CTRL
lappend search_path $System_Path/rtl/CLK_DIV_RX_MUX
lappend search_path $System_Path/rtl/UART
lappend search_path $System_Path/rtl/SYS_TOP

set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

## Standard Cell libraries 
set target_library [list $SSLIB $TTLIB $FFLIB]

## Standard Cell & Hard Macros libraries 
set link_library [list * $SSLIB $TTLIB $FFLIB]  

######################## Reading RTL Files #################################

puts "###########################################"
puts "#             Reading RTL Files           #"
puts "###########################################"

#ALU
analyze -format verilog ALU.v
#FIFO
analyze -format verilog ASYNC_FIFO_TOP.v
analyze -format verilog FIFO_MEM_CNTRL.v
analyze -format verilog FIFO_RD.v
analyze -format verilog FIFO_WR.v
analyze -format verilog DF_SYNC.v
#CLK_DIVIDER MUX
analyze -format verilog CLK_DIV_RX_MUX.v
#CLK_DIVIDER
analyze -format verilog CLK_DIV.v
#CLK_GATING
analyze -format verilog CLK_GATE.v
#DATA_SYNC
analyze -format verilog Data_sync.v
#REGISTER_FILE
analyze -format verilog REG_FILE.v
#PULSE_GENERATOR
analyze -format verilog Pulse_Gen.v
#RST_SYNC
analyze -format verilog RST_SYNC.v
#SYS_CONTROLLER
analyze -format verilog SYS_CTRL.v
#UART_RX
analyze -format verilog Data_Sampling.v
analyze -format verilog Deserializer.v
analyze -format verilog Edge_Bit_Counter.v
analyze -format verilog Par_Check.v
analyze -format verilog Start_Check.v
analyze -format verilog Stop_Check.v
analyze -format verilog UART_RX.v
analyze -format sverilog FSM.sv
#UART_TX
analyze -format verilog parity_calc.v
analyze -format verilog Mux.v
analyze -format verilog Serializer.v
analyze -format verilog UART_TX.v
analyze -format verilog TX_FSM.v

#UART_TOP
analyze -format verilog UART_TOP.v

#SYS_TOP
analyze -format verilog SYS_TOP.v

elaborate -lib WORK SYS_TOP

###################### Defining toplevel ###################################

current_design $top_module

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## Liniking All The Design Parts ########"
puts "###############################################"

link 

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## checking design consistency ##########"
puts "###############################################"

check_design >> reports/check_design.rpt

############################### Path groups ################################
puts "###############################################"
puts "################ Path groups ##################"
puts "###############################################"

group_path -name INREG -from [all_inputs]
group_path -name REGOUT -to [all_outputs]
group_path -name INOUT -from [all_inputs] -to [all_outputs]

#################### Define Design Constraints #########################
puts "###############################################"
puts "############ Design Constraints #### ##########"
puts "###############################################"

source -echo ./cons.tcl

#################### Archirecture Scan Chains #########################
puts "###############################################"
puts "############ Configure scan chains ############"
puts "###############################################"

set_scan_configuration -clock_mixing no_mix  \
                       -style multiplexed_flip_flop \
                       -replace true -max_length 100


###################### Mapping and optimization ########################
puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"

compile -scan 

################################################################### 
# Setting Test Timing Variables
################################################################### 

# Preclock Measure Protocol (default protocol)
set test_default_period 100
set test_default_delay 0
set test_default_bidir_delay 0
set test_default_strobe 20
set test_default_strobe_width 0

########################## Define DFT Signals ##########################

set_dft_signal -port [get_ports scan_clk]  -type ScanClock   -view existing_dft  -timing {30 60}
set_dft_signal -port [get_ports scan_rst]  -type Reset       -view existing_dft  -active_state 0
set_dft_signal -port [get_ports test_mode] -type Constant    -view existing_dft  -active_state 1 
set_dft_signal -port [get_ports test_mode] -type TestMode    -view spec          -active_state 1 
set_dft_signal -port [get_ports SE]        -type ScanEnable  -view spec          -active_state 1   -usage scan
set_dft_signal -port [get_ports SI]        -type ScanDataIn  -view spec 
set_dft_signal -port [get_ports SO]        -type ScanDataOut -view spec 

############################# Create Test Protocol #####################

create_test_protocol
                            
###################### Pre-DFT Design Rule Checking ####################

dft_drc -verbose

############################# Preview DFT ##############################

preview_dft -show scan_summary

############################# Insert DFT ###############################

insert_dft

######################## Optimize Logic post DFT #######################

compile -scan -incremental

###################### Design Rule Checking post DFT ###################

dft_drc -verbose -coverage_estimate > reports/coverage_dft.rpt

##################### Close Formality Setup file ###########################

set_svf -off

#############################################################################
# Write out files
#############################################################################

write_file -format verilog -hierarchy -output netlists/SYS_TOP.ddc
write_file -format verilog -hierarchy -output netlists/SYS_TOP.v
write_sdf  sdf/SYS_TOP.sdf
write_sdc  -nosplit sdc/SYS_TOP.sdc


####################### reporting ##########################################

report_area -hierarchy > reports/area_dft.rpt
report_power -hierarchy > reports/power_dft.rpt
report_timing -delay_type min -max_paths 20 > reports/hold_dft.rpt
report_timing -delay_type max -max_paths 20 > reports/setup_dft.rpt
report_clock -attributes > reports/clocks_dft.rpt
report_constraint -all_violators -nosplit > reports/constraints_dft.rpt


#gui_start
#or
#exit
