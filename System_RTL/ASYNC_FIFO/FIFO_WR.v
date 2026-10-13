module FIFO_WR #(
    parameter ADDRESS_WIDTH = 3   
)(
    ///////////////////////////////////////////////////////
    ///////////////// Input Signals ///////////////////////
    ///////////////////////////////////////////////////////
    input  wire                     i_wclk,      
    input  wire                     i_wrst_n,     
    input  wire                     i_winc,       
    input  wire [ADDRESS_WIDTH:0]   i_wq2_rptr,  

    ///////////////////////////////////////////////////////
    //////////////// Output Signals ///////////////////////
    ///////////////////////////////////////////////////////
    output wire                      o_wfull,   
    output wire  [ADDRESS_WIDTH-1:0] o_waddr,    
    output reg   [ADDRESS_WIDTH:0]   o_wptr        
);

    ///////////////////////////////////////////////////////
    ////////////// Internal Registers /////////////////////
    ///////////////////////////////////////////////////////
    reg [ADDRESS_WIDTH:0] wptr_bin; 
    ///////////////////////////////////////////////////////
    /////////// Pointer Conversion to Gray Code ///////////
    ///////////////////////////////////////////////////////
    //assign o_wptr = wptr_bin ^ (wptr_bin >> 1); 

    always @(posedge i_wclk or negedge i_wrst_n) begin
       if(~i_wrst_n) begin
            o_wptr <= 0 ;
        end
        else begin
            case (wptr_bin)
                4'b0000: o_wptr <= 4'b0000;
                4'b0001: o_wptr <= 4'b0001;
                4'b0010: o_wptr <= 4'b0011;
                4'b0011: o_wptr <= 4'b0010;
                4'b0100: o_wptr <= 4'b0110;
                4'b0101: o_wptr <= 4'b0111;
                4'b0110: o_wptr <= 4'b0101;
                4'b0111: o_wptr <= 4'b0100;
                4'b1000: o_wptr <= 4'b1100;
                4'b1001: o_wptr <= 4'b1101;
                4'b1010: o_wptr <= 4'b1111;
                4'b1011: o_wptr <= 4'b1110;
                4'b1100: o_wptr <= 4'b1010;
                4'b1101: o_wptr <= 4'b1011;
                4'b1110: o_wptr <= 4'b1001;
                4'b1111: o_wptr <= 4'b1000;
            endcase
        end
    end


    ///////////////////////////////////////////////////////
    /////////////////// Full Condition ////////////////////
    ///////////////////////////////////////////////////////
    assign o_wfull = (
        (o_wptr[1:0] == i_wq2_rptr[1:0]) && 
        (o_wptr[2]   != i_wq2_rptr[2])   &&  
        (o_wptr[3]   != i_wq2_rptr[3])      
    );

    ///////////////////////////////////////////////////////
    ///////////// Write Address and Pointer ///////////////
    ///////////////////////////////////////////////////////
    always @(posedge i_wclk or negedge i_wrst_n) begin
        if (!i_wrst_n) begin
            wptr_bin <= 'b0;
        end 
        else if (i_winc && !o_wfull) begin
            wptr_bin <= wptr_bin + 1'b1;
        end
    end

    assign o_waddr = wptr_bin [ADDRESS_WIDTH-1:0];

endmodule
