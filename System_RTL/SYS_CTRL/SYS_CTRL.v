module SYS_CTRL #(
    parameter ALU_INPUT_WIDTH = 16, 
    parameter REGFILE_DATA_WIDTH = 8, 
    parameter REGFILE_ADDR_WIDTH = 4
) (
    // Clock and Reset
    input  wire                         	CLK,
    input  wire                         	RST,
    
    // FIFO Interface
    input  wire                         	FIFO_FULL,
    
    // ALU Interface
    input  wire [ALU_INPUT_WIDTH-1:0]       ALU_OUT,
    input  wire                         	ALU_OUT_Valid,
    output reg  [3:0]                   	ALU_FUN,
    output reg                          	ALU_EN,
    output reg                          	CLK_Gate_EN,
    
    // Register File Interface
    output reg  [REGFILE_ADDR_WIDTH-1:0]    Address,
    output reg                          	WrEn,
    output reg                          	RdEn,
    output reg  [REGFILE_DATA_WIDTH-1:0]    WrData,
    input  wire [REGFILE_DATA_WIDTH-1:0]    RdData,
    input  wire                         	RdData_Valid,
    
    // UART RX Interface
    input  wire [REGFILE_DATA_WIDTH-1:0]    RX_P_DATA,
    input  wire                         	RX_D_VLD,
    
    // UART TX Interface (to ASYNC FIFO)
    output reg  [REGFILE_DATA_WIDTH-1:0]    TX_P_DATA,
    output reg                          	TX_D_VLD,

    // Clock Divider Enable 
    output wire                             clk_div_en                
);

    // Command Definitions
    localparam [7:0] CMD_WRITE_REG = 8'hAA;
    localparam [7:0] CMD_READ_REG  = 8'hBB;
    localparam [7:0] CMD_ALU_OP    = 8'hCC;
    localparam [7:0] CMD_ALU_FUNC  = 8'hDD;
    
    // ALU Operand Addresses
    localparam [REGFILE_ADDR_WIDTH-1:0] ALU_OPERAND_A_ADDR = 4'h0;
    localparam [REGFILE_ADDR_WIDTH-1:0] ALU_OPERAND_B_ADDR = 4'h1;

    // State Machine Definition using localparam
    localparam [3:0] ST_IDLE                    = 4'b0000;
    localparam [3:0] ST_WAIT_WRITE_ADDRESS      = 4'b0001;
    localparam [3:0] ST_WAIT_WRITE_DATA         = 4'b0011;
    localparam [3:0] ST_WAIT_READ_ADDRESS       = 4'b0010;
    localparam [3:0] ST_EXECUTE_READ            = 4'b0110;
    localparam [3:0] ST_WAIT_ALU_OPERAND_A      = 4'b0111;
    localparam [3:0] ST_WAIT_ALU_OPERAND_B      = 4'b0101;
    localparam [3:0] ST_WAIT_ALU_FUNCTION       = 4'b0100;
    localparam [3:0] ST_TRANSMIT_ALU_LOW_BYTE   = 4'b1100;
    localparam [3:0] ST_TRANSMIT_ALU_HIGH_BYTE  = 4'b1101;

    reg [3:0] current_state, next_state;

    // State Register
    always @(posedge CLK or negedge RST) begin
        if (~RST) begin
            current_state <= ST_IDLE;
        end 
        else begin
            current_state <= next_state;
        end
    end

    // Address Storage Register
    reg [REGFILE_ADDR_WIDTH-1:0] stored_address;
    
    always @(posedge CLK or negedge RST) begin
        if (~RST) begin
            stored_address <= '0;
        end
        else if ((current_state == ST_WAIT_WRITE_ADDRESS || current_state == ST_WAIT_READ_ADDRESS) && RX_D_VLD) begin
            stored_address <= RX_P_DATA;
        end
    end

    // ALU Function Storage Register
    reg [3:0] stored_alu_function;
    
    always @(posedge CLK or negedge RST) begin
        if (~RST) begin
            stored_alu_function <= '0;
        end
        else if (current_state == ST_WAIT_ALU_FUNCTION && RX_D_VLD) begin
            stored_alu_function <= RX_P_DATA[3:0];
        end
    end

    // Main State Machine Logic
    always @(*) begin
        // Default assignments
        ALU_FUN      = '0;
        WrData       = '0;
        TX_P_DATA    = '0;
        Address      = '0;
        ALU_EN       = 1'b0;
        CLK_Gate_EN  = 1'b0;
        WrEn         = 1'b0;
        RdEn         = 1'b0;
        TX_D_VLD     = 1'b0;
        next_state   = current_state;

        case (current_state)
            ST_IDLE: begin
                if (RX_D_VLD) begin
                    case (RX_P_DATA)
                        CMD_WRITE_REG: next_state = ST_WAIT_WRITE_ADDRESS;
                        CMD_READ_REG:  next_state = ST_WAIT_READ_ADDRESS;
                        CMD_ALU_OP:    next_state = ST_WAIT_ALU_OPERAND_A;
                        CMD_ALU_FUNC:  next_state = ST_WAIT_ALU_FUNCTION;
                        default:       next_state = ST_IDLE;
                    endcase
                end
            end

            ST_WAIT_WRITE_ADDRESS: begin
                if (RX_D_VLD) begin
                    next_state = ST_WAIT_WRITE_DATA;
                end
            end

            ST_WAIT_WRITE_DATA: begin
                if (RX_D_VLD) begin
                    next_state = ST_IDLE;
                    Address    = stored_address;
                    WrData     = RX_P_DATA;
                    WrEn       = 1'b1;
                end
            end

            ST_WAIT_READ_ADDRESS: begin
                if (RX_D_VLD) begin
                    next_state = ST_EXECUTE_READ;
                end
            end

            ST_EXECUTE_READ: begin
                RdEn    = 1'b1;
                Address = stored_address;
                
                if (RdData_Valid && ~FIFO_FULL) begin
                    next_state = ST_IDLE;
                    TX_P_DATA  = RdData;
                    TX_D_VLD   = 1'b1;
                end
            end

            ST_WAIT_ALU_OPERAND_A: begin
                if (RX_D_VLD) begin
                    Address = ALU_OPERAND_A_ADDR;
                    WrData  = RX_P_DATA;
                    WrEn    = 1'b1;
                    next_state = ST_WAIT_ALU_OPERAND_B;
                end
            end

            ST_WAIT_ALU_OPERAND_B: begin
                if (RX_D_VLD) begin
                    Address = ALU_OPERAND_B_ADDR;
                    WrData  = RX_P_DATA;
                    WrEn    = 1'b1;
                    next_state = ST_WAIT_ALU_FUNCTION;
                end
            end

            ST_WAIT_ALU_FUNCTION: begin
                CLK_Gate_EN = 1'b1;
                
                if (RX_D_VLD) begin
                    ALU_FUN    = RX_P_DATA[3:0];
                    ALU_EN     = 1'b1;
                    next_state = ST_TRANSMIT_ALU_LOW_BYTE;
                end
            end

            ST_TRANSMIT_ALU_LOW_BYTE: begin
                ALU_EN      = 1'b1;
                CLK_Gate_EN = 1'b1;
                ALU_FUN     = stored_alu_function;
                
                if (ALU_OUT_Valid && ~FIFO_FULL) begin
                    TX_P_DATA  = ALU_OUT[7:0];
                    TX_D_VLD   = 1'b1;
                    next_state = ST_TRANSMIT_ALU_HIGH_BYTE;
                end
            end

            ST_TRANSMIT_ALU_HIGH_BYTE: begin
                ALU_EN      = 1'b1;
                CLK_Gate_EN = 1'b1;
                ALU_FUN     = stored_alu_function;
                
                if (~FIFO_FULL) begin
                    TX_P_DATA  = ALU_OUT[15:8];
                    TX_D_VLD   = 1'b1;
                    next_state = ST_IDLE;
                end
            end

            default: begin
                next_state = ST_IDLE;
            end 
        endcase
    end


    // Always On as Specs said
    assign clk_div_en = 1;

endmodule