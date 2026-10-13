module UART_RX_Start_Check (
    input  wire clk,
    input  wire rst,        
    input  wire start_chk_enable,    
    input  wire start_bit_sampled,  
    output reg  start_glitch_err    
);

always @(posedge clk or negedge rst) begin
    if (~rst) begin
        start_glitch_err <= 1'b0;
    end
    else if (start_chk_enable) begin
        start_glitch_err <= start_bit_sampled;
    end
end

endmodule
