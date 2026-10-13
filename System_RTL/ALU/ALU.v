//======================================================
//  ALU Module
//  Author: Mina Ehab
//  Description: Parameterized Arithmetic Logic Unit
//======================================================

module ALU #(
    parameter OPERAND_WIDTH = 8, 
    parameter OUTPUT_WIDTH  = 2 * OPERAND_WIDTH
)(
    input  wire                     CLK,
    input  wire                     RST,
    input  wire                     EN,
    input  wire [OPERAND_WIDTH-1:0] A,
    input  wire [OPERAND_WIDTH-1:0] B,
    input  wire [3:0]               ALU_FUN,
    output reg  [OUTPUT_WIDTH-1:0]  ALU_OUT,
    output reg                      OUT_VALID
);

    always @(posedge CLK or negedge RST) begin
        if (~RST) begin
            ALU_OUT   <= 'b0;
            OUT_VALID <= 1'b0;
        end 
        else if (EN) begin
            OUT_VALID <= 1'b1;

            case (ALU_FUN)
                4'b0000: ALU_OUT <= A + B;            // Addition
                4'b0001: ALU_OUT <= A - B;            // Subtraction
                4'b0010: ALU_OUT <= A * B;            // Multiplication
                4'b0011: ALU_OUT <= A / B;            // Division

                4'b0100: ALU_OUT <= A & B;            // AND
                4'b0101: ALU_OUT <= A | B;            // OR
                4'b0110: ALU_OUT <= ~(A & B);         // NAND
                4'b0111: ALU_OUT <= ~(A | B);         // NOR
                4'b1000: ALU_OUT <= A ^ B;            // XOR
                4'b1001: ALU_OUT <= ~(A ^ B);         // XNOR

                4'b1010: ALU_OUT <= (A == B);         // Equality check
                4'b1011: ALU_OUT <= (A > B) ? 'd2 : 'b0; // Greater than
                4'b1100: ALU_OUT <= (A < B) ? 'd3 : 'b0; // Less than

                4'b1101: ALU_OUT <= A >> 1;           // Shift right
                4'b1110: ALU_OUT <= A << 1;           // Shift left

                default: OUT_VALID <= 1'b0;           // Invalid function
            endcase
        end 
        else begin
            OUT_VALID <= 1'b0;
        end
    end

endmodule
