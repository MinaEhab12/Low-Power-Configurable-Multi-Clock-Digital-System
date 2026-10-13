module UART_RX # (parameter DATA_WIDTH = 8)
(
	input wire CLK,
	input wire RST,
	input wire [5:0] PRESCALAR,
	input wire PAR_EN,
	input wire PAR_TYP,
	input wire RX_IN,
	output wire [DATA_WIDTH-1:0] P_DATA,
	output wire Parity_Error,
	output wire Stop_Error,
	output wire Data_Valid
);

// Internal Signals
wire deser_en, data_samp_en, edge_bit_cnt_en;
wire par_chk_en, stop_chk_en, start_chk_en;
wire sampled_bit;
wire [5:0] edge_cnt;
wire [3:0] bit_cnt;
wire start_glitch;

Deserializer  #(.DATA_WIDTH(DATA_WIDTH)) U_Deserializer (
.deser_enable   (deser_en),
.serial_in_bit(sampled_bit),
.clk        (CLK),
.rst        (RST),
.parallel_data     (P_DATA)
);

Data_Sampling U_Data_Sampling (
.sampled_bit (sampled_bit),
.clk         (CLK),
.rst         (RST),
.edge_counter    (edge_cnt),
.samp_enable     (data_samp_en),
.rx_serial_in       (RX_IN),
.prescaler   (PRESCALAR)
);

Edge_Bit_Counter U_Edge_Bit_Counter (
.clk            (CLK),
.rst            (RST),
.edge_index       (edge_cnt),
.prescaler      (PRESCALAR),
.bit_index        (bit_cnt),
.edge_cnt_enable(edge_bit_cnt_en)
);

UART_RX_FSM U_FSM (
.clk            (CLK),
.rst            (RST),
.edge_index       (edge_cnt),
.bit_index        (bit_cnt),
.deser_enable       (deser_en),
.samp_enable   (data_samp_en),
.edge_cnt_enable(edge_bit_cnt_en),
.rx_serial_in          (RX_IN),
.prescaler      (PRESCALAR),
.parity_chk_enable     (par_chk_en),
.stop_chk_enable    (stop_chk_en),
.start_chk_enable   (start_chk_en),
.start_glitch_err   (start_glitch),
.parity_enable         (PAR_EN),
.parity_error        (Parity_Error),
.stop_error       (Stop_Error),
.data_valid     (Data_Valid)
);

UART_RX_Parity_Check U_Par_Check (
.clk        (CLK),
.rst        (RST),
.parallel_data     (P_DATA),
.parity_bit_rx(sampled_bit),
.parity_chk_enable (par_chk_en),
.parity_error    (Parity_Error),
.parity_type    (PAR_TYP)
);

UART_RX_Start_Check U_Start_Check (
.clk         (CLK),
.rst         (RST),
.start_bit_sampled (sampled_bit),
.start_chk_enable(start_chk_en),
.start_glitch_err(start_glitch)
);

UART_RX_Stop_Check U_Stop_Check (
.clk        (CLK),
.rst        (RST),
.stop_bit_sampled(sampled_bit),
.stop_chk_enable(stop_chk_en),
.stop_error   (Stop_Error)
);

endmodule
