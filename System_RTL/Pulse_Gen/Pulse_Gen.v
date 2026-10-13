/////////////////////////////////////////////////////////////
//                   Pulse Generator                       //
//   Description: Generates a single-cycle pulse            //
//                from a level-sensitive input.             //
//   Author: Mina Ehab                                      //
/////////////////////////////////////////////////////////////

module PULSE_GEN (
    input  wire clk,        // System clock
    input  wire rst_n,      // Active-low reset
    input  wire level_in,   // Level input signal
    output wire pulse_out   // Pulse output signal
);

    // Internal registers
    reg level_d1;   // First stage register
    reg level_d2;   // Second stage register

    // Sequential process
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            level_d1 <= 1'b0;
            level_d2 <= 1'b0;
        end 
        else begin
            level_d1 <= level_in;
            level_d2 <= level_d1;
        end  
    end

    // Pulse generation logic
    assign pulse_out = level_d1 && !level_d2;

endmodule
