//======================================================
// Module: REG_FILE
// Description: Register file with parameterized depth and width.
//              Supports write and read operations with separate enable signals.
//======================================================

module REG_FILE #(
    parameter REG_DEPTH      = 16,                       // Number of registers
    parameter REG_WIDTH      = 8,                      // Width of each register
    parameter ADDRESS_WIDTH  = 4                        // Address width for accessing registers
)(
    input  wire                    CLK,                 
    input  wire                    RST,                 // Active-low Asynchronous reset
    input  wire [REG_WIDTH-1:0]     WrData,              // Data input to be written
    input  wire [ADDRESS_WIDTH-1:0] Address,            // Address for read/write
    input  wire                    WrEn,               
    input  wire                    RdEn,   

    output reg                              RdData_Valid,            
    output reg  [REG_WIDTH-1:0]             RdData,              // Data output after reading
    output wire [REG_WIDTH-1:0]             REG0,
    output wire [REG_WIDTH-1:0]             REG1,
    output wire [REG_WIDTH-1:0]             REG2,
    output wire [REG_WIDTH-1:0]             REG3
);
    
    integer i;
    // Register file declaration
    reg [REG_WIDTH-1:0] reg_file [REG_DEPTH-1:0];

    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            // Reset all registers and output
            for (i = 0; i < REG_DEPTH; i = i + 1) begin
                if (i == 2) begin
                    reg_file[i] <= 'b100000_01;
                end
                else if (i == 3) begin
                    reg_file[i] <= 'b0010_0000;
                end
                else begin
                    reg_file[i] <= 'b0;
                end
            end
            
            RdData      <= 'b0;
            RdData_Valid <= 'b0;
        end 
        else if (WrEn && !RdEn) begin
            // Write operation
            reg_file[Address] <= WrData;
        end 
        else if (RdEn && !WrEn) begin
            // Read operation
            RdData <= reg_file[Address];
            RdData_Valid <= 'b1;
        end
        else begin
            RdData_Valid <= 'b0;
        end
    end

    assign REG0 = reg_file[0];
    assign REG1 = reg_file[1];
    assign REG2 = reg_file[2];
    assign REG3 = reg_file[3];


endmodule : REG_FILE
