module UART_RX_Parity_Check #(
    parameter DATA_WIDTH = 8   
)(
    input  wire                  clk,             // System clock
    input  wire                  rst,             // Active low reset
    input  wire                  parity_type,     // 0 = even, 1 = odd
    input  wire                  parity_chk_enable, // Enable parity check
    input  wire                  parity_bit_rx,   // Received parity bit (sampled)
    input  wire [DATA_WIDTH-1:0] parallel_data,   // Received parallel data
    output reg                   parity_error     // Parity error flag
);

reg expected_parity_bit;

always @(*) begin
    if (parity_type) begin
        expected_parity_bit = ~^parallel_data;  // Odd parity
    end
    else begin
        expected_parity_bit = ^parallel_data;   // Even parity
    end
end

always @(posedge clk or negedge rst) begin
    if (~rst) begin
        parity_error <= 1'b0;
    end
    else if (parity_chk_enable) begin
        parity_error <= ~(parity_bit_rx == expected_parity_bit);
    end
end

endmodule