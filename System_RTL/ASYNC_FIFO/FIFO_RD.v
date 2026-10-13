module FIFO_RD #(
    parameter ADDRESS_WIDTH = 3     
)(
    ///////////////////////////////////////////////////////
    ///////////////// Input Signals ///////////////////////
    ///////////////////////////////////////////////////////
    input  wire                     i_rclk,        
    input  wire                     i_rrst_n,     
    input  wire                     i_rinc,        
    input  wire [ADDRESS_WIDTH:0]   i_rq2_wptr,  

    ///////////////////////////////////////////////////////
    //////////////// Output Signals ///////////////////////
    ///////////////////////////////////////////////////////
    output wire                      o_rempty,
    output wire  [ADDRESS_WIDTH-1:0] o_raddr,     
    output reg   [ADDRESS_WIDTH:0]   o_rptr         
);

    ///////////////////////////////////////////////////////
    ////////////// Internal Registers /////////////////////
    ///////////////////////////////////////////////////////
    reg [ADDRESS_WIDTH:0] rptr_bin; 

    ///////////////////////////////////////////////////////
    /////////// Pointer Conversion to Gray Code ///////////
    ///////////////////////////////////////////////////////

    //assign o_rptr   = rptr_bin ^ (rptr_bin >> 1);

    always @(posedge i_rclk or negedge i_rrst_n) begin
    if(~i_rrst_n) begin
        o_rptr <= 0 ;
    end
    else begin
        case (rptr_bin)
            4'b0000: o_rptr <= 4'b0000;
            4'b0001: o_rptr <= 4'b0001;
            4'b0010: o_rptr <= 4'b0011;
            4'b0011: o_rptr <= 4'b0010;
            4'b0100: o_rptr <= 4'b0110;
            4'b0101: o_rptr <= 4'b0111;
            4'b0110: o_rptr <= 4'b0101;
            4'b0111: o_rptr <= 4'b0100;
            4'b1000: o_rptr <= 4'b1100;
            4'b1001: o_rptr <= 4'b1101;
            4'b1010: o_rptr <= 4'b1111;
            4'b1011: o_rptr <= 4'b1110;
            4'b1100: o_rptr <= 4'b1010;
            4'b1101: o_rptr <= 4'b1011;
            4'b1110: o_rptr <= 4'b1001;
            4'b1111: o_rptr <= 4'b1000;
        endcase
    end
end 

    assign o_rempty = (o_rptr == i_rq2_wptr);     

    ///////////////////////////////////////////////////////
    ////////////// Read Address and Pointer ///////////////
    ///////////////////////////////////////////////////////
    always @(posedge i_rclk or negedge i_rrst_n) begin
        if (!i_rrst_n) begin
            rptr_bin  <= 'b0;
        end 
        else if (i_rinc && !o_rempty) begin
            rptr_bin  <= rptr_bin + 1'b1;
        end
    end

    assign o_raddr = rptr_bin[ADDRESS_WIDTH-1:0];


endmodule
