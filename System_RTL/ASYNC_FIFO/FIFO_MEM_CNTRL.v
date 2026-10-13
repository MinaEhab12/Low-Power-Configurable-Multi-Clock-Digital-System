module FIFO_MEM_CNTRL #(
    parameter ADDRESS_WIDTH = 3,   // Number of address bits
    parameter MEMORY_DEPTH  = 8,   // Depth of the FIFO memory
    parameter DATA_WIDTH    = 8    // Width of each data word
)(
    ///////////////////////////////////////////////////////
    ///////////////// Input Signals ///////////////////////
    ///////////////////////////////////////////////////////
    input  wire                     i_wclk,      // Write clock
    input  wire                     i_wrst_n,    // Active-low reset
    input  wire                     i_wen,       // Write enable
    input  wire [DATA_WIDTH-1:0]    i_wdata,     // Write data
    input  wire [ADDRESS_WIDTH-1:0] i_waddr,     // Write address
    input  wire [ADDRESS_WIDTH-1:0] i_raddr,     // Read address

    ///////////////////////////////////////////////////////
    //////////////// Output Signals ///////////////////////
    ///////////////////////////////////////////////////////
    output wire [DATA_WIDTH-1:0]    o_rdata      // Read data
);

    ///////////////////////////////////////////////////////
    ///////////////// Internal Memory /////////////////////
    ///////////////////////////////////////////////////////
    reg [DATA_WIDTH-1:0] memory [MEMORY_DEPTH-1:0];

    integer i;

    ///////////////////////////////////////////////////////
    ///////////////// Write Operation /////////////////////
    ///////////////////////////////////////////////////////
    always @(posedge i_wclk or negedge i_wrst_n) begin
        if (!i_wrst_n) begin
            // Reset memory contents
            for (i = 0; i < MEMORY_DEPTH; i = i + 1) begin
                memory[i] <= 'b0;
            end
        end
        else if (i_wen) begin
            // Write data when enabled
            memory[i_waddr] <= i_wdata;
        end
    end

    ///////////////////////////////////////////////////////
    ////////////////// Read Operation /////////////////////
    ///////////////////////////////////////////////////////
    assign o_rdata = memory[i_raddr];

endmodule
