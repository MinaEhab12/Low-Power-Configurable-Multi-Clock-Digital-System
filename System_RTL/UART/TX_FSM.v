//=========================================================================
// Module: FSM
// Description: Finite State Machine to control serialization process.
//              Controls the MUX selection, Serializer enable signal,
//              and Busy signal during data transmission.
//=========================================================================

module FSM (
    input  wire       CLK, 
    input  wire       RST,       
    input  wire       Data_Valid, 
    input  wire       PAR_EN,     
    input  wire       Ser_Done,  

    output reg        Ser_En,     
    output reg [1:0]  MUX_Sel,    
    output reg        Busy        
);

    //-------------------------------------------------------------------------
    // MUX Selector Encoding
    //-------------------------------------------------------------------------
    localparam [1:0] 
        START_Mux   = 2'b00,
        DATA_Mux    = 2'b01,
        STOP_Mux    = 2'b11,
        PARITY_Mux  = 2'b10;

    //-------------------------------------------------------------------------
    // FSM State Encoding using typedef enum
    //-------------------------------------------------------------------------
	localparam [2:0] 
	    IDLE   = 3'b000,
	    START  = 3'b001,
	    DATA   = 3'b011,
	    PARITY = 3'b010,
	    STOP   = 3'b110;


    reg [2:0] current_state, next_state;

    //-------------------------------------------------------------------------
    // Internal signal for combinational Busy
    //-------------------------------------------------------------------------
    reg busy_comb;

    //-------------------------------------------------------------------------
    // Sequential Logic: State transition and Busy signal latch
    //-------------------------------------------------------------------------
    always @(posedge CLK or negedge RST) begin
        if (~RST) begin
            current_state <= IDLE;
            Busy          <= 1'b0;
        end 
        else begin
            current_state <= next_state;
            Busy          <= busy_comb;
        end
    end

    //-------------------------------------------------------------------------
    // Combinational Logic: Next state and output control
    //-------------------------------------------------------------------------
    always @(*) begin
        Ser_En    = 1'b0;
        MUX_Sel   = STOP_Mux;  
        busy_comb = 1'b0;
        next_state = current_state;

        case (current_state)
            //=========================================================
            IDLE: begin
                if (Data_Valid) begin
                    next_state = START;
                    MUX_Sel    = START_Mux;
                    busy_comb  = 1'b1;
                end
            end

            //=========================================================
            START: begin
                next_state = DATA;
                Ser_En     = 1'b1;
                MUX_Sel    = DATA_Mux;
                busy_comb  = 1'b1;
            end

            //=========================================================
            DATA: begin
                MUX_Sel    = DATA_Mux;
                Ser_En     = 1'b1;
                busy_comb  = 1'b1;

                if (Ser_Done) begin
                    if (PAR_EN) begin
                        next_state = PARITY;
                        Ser_En     = 1'b0;
                        MUX_Sel    = PARITY_Mux;
                    end 
                    else begin
                        next_state = STOP;
                        Ser_En     = 1'b0;
                        MUX_Sel    = STOP_Mux;
                    end
                end
            end

            //=========================================================
            PARITY: begin
                next_state = STOP;
                MUX_Sel    = STOP_Mux;
                busy_comb  = 1'b1;
            end

            //=========================================================
            STOP: begin
                next_state = IDLE;
                // Busy is 0 by default on transition to IDLE
            end

            //=========================================================
            default: begin
                next_state = IDLE;
            end
        endcase
    end

endmodule
