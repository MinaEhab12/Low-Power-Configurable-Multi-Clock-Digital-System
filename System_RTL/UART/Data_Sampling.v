module Data_Sampling (
    input  wire        clk,  
    input  wire        rst,          
    input  wire        samp_enable,  
    input  wire [5:0]  edge_counter,   
    input  wire        rx_serial_in,  
    input  wire [5:0]  prescaler,     
    output reg         sampled_bit     
);

wire [5:0] sample_pos_before, sample_pos_mid, sample_pos_after;

// Define the three sampling points
assign sample_pos_mid    = (prescaler >> 1);
assign sample_pos_before = sample_pos_mid - 1;
assign sample_pos_after  = sample_pos_mid + 1;

reg sample_stage1, sample_stage2, sample_stage3;

always @(posedge clk or negedge rst) begin
    if (~rst) begin
        sampled_bit   <= 1'b0;
        sample_stage1 <= 1'b0;
        sample_stage2 <= 1'b0;
        sample_stage3 <= 1'b0;
    end
    else if (samp_enable) begin
        if (edge_counter == sample_pos_before) begin
            sample_stage1 <= rx_serial_in;
        end
        else if (edge_counter == sample_pos_mid) begin
            sample_stage2 <= rx_serial_in;
        end
        else if (edge_counter == sample_pos_after) begin
            sample_stage3 <= rx_serial_in;
        end
        else if (edge_counter == sample_pos_after + 1) begin
            // Majority voting logic
            sampled_bit <= (sample_stage1 & sample_stage2) |
                           (sample_stage2 & sample_stage3) |
                           (sample_stage1 & sample_stage3);
        end
    end
end

endmodule
