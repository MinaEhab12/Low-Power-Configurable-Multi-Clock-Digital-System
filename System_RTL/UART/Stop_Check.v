module UART_RX_Stop_Check (
    input  wire clk,                
    input  wire rst,
    input  wire stop_chk_enable,    
    input  wire stop_bit_sampled,   
    output reg  stop_error           
);

always @(posedge clk or negedge rst) begin
    if (~rst) begin
        stop_error <= 1'b0;
    end
    else if (stop_chk_enable) begin
        stop_error <= ~stop_bit_sampled;  // Stop bit must be HIGH, else error
    end
end

endmodule
