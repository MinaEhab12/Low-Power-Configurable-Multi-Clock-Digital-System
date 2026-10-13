`timescale 1ns/1ps

module SYS_TOP_tb ();

    ////////////////////////////////////////////////////////
    ///////////////////// Parameters ///////////////////////
    ////////////////////////////////////////////////////////
    
    parameter REF_CLOCK_PERIOD          = 10;
    parameter UART_CLOCK_PERIOD         = 271.2675;
    real      UART_TX_CLOCK_PERIOD      = 8680.56;
    
    localparam SINGLE_FRAME_MODE        = 1'd0;
    localparam DUAL_FRAME_MODE          = 1'd1;
    
    parameter FRAME_WIDTH               = 11;
    
    integer   failed_test_count;
    integer   passed_test_count;
    integer   current_test_case;
    integer   parity_error_count;        // Counter for parity errors
    integer   framing_error_count;       // Counter for framing errors
    
    ////////////////////////////////////////////////////////
    /////////////////////// Signals ////////////////////////
    ////////////////////////////////////////////////////////
    
    // Clock and Reset signals
    reg       system_reset_n;
    reg       uart_clock;
    reg       reference_clock;
    
    // UART Interface signals
    reg       uart_rx_input;
    wire      uart_tx_output;
    wire      uart_parity_error;
    wire      uart_framing_error;
    
    // Test frame registers
    reg  [FRAME_WIDTH - 1:0] received_frame_1;
    reg  [FRAME_WIDTH - 1:0] received_frame_2;
    integer                  bit_index;
    
    ////////////////////////////////////////////////////////
    ////////////////// Error Monitoring ///////////////////
    ////////////////////////////////////////////////////////
    
    // Monitor parity error
    always @(posedge uart_parity_error) begin
        parity_error_count = parity_error_count + 1;
        $display("*** PARITY ERROR DETECTED *** at time %0t ns - Total Parity Errors: %0d", $time, parity_error_count);
    end
    
    // Monitor framing error
    always @(posedge uart_framing_error) begin
        framing_error_count = framing_error_count + 1;
        $display("*** FRAMING ERROR DETECTED *** at time %0t ns - Total Framing Errors: %0d", $time, framing_error_count);
    end
    
    ////////////////////////////////////////////////////////
    ////////////////// Initial Block ///////////////////////
    ////////////////////////////////////////////////////////
    
    initial begin
        $dumpfile("SYS_TOP.vcd");
        $dumpvars;
        
        initialize_testbench();
        apply_system_reset();
            
        ////////////////////// Register File Write Tests /////////////////////
        
        // 0xAA - 0x5 - 0x00
        write_to_register_file('b0_1010_1010_0_1, 'b0_0000_0101_0_1, 'b0_0000_0000_0_1);
        // 0xAA - 0xB - 0xFE
        write_to_register_file('b0_1010_1010_0_1, 'b0_0000_1011_1_1, 'b0_1111_0111_1_1);
        // 0xAA - 0xC - 0x68  
        write_to_register_file('b0_1010_1010_0_1, 'b0_0000_1100_0_1, 'b0_0110_1000_1_1); 
        // 0xAA - 0x9 - 0x0F 
        write_to_register_file('b0_1010_1010_0_1, 'b0_0000_1001_0_1, 'b0_0000_1111_0_1);
        // 0xAA - 0xF - 0xA5  
        write_to_register_file('b0_1010_1010_0_1, 'b0_0000_1111_0_1, 'b0_1010_0101_0_1);
        // 0xAA - 0XA - 0xDD
        write_to_register_file('b0_1010_1010_0_1, 'b0_0000_1010_0_1, 'b0_1101_1101_0_1); 
        // 0xAA - 0X8 - 0xBC
        write_to_register_file('b0_1010_1010_0_1, 'b0_0000_1000_1_1, 'b0_1011_1100_1_1);        
        // 0xAA - 0XD - 0xAE
        write_to_register_file('b0_1010_1010_0_1, 'b0_0000_1101_1_1, 'b0_1010_1110_1_1);
        // 0xAA - 0X4 - 0x99
        write_to_register_file('b0_1010_1010_0_1, 'b0_0000_0100_1_1, 'b0_1001_1001_0_1);
        // 0xAA - 0X7 - 0x77
        write_to_register_file('b0_1010_1010_0_1, 'b0_0000_0111_1_1, 'b0_0111_0111_0_1);
        
        ///////////////////// Register File Read Tests ///////////////////////
        
        // 0xBB - 0x5
        read_from_register_file('b0_1011_1011_0_1, 'b0_0000_0101_0_1); 
        // 0xBB - 0xB                   
        read_from_register_file('b0_1011_1011_0_1, 'b0_0000_1011_1_1);
        // 0xBB - 0xC                    
        read_from_register_file('b0_1011_1011_0_1, 'b0_0000_1100_0_1);
        // 0xBB - 0x9                    
        read_from_register_file('b0_1011_1011_0_1, 'b0_0000_1001_0_1);
        // 0xBB - 0xF                    
        read_from_register_file('b0_1011_1011_0_1, 'b0_0000_1111_0_1);
        // 0xBB - 0xA
        read_from_register_file('b0_1011_1011_0_1, 'b0_0000_1010_0_1); 
        // 0xBB - 0x8
        read_from_register_file('b0_1011_1011_0_1, 'b0_0000_1000_1_1); 
        // 0xBB - 0xD
        read_from_register_file('b0_1011_1011_0_1, 'b0_0000_1101_1_1); 
        // 0xBB - 0x4
        read_from_register_file('b0_1011_1011_0_1, 'b0_0000_0100_1_1); 
        // 0xBB - 0x7
        read_from_register_file('b0_1011_1011_0_1, 'b0_0000_0111_1_1);                   

        
        /////////////////// ALU With Operands Tests /////////////////////
        
        // ALU Subtraction: CMD=0xCC, OP_A=0x08, OP_B=0x06, FUNC=0x01 (A - B = 8 - 6 = 2)
        execute_alu_with_operands('b0_1100_1100_0_1, 'b0_0000_1000_1_1, 'b0_0000_0110_0_1, 'b0_0000_0001_1_1);
        
        // ALU Multiplication: CMD=0xCC, OP_A=0x14, OP_B=0x0A, FUNC=0x02 (A * B = 20 * 10 = 200)
        execute_alu_with_operands('b0_1100_1100_0_1, 'b0_0001_0100_0_1, 'b0_0000_1010_0_1, 'b0_0000_0010_1_1);
        
        // ALU NOR Operation: CMD=0xCC, OP_A=0xEA, OP_B=0x0B, FUNC=0x07 (~(A | B))
        execute_alu_with_operands('b0_1100_1100_0_1, 'b0_1110_1010_1_1, 'b0_0000_1011_1_1, 'b0_0000_0111_1_1);
        
        // ALU Equality Check: CMD=0xCC, OP_A=0x32, OP_B=0x32, FUNC=0x0A (A == B ? 1 : 0)
        execute_alu_with_operands('b0_1100_1100_0_1, 'b0_0011_0010_1_1, 'b0_0011_0010_1_1, 'b0_0000_1010_0_1);

        
        ///////////////// ALU Without Operands Tests ////////////////////
        
        // ALU Compare A < B: CMD=0xDD, FUNC=0x0C (Uses previously stored operands)
        execute_alu_without_operands('b0_1101_1101_0_1, 'b0_0000_1100_0_1);
        
        // ALU Shift Left: CMD=0xDD, FUNC=0x0E (A << 1, equivalent to A * 2)
        execute_alu_without_operands('b0_1101_1101_0_1, 'b0_0000_1110_1_1);
        
        // ALU Multiplication: CMD=0xDD, FUNC=0x02 (A * B using stored operands)
        execute_alu_without_operands('b0_1101_1101_0_1, 'b0_0000_0010_1_1);
        
        // ALU Division: CMD=0xDD, FUNC=0x03 (A / B using stored operands)
        execute_alu_without_operands('b0_1101_1101_0_1, 'b0_0000_0011_0_1);
        
        #(100 * UART_TX_CLOCK_PERIOD);
        $stop;
    end
    
    initial begin

        /////////////////////////// Check Register File Read Tests ////////////////////////////
        
        $display("");
        $display("================================================================================");
        $display("                        Verifying Register File Read Results...                 ");
        $display("================================================================================");

        verify_output_data('b0_0000_0000_0_1, SINGLE_FRAME_MODE);
        verify_output_data('b0_1111_0111_1_1, SINGLE_FRAME_MODE);
        verify_output_data('b0_0110_1000_1_1, SINGLE_FRAME_MODE);
        verify_output_data('b0_0000_1111_0_1, SINGLE_FRAME_MODE);
        verify_output_data('b0_1010_0101_0_1, SINGLE_FRAME_MODE);
        verify_output_data('b0_1101_1101_0_1, SINGLE_FRAME_MODE);
        verify_output_data('b0_1011_1100_1_1, SINGLE_FRAME_MODE);
        verify_output_data('b0_1010_1110_1_1, SINGLE_FRAME_MODE);
        verify_output_data('b0_1001_1001_0_1, SINGLE_FRAME_MODE);
        verify_output_data('b0_0111_0111_0_1, SINGLE_FRAME_MODE);
        
        ///////////////////// Check ALU With Operands Output Tests ///////////////////////

        $display("");
        $display("================================================================================");
        $display("                        Verifying ALU With Operands Results...                  ");
        $display("================================================================================");
        verify_output_data('b0_0000_0000_0_1_0_0000_0010_1_1, DUAL_FRAME_MODE);
        verify_output_data('b0_0000_0000_0_1_0_1100_1000_1_1, DUAL_FRAME_MODE);
        verify_output_data('b0_1111_1111_0_1_0_0001_0100_0_1, DUAL_FRAME_MODE);
        verify_output_data('b0_0000_0000_0_1_0_0000_0001_1_1, DUAL_FRAME_MODE);
        
        /////////////////// Check ALU Without Operands Output Tests //////////////////////
        
        $display("");
        $display("================================================================================");
        $display("                        Verifying ALU Without Operands Results...               ");
        $display("================================================================================");
        verify_output_data('b0_0000_0000_0_1_0_0000_0000_0_1, DUAL_FRAME_MODE);
        verify_output_data('b0_0000_0000_0_1_0_0110_0100_1_1, DUAL_FRAME_MODE);
        verify_output_data('b0_0000_1001_0_1_0_1100_0100_1_1, DUAL_FRAME_MODE);
        verify_output_data('b0_0000_0000_0_1_0_0000_0001_1_1, DUAL_FRAME_MODE);
        
        // Print comprehensive summary report
        print_summary_report();
        
    end
    
    ////////////////////////////////////////////////////////
    /////////////////////// TASKS //////////////////////////
    ////////////////////////////////////////////////////////
    
    /////////////// Signals Initialization /////////////////
    
    task initialize_testbench;
        begin
            failed_test_count    = 0;
            passed_test_count    = 0;
            current_test_case    = 0;
            parity_error_count   = 0;
            framing_error_count  = 0;
            received_frame_1     = 0;
            received_frame_2     = 0;
            uart_clock           = 1'b0;
            reference_clock      = 1'b0;
            uart_rx_input        = 1'b1;
        end
    endtask
    
    ////////////////////// RESET //////////////////////////
    
    task apply_system_reset;
        begin
            system_reset_n = 1'b0;
            #UART_TX_CLOCK_PERIOD;
            system_reset_n = 1'b1;
        end
    endtask
    
    /////////////////// Register File Write ////////////////////
    
    task write_to_register_file;
        input [FRAME_WIDTH - 1:0] command_frame, address_frame, data_frame;
        begin
            transmit_uart_frame(command_frame);
            transmit_uart_frame(address_frame);
            transmit_uart_frame(data_frame);
        end
    endtask
    
    /////////////////// Transmit UART Frame ////////////////////
    
    task transmit_uart_frame;
        input [FRAME_WIDTH - 1:0] frame_data;
        integer bit_counter;
        begin
            // Start Bit
            uart_rx_input = frame_data[FRAME_WIDTH - 1];
            #(UART_TX_CLOCK_PERIOD);
            
            // Data Bits
            for (bit_counter = 2; bit_counter <= FRAME_WIDTH - 2; bit_counter = bit_counter + 1) begin
                uart_rx_input = frame_data[bit_counter];
                #(UART_TX_CLOCK_PERIOD);
            end
            
            // Parity Bit
            uart_rx_input = frame_data[1];
            #(UART_TX_CLOCK_PERIOD);
            
            // Stop Bit
            uart_rx_input = frame_data[0];
            #(UART_TX_CLOCK_PERIOD);
        end
    endtask
    
    /////////////////// Register File Read ////////////////////
    
    task read_from_register_file;
        input [FRAME_WIDTH - 1:0] command_frame, address_frame;
        begin
            transmit_uart_frame(command_frame);
            transmit_uart_frame(address_frame);
            #(UART_TX_CLOCK_PERIOD);
        end
    endtask
    
    /////////////////// ALU With Operands //////////////////
    
    task execute_alu_with_operands;
        input [FRAME_WIDTH - 1:0] command_frame, operand_1_frame, operand_2_frame, function_frame;
        begin
            transmit_uart_frame(command_frame);
            transmit_uart_frame(operand_1_frame);
            transmit_uart_frame(operand_2_frame);
            transmit_uart_frame(function_frame);
            #(UART_TX_CLOCK_PERIOD);
        end
    endtask
    
    ////////////////// ALU Without Operands ////////////////
    
    task execute_alu_without_operands;
        input [FRAME_WIDTH - 1:0] command_frame, function_frame;
        begin
            transmit_uart_frame(command_frame);
            transmit_uart_frame(function_frame);
            #(UART_TX_CLOCK_PERIOD);
        end
    endtask
    
    //////////////////// Verify Output Data //////////////////////
    
    task verify_output_data;
        input [(FRAME_WIDTH - 1) * 2:0] expected_output_data;
        input                           verification_mode;
        integer                         bit_loop_counter;
        begin
            received_frame_1     = 0;
            received_frame_2     = 0;
            current_test_case    = current_test_case + 1;
            
            @(posedge dut_sys_top.U0_UART.u_uart_tx.busy);
            
            // Capture First Frame
            // Start Bit
            #(UART_TX_CLOCK_PERIOD);
            received_frame_1[10] = uart_tx_output;
            
            // Data Bits
            for (bit_index = 2; bit_index < 10; bit_index = bit_index + 1) begin
                #(UART_TX_CLOCK_PERIOD);
                received_frame_1[bit_index] = uart_tx_output;
            end
            
            // Parity Bit
            #(UART_TX_CLOCK_PERIOD);
            received_frame_1[1] = uart_tx_output;
            
            // Stop Bit
            #(UART_TX_CLOCK_PERIOD);
            received_frame_1[0] = uart_tx_output;
            
            if (verification_mode == SINGLE_FRAME_MODE) begin
                if (received_frame_1 == expected_output_data) begin
                    $display("Test case %0d || PASSED || DATA READ FROM REG = %8b", current_test_case, received_frame_1[9:2]);
                    passed_test_count = passed_test_count + 1;
                end
                else begin
                    $display("Test case %0d || FAILED || DATA READ FROM REG = %8b", current_test_case, received_frame_1[9:2]);
                    failed_test_count = failed_test_count + 1;
                end
            end
            else begin
                @(posedge dut_sys_top.U0_UART.u_uart_tx.busy);
                
                // Capture Second Frame
                // Start Bit
                #(UART_TX_CLOCK_PERIOD);
                received_frame_2[10] = uart_tx_output;
                
                // Data Bits
                for (bit_loop_counter = 2; bit_loop_counter < 10; bit_loop_counter = bit_loop_counter + 1) begin
                    #(UART_TX_CLOCK_PERIOD);
                    received_frame_2[bit_loop_counter] = uart_tx_output;
                end
                
                // Parity Bit
                #(UART_TX_CLOCK_PERIOD);
                received_frame_2[1] = uart_tx_output;
                
                // Stop Bit
                #(UART_TX_CLOCK_PERIOD);
                received_frame_2[0] = uart_tx_output;
                
                if ({received_frame_2, received_frame_1} == expected_output_data) begin
                    $display("Test case %0d || PASSED || ALU OUTPUT = %16b", current_test_case, {received_frame_2[9:2], received_frame_1[9:2]});
                    passed_test_count = passed_test_count + 1;
                end
                else begin
                    $display("Test case %0d || FAILED || ALU OUTPUT = %16b", current_test_case, {received_frame_2[9:2], received_frame_1[9:2]});
                    failed_test_count = failed_test_count + 1;
                end
            end
        end
    endtask
    
    /////////////////// Summary Report Task /////////////////////
    
    task print_summary_report;
        integer total_tests;
        real pass_percentage;
        begin
            total_tests = passed_test_count + failed_test_count;
            if (total_tests > 0)
                pass_percentage = (passed_test_count * 100.0) / total_tests;
            else
                pass_percentage = 0.0;
            
            $display("\n");
            $display("================================================================================");
            $display("                           COMPREHENSIVE TEST SUMMARY REPORT                    ");
            $display("================================================================================");
            $display("");
            $display("TEST EXECUTION RESULTS:");
            $display("----------------------");
            $display("Total Test Cases Executed   : %0d", total_tests);
            $display("PASSED Test Cases           : %0d", passed_test_count);
            $display("FAILED Test Cases           : %0d", failed_test_count);
            $display("Pass Rate                   : %.2f%%", pass_percentage);
            $display("");
            $display("ERROR MONITORING RESULTS:");
            $display("------------------------");
            $display("Parity Errors Detected      : %0d", parity_error_count);
            $display("Framing Errors Detected     : %0d", framing_error_count);
            $display("Total Communication Errors  : %0d", parity_error_count + framing_error_count);
            $display("");
            $display("OVERALL SYSTEM STATUS:");
            $display("---------------------");
            if (failed_test_count == 0 && parity_error_count == 0 && framing_error_count == 0) begin
                $display("STATUS: ALL TESTS PASSED - SYSTEM FUNCTIONING CORRECTLY");
                $display("-->   No functional test failures");
                $display("-->   No communication errors detected");
            end
            else begin
                $display("STATUS: ISSUES DETECTED - REVIEW REQUIRED");
                if (failed_test_count > 0)
                    $display("%0d test case(s) failed - Check functional logic", failed_test_count);
                if (parity_error_count > 0)
                    $display("%0d parity error(s) detected - Check data integrity", parity_error_count);
                if (framing_error_count > 0)
                    $display("%0d framing error(s) detected - Check UART timing/configuration", framing_error_count);
            end
            $display("");
            $display("================================================================================");
            $display("                                END OF REPORT                                  ");
            $display("================================================================================");
        end
    endtask
    
    ////////////////////////////////////////////////////////
    /////////////////// Clock Generation ///////////////////
    ////////////////////////////////////////////////////////
    
    always #(REF_CLOCK_PERIOD/2)   reference_clock = ~reference_clock;
    always #(UART_CLOCK_PERIOD/2)  uart_clock      = ~uart_clock;
    
    ////////////////////////////////////////////////////////
    /////////////////// DUT Instantiation //////////////////
    ////////////////////////////////////////////////////////
    
    SYS_TOP #(
        .DATA_WIDTH (8),
        .RF_ADDR    (4)
    ) dut_sys_top (
        .RST_N         (system_reset_n),
        .UART_CLK      (uart_clock),
        .REF_CLK       (reference_clock),
        .UART_RX_IN    (uart_rx_input),
        .UART_TX_O     (uart_tx_output),
        .parity_error  (uart_parity_error),
        .framing_error (uart_framing_error)
    );

endmodule