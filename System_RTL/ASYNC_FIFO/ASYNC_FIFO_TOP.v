module ASYNC_FIFO #(
    parameter DATA_WIDTH    = 8,
    parameter ADDRESS_WIDTH = 3,
    parameter MEMORY_DEPTH  = 8,
    parameter BUS_WIDTH     = 4
) (
    ///////////////////////////////////////////////////////
    ///////////////// Input Signals ///////////////////////
    ///////////////////////////////////////////////////////
    input  wire                   W_CLK,
    input  wire                   W_RST,
    input  wire                   W_INC,
    input  wire                   R_CLK,
    input  wire                   R_RST,
    input  wire                   R_INC,
    input  wire [DATA_WIDTH-1:0]  WR_DATA,
    ///////////////////////////////////////////////////////
    //////////////// Output Signals ///////////////////////
    ///////////////////////////////////////////////////////
    output wire [DATA_WIDTH-1:0]  RD_DATA,
    output wire                   FULL,
    output wire                   EMPTY
);

    ///////////////////////////////////////////////////////
    ////////////// Internal Wire Declarations /////////////
    ///////////////////////////////////////////////////////
    wire [ADDRESS_WIDTH:0]   rptr;
    wire [ADDRESS_WIDTH:0]   wptr;
    wire [ADDRESS_WIDTH-1:0] raddr;
    wire [ADDRESS_WIDTH-1:0] waddr;
    wire [ADDRESS_WIDTH:0]   wq2_rptr;
    wire [ADDRESS_WIDTH:0]   rq2_wptr;

    ///////////////////////////////////////////////////////
    //////////// Read Pointer to Write Clock Sync /////////
    ///////////////////////////////////////////////////////
    DF_SYNC #(
        .BUS_WIDTH(BUS_WIDTH)
    ) sync_r2w (
        .i_clk       (W_CLK),
        .i_rst_n     (W_RST),
        .i_async_data(rptr),
        .o_sync_data (wq2_rptr)
    );

    ///////////////////////////////////////////////////////
    /////////// Write Pointer to Read Clock Sync //////////
    ///////////////////////////////////////////////////////
    DF_SYNC #(
        .BUS_WIDTH(BUS_WIDTH)
    ) sync_w2r (
        .i_clk       (R_CLK),
        .i_rst_n     (R_RST),
        .i_async_data(wptr),
        .o_sync_data (rq2_wptr)
    );

    ///////////////////////////////////////////////////////
    ///////////////// FIFO Memory Control /////////////////
    ///////////////////////////////////////////////////////
    FIFO_MEM_CNTRL #(
        .ADDRESS_WIDTH(ADDRESS_WIDTH),
        .DATA_WIDTH   (DATA_WIDTH),
        .MEMORY_DEPTH (MEMORY_DEPTH)
    ) FIFO_Memory (
        .i_wclk  (W_CLK),
        .i_wrst_n(W_RST),
        .i_raddr (raddr),
        .i_waddr (waddr),
        .i_wdata (WR_DATA),
        .i_wen   (W_INC & ~FULL),
        .o_rdata (RD_DATA)
    );

    ///////////////////////////////////////////////////////
    /////////////////// FIFO Read Control /////////////////
    ///////////////////////////////////////////////////////
    FIFO_RD #(
        .ADDRESS_WIDTH(ADDRESS_WIDTH)
    ) U_FIFO_RD (
        .i_rclk     (R_CLK),
        .i_rrst_n   (R_RST),
        .o_raddr    (raddr),
        .o_rptr     (rptr),
        .i_rq2_wptr (rq2_wptr),
        .i_rinc     (R_INC),
        .o_rempty   (EMPTY)
    );

    ///////////////////////////////////////////////////////
    ////////////////// FIFO Write Control /////////////////
    ///////////////////////////////////////////////////////
    FIFO_WR #(
        .ADDRESS_WIDTH(ADDRESS_WIDTH)
    ) U_FIFO_WR (
        .i_wclk     (W_CLK),
        .i_wrst_n   (W_RST),
        .o_waddr    (waddr),
        .o_wptr     (wptr),
        .i_wq2_rptr (wq2_rptr),
        .i_winc     (W_INC),
        .o_wfull    (FULL)
    );

endmodule