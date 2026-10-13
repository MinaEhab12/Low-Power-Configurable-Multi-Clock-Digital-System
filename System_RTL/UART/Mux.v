//============================================================
// Module: MUX
// Description: Multiplexer that selects between start bit,
//              serial data bit, parity bit, and stop bit 
//              based on MUX_Sel signal.
//============================================================

module MUX (
    input  wire        CLK,       
    input  wire        RST,       

    input  wire [1:0]  mux_sel,    
    input  wire        start_bit,  
    input  wire        ser_data,   
    input  wire        par_bit,    
    input  wire        stop_bit,   

    output reg         TX_OUT      
);


    always @(posedge CLK or negedge RST) begin
        if (~RST) begin
            // Reset condition: default TX_OUT to idle state (usually high in UART)
            TX_OUT <= 1'b1;
        end
        else begin
            case (mux_sel)
                2'b00 : TX_OUT <= start_bit;  
                2'b01 : TX_OUT <= ser_data;   
                2'b10 : TX_OUT <= par_bit;    
                2'b11 : TX_OUT <= stop_bit;  
            endcase
        end
    end

endmodule
