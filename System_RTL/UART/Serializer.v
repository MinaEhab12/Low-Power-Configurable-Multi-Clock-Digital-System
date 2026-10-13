//=========================================================================
// Module: Serializer
// Description: Serializes parallel input data (P_DATA) one bit at a time.
//=========================================================================

module Serializer
    #(
        parameter DATA_WIDTH = 8
    )
    (
    input  wire                    CLK,         
    input  wire                    RST,        
    input  wire [DATA_WIDTH-1 :0]  P_DATA,      
    input  wire                    Data_Valid,  
    input  wire                    Ser_En,      
    input  wire                    Busy,        
    
    output wire                    Ser_Data,    
    output reg                     Ser_Done     
);

reg [DATA_WIDTH - 1:0] P_DATA_Buf;       // Holds the data being serialized
reg [2:0]            counter;          // 3-bit counter for indication of one byte

always @(posedge CLK or negedge RST) begin
    if (~RST) begin
        Ser_Done        <= 'b0;
        P_DATA_Buf      <= 'b0;
        counter         <= 'b0;
    end
    else if (Data_Valid && ~Busy) begin
        // Latch new parallel data when valid and not busy
        Ser_Done        <= 'b0;
        P_DATA_Buf <= P_DATA;
        counter         <= 'b0;
    end
    else if (Ser_En && ~Ser_Done) begin
        P_DATA_Buf      <= P_DATA_Buf >> 1;
        counter         <= counter + 1;
        Ser_Done        <= (counter == ('d7));    // Set done flag when last bit is reached
    end
    else begin
        Ser_Done        <= 'b0;
        P_DATA_Buf      <= 'b0;
        counter         <= 'b0;
    end
end

//=========================================================================
// Assign the least significant bit of the shift register to output
//=========================================================================
assign Ser_Data = P_DATA_Buf[0];

endmodule
