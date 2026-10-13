//============================================================
// Module: Parity_Calc
// Description: Calculates the parity bit (even or odd) for
//              the input parallel data when Data_Valid is high
//              and Busy is low.
//============================================================
module Parity_Calc 
(
    input  wire                   CLK,        
    input  wire                   RST,        
    input  wire [7:0] P_DATA,     
    input  wire                   Busy,        
    input  wire                   PAR_TYP,     
    input  wire                   Data_Valid,  
    output reg                    par_bit      
);

//============================================================
// Internal register to hold the data
//============================================================
reg [7:0] P_DATA_Buf;

always @(posedge CLK or negedge RST) begin
    if (~RST) begin
        par_bit   <= 1'b0;
        P_DATA_Buf <= 'b0;
    end
    else begin
        // Latch data only when valid and not busy so it is correct data
        if (Data_Valid &&~Busy) begin
            P_DATA_Buf <= P_DATA;
        end
        
        // Calculate parity bit based on selected type
        if (PAR_TYP) begin
            par_bit <= (~^ P_DATA_Buf);  // Odd parity
        end
        else begin
            par_bit <= (^P_DATA_Buf);   // Even parity
        end
    end
end

endmodule

