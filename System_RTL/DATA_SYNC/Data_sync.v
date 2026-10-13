//======================================================
// Module: DATA_SYNC
// Description: Synchronizer for multi-bit bus with enable
// Parameters:
//   - BUS_WIDTH  : width of the bus (default = 8)
//   - NUM_STAGES : number of synchronizer stages (default = 2)
//======================================================

module DATA_SYNC #(
    parameter BUS_WIDTH  = 8,
    parameter NUM_STAGES = 2
)(
    //======================
    // Input Ports
    //======================
    input  wire                 CLK,          
    input  wire                 RST,        
    input  wire                 Bus_Enable,   
    input  wire [BUS_WIDTH-1:0] Unsync_Bus, 

    //======================
    // Output Ports
    //======================
    output reg  [BUS_WIDTH-1:0] Sync_Bus,   
    output reg                  Enable_Pulse 
);

    //======================
    // Internal Registers
    //======================
    reg  [NUM_STAGES-1:0] Multi_FF_bus_en; 
    reg                   enable_sync_dly;   

    //======================
    // Internal Wires
    //======================
    wire Pulse_Gen; // Pulse generation signal

    //======================
    // Synchronizer for Enable Signal
    //======================
    always @(posedge CLK or negedge RST) begin
        if (~RST) begin
            Multi_FF_bus_en <= 'b0;
        end
        else begin
            Multi_FF_bus_en <= {Multi_FF_bus_en[NUM_STAGES-2:0], Bus_Enable};
        end
    end

    //======================
    // Synchronize Data Bus
    //======================
    always @(posedge CLK or negedge RST) begin
        if (~RST) begin
            Sync_Bus <= 'b0;
        end
        else begin
            if (Pulse_Gen) begin
				Sync_Bus <= Unsync_Bus;
            end
        end
    end

    //======================
    // Enable Pulse Generation
    //======================
    always @(posedge CLK or negedge RST) begin
        if (~RST) begin
            enable_sync_dly <= 1'b0;
            Enable_Pulse    <= 1'b0;
        end
        else begin
            enable_sync_dly <= Multi_FF_bus_en[NUM_STAGES-1];
            Enable_Pulse    <= Pulse_Gen;
        end
    end

    //======================
    // Rising Edge Detection
    //======================
    assign Pulse_Gen = (~enable_sync_dly) & (Multi_FF_bus_en[NUM_STAGES-1]);

endmodule
