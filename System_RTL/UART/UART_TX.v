module UART_TX # (parameter DATA_WIDTH = 8)(
    input  wire                               clk,
    input  wire                               rst,
    input  wire [DATA_WIDTH - 1:0]            p_data,
    input  wire                               data_valid,
    input  wire                               par_en,
    input  wire                               par_typ,
    output wire                               tx_out,
    output wire                               busy
);

// Internal connections
wire        ser_done;
wire        ser_en;
wire        ser_data;
wire        par_bit;
wire [1:0]  mux_sel;

// Serializer Instance
Serializer  #(.DATA_WIDTH(DATA_WIDTH)) DUT_Serializer(
    .CLK        (clk),
    .RST        (rst),
    .Busy       (busy),
    .P_DATA     (p_data),
    .Data_Valid (data_valid),
    .Ser_En     (ser_en),
    .Ser_Data   (ser_data),
    .Ser_Done   (ser_done)
);

// FSM Instance
FSM DUT_FSM (
    .CLK        (clk),
    .RST        (rst),
    .Ser_En     (ser_en),
    .Ser_Done   (ser_done),
    .Data_Valid (data_valid),
    .PAR_EN     (par_en),
    .MUX_Sel    (mux_sel),
    .Busy       (busy)
);  

// Parity Calculator Instance
Parity_Calc DUT_Parity_Calc (
    .CLK        (clk),
    .RST        (rst),
    .Data_Valid (data_valid),
    .Busy       (busy),
    .P_DATA     (p_data),
    .PAR_TYP    (par_typ),
    .par_bit    (par_bit)
);

// MUX Instance
MUX DUT_MUX (
    .CLK        (clk),
    .RST        (rst),
    .mux_sel    (mux_sel),
    .par_bit    (par_bit),
    .ser_data   (ser_data),
    .start_bit  (1'b0),
    .stop_bit   (1'b1),
    .TX_OUT     (tx_out)
);

endmodule
