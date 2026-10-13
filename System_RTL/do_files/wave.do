onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /SYS_TOP_tb/UART_TX_CLOCK_PERIOD
add wave -noupdate /SYS_TOP_tb/failed_test_count
add wave -noupdate /SYS_TOP_tb/passed_test_count
add wave -noupdate /SYS_TOP_tb/current_test_case
add wave -noupdate /SYS_TOP_tb/parity_error_count
add wave -noupdate /SYS_TOP_tb/framing_error_count
add wave -noupdate /SYS_TOP_tb/system_reset_n
add wave -noupdate /SYS_TOP_tb/uart_clock
add wave -noupdate /SYS_TOP_tb/reference_clock
add wave -noupdate /SYS_TOP_tb/uart_rx_input
add wave -noupdate /SYS_TOP_tb/uart_tx_output
add wave -noupdate /SYS_TOP_tb/uart_parity_error
add wave -noupdate /SYS_TOP_tb/uart_framing_error
add wave -noupdate -color Red /SYS_TOP_tb/received_frame_1
add wave -noupdate /SYS_TOP_tb/received_frame_2
add wave -noupdate /SYS_TOP_tb/bit_index
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3303366038 ps} 0}
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
configure wave -timelineunits ps
update
WaveRestoreZoom {3265501057 ps} {3571598135 ps}
