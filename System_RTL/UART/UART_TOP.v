module UART_TOP #(
    parameter DATA_WIDTH = 8
)
(
 input   wire                          RST,
 input   wire                          TX_CLK,
 input   wire                          RX_CLK,
 input   wire                          RX_IN_S,
 output  wire   [DATA_WIDTH-1:0]       RX_OUT_P, 
 output  wire                          RX_OUT_V,
 input   wire   [DATA_WIDTH-1:0]       TX_IN_P, 
 input   wire                          TX_IN_V, 
 output  wire                          TX_OUT_S,
 output  wire                          TX_OUT_V,  
 input   wire   [5:0]                  Prescale, 
 input   wire                          parity_enable,
 input   wire                          parity_type,
 output  wire                          parity_error,
 output  wire                          framing_error
);

// Instantiate UART_TX
UART_TX #(
    .DATA_WIDTH(DATA_WIDTH)
) u_uart_tx (
    .clk(TX_CLK),
    .rst(RST),
    .p_data(TX_IN_P),
    .data_valid(TX_IN_V),
    .par_en(parity_enable),
    .par_typ(parity_type),
    .tx_out(TX_OUT_S),
    .busy(TX_OUT_V)
);

// Instantiate UART_RX
UART_RX #(
    .DATA_WIDTH(DATA_WIDTH)
) u_uart_rx (
    .CLK(RX_CLK),
    .RST(RST),
    .PRESCALAR(Prescale),
    .PAR_EN(parity_enable),
    .PAR_TYP(parity_type),
    .RX_IN(RX_IN_S),
    .P_DATA(RX_OUT_P),
    .Parity_Error(parity_error),
    .Stop_Error(framing_error),
    .Data_Valid(RX_OUT_V)
);

endmodule