module Deserializer #(
    parameter DATA_WIDTH = 8   // Parallel output data width
)(
    input  wire                  clk,
    input  wire                  rst,           
    input  wire                  deser_enable,   
    input  wire                  serial_in_bit,  // Incoming serial bit (from sampler)
    output reg  [DATA_WIDTH-1:0] parallel_data  
);

integer bit_index;   // Counts number of bits shifted in

always @(posedge clk or negedge rst) begin
    if (~rst) begin
        parallel_data <= 'b0;
        bit_index     <= 0;
    end
    else if (deser_enable) begin
        parallel_data <= {serial_in_bit, parallel_data[DATA_WIDTH-1:1]};
        bit_index     <= bit_index + 1;

        if (bit_index == DATA_WIDTH - 1) begin
            bit_index <= 0;
        end
    end
end

endmodule
