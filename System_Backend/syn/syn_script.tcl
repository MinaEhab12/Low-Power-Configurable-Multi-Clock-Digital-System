########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

##################### Define Working Library Directory ######################
                                                   
define_design_lib work -path ./work

############################# Formality Setup File ##########################
                                                   
set_svf $top_module.svf

################## Design Compiler Library Files #setup ######################

puts "###########################################"
puts "#      #setting Design Libraries          #"
puts "###########################################"

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

###################### Mapping and optimization ########################
puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"

compile -map_effort high

##################### Close Formality Setup file ###########################

set_svf -off

#############################################################################
# Write out files
#############################################################################

write_file -format verilog -hierarchy -output netlists/$top_module.ddc
write_file -format verilog -hierarchy -output netlists/$top_module.v
write_sdf  sdf/$top_module.sdf
write_sdc  -nosplit sdc/$top_module.sdc

####################### reporting ##########################################

report_area -hierarchy > reports/area.rpt
report_power -hierarchy > reports/power.rpt
report_timing -delay_type min > reports/hold.rpt
report_timing -delay_type max > reports/setup.rpt
report_clock -attributes > reports/clocks.rpt
report_constraint -all_violators -nosplit > reports/constraints.rpt

################# starting graphical user interface #######################


############################################################################
# DFT Preparation Section
############################################################################

set flops_per_chain 100

set num_flops [sizeof_collection [all_registers -edge_triggered]]

set num_chains [expr $num_flops / $flops_per_chain + 1 ]


#gui_start
#or
#exit
