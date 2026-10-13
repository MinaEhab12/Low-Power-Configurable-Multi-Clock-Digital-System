//======================================================
// Module: RST_SYNC
// Description: Reset Synchronizer
// Parameter: NUM_STAGES - number of synchronization stages (default = 2)
//======================================================

module RST_SYNC #(
    parameter NUM_STAGES = 2
)(
    //======================
    // Input Ports
    //======================
    
    input  wire CLK,    // Clock input
    input  wire RST,    // Asynchronous active-low reset

    //======================
    // Output Ports
    //======================

    output wire SYNC_RST // Synchronized reset
);

    //======================
    // Internal Registers
    //======================

    reg [NUM_STAGES-1:0] sync_reg;

    //======================
    // Synchronization Logic
    //======================

    always @(posedge CLK or negedge RST) begin
        if (~RST) begin
            sync_reg <= 'b0;  // Clear register on async reset
        end
        else begin
            // Shift register for reset synchronization
            sync_reg <= {sync_reg[NUM_STAGES-2:0], 1'b1};
        end
    end

    //======================
    // Output Assignment
    //======================

    assign SYNC_RST = sync_reg[NUM_STAGES-1];

endmodule
