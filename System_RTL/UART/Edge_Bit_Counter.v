module Edge_Bit_Counter (
    input  wire       clk,
    input  wire       rst,           
    input  wire       edge_cnt_enable,
    input  wire [5:0] prescaler,     
    output reg  [3:0] bit_index,        // Counts number of received bits
    output reg  [5:0] edge_index        // Counts edges within one bit
);

always @(posedge clk or negedge rst) begin
    if (~rst) begin
        bit_index  <= 4'b0;
        edge_index <= 6'b1;
    end
    else if (edge_cnt_enable) begin
        if (edge_index == prescaler) begin
            edge_index <= 6'b1;         // Reset edge counter after full prescaler cycle
            bit_index  <= bit_index + 1;
        end
        else begin
            edge_index <= edge_index + 1;
        end
    end
    else begin
        bit_index  <= 4'b0;
        edge_index <= 6'b1;
    end
end

endmodule
