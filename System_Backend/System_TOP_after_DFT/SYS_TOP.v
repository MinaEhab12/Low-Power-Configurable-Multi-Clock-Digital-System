
module SYS_TOP # ( parameter DATA_WIDTH = 8 ,  RF_ADDR = 4, NUM_OF_CHAINS = 4 )

(
 input   wire                          RST_N,
 input   wire                          UART_CLK,
 input   wire                          REF_CLK,
 input   wire                          UART_RX_IN,
 output  wire                          UART_TX_O,
 output  wire                          parity_error,
 output  wire                          framing_error,

 // DFT 
 input   wire  [NUM_OF_CHAINS-1:0]	    SI,
 input	 wire 							SE,
 input   wire						    test_mode,
 input   wire 							scan_clk,
 input   wire 							scan_rst,

 output  wire  [NUM_OF_CHAINS-1:0]      SO

);


wire                                   SYNC_UART_RST,
                                       SYNC_REF_RST;
									   
wire					               UART_TX_CLK;
wire					               UART_RX_CLK;


wire      [DATA_WIDTH-1:0]             Operand_A,
                                       Operand_B,
									   UART_Config,
									   DIV_RATIO;
									   
wire      [DATA_WIDTH-1:0]             DIV_RATIO_RX;
									   
wire      [DATA_WIDTH-1:0]             UART_RX_OUT;
wire         						   UART_RX_V_OUT;
wire      [DATA_WIDTH-1:0]			   UART_RX_SYNC;
wire                                   UART_RX_V_SYNC;

wire      [DATA_WIDTH-1:0]             UART_TX_IN;
wire        						   UART_TX_VLD;
wire      [DATA_WIDTH-1:0]             UART_TX_SYNC;
wire        						   UART_TX_V_SYNC;

wire                                   UART_TX_Busy;	
wire                                   UART_TX_Busy_PULSE;	
									   
wire                                   RF_WrEn;
wire                                   RF_RdEn;
wire      [RF_ADDR-1:0]                RF_Address;
wire      [DATA_WIDTH-1:0]             RF_WrData;
wire      [DATA_WIDTH-1:0]             RF_RdData;
wire                                   RF_RdData_VLD;									   

wire                                   CLKG_EN;
wire                                   ALU_EN;
wire      [3:0]                        ALU_FUN; 
wire      [DATA_WIDTH*2-1:0]           ALU_OUT;
wire                                   ALU_OUT_VLD; 
									   
wire                                   ALU_CLK ;								   

wire                                   FIFO_FULL ;

wire 								   clk_div_en;

wire 								   CLK_M, CLK_M_UART, CLK_M_TX, CLK_M_RX;
wire 								   RST_M_sync, RST_M_UART_unsync, RST_M_REF_unsync;


///********************************************************///
//////////////////// DFT MUXs /////////////////////
///********************************************************///

assign CLK_M                  = (test_mode) ? scan_clk : REF_CLK;
assign CLK_M_UART             = (test_mode) ? scan_clk : UART_CLK;

assign CLK_M_TX				  = (test_mode) ? scan_clk : UART_TX_CLK;
assign CLK_M_RX				  = (test_mode) ? scan_clk : UART_RX_CLK;

assign RST_M_sync             = (test_mode) ? scan_rst : RST_N;
assign RST_M_UART_unsync	  = (test_mode) ? scan_rst : SYNC_UART_RST;
assign RST_M_REF_unsync	      = (test_mode) ? scan_rst : SYNC_REF_RST;
								   
///********************************************************///
//////////////////// Reset synchronizers /////////////////////
///********************************************************///

RST_SYNC # (.NUM_STAGES(2)) U0_RST_SYNC (
.RST(RST_M_sync),
.CLK(CLK_M_UART),
.SYNC_RST(SYNC_UART_RST)
);

RST_SYNC # (.NUM_STAGES(2)) U1_RST_SYNC (
.RST(RST_M_sync),
.CLK(CLK_M),
.SYNC_RST(SYNC_REF_RST)
);

///********************************************************///
////////////////////// Data Synchronizer /////////////////////
///********************************************************///

DATA_SYNC # (.NUM_STAGES(2) , .BUS_WIDTH(8)) U0_ref_sync (
.CLK(CLK_M),
.RST(RST_M_REF_unsync),
.Unsync_Bus(UART_RX_OUT),
.Bus_Enable(UART_RX_V_OUT),
.Sync_Bus(UART_RX_SYNC),
.Enable_Pulse(UART_RX_V_SYNC)
);

///********************************************************///
///////////////////////// Async FIFO /////////////////////////
///********************************************************///

ASYNC_FIFO #(.DATA_WIDTH(DATA_WIDTH) ,.ADDRESS_WIDTH(3), .BUS_WIDTH(4)  , .MEMORY_DEPTH(8)) U0_UART_FIFO (
.W_CLK(CLK_M),
.W_RST(RST_M_REF_unsync),  
.W_INC(UART_TX_VLD),
.WR_DATA(UART_TX_IN),             
.R_CLK(CLK_M_TX),              
.R_RST(RST_M_UART_unsync),              
.R_INC(UART_TX_Busy_PULSE),              
.RD_DATA(UART_TX_SYNC),             
.FULL(FIFO_FULL),               
.EMPTY(UART_TX_V_SYNC)               
);

///********************************************************///
//////////////////////// Pulse Generator /////////////////////
///********************************************************///

PULSE_GEN U0_PULSE_GEN (
.clk(CLK_M_TX),
.rst_n(RST_M_UART_unsync),
.level_in(UART_TX_Busy),
.pulse_out(UART_TX_Busy_PULSE)
);

///********************************************************///
//////////// Clock Divider for UART_TX Clock /////////////////
///********************************************************///

CLK_DIV U0_ClkDiv (
.i_ref_clk(CLK_M_UART),             
.i_rst_n(RST_M_UART_unsync),                 
.i_clk_en(clk_div_en),               
.i_div_ratio(DIV_RATIO),           
.o_div_clk(UART_TX_CLK)             
);

///********************************************************///
/////////////////////// Custom Mux Clock /////////////////////
///********************************************************///

CLK_DIV_RX_MUX U0_CLKDIV_MUX (
.PreScale(UART_Config[7:2]),
.Div_Ratio(DIV_RATIO_RX)
);

///********************************************************///
//////////// Clock Divider for UART_RX Clock /////////////////
///********************************************************///

CLK_DIV U1_ClkDiv (
.i_ref_clk(CLK_M_UART),             
.i_rst_n(RST_M_UART_unsync),                 
.i_clk_en(clk_div_en),               
.i_div_ratio(DIV_RATIO_RX),           
.o_div_clk(UART_RX_CLK)             
);

///********************************************************///
/////////////////////////// UART /////////////////////////////
///********************************************************///

UART_TOP  U0_UART (
.RST(RST_M_UART_unsync),
.TX_CLK(CLK_M_TX),
.RX_CLK(CLK_M_RX),
.parity_enable(UART_Config[0]),
.parity_type(UART_Config[1]),
.Prescale(UART_Config[7:2]),
.RX_IN_S(UART_RX_IN),
.RX_OUT_P(UART_RX_OUT),                      
.RX_OUT_V(UART_RX_V_OUT),                      
.TX_IN_P(UART_TX_SYNC), 
.TX_IN_V(!UART_TX_V_SYNC), 
.TX_OUT_S(UART_TX_O),
.TX_OUT_V(UART_TX_Busy),
.parity_error(parity_error),
.framing_error(framing_error)                  
);

///********************************************************///
//////////////////// System Controller ///////////////////////
///********************************************************///

SYS_CTRL U0_SYS_CTRL (
.CLK(CLK_M),
.RST(RST_M_REF_unsync),
.RdData(RF_RdData),
.RdData_Valid(RF_RdData_VLD),
.WrEn(RF_WrEn),
.RdEn(RF_RdEn),
.Address(RF_Address),
.WrData(RF_WrData),
.ALU_EN(ALU_EN),
.ALU_FUN(ALU_FUN), 
.ALU_OUT(ALU_OUT),
.ALU_OUT_Valid(ALU_OUT_VLD),  
.CLK_Gate_EN(CLKG_EN),    
.FIFO_FULL(FIFO_FULL),
.RX_P_DATA(UART_RX_SYNC), 
.RX_D_VLD(UART_RX_V_SYNC),
.TX_P_DATA(UART_TX_IN), 
.TX_D_VLD(UART_TX_VLD),
.clk_div_en(clk_div_en)
);

///********************************************************///
/////////////////////// Register File ////////////////////////
///********************************************************///

REG_FILE U0_RegFile (
.CLK(CLK_M),
.RST(RST_M_REF_unsync),
.WrEn(RF_WrEn),
.RdEn(RF_RdEn),
.Address(RF_Address),
.WrData(RF_WrData),
.RdData(RF_RdData),
.RdData_Valid(RF_RdData_VLD),
.REG0(Operand_A),
.REG1(Operand_B),
.REG2(UART_Config),
.REG3(DIV_RATIO)
);

///********************************************************///
//////////////////////////// ALU /////////////////////////////
///********************************************************///
 
ALU #(.OPERAND_WIDTH(DATA_WIDTH)) U0_ALU (
.CLK(ALU_CLK),
.RST(RST_M_REF_unsync),  
.A(Operand_A), 
.B(Operand_B),
.EN(ALU_EN),
.ALU_FUN(ALU_FUN),
.ALU_OUT(ALU_OUT),
.OUT_VALID(ALU_OUT_VLD)
);

///********************************************************///
///////////////////////// Clock Gating ///////////////////////
///********************************************************///

CLK_GATE U0_CLK_GATE (
.CLK_EN(CLKG_EN),
.CLK(CLK_M),
.test_en(test_mode),
.GATED_CLK(ALU_CLK)
);

endmodule
 