module UART_RX_FSM (
    input  wire       clk,
    input  wire       rst,             
    input  wire       rx_serial_in,    
    input  wire       parity_enable, 
    input  wire [3:0] bit_index,         
    input  wire [5:0] edge_index,        
    input  wire [5:0] prescaler,         
    input  wire       parity_error,      
    input  wire       start_glitch_err,
    input  wire       stop_error,      
    output reg        samp_enable,        
    output reg        edge_cnt_enable,    
    output reg        parity_chk_enable,  
    output reg        stop_chk_enable, 
    output reg        start_chk_enable,
    output reg        deser_enable,    
    output reg        data_valid          
);

typedef enum logic [2:0] {
    IDLE_STATE       = 3'b000,
    START_CHECK      = 3'b001,
    RECEIVE_DATA     = 3'b011,
    PARITY_CHECK     = 3'b010,
    STOP_CHECK_P     = 3'b110,
    STOP_CHECK_NP    = 3'b111,
    SEND_PARALLEL    = 3'b101
} fsm_state_t;

fsm_state_t current_state, next_state;

wire sample_ready;
assign sample_ready = (edge_index == ((prescaler >> 1) + 3));

reg data_valid_next;

always @(posedge clk or negedge rst) begin
    if (~rst) begin
        current_state <= IDLE_STATE;
        data_valid    <= 1'b0;
    end 
    else begin
        current_state <= next_state;
        data_valid    <= data_valid_next;
    end
end

always @(*) begin
    // Default assignments
    samp_enable       = 1'b1;
    edge_cnt_enable   = 1'b1;
    parity_chk_enable = 1'b0;
    stop_chk_enable   = 1'b0;
    start_chk_enable  = 1'b0;
    deser_enable      = 1'b0;
    data_valid_next   = 1'b0;

    case (current_state)

        IDLE_STATE: begin
            if (~rx_serial_in) begin
                next_state = START_CHECK;
            end
            else begin
                next_state       = IDLE_STATE;
                samp_enable      = 1'b0;
                edge_cnt_enable  = 1'b0;
            end
        end

        START_CHECK: begin
            if (bit_index == 4'd1) begin
                if (start_glitch_err) begin
                    next_state      = IDLE_STATE;
                    samp_enable     = 1'b0;
                    edge_cnt_enable = 1'b0;
                end
                else begin
                    next_state  = RECEIVE_DATA;
                    deser_enable = 1'b1;
                end
            end
            else begin
                next_state = START_CHECK;
                if (sample_ready) begin
                    start_chk_enable = 1'b1;
                end
            end
        end

        RECEIVE_DATA: begin
            if (bit_index == 4'd9) begin
                if (parity_enable) begin
                    next_state = PARITY_CHECK;
                end
                else begin
                    next_state = STOP_CHECK_NP;
                end
                deser_enable = 1'b0;  // Stop deserializer after all bits
            end
            else begin
                next_state = RECEIVE_DATA;
                if (sample_ready) begin
                    deser_enable = 1'b1;
                end
            end
        end

        PARITY_CHECK: begin
            if (bit_index == 4'd10) begin
                if (parity_error) begin
                    next_state      = IDLE_STATE;
                    samp_enable     = 1'b0;
                    edge_cnt_enable = 1'b0;
                end
                else begin
                    next_state = STOP_CHECK_P;
                end
            end
            else begin
                next_state = PARITY_CHECK;
                if (sample_ready) begin
                    parity_chk_enable = 1'b1;
                end
            end
        end

        STOP_CHECK_NP: begin
            if (bit_index == 4'd9 && edge_index == prescaler) begin
                if (stop_error) begin
                    next_state      = IDLE_STATE;
                    samp_enable     = 1'b0;
                    edge_cnt_enable = 1'b0;
                end
                else begin
                    next_state      = SEND_PARALLEL;
                    data_valid_next = 1'b1;
                    samp_enable     = 1'b0;
                    edge_cnt_enable = 1'b0;
                end
            end
            else begin
                next_state = STOP_CHECK_NP;
                if (sample_ready) begin
                    stop_chk_enable = 1'b1;
                end
            end
        end

        STOP_CHECK_P: begin
            if (bit_index == 4'd10 && edge_index == prescaler) begin
                if (stop_error) begin
                    next_state      = IDLE_STATE;
                    samp_enable     = 1'b0;
                    edge_cnt_enable = 1'b0;
                end
                else begin
                    next_state      = SEND_PARALLEL;
                    data_valid_next = 1'b1;
                    samp_enable     = 1'b0;
                    edge_cnt_enable = 1'b0;
                end
            end
            else begin
                next_state = STOP_CHECK_P;
                if (sample_ready) begin
                    stop_chk_enable = 1'b1;
                end
            end
        end

        SEND_PARALLEL: begin
            if (~rx_serial_in) begin
                next_state = START_CHECK;
            end
            else begin
                next_state      = IDLE_STATE;
                samp_enable     = 1'b0;
                edge_cnt_enable = 1'b0;
            end
        end

        default: begin
            next_state      = IDLE_STATE;
            samp_enable     = 1'b0;
            edge_cnt_enable = 1'b0;
        end
    endcase
end

endmodule
