/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Sun Sep 28 22:28:19 2025
/////////////////////////////////////////////////////////////


module RST_SYNC_NUM_STAGES2_0 ( CLK, RST, SYNC_RST );
  input CLK, RST;
  output SYNC_RST;
  wire   \sync_reg[0] ;

  DFFRQX2M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .CK(CLK), .RN(RST), .Q(
        SYNC_RST) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\sync_reg[0] )
         );
endmodule


module RST_SYNC_NUM_STAGES2_1 ( CLK, RST, SYNC_RST );
  input CLK, RST;
  output SYNC_RST;
  wire   \sync_reg[0] ;

  DFFRQX2M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .CK(CLK), .RN(RST), .Q(
        SYNC_RST) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\sync_reg[0] )
         );
endmodule


module DATA_SYNC_BUS_WIDTH8_NUM_STAGES2 ( CLK, RST, Bus_Enable, Unsync_Bus, 
        Sync_Bus, Enable_Pulse );
  input [7:0] Unsync_Bus;
  output [7:0] Sync_Bus;
  input CLK, RST, Bus_Enable;
  output Enable_Pulse;
  wire   enable_sync_dly, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [1:0] Multi_FF_bus_en;

  DFFRQX2M enable_sync_dly_reg ( .D(Multi_FF_bus_en[1]), .CK(CLK), .RN(RST), 
        .Q(enable_sync_dly) );
  DFFRQX2M \Multi_FF_bus_en_reg[1]  ( .D(Multi_FF_bus_en[0]), .CK(CLK), .RN(
        RST), .Q(Multi_FF_bus_en[1]) );
  DFFRQX2M \Sync_Bus_reg[7]  ( .D(n2), .CK(CLK), .RN(RST), .Q(Sync_Bus[7]) );
  DFFRQX2M \Sync_Bus_reg[4]  ( .D(n5), .CK(CLK), .RN(RST), .Q(Sync_Bus[4]) );
  DFFRQX2M \Sync_Bus_reg[6]  ( .D(n3), .CK(CLK), .RN(RST), .Q(Sync_Bus[6]) );
  DFFRQX2M \Sync_Bus_reg[5]  ( .D(n4), .CK(CLK), .RN(RST), .Q(Sync_Bus[5]) );
  DFFRQX2M \Sync_Bus_reg[0]  ( .D(n9), .CK(CLK), .RN(RST), .Q(Sync_Bus[0]) );
  DFFRQX2M \Sync_Bus_reg[3]  ( .D(n6), .CK(CLK), .RN(RST), .Q(Sync_Bus[3]) );
  DFFRQX2M \Sync_Bus_reg[2]  ( .D(n7), .CK(CLK), .RN(RST), .Q(Sync_Bus[2]) );
  DFFRQX2M \Sync_Bus_reg[1]  ( .D(n8), .CK(CLK), .RN(RST), .Q(Sync_Bus[1]) );
  DFFRQX2M Enable_Pulse_reg ( .D(n10), .CK(CLK), .RN(RST), .Q(Enable_Pulse) );
  DFFRQX2M \Multi_FF_bus_en_reg[0]  ( .D(Bus_Enable), .CK(CLK), .RN(RST), .Q(
        Multi_FF_bus_en[0]) );
  INVX2M U3 ( .A(n1), .Y(n10) );
  NAND2BX2M U4 ( .AN(enable_sync_dly), .B(Multi_FF_bus_en[1]), .Y(n1) );
  AO22X1M U5 ( .A0(Unsync_Bus[7]), .A1(n10), .B0(Sync_Bus[7]), .B1(n1), .Y(n2)
         );
  AO22X1M U6 ( .A0(Unsync_Bus[6]), .A1(n10), .B0(Sync_Bus[6]), .B1(n1), .Y(n3)
         );
  AO22X1M U7 ( .A0(Unsync_Bus[5]), .A1(n10), .B0(Sync_Bus[5]), .B1(n1), .Y(n4)
         );
  AO22X1M U8 ( .A0(Unsync_Bus[4]), .A1(n10), .B0(Sync_Bus[4]), .B1(n1), .Y(n5)
         );
  AO22X1M U9 ( .A0(Unsync_Bus[3]), .A1(n10), .B0(Sync_Bus[3]), .B1(n1), .Y(n6)
         );
  AO22X1M U10 ( .A0(Unsync_Bus[2]), .A1(n10), .B0(Sync_Bus[2]), .B1(n1), .Y(n7) );
  AO22X1M U11 ( .A0(Unsync_Bus[1]), .A1(n10), .B0(Sync_Bus[1]), .B1(n1), .Y(n8) );
  AO22X1M U12 ( .A0(Unsync_Bus[0]), .A1(n10), .B0(Sync_Bus[0]), .B1(n1), .Y(n9) );
endmodule


module DF_SYNC_BUS_WIDTH4_0 ( i_clk, i_rst_n, i_async_data, o_sync_data );
  input [3:0] i_async_data;
  output [3:0] o_sync_data;
  input i_clk, i_rst_n;

  wire   [3:0] sync_stage1;

  DFFRQX2M \sync_stage2_reg[1]  ( .D(sync_stage1[1]), .CK(i_clk), .RN(i_rst_n), 
        .Q(o_sync_data[1]) );
  DFFRQX2M \sync_stage2_reg[0]  ( .D(sync_stage1[0]), .CK(i_clk), .RN(i_rst_n), 
        .Q(o_sync_data[0]) );
  DFFRQX2M \sync_stage2_reg[3]  ( .D(sync_stage1[3]), .CK(i_clk), .RN(i_rst_n), 
        .Q(o_sync_data[3]) );
  DFFRQX2M \sync_stage2_reg[2]  ( .D(sync_stage1[2]), .CK(i_clk), .RN(i_rst_n), 
        .Q(o_sync_data[2]) );
  DFFRQX2M \sync_stage1_reg[3]  ( .D(i_async_data[3]), .CK(i_clk), .RN(i_rst_n), .Q(sync_stage1[3]) );
  DFFRQX2M \sync_stage1_reg[2]  ( .D(i_async_data[2]), .CK(i_clk), .RN(i_rst_n), .Q(sync_stage1[2]) );
  DFFRQX2M \sync_stage1_reg[1]  ( .D(i_async_data[1]), .CK(i_clk), .RN(i_rst_n), .Q(sync_stage1[1]) );
  DFFRQX2M \sync_stage1_reg[0]  ( .D(i_async_data[0]), .CK(i_clk), .RN(i_rst_n), .Q(sync_stage1[0]) );
endmodule


module DF_SYNC_BUS_WIDTH4_1 ( i_clk, i_rst_n, i_async_data, o_sync_data );
  input [3:0] i_async_data;
  output [3:0] o_sync_data;
  input i_clk, i_rst_n;

  wire   [3:0] sync_stage1;

  DFFRQX2M \sync_stage2_reg[3]  ( .D(sync_stage1[3]), .CK(i_clk), .RN(i_rst_n), 
        .Q(o_sync_data[3]) );
  DFFRQX2M \sync_stage2_reg[2]  ( .D(sync_stage1[2]), .CK(i_clk), .RN(i_rst_n), 
        .Q(o_sync_data[2]) );
  DFFRQX2M \sync_stage2_reg[1]  ( .D(sync_stage1[1]), .CK(i_clk), .RN(i_rst_n), 
        .Q(o_sync_data[1]) );
  DFFRQX2M \sync_stage2_reg[0]  ( .D(sync_stage1[0]), .CK(i_clk), .RN(i_rst_n), 
        .Q(o_sync_data[0]) );
  DFFRQX2M \sync_stage1_reg[3]  ( .D(i_async_data[3]), .CK(i_clk), .RN(i_rst_n), .Q(sync_stage1[3]) );
  DFFRQX2M \sync_stage1_reg[2]  ( .D(i_async_data[2]), .CK(i_clk), .RN(i_rst_n), .Q(sync_stage1[2]) );
  DFFRQX2M \sync_stage1_reg[1]  ( .D(i_async_data[1]), .CK(i_clk), .RN(i_rst_n), .Q(sync_stage1[1]) );
  DFFRQX2M \sync_stage1_reg[0]  ( .D(i_async_data[0]), .CK(i_clk), .RN(i_rst_n), .Q(sync_stage1[0]) );
endmodule


module FIFO_MEM_CNTRL_ADDRESS_WIDTH3_MEMORY_DEPTH8_DATA_WIDTH8 ( i_wclk, 
        i_wrst_n, i_wen, i_wdata, i_waddr, i_raddr, o_rdata );
  input [7:0] i_wdata;
  input [2:0] i_waddr;
  input [2:0] i_raddr;
  output [7:0] o_rdata;
  input i_wclk, i_wrst_n, i_wen;
  wire   N10, N11, N12, \memory[7][7] , \memory[7][6] , \memory[7][5] ,
         \memory[7][4] , \memory[7][3] , \memory[7][2] , \memory[7][1] ,
         \memory[7][0] , \memory[6][7] , \memory[6][6] , \memory[6][5] ,
         \memory[6][4] , \memory[6][3] , \memory[6][2] , \memory[6][1] ,
         \memory[6][0] , \memory[5][7] , \memory[5][6] , \memory[5][5] ,
         \memory[5][4] , \memory[5][3] , \memory[5][2] , \memory[5][1] ,
         \memory[5][0] , \memory[4][7] , \memory[4][6] , \memory[4][5] ,
         \memory[4][4] , \memory[4][3] , \memory[4][2] , \memory[4][1] ,
         \memory[4][0] , \memory[3][7] , \memory[3][6] , \memory[3][5] ,
         \memory[3][4] , \memory[3][3] , \memory[3][2] , \memory[3][1] ,
         \memory[3][0] , \memory[2][7] , \memory[2][6] , \memory[2][5] ,
         \memory[2][4] , \memory[2][3] , \memory[2][2] , \memory[2][1] ,
         \memory[2][0] , \memory[1][7] , \memory[1][6] , \memory[1][5] ,
         \memory[1][4] , \memory[1][3] , \memory[1][2] , \memory[1][1] ,
         \memory[1][0] , \memory[0][7] , \memory[0][6] , \memory[0][5] ,
         \memory[0][4] , \memory[0][3] , \memory[0][2] , \memory[0][1] ,
         \memory[0][0] , n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113;
  assign N10 = i_raddr[0];
  assign N11 = i_raddr[1];
  assign N12 = i_raddr[2];

  DFFRQX2M \memory_reg[5][7]  ( .D(n68), .CK(i_wclk), .RN(n100), .Q(
        \memory[5][7] ) );
  DFFRQX2M \memory_reg[5][6]  ( .D(n67), .CK(i_wclk), .RN(n100), .Q(
        \memory[5][6] ) );
  DFFRQX2M \memory_reg[5][5]  ( .D(n66), .CK(i_wclk), .RN(n100), .Q(
        \memory[5][5] ) );
  DFFRQX2M \memory_reg[5][4]  ( .D(n65), .CK(i_wclk), .RN(n100), .Q(
        \memory[5][4] ) );
  DFFRQX2M \memory_reg[5][3]  ( .D(n64), .CK(i_wclk), .RN(n100), .Q(
        \memory[5][3] ) );
  DFFRQX2M \memory_reg[5][2]  ( .D(n63), .CK(i_wclk), .RN(n100), .Q(
        \memory[5][2] ) );
  DFFRQX2M \memory_reg[5][1]  ( .D(n62), .CK(i_wclk), .RN(n100), .Q(
        \memory[5][1] ) );
  DFFRQX2M \memory_reg[5][0]  ( .D(n61), .CK(i_wclk), .RN(n100), .Q(
        \memory[5][0] ) );
  DFFRQX2M \memory_reg[1][7]  ( .D(n36), .CK(i_wclk), .RN(n102), .Q(
        \memory[1][7] ) );
  DFFRQX2M \memory_reg[1][6]  ( .D(n35), .CK(i_wclk), .RN(n102), .Q(
        \memory[1][6] ) );
  DFFRQX2M \memory_reg[1][5]  ( .D(n34), .CK(i_wclk), .RN(n102), .Q(
        \memory[1][5] ) );
  DFFRQX2M \memory_reg[1][4]  ( .D(n33), .CK(i_wclk), .RN(n102), .Q(
        \memory[1][4] ) );
  DFFRQX2M \memory_reg[1][3]  ( .D(n32), .CK(i_wclk), .RN(n103), .Q(
        \memory[1][3] ) );
  DFFRQX2M \memory_reg[1][2]  ( .D(n31), .CK(i_wclk), .RN(n103), .Q(
        \memory[1][2] ) );
  DFFRQX2M \memory_reg[1][1]  ( .D(n30), .CK(i_wclk), .RN(n103), .Q(
        \memory[1][1] ) );
  DFFRQX2M \memory_reg[1][0]  ( .D(n29), .CK(i_wclk), .RN(n103), .Q(
        \memory[1][0] ) );
  DFFRQX2M \memory_reg[7][7]  ( .D(n84), .CK(i_wclk), .RN(n99), .Q(
        \memory[7][7] ) );
  DFFRQX2M \memory_reg[7][6]  ( .D(n83), .CK(i_wclk), .RN(n99), .Q(
        \memory[7][6] ) );
  DFFRQX2M \memory_reg[7][5]  ( .D(n82), .CK(i_wclk), .RN(n99), .Q(
        \memory[7][5] ) );
  DFFRQX2M \memory_reg[7][4]  ( .D(n81), .CK(i_wclk), .RN(n99), .Q(
        \memory[7][4] ) );
  DFFRQX2M \memory_reg[7][3]  ( .D(n80), .CK(i_wclk), .RN(n99), .Q(
        \memory[7][3] ) );
  DFFRQX2M \memory_reg[7][2]  ( .D(n79), .CK(i_wclk), .RN(n99), .Q(
        \memory[7][2] ) );
  DFFRQX2M \memory_reg[7][1]  ( .D(n78), .CK(i_wclk), .RN(n99), .Q(
        \memory[7][1] ) );
  DFFRQX2M \memory_reg[7][0]  ( .D(n77), .CK(i_wclk), .RN(n99), .Q(
        \memory[7][0] ) );
  DFFRQX2M \memory_reg[3][7]  ( .D(n52), .CK(i_wclk), .RN(n101), .Q(
        \memory[3][7] ) );
  DFFRQX2M \memory_reg[3][6]  ( .D(n51), .CK(i_wclk), .RN(n101), .Q(
        \memory[3][6] ) );
  DFFRQX2M \memory_reg[3][5]  ( .D(n50), .CK(i_wclk), .RN(n101), .Q(
        \memory[3][5] ) );
  DFFRQX2M \memory_reg[3][4]  ( .D(n49), .CK(i_wclk), .RN(n101), .Q(
        \memory[3][4] ) );
  DFFRQX2M \memory_reg[3][3]  ( .D(n48), .CK(i_wclk), .RN(n101), .Q(
        \memory[3][3] ) );
  DFFRQX2M \memory_reg[3][2]  ( .D(n47), .CK(i_wclk), .RN(n101), .Q(
        \memory[3][2] ) );
  DFFRQX2M \memory_reg[3][1]  ( .D(n46), .CK(i_wclk), .RN(n101), .Q(
        \memory[3][1] ) );
  DFFRQX2M \memory_reg[3][0]  ( .D(n45), .CK(i_wclk), .RN(n102), .Q(
        \memory[3][0] ) );
  DFFRQX2M \memory_reg[6][7]  ( .D(n76), .CK(i_wclk), .RN(n99), .Q(
        \memory[6][7] ) );
  DFFRQX2M \memory_reg[6][6]  ( .D(n75), .CK(i_wclk), .RN(n99), .Q(
        \memory[6][6] ) );
  DFFRQX2M \memory_reg[6][5]  ( .D(n74), .CK(i_wclk), .RN(n99), .Q(
        \memory[6][5] ) );
  DFFRQX2M \memory_reg[6][4]  ( .D(n73), .CK(i_wclk), .RN(n99), .Q(
        \memory[6][4] ) );
  DFFRQX2M \memory_reg[6][3]  ( .D(n72), .CK(i_wclk), .RN(n99), .Q(
        \memory[6][3] ) );
  DFFRQX2M \memory_reg[6][2]  ( .D(n71), .CK(i_wclk), .RN(n100), .Q(
        \memory[6][2] ) );
  DFFRQX2M \memory_reg[6][1]  ( .D(n70), .CK(i_wclk), .RN(n100), .Q(
        \memory[6][1] ) );
  DFFRQX2M \memory_reg[6][0]  ( .D(n69), .CK(i_wclk), .RN(n100), .Q(
        \memory[6][0] ) );
  DFFRQX2M \memory_reg[2][7]  ( .D(n44), .CK(i_wclk), .RN(n102), .Q(
        \memory[2][7] ) );
  DFFRQX2M \memory_reg[2][6]  ( .D(n43), .CK(i_wclk), .RN(n102), .Q(
        \memory[2][6] ) );
  DFFRQX2M \memory_reg[2][5]  ( .D(n42), .CK(i_wclk), .RN(n102), .Q(
        \memory[2][5] ) );
  DFFRQX2M \memory_reg[2][4]  ( .D(n41), .CK(i_wclk), .RN(n102), .Q(
        \memory[2][4] ) );
  DFFRQX2M \memory_reg[2][3]  ( .D(n40), .CK(i_wclk), .RN(n102), .Q(
        \memory[2][3] ) );
  DFFRQX2M \memory_reg[2][2]  ( .D(n39), .CK(i_wclk), .RN(n102), .Q(
        \memory[2][2] ) );
  DFFRQX2M \memory_reg[2][1]  ( .D(n38), .CK(i_wclk), .RN(n102), .Q(
        \memory[2][1] ) );
  DFFRQX2M \memory_reg[2][0]  ( .D(n37), .CK(i_wclk), .RN(n102), .Q(
        \memory[2][0] ) );
  DFFRQX2M \memory_reg[4][7]  ( .D(n60), .CK(i_wclk), .RN(n100), .Q(
        \memory[4][7] ) );
  DFFRQX2M \memory_reg[4][6]  ( .D(n59), .CK(i_wclk), .RN(n100), .Q(
        \memory[4][6] ) );
  DFFRQX2M \memory_reg[4][5]  ( .D(n58), .CK(i_wclk), .RN(n101), .Q(
        \memory[4][5] ) );
  DFFRQX2M \memory_reg[4][4]  ( .D(n57), .CK(i_wclk), .RN(n101), .Q(
        \memory[4][4] ) );
  DFFRQX2M \memory_reg[4][3]  ( .D(n56), .CK(i_wclk), .RN(n101), .Q(
        \memory[4][3] ) );
  DFFRQX2M \memory_reg[4][2]  ( .D(n55), .CK(i_wclk), .RN(n101), .Q(
        \memory[4][2] ) );
  DFFRQX2M \memory_reg[4][1]  ( .D(n54), .CK(i_wclk), .RN(n101), .Q(
        \memory[4][1] ) );
  DFFRQX2M \memory_reg[4][0]  ( .D(n53), .CK(i_wclk), .RN(n101), .Q(
        \memory[4][0] ) );
  DFFRQX2M \memory_reg[0][7]  ( .D(n28), .CK(i_wclk), .RN(n103), .Q(
        \memory[0][7] ) );
  DFFRQX2M \memory_reg[0][6]  ( .D(n27), .CK(i_wclk), .RN(n103), .Q(
        \memory[0][6] ) );
  DFFRQX2M \memory_reg[0][5]  ( .D(n26), .CK(i_wclk), .RN(n103), .Q(
        \memory[0][5] ) );
  DFFRQX2M \memory_reg[0][4]  ( .D(n25), .CK(i_wclk), .RN(n103), .Q(
        \memory[0][4] ) );
  DFFRQX2M \memory_reg[0][3]  ( .D(n24), .CK(i_wclk), .RN(n103), .Q(
        \memory[0][3] ) );
  DFFRQX2M \memory_reg[0][2]  ( .D(n23), .CK(i_wclk), .RN(n103), .Q(
        \memory[0][2] ) );
  DFFRQX2M \memory_reg[0][1]  ( .D(n22), .CK(i_wclk), .RN(n103), .Q(
        \memory[0][1] ) );
  DFFRQX2M \memory_reg[0][0]  ( .D(n21), .CK(i_wclk), .RN(n103), .Q(
        \memory[0][0] ) );
  BUFX2M U2 ( .A(n14), .Y(n96) );
  BUFX2M U3 ( .A(n18), .Y(n95) );
  BUFX2M U4 ( .A(n19), .Y(n94) );
  BUFX2M U5 ( .A(n20), .Y(n93) );
  BUFX2M U6 ( .A(n97), .Y(n101) );
  BUFX2M U7 ( .A(n97), .Y(n100) );
  BUFX2M U8 ( .A(n97), .Y(n99) );
  BUFX2M U9 ( .A(n98), .Y(n102) );
  BUFX2M U10 ( .A(n98), .Y(n103) );
  BUFX2M U11 ( .A(i_wrst_n), .Y(n97) );
  BUFX2M U12 ( .A(i_wrst_n), .Y(n98) );
  NAND3X2M U13 ( .A(n104), .B(n113), .C(n12), .Y(n11) );
  NAND3X2M U14 ( .A(n104), .B(n113), .C(n17), .Y(n16) );
  NAND3X2M U15 ( .A(i_waddr[0]), .B(n12), .C(i_waddr[1]), .Y(n15) );
  NAND3X2M U16 ( .A(n12), .B(n113), .C(i_waddr[0]), .Y(n13) );
  NOR2BX2M U17 ( .AN(i_wen), .B(i_waddr[2]), .Y(n12) );
  OAI2BB2X1M U18 ( .B0(n11), .B1(n105), .A0N(\memory[0][0] ), .A1N(n11), .Y(
        n21) );
  OAI2BB2X1M U19 ( .B0(n11), .B1(n106), .A0N(\memory[0][1] ), .A1N(n11), .Y(
        n22) );
  OAI2BB2X1M U20 ( .B0(n11), .B1(n107), .A0N(\memory[0][2] ), .A1N(n11), .Y(
        n23) );
  OAI2BB2X1M U21 ( .B0(n11), .B1(n108), .A0N(\memory[0][3] ), .A1N(n11), .Y(
        n24) );
  OAI2BB2X1M U22 ( .B0(n11), .B1(n109), .A0N(\memory[0][4] ), .A1N(n11), .Y(
        n25) );
  OAI2BB2X1M U23 ( .B0(n11), .B1(n110), .A0N(\memory[0][5] ), .A1N(n11), .Y(
        n26) );
  OAI2BB2X1M U24 ( .B0(n11), .B1(n111), .A0N(\memory[0][6] ), .A1N(n11), .Y(
        n27) );
  OAI2BB2X1M U25 ( .B0(n11), .B1(n112), .A0N(\memory[0][7] ), .A1N(n11), .Y(
        n28) );
  OAI2BB2X1M U26 ( .B0(n105), .B1(n15), .A0N(\memory[3][0] ), .A1N(n15), .Y(
        n45) );
  OAI2BB2X1M U27 ( .B0(n106), .B1(n15), .A0N(\memory[3][1] ), .A1N(n15), .Y(
        n46) );
  OAI2BB2X1M U28 ( .B0(n107), .B1(n15), .A0N(\memory[3][2] ), .A1N(n15), .Y(
        n47) );
  OAI2BB2X1M U29 ( .B0(n108), .B1(n15), .A0N(\memory[3][3] ), .A1N(n15), .Y(
        n48) );
  OAI2BB2X1M U30 ( .B0(n109), .B1(n15), .A0N(\memory[3][4] ), .A1N(n15), .Y(
        n49) );
  OAI2BB2X1M U31 ( .B0(n110), .B1(n15), .A0N(\memory[3][5] ), .A1N(n15), .Y(
        n50) );
  OAI2BB2X1M U32 ( .B0(n111), .B1(n15), .A0N(\memory[3][6] ), .A1N(n15), .Y(
        n51) );
  OAI2BB2X1M U33 ( .B0(n112), .B1(n15), .A0N(\memory[3][7] ), .A1N(n15), .Y(
        n52) );
  OAI2BB2X1M U34 ( .B0(n105), .B1(n13), .A0N(\memory[1][0] ), .A1N(n13), .Y(
        n29) );
  OAI2BB2X1M U35 ( .B0(n106), .B1(n13), .A0N(\memory[1][1] ), .A1N(n13), .Y(
        n30) );
  OAI2BB2X1M U36 ( .B0(n107), .B1(n13), .A0N(\memory[1][2] ), .A1N(n13), .Y(
        n31) );
  OAI2BB2X1M U37 ( .B0(n108), .B1(n13), .A0N(\memory[1][3] ), .A1N(n13), .Y(
        n32) );
  OAI2BB2X1M U38 ( .B0(n109), .B1(n13), .A0N(\memory[1][4] ), .A1N(n13), .Y(
        n33) );
  OAI2BB2X1M U39 ( .B0(n110), .B1(n13), .A0N(\memory[1][5] ), .A1N(n13), .Y(
        n34) );
  OAI2BB2X1M U40 ( .B0(n111), .B1(n13), .A0N(\memory[1][6] ), .A1N(n13), .Y(
        n35) );
  OAI2BB2X1M U41 ( .B0(n112), .B1(n13), .A0N(\memory[1][7] ), .A1N(n13), .Y(
        n36) );
  INVX2M U42 ( .A(i_wdata[0]), .Y(n105) );
  INVX2M U43 ( .A(i_wdata[1]), .Y(n106) );
  INVX2M U44 ( .A(i_wdata[2]), .Y(n107) );
  INVX2M U45 ( .A(i_wdata[3]), .Y(n108) );
  INVX2M U46 ( .A(i_wdata[4]), .Y(n109) );
  INVX2M U47 ( .A(i_wdata[5]), .Y(n110) );
  INVX2M U48 ( .A(i_wdata[6]), .Y(n111) );
  INVX2M U49 ( .A(i_wdata[7]), .Y(n112) );
  OAI2BB2X1M U50 ( .B0(n105), .B1(n16), .A0N(\memory[4][0] ), .A1N(n16), .Y(
        n53) );
  OAI2BB2X1M U51 ( .B0(n106), .B1(n16), .A0N(\memory[4][1] ), .A1N(n16), .Y(
        n54) );
  OAI2BB2X1M U52 ( .B0(n107), .B1(n16), .A0N(\memory[4][2] ), .A1N(n16), .Y(
        n55) );
  OAI2BB2X1M U53 ( .B0(n108), .B1(n16), .A0N(\memory[4][3] ), .A1N(n16), .Y(
        n56) );
  OAI2BB2X1M U54 ( .B0(n109), .B1(n16), .A0N(\memory[4][4] ), .A1N(n16), .Y(
        n57) );
  OAI2BB2X1M U55 ( .B0(n110), .B1(n16), .A0N(\memory[4][5] ), .A1N(n16), .Y(
        n58) );
  OAI2BB2X1M U56 ( .B0(n111), .B1(n16), .A0N(\memory[4][6] ), .A1N(n16), .Y(
        n59) );
  OAI2BB2X1M U57 ( .B0(n112), .B1(n16), .A0N(\memory[4][7] ), .A1N(n16), .Y(
        n60) );
  OAI2BB2X1M U58 ( .B0(n105), .B1(n96), .A0N(\memory[2][0] ), .A1N(n96), .Y(
        n37) );
  OAI2BB2X1M U59 ( .B0(n106), .B1(n96), .A0N(\memory[2][1] ), .A1N(n96), .Y(
        n38) );
  OAI2BB2X1M U60 ( .B0(n107), .B1(n96), .A0N(\memory[2][2] ), .A1N(n96), .Y(
        n39) );
  OAI2BB2X1M U61 ( .B0(n108), .B1(n96), .A0N(\memory[2][3] ), .A1N(n96), .Y(
        n40) );
  OAI2BB2X1M U62 ( .B0(n109), .B1(n96), .A0N(\memory[2][4] ), .A1N(n96), .Y(
        n41) );
  OAI2BB2X1M U63 ( .B0(n110), .B1(n96), .A0N(\memory[2][5] ), .A1N(n96), .Y(
        n42) );
  OAI2BB2X1M U64 ( .B0(n111), .B1(n96), .A0N(\memory[2][6] ), .A1N(n96), .Y(
        n43) );
  OAI2BB2X1M U65 ( .B0(n112), .B1(n96), .A0N(\memory[2][7] ), .A1N(n96), .Y(
        n44) );
  OAI2BB2X1M U66 ( .B0(n105), .B1(n95), .A0N(\memory[5][0] ), .A1N(n95), .Y(
        n61) );
  OAI2BB2X1M U67 ( .B0(n106), .B1(n95), .A0N(\memory[5][1] ), .A1N(n95), .Y(
        n62) );
  OAI2BB2X1M U68 ( .B0(n107), .B1(n95), .A0N(\memory[5][2] ), .A1N(n95), .Y(
        n63) );
  OAI2BB2X1M U69 ( .B0(n108), .B1(n95), .A0N(\memory[5][3] ), .A1N(n95), .Y(
        n64) );
  OAI2BB2X1M U70 ( .B0(n109), .B1(n95), .A0N(\memory[5][4] ), .A1N(n95), .Y(
        n65) );
  OAI2BB2X1M U71 ( .B0(n110), .B1(n95), .A0N(\memory[5][5] ), .A1N(n95), .Y(
        n66) );
  OAI2BB2X1M U72 ( .B0(n111), .B1(n95), .A0N(\memory[5][6] ), .A1N(n95), .Y(
        n67) );
  OAI2BB2X1M U73 ( .B0(n112), .B1(n95), .A0N(\memory[5][7] ), .A1N(n95), .Y(
        n68) );
  OAI2BB2X1M U74 ( .B0(n105), .B1(n94), .A0N(\memory[6][0] ), .A1N(n94), .Y(
        n69) );
  OAI2BB2X1M U75 ( .B0(n106), .B1(n94), .A0N(\memory[6][1] ), .A1N(n94), .Y(
        n70) );
  OAI2BB2X1M U76 ( .B0(n107), .B1(n94), .A0N(\memory[6][2] ), .A1N(n94), .Y(
        n71) );
  OAI2BB2X1M U77 ( .B0(n108), .B1(n94), .A0N(\memory[6][3] ), .A1N(n94), .Y(
        n72) );
  OAI2BB2X1M U78 ( .B0(n109), .B1(n94), .A0N(\memory[6][4] ), .A1N(n94), .Y(
        n73) );
  OAI2BB2X1M U79 ( .B0(n110), .B1(n94), .A0N(\memory[6][5] ), .A1N(n94), .Y(
        n74) );
  OAI2BB2X1M U80 ( .B0(n111), .B1(n94), .A0N(\memory[6][6] ), .A1N(n94), .Y(
        n75) );
  OAI2BB2X1M U81 ( .B0(n112), .B1(n94), .A0N(\memory[6][7] ), .A1N(n94), .Y(
        n76) );
  OAI2BB2X1M U82 ( .B0(n105), .B1(n93), .A0N(\memory[7][0] ), .A1N(n93), .Y(
        n77) );
  OAI2BB2X1M U83 ( .B0(n106), .B1(n93), .A0N(\memory[7][1] ), .A1N(n93), .Y(
        n78) );
  OAI2BB2X1M U84 ( .B0(n107), .B1(n93), .A0N(\memory[7][2] ), .A1N(n93), .Y(
        n79) );
  OAI2BB2X1M U85 ( .B0(n108), .B1(n93), .A0N(\memory[7][3] ), .A1N(n93), .Y(
        n80) );
  OAI2BB2X1M U86 ( .B0(n109), .B1(n93), .A0N(\memory[7][4] ), .A1N(n93), .Y(
        n81) );
  OAI2BB2X1M U87 ( .B0(n110), .B1(n93), .A0N(\memory[7][5] ), .A1N(n93), .Y(
        n82) );
  OAI2BB2X1M U88 ( .B0(n111), .B1(n93), .A0N(\memory[7][6] ), .A1N(n93), .Y(
        n83) );
  OAI2BB2X1M U89 ( .B0(n112), .B1(n93), .A0N(\memory[7][7] ), .A1N(n93), .Y(
        n84) );
  AND2X2M U90 ( .A(i_waddr[2]), .B(i_wen), .Y(n17) );
  NAND3X2M U91 ( .A(n12), .B(n104), .C(i_waddr[1]), .Y(n14) );
  NAND3X2M U92 ( .A(i_waddr[0]), .B(n113), .C(n17), .Y(n18) );
  NAND3X2M U93 ( .A(i_waddr[1]), .B(n104), .C(n17), .Y(n19) );
  NAND3X2M U94 ( .A(i_waddr[1]), .B(i_waddr[0]), .C(n17), .Y(n20) );
  INVX2M U95 ( .A(i_waddr[1]), .Y(n113) );
  INVX2M U96 ( .A(i_waddr[0]), .Y(n104) );
  MX2X2M U97 ( .A(n90), .B(n89), .S0(N12), .Y(o_rdata[7]) );
  MX4X1M U98 ( .A(\memory[0][7] ), .B(\memory[1][7] ), .C(\memory[2][7] ), .D(
        \memory[3][7] ), .S0(n92), .S1(N11), .Y(n90) );
  MX4X1M U99 ( .A(\memory[4][7] ), .B(\memory[5][7] ), .C(\memory[6][7] ), .D(
        \memory[7][7] ), .S0(n91), .S1(N11), .Y(n89) );
  MX2X2M U100 ( .A(n2), .B(n1), .S0(N12), .Y(o_rdata[0]) );
  MX4X1M U101 ( .A(\memory[0][0] ), .B(\memory[1][0] ), .C(\memory[2][0] ), 
        .D(\memory[3][0] ), .S0(n92), .S1(N11), .Y(n2) );
  MX4X1M U102 ( .A(\memory[4][0] ), .B(\memory[5][0] ), .C(\memory[6][0] ), 
        .D(\memory[7][0] ), .S0(n91), .S1(N11), .Y(n1) );
  MX2X2M U103 ( .A(n4), .B(n3), .S0(N12), .Y(o_rdata[1]) );
  MX4X1M U104 ( .A(\memory[0][1] ), .B(\memory[1][1] ), .C(\memory[2][1] ), 
        .D(\memory[3][1] ), .S0(n92), .S1(N11), .Y(n4) );
  MX4X1M U105 ( .A(\memory[4][1] ), .B(\memory[5][1] ), .C(\memory[6][1] ), 
        .D(\memory[7][1] ), .S0(n91), .S1(N11), .Y(n3) );
  MX2X2M U106 ( .A(n6), .B(n5), .S0(N12), .Y(o_rdata[2]) );
  MX4X1M U107 ( .A(\memory[0][2] ), .B(\memory[1][2] ), .C(\memory[2][2] ), 
        .D(\memory[3][2] ), .S0(n92), .S1(N11), .Y(n6) );
  MX4X1M U108 ( .A(\memory[4][2] ), .B(\memory[5][2] ), .C(\memory[6][2] ), 
        .D(\memory[7][2] ), .S0(n91), .S1(N11), .Y(n5) );
  MX2X2M U109 ( .A(n8), .B(n7), .S0(N12), .Y(o_rdata[3]) );
  MX4X1M U110 ( .A(\memory[0][3] ), .B(\memory[1][3] ), .C(\memory[2][3] ), 
        .D(\memory[3][3] ), .S0(n92), .S1(N11), .Y(n8) );
  MX4X1M U111 ( .A(\memory[4][3] ), .B(\memory[5][3] ), .C(\memory[6][3] ), 
        .D(\memory[7][3] ), .S0(n91), .S1(N11), .Y(n7) );
  MX2X2M U112 ( .A(n10), .B(n9), .S0(N12), .Y(o_rdata[4]) );
  MX4X1M U113 ( .A(\memory[0][4] ), .B(\memory[1][4] ), .C(\memory[2][4] ), 
        .D(\memory[3][4] ), .S0(n92), .S1(N11), .Y(n10) );
  MX4X1M U114 ( .A(\memory[4][4] ), .B(\memory[5][4] ), .C(\memory[6][4] ), 
        .D(\memory[7][4] ), .S0(n91), .S1(N11), .Y(n9) );
  MX2X2M U115 ( .A(n86), .B(n85), .S0(N12), .Y(o_rdata[5]) );
  MX4X1M U116 ( .A(\memory[0][5] ), .B(\memory[1][5] ), .C(\memory[2][5] ), 
        .D(\memory[3][5] ), .S0(n92), .S1(N11), .Y(n86) );
  MX4X1M U117 ( .A(\memory[4][5] ), .B(\memory[5][5] ), .C(\memory[6][5] ), 
        .D(\memory[7][5] ), .S0(n91), .S1(N11), .Y(n85) );
  MX2X2M U118 ( .A(n88), .B(n87), .S0(N12), .Y(o_rdata[6]) );
  MX4X1M U119 ( .A(\memory[0][6] ), .B(\memory[1][6] ), .C(\memory[2][6] ), 
        .D(\memory[3][6] ), .S0(n92), .S1(N11), .Y(n88) );
  MX4X1M U120 ( .A(\memory[4][6] ), .B(\memory[5][6] ), .C(\memory[6][6] ), 
        .D(\memory[7][6] ), .S0(n91), .S1(N11), .Y(n87) );
  BUFX2M U121 ( .A(N10), .Y(n91) );
  BUFX2M U122 ( .A(N10), .Y(n92) );
endmodule


module FIFO_RD_ADDRESS_WIDTH3 ( i_rclk, i_rrst_n, i_rinc, i_rq2_wptr, o_rempty, 
        o_raddr, o_rptr );
  input [3:0] i_rq2_wptr;
  output [2:0] o_raddr;
  output [3:0] o_rptr;
  input i_rclk, i_rrst_n, i_rinc;
  output o_rempty;
  wire   N83, N84, N85, N86, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n1, n2, n3, n4;

  DFFRQX2M \rptr_bin_reg[3]  ( .D(n17), .CK(i_rclk), .RN(i_rrst_n), .Q(N86) );
  DFFRQX2M \o_rptr_reg[0]  ( .D(N83), .CK(i_rclk), .RN(i_rrst_n), .Q(o_rptr[0]) );
  DFFRQX2M \o_rptr_reg[3]  ( .D(N86), .CK(i_rclk), .RN(i_rrst_n), .Q(o_rptr[3]) );
  DFFRQX2M \o_rptr_reg[2]  ( .D(N85), .CK(i_rclk), .RN(i_rrst_n), .Q(o_rptr[2]) );
  DFFRQX2M \o_rptr_reg[1]  ( .D(N84), .CK(i_rclk), .RN(i_rrst_n), .Q(o_rptr[1]) );
  DFFRQX2M \rptr_bin_reg[0]  ( .D(n20), .CK(i_rclk), .RN(i_rrst_n), .Q(
        o_raddr[0]) );
  DFFRQX2M \rptr_bin_reg[2]  ( .D(n18), .CK(i_rclk), .RN(i_rrst_n), .Q(
        o_raddr[2]) );
  DFFRQX2M \rptr_bin_reg[1]  ( .D(n19), .CK(i_rclk), .RN(i_rrst_n), .Q(
        o_raddr[1]) );
  NOR2X2M U3 ( .A(n2), .B(n12), .Y(n11) );
  INVX2M U4 ( .A(n7), .Y(o_rempty) );
  XNOR2X2M U5 ( .A(o_rptr[2]), .B(i_rq2_wptr[2]), .Y(n16) );
  XNOR2X2M U6 ( .A(o_raddr[2]), .B(n10), .Y(n18) );
  XNOR2X2M U7 ( .A(o_raddr[0]), .B(n12), .Y(n20) );
  NAND4X2M U8 ( .A(n13), .B(n14), .C(n15), .D(n16), .Y(n7) );
  XNOR2X2M U9 ( .A(o_rptr[1]), .B(i_rq2_wptr[1]), .Y(n13) );
  XNOR2X2M U10 ( .A(o_rptr[0]), .B(i_rq2_wptr[0]), .Y(n14) );
  XNOR2X2M U11 ( .A(o_rptr[3]), .B(i_rq2_wptr[3]), .Y(n15) );
  OAI211X2M U12 ( .A0(n1), .A1(n4), .B0(n8), .C0(n9), .Y(n17) );
  NAND3X2M U13 ( .A(n1), .B(n4), .C(o_raddr[2]), .Y(n8) );
  INVX2M U14 ( .A(N86), .Y(n4) );
  INVX2M U15 ( .A(n10), .Y(n1) );
  NAND2X2M U16 ( .A(o_raddr[1]), .B(n11), .Y(n10) );
  NAND2X2M U17 ( .A(i_rinc), .B(n7), .Y(n12) );
  INVX2M U18 ( .A(o_raddr[0]), .Y(n2) );
  CLKXOR2X2M U19 ( .A(o_raddr[1]), .B(n11), .Y(n19) );
  XNOR2X2M U20 ( .A(n3), .B(o_raddr[1]), .Y(N84) );
  XNOR2X2M U21 ( .A(o_raddr[1]), .B(n2), .Y(N83) );
  OAI21X2M U22 ( .A0(N86), .A1(n3), .B0(n9), .Y(N85) );
  INVX2M U23 ( .A(o_raddr[2]), .Y(n3) );
  NAND2X2M U24 ( .A(N86), .B(n3), .Y(n9) );
endmodule


module FIFO_WR_ADDRESS_WIDTH3 ( i_wclk, i_wrst_n, i_winc, i_wq2_rptr, o_wfull, 
        o_waddr, o_wptr );
  input [3:0] i_wq2_rptr;
  output [2:0] o_waddr;
  output [3:0] o_wptr;
  input i_wclk, i_wrst_n, i_winc;
  output o_wfull;
  wire   N84, N85, N86, N93, n3, n4, n5, n6, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n1;

  DFFRQX2M \wptr_bin_reg[3]  ( .D(n13), .CK(i_wclk), .RN(i_wrst_n), .Q(N86) );
  DFFRQX2M \wptr_bin_reg[2]  ( .D(n14), .CK(i_wclk), .RN(i_wrst_n), .Q(
        o_waddr[2]) );
  DFFRQX2M \wptr_bin_reg[0]  ( .D(n16), .CK(i_wclk), .RN(i_wrst_n), .Q(
        o_waddr[0]) );
  DFFRQX2M \o_wptr_reg[0]  ( .D(N93), .CK(i_wclk), .RN(i_wrst_n), .Q(o_wptr[0]) );
  DFFRQX2M \o_wptr_reg[1]  ( .D(N84), .CK(i_wclk), .RN(i_wrst_n), .Q(o_wptr[1]) );
  DFFRQX2M \o_wptr_reg[3]  ( .D(N86), .CK(i_wclk), .RN(i_wrst_n), .Q(o_wptr[3]) );
  DFFRQX2M \o_wptr_reg[2]  ( .D(N85), .CK(i_wclk), .RN(i_wrst_n), .Q(o_wptr[2]) );
  DFFRQX2M \wptr_bin_reg[1]  ( .D(n15), .CK(i_wclk), .RN(i_wrst_n), .Q(
        o_waddr[1]) );
  NOR2X2M U3 ( .A(n1), .B(n8), .Y(n6) );
  NAND2X2M U4 ( .A(i_winc), .B(n3), .Y(n8) );
  INVX2M U5 ( .A(n3), .Y(o_wfull) );
  XNOR2X2M U6 ( .A(o_waddr[2]), .B(n5), .Y(n14) );
  XNOR2X2M U7 ( .A(N86), .B(n4), .Y(n13) );
  NAND2BX2M U8 ( .AN(n5), .B(o_waddr[2]), .Y(n4) );
  XNOR2X2M U9 ( .A(o_waddr[0]), .B(n8), .Y(n16) );
  NAND4X2M U10 ( .A(n9), .B(n10), .C(n11), .D(n12), .Y(n3) );
  XNOR2X2M U11 ( .A(o_wptr[0]), .B(i_wq2_rptr[0]), .Y(n9) );
  XNOR2X2M U12 ( .A(o_wptr[1]), .B(i_wq2_rptr[1]), .Y(n10) );
  CLKXOR2X2M U13 ( .A(o_wptr[2]), .B(i_wq2_rptr[2]), .Y(n11) );
  NAND2X2M U14 ( .A(o_waddr[1]), .B(n6), .Y(n5) );
  CLKXOR2X2M U15 ( .A(o_wptr[3]), .B(i_wq2_rptr[3]), .Y(n12) );
  CLKXOR2X2M U16 ( .A(o_waddr[1]), .B(n6), .Y(n15) );
  XNOR2X2M U17 ( .A(o_waddr[1]), .B(n1), .Y(N93) );
  INVX2M U18 ( .A(o_waddr[0]), .Y(n1) );
  CLKXOR2X2M U19 ( .A(o_waddr[2]), .B(o_waddr[1]), .Y(N84) );
  CLKXOR2X2M U20 ( .A(o_waddr[2]), .B(N86), .Y(N85) );
endmodule


module ASYNC_FIFO_DATA_WIDTH8_ADDRESS_WIDTH3_MEMORY_DEPTH8_BUS_WIDTH4 ( W_CLK, 
        W_RST, W_INC, R_CLK, R_RST, R_INC, WR_DATA, RD_DATA, FULL, EMPTY );
  input [7:0] WR_DATA;
  output [7:0] RD_DATA;
  input W_CLK, W_RST, W_INC, R_CLK, R_RST, R_INC;
  output FULL, EMPTY;
  wire   _0_net_, n1, n2;
  wire   [3:0] rptr;
  wire   [3:0] wq2_rptr;
  wire   [3:0] wptr;
  wire   [3:0] rq2_wptr;
  wire   [2:0] raddr;
  wire   [2:0] waddr;

  DF_SYNC_BUS_WIDTH4_0 sync_r2w ( .i_clk(W_CLK), .i_rst_n(n1), .i_async_data(
        rptr), .o_sync_data(wq2_rptr) );
  DF_SYNC_BUS_WIDTH4_1 sync_w2r ( .i_clk(R_CLK), .i_rst_n(R_RST), 
        .i_async_data(wptr), .o_sync_data(rq2_wptr) );
  FIFO_MEM_CNTRL_ADDRESS_WIDTH3_MEMORY_DEPTH8_DATA_WIDTH8 FIFO_Memory ( 
        .i_wclk(W_CLK), .i_wrst_n(n1), .i_wen(_0_net_), .i_wdata(WR_DATA), 
        .i_waddr(waddr), .i_raddr(raddr), .o_rdata(RD_DATA) );
  FIFO_RD_ADDRESS_WIDTH3 U_FIFO_RD ( .i_rclk(R_CLK), .i_rrst_n(R_RST), 
        .i_rinc(R_INC), .i_rq2_wptr(rq2_wptr), .o_rempty(EMPTY), .o_raddr(
        raddr), .o_rptr(rptr) );
  FIFO_WR_ADDRESS_WIDTH3 U_FIFO_WR ( .i_wclk(W_CLK), .i_wrst_n(n1), .i_winc(
        W_INC), .i_wq2_rptr(wq2_rptr), .o_wfull(FULL), .o_waddr(waddr), 
        .o_wptr(wptr) );
  NOR2BX2M U1 ( .AN(W_INC), .B(FULL), .Y(_0_net_) );
  INVX2M U2 ( .A(n2), .Y(n1) );
  INVX2M U3 ( .A(W_RST), .Y(n2) );
endmodule


module PULSE_GEN ( clk, rst_n, level_in, pulse_out );
  input clk, rst_n, level_in;
  output pulse_out;
  wire   level_d2, level_d1;

  DFFRQX2M level_d1_reg ( .D(level_in), .CK(clk), .RN(rst_n), .Q(level_d1) );
  DFFRQX2M level_d2_reg ( .D(level_d1), .CK(clk), .RN(rst_n), .Q(level_d2) );
  NOR2BX2M U3 ( .AN(level_d1), .B(level_d2), .Y(pulse_out) );
endmodule


module CLK_DIV_0_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CLK_DIV_0_DW01_inc_2 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CLK_DIV_0_DW01_inc_3 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CLK_DIV_0_DW01_inc_1 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CLK_DIV_0 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en;
  output o_div_clk;
  wire   N0, div_clk, odd_phase_sel, N16, N17, N18, N19, N20, N21, N22, N25,
         N26, N27, N28, N29, N30, N31, N32, N43, N44, N45, N46, N47, N48, N49,
         N50, n37, n38, n39, n40, n41, n42, n43, n44, n45, N84, N83, N82, N81,
         N80, N79, N78, N77, N76, N75, N74, N73, N72, N71,
         \mult_add_84_aco/PROD_not[0] , \mult_add_84_aco/PROD_not[1] ,
         \mult_add_84_aco/PROD_not[2] , \mult_add_84_aco/PROD_not[3] ,
         \mult_add_84_aco/PROD_not[4] , \mult_add_84_aco/PROD_not[5] ,
         \mult_add_84_aco/PROD_not[6] , \mult_add_66_aco/PROD_not[0] ,
         \mult_add_66_aco/PROD_not[1] , \mult_add_66_aco/PROD_not[2] ,
         \mult_add_66_aco/PROD_not[3] , \mult_add_66_aco/PROD_not[4] ,
         \mult_add_66_aco/PROD_not[5] , \mult_add_66_aco/PROD_not[6] , n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57;
  wire   [6:0] half_ratio_plus1;
  wire   [6:0] div_counter;

  CLK_DIV_0_DW01_inc_0 add_35 ( .A(i_div_ratio[7:1]), .SUM(half_ratio_plus1)
         );
  CLK_DIV_0_DW01_inc_2 add_66_aco ( .A({N84, N83, N82, N81, N80, N79, N78}), 
        .SUM({N22, N21, N20, N19, N18, N17, N16}) );
  CLK_DIV_0_DW01_inc_3 add_74_aco ( .A({n7, n6, n5, n4, n3, n2, n1}), .SUM({
        N32, N31, N30, N29, N28, N27, N26}) );
  CLK_DIV_0_DW01_inc_1 add_84_aco ( .A({N77, N76, N75, N74, N73, N72, N71}), 
        .SUM({N50, N49, N48, N47, N46, N45, N44}) );
  DFFRQX2M div_clk_reg ( .D(n37), .CK(i_ref_clk), .RN(i_rst_n), .Q(div_clk) );
  DFFRQX2M odd_phase_sel_reg ( .D(n45), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        odd_phase_sel) );
  DFFSQX2M \div_counter_reg[0]  ( .D(n44), .CK(i_ref_clk), .SN(i_rst_n), .Q(
        div_counter[0]) );
  DFFRQX2M \div_counter_reg[5]  ( .D(n39), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        div_counter[5]) );
  DFFRQX2M \div_counter_reg[4]  ( .D(n40), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        div_counter[4]) );
  DFFRQX2M \div_counter_reg[3]  ( .D(n41), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        div_counter[3]) );
  DFFRQX2M \div_counter_reg[2]  ( .D(n42), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        div_counter[2]) );
  DFFRQX2M \div_counter_reg[1]  ( .D(n43), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        div_counter[1]) );
  DFFRQX2M \div_counter_reg[6]  ( .D(n38), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        div_counter[6]) );
  AND2X2M U3 ( .A(div_counter[0]), .B(N25), .Y(n1) );
  AND2X2M U4 ( .A(div_counter[1]), .B(N25), .Y(n2) );
  AND2X2M U5 ( .A(div_counter[2]), .B(N25), .Y(n3) );
  AND2X2M U6 ( .A(div_counter[3]), .B(N25), .Y(n4) );
  AND2X2M U7 ( .A(div_counter[4]), .B(N25), .Y(n5) );
  AND2X2M U8 ( .A(div_counter[5]), .B(N25), .Y(n6) );
  AND2X2M U9 ( .A(N25), .B(div_counter[6]), .Y(n7) );
  MX2X2M U10 ( .A(i_ref_clk), .B(div_clk), .S0(N0), .Y(o_div_clk) );
  NAND4X2M U11 ( .A(n31), .B(n32), .C(n33), .D(n34), .Y(N43) );
  NAND2BX2M U12 ( .AN(n56), .B(i_clk_en), .Y(n16) );
  NAND4X2M U13 ( .A(n48), .B(n49), .C(n50), .D(n51), .Y(N25) );
  CLKNAND2X2M U14 ( .A(div_counter[0]), .B(N43), .Y(
        \mult_add_66_aco/PROD_not[0] ) );
  CLKINVX1M U15 ( .A(\mult_add_66_aco/PROD_not[0] ), .Y(N78) );
  CLKNAND2X2M U16 ( .A(div_counter[1]), .B(N43), .Y(
        \mult_add_66_aco/PROD_not[1] ) );
  CLKINVX1M U17 ( .A(\mult_add_66_aco/PROD_not[1] ), .Y(N79) );
  CLKNAND2X2M U18 ( .A(div_counter[2]), .B(N43), .Y(
        \mult_add_66_aco/PROD_not[2] ) );
  CLKINVX1M U19 ( .A(\mult_add_66_aco/PROD_not[2] ), .Y(N80) );
  CLKNAND2X2M U20 ( .A(div_counter[3]), .B(N43), .Y(
        \mult_add_66_aco/PROD_not[3] ) );
  CLKINVX1M U21 ( .A(\mult_add_66_aco/PROD_not[3] ), .Y(N81) );
  CLKNAND2X2M U22 ( .A(div_counter[4]), .B(N43), .Y(
        \mult_add_66_aco/PROD_not[4] ) );
  CLKINVX1M U23 ( .A(\mult_add_66_aco/PROD_not[4] ), .Y(N82) );
  CLKNAND2X2M U24 ( .A(div_counter[5]), .B(N43), .Y(
        \mult_add_66_aco/PROD_not[5] ) );
  CLKINVX1M U25 ( .A(\mult_add_66_aco/PROD_not[5] ), .Y(N83) );
  CLKNAND2X2M U26 ( .A(N43), .B(div_counter[6]), .Y(
        \mult_add_66_aco/PROD_not[6] ) );
  CLKINVX1M U27 ( .A(\mult_add_66_aco/PROD_not[6] ), .Y(N84) );
  CLKNAND2X2M U28 ( .A(div_counter[0]), .B(N43), .Y(
        \mult_add_84_aco/PROD_not[0] ) );
  CLKINVX1M U29 ( .A(\mult_add_84_aco/PROD_not[0] ), .Y(N71) );
  CLKNAND2X2M U30 ( .A(div_counter[1]), .B(N43), .Y(
        \mult_add_84_aco/PROD_not[1] ) );
  CLKINVX1M U31 ( .A(\mult_add_84_aco/PROD_not[1] ), .Y(N72) );
  CLKNAND2X2M U32 ( .A(div_counter[2]), .B(N43), .Y(
        \mult_add_84_aco/PROD_not[2] ) );
  CLKINVX1M U33 ( .A(\mult_add_84_aco/PROD_not[2] ), .Y(N73) );
  CLKNAND2X2M U34 ( .A(div_counter[3]), .B(N43), .Y(
        \mult_add_84_aco/PROD_not[3] ) );
  CLKINVX1M U35 ( .A(\mult_add_84_aco/PROD_not[3] ), .Y(N74) );
  CLKNAND2X2M U36 ( .A(div_counter[4]), .B(N43), .Y(
        \mult_add_84_aco/PROD_not[4] ) );
  CLKINVX1M U37 ( .A(\mult_add_84_aco/PROD_not[4] ), .Y(N75) );
  CLKNAND2X2M U38 ( .A(div_counter[5]), .B(N43), .Y(
        \mult_add_84_aco/PROD_not[5] ) );
  CLKINVX1M U39 ( .A(\mult_add_84_aco/PROD_not[5] ), .Y(N76) );
  CLKNAND2X2M U40 ( .A(N43), .B(div_counter[6]), .Y(
        \mult_add_84_aco/PROD_not[6] ) );
  CLKINVX1M U41 ( .A(\mult_add_84_aco/PROD_not[6] ), .Y(N77) );
  CLKXOR2X2M U42 ( .A(n8), .B(odd_phase_sel), .Y(n45) );
  OAI22X1M U43 ( .A0(N25), .A1(n9), .B0(N43), .B1(n10), .Y(n8) );
  CLKNAND2X2M U44 ( .A(n11), .B(n12), .Y(n44) );
  AOI22X1M U45 ( .A0(N16), .A1(n13), .B0(N44), .B1(n14), .Y(n12) );
  AOI22X1M U46 ( .A0(N26), .A1(n15), .B0(div_counter[0]), .B1(n16), .Y(n11) );
  CLKNAND2X2M U47 ( .A(n17), .B(n18), .Y(n43) );
  AOI22X1M U48 ( .A0(N17), .A1(n13), .B0(N45), .B1(n14), .Y(n18) );
  AOI22X1M U49 ( .A0(N27), .A1(n15), .B0(div_counter[1]), .B1(n16), .Y(n17) );
  CLKNAND2X2M U50 ( .A(n19), .B(n20), .Y(n42) );
  AOI22X1M U51 ( .A0(N18), .A1(n13), .B0(N46), .B1(n14), .Y(n20) );
  AOI22X1M U52 ( .A0(N28), .A1(n15), .B0(div_counter[2]), .B1(n16), .Y(n19) );
  CLKNAND2X2M U53 ( .A(n21), .B(n22), .Y(n41) );
  AOI22X1M U54 ( .A0(N19), .A1(n13), .B0(N47), .B1(n14), .Y(n22) );
  AOI22X1M U55 ( .A0(N29), .A1(n15), .B0(div_counter[3]), .B1(n16), .Y(n21) );
  CLKNAND2X2M U56 ( .A(n23), .B(n24), .Y(n40) );
  AOI22X1M U57 ( .A0(N20), .A1(n13), .B0(N48), .B1(n14), .Y(n24) );
  AOI22X1M U58 ( .A0(N30), .A1(n15), .B0(div_counter[4]), .B1(n16), .Y(n23) );
  CLKNAND2X2M U59 ( .A(n25), .B(n26), .Y(n39) );
  AOI22X1M U60 ( .A0(N21), .A1(n13), .B0(N49), .B1(n14), .Y(n26) );
  AOI22X1M U61 ( .A0(N31), .A1(n15), .B0(div_counter[5]), .B1(n16), .Y(n25) );
  CLKNAND2X2M U62 ( .A(n27), .B(n28), .Y(n38) );
  AOI22X1M U63 ( .A0(N22), .A1(n13), .B0(N50), .B1(n14), .Y(n28) );
  CLKINVX1M U64 ( .A(n10), .Y(n13) );
  NAND3X1M U65 ( .A(i_div_ratio[0]), .B(N0), .C(odd_phase_sel), .Y(n10) );
  AOI22X1M U66 ( .A0(N32), .A1(n15), .B0(div_counter[6]), .B1(n16), .Y(n27) );
  CLKXOR2X2M U67 ( .A(n29), .B(div_clk), .Y(n37) );
  OAI22X1M U68 ( .A0(N25), .A1(n9), .B0(N43), .B1(n30), .Y(n29) );
  AOI21X1M U69 ( .A0(odd_phase_sel), .A1(N0), .B0(n14), .Y(n30) );
  NOR2X1M U70 ( .A(n16), .B(i_div_ratio[0]), .Y(n14) );
  CLKINVX1M U71 ( .A(n15), .Y(n9) );
  NOR3BX1M U72 ( .AN(i_div_ratio[0]), .B(odd_phase_sel), .C(n16), .Y(n15) );
  NOR4X1M U73 ( .A(n35), .B(n36), .C(n46), .D(n47), .Y(n34) );
  CLKXOR2X2M U74 ( .A(i_div_ratio[3]), .B(div_counter[2]), .Y(n47) );
  CLKXOR2X2M U75 ( .A(i_div_ratio[2]), .B(div_counter[1]), .Y(n46) );
  CLKXOR2X2M U76 ( .A(i_div_ratio[1]), .B(div_counter[0]), .Y(n36) );
  CLKXOR2X2M U77 ( .A(i_div_ratio[7]), .B(div_counter[6]), .Y(n35) );
  XNOR2X1M U78 ( .A(div_counter[4]), .B(i_div_ratio[5]), .Y(n33) );
  XNOR2X1M U79 ( .A(div_counter[5]), .B(i_div_ratio[6]), .Y(n32) );
  XNOR2X1M U80 ( .A(div_counter[3]), .B(i_div_ratio[4]), .Y(n31) );
  NOR4X1M U81 ( .A(n52), .B(n53), .C(n54), .D(n55), .Y(n51) );
  CLKXOR2X2M U82 ( .A(half_ratio_plus1[2]), .B(div_counter[2]), .Y(n55) );
  CLKXOR2X2M U83 ( .A(half_ratio_plus1[1]), .B(div_counter[1]), .Y(n54) );
  CLKXOR2X2M U84 ( .A(half_ratio_plus1[0]), .B(div_counter[0]), .Y(n53) );
  CLKXOR2X2M U85 ( .A(half_ratio_plus1[6]), .B(div_counter[6]), .Y(n52) );
  XNOR2X1M U86 ( .A(div_counter[4]), .B(half_ratio_plus1[4]), .Y(n50) );
  XNOR2X1M U87 ( .A(div_counter[5]), .B(half_ratio_plus1[5]), .Y(n49) );
  XNOR2X1M U88 ( .A(div_counter[3]), .B(half_ratio_plus1[3]), .Y(n48) );
  CLKINVX1M U89 ( .A(n16), .Y(N0) );
  NOR4BX1M U90 ( .AN(n57), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n56) );
  NOR4X1M U91 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n57) );
endmodule


module CLK_DIV_RX_MUX ( PreScale, Div_Ratio );
  input [5:0] PreScale;
  output [7:0] Div_Ratio;
  wire   n1, n2, n3;

  INVX2M U3 ( .A(1'b1), .Y(Div_Ratio[3]) );
  INVX2M U5 ( .A(1'b1), .Y(Div_Ratio[4]) );
  INVX2M U7 ( .A(1'b1), .Y(Div_Ratio[5]) );
  INVX2M U9 ( .A(1'b1), .Y(Div_Ratio[6]) );
  INVX2M U11 ( .A(1'b1), .Y(Div_Ratio[7]) );
  OAI21X2M U13 ( .A0(n1), .A1(n3), .B0(n2), .Y(Div_Ratio[0]) );
  AND2X2M U14 ( .A(n1), .B(n2), .Y(Div_Ratio[2]) );
  AND2X2M U15 ( .A(n2), .B(n3), .Y(Div_Ratio[1]) );
  NOR3BX2M U16 ( .AN(PreScale[4]), .B(PreScale[3]), .C(PreScale[5]), .Y(n3) );
  NOR3BX2M U17 ( .AN(PreScale[3]), .B(PreScale[4]), .C(PreScale[5]), .Y(n1) );
  NOR3X2M U18 ( .A(PreScale[2]), .B(PreScale[1]), .C(PreScale[0]), .Y(n2) );
endmodule


module CLK_DIV_1_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CLK_DIV_1_DW01_inc_1 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CLK_DIV_1_DW01_inc_3 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CLK_DIV_1_DW01_inc_2 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CLK_DIV_1 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en;
  output o_div_clk;
  wire   N0, div_clk, odd_phase_sel, N16, N17, N18, N19, N20, N21, N22, N25,
         N26, N27, N28, N29, N30, N31, N32, N43, N44, N45, N46, N47, N48, N49,
         N50, N84, N83, N82, N81, N80, N79, N78, N77, N76, N75, N74, N73, N72,
         N71, \mult_add_66_aco/PROD_not[0] , \mult_add_66_aco/PROD_not[1] ,
         \mult_add_66_aco/PROD_not[2] , \mult_add_66_aco/PROD_not[3] ,
         \mult_add_66_aco/PROD_not[4] , \mult_add_66_aco/PROD_not[5] ,
         \mult_add_66_aco/PROD_not[6] , \mult_add_84_aco/PROD_not[0] ,
         \mult_add_84_aco/PROD_not[1] , \mult_add_84_aco/PROD_not[2] ,
         \mult_add_84_aco/PROD_not[3] , \mult_add_84_aco/PROD_not[4] ,
         \mult_add_84_aco/PROD_not[5] , \mult_add_84_aco/PROD_not[6] , n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66;
  wire   [6:0] half_ratio_plus1;
  wire   [6:0] div_counter;

  CLK_DIV_1_DW01_inc_0 add_35 ( .A(i_div_ratio[7:1]), .SUM(half_ratio_plus1)
         );
  CLK_DIV_1_DW01_inc_1 add_66_aco ( .A({N84, N83, N82, N81, N80, N79, N78}), 
        .SUM({N22, N21, N20, N19, N18, N17, N16}) );
  CLK_DIV_1_DW01_inc_3 add_74_aco ( .A({n7, n6, n5, n4, n3, n2, n1}), .SUM({
        N32, N31, N30, N29, N28, N27, N26}) );
  CLK_DIV_1_DW01_inc_2 add_84_aco ( .A({N77, N76, N75, N74, N73, N72, N71}), 
        .SUM({N50, N49, N48, N47, N46, N45, N44}) );
  DFFRQX2M div_clk_reg ( .D(n66), .CK(i_ref_clk), .RN(i_rst_n), .Q(div_clk) );
  DFFRQX2M odd_phase_sel_reg ( .D(n58), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        odd_phase_sel) );
  DFFSQX2M \div_counter_reg[0]  ( .D(n59), .CK(i_ref_clk), .SN(i_rst_n), .Q(
        div_counter[0]) );
  DFFRQX2M \div_counter_reg[5]  ( .D(n64), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        div_counter[5]) );
  DFFRQX2M \div_counter_reg[4]  ( .D(n63), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        div_counter[4]) );
  DFFRQX2M \div_counter_reg[3]  ( .D(n62), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        div_counter[3]) );
  DFFRQX2M \div_counter_reg[6]  ( .D(n65), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        div_counter[6]) );
  DFFRQX2M \div_counter_reg[2]  ( .D(n61), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        div_counter[2]) );
  DFFRQX2M \div_counter_reg[1]  ( .D(n60), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        div_counter[1]) );
  AND2X2M U3 ( .A(div_counter[0]), .B(N25), .Y(n1) );
  AND2X2M U4 ( .A(div_counter[1]), .B(N25), .Y(n2) );
  AND2X2M U5 ( .A(div_counter[2]), .B(N25), .Y(n3) );
  AND2X2M U6 ( .A(div_counter[3]), .B(N25), .Y(n4) );
  AND2X2M U7 ( .A(div_counter[4]), .B(N25), .Y(n5) );
  AND2X2M U8 ( .A(div_counter[5]), .B(N25), .Y(n6) );
  AND2X2M U9 ( .A(N25), .B(div_counter[6]), .Y(n7) );
  MX2X2M U10 ( .A(i_ref_clk), .B(div_clk), .S0(N0), .Y(o_div_clk) );
  NAND4X2M U11 ( .A(n31), .B(n32), .C(n33), .D(n34), .Y(N43) );
  NAND2BX2M U12 ( .AN(n56), .B(i_clk_en), .Y(n16) );
  NAND4X2M U13 ( .A(n48), .B(n49), .C(n50), .D(n51), .Y(N25) );
  CLKNAND2X2M U14 ( .A(div_counter[0]), .B(N43), .Y(
        \mult_add_84_aco/PROD_not[0] ) );
  CLKINVX1M U15 ( .A(\mult_add_84_aco/PROD_not[0] ), .Y(N71) );
  CLKNAND2X2M U16 ( .A(div_counter[1]), .B(N43), .Y(
        \mult_add_84_aco/PROD_not[1] ) );
  CLKINVX1M U17 ( .A(\mult_add_84_aco/PROD_not[1] ), .Y(N72) );
  CLKNAND2X2M U18 ( .A(div_counter[2]), .B(N43), .Y(
        \mult_add_84_aco/PROD_not[2] ) );
  CLKINVX1M U19 ( .A(\mult_add_84_aco/PROD_not[2] ), .Y(N73) );
  CLKNAND2X2M U20 ( .A(div_counter[3]), .B(N43), .Y(
        \mult_add_84_aco/PROD_not[3] ) );
  CLKINVX1M U21 ( .A(\mult_add_84_aco/PROD_not[3] ), .Y(N74) );
  CLKNAND2X2M U22 ( .A(div_counter[4]), .B(N43), .Y(
        \mult_add_84_aco/PROD_not[4] ) );
  CLKINVX1M U23 ( .A(\mult_add_84_aco/PROD_not[4] ), .Y(N75) );
  CLKNAND2X2M U24 ( .A(div_counter[5]), .B(N43), .Y(
        \mult_add_84_aco/PROD_not[5] ) );
  CLKINVX1M U25 ( .A(\mult_add_84_aco/PROD_not[5] ), .Y(N76) );
  CLKNAND2X2M U26 ( .A(N43), .B(div_counter[6]), .Y(
        \mult_add_84_aco/PROD_not[6] ) );
  CLKINVX1M U27 ( .A(\mult_add_84_aco/PROD_not[6] ), .Y(N77) );
  CLKNAND2X2M U28 ( .A(div_counter[0]), .B(N43), .Y(
        \mult_add_66_aco/PROD_not[0] ) );
  CLKINVX1M U29 ( .A(\mult_add_66_aco/PROD_not[0] ), .Y(N78) );
  CLKNAND2X2M U30 ( .A(div_counter[1]), .B(N43), .Y(
        \mult_add_66_aco/PROD_not[1] ) );
  CLKINVX1M U31 ( .A(\mult_add_66_aco/PROD_not[1] ), .Y(N79) );
  CLKNAND2X2M U32 ( .A(div_counter[2]), .B(N43), .Y(
        \mult_add_66_aco/PROD_not[2] ) );
  CLKINVX1M U33 ( .A(\mult_add_66_aco/PROD_not[2] ), .Y(N80) );
  CLKNAND2X2M U34 ( .A(div_counter[3]), .B(N43), .Y(
        \mult_add_66_aco/PROD_not[3] ) );
  CLKINVX1M U35 ( .A(\mult_add_66_aco/PROD_not[3] ), .Y(N81) );
  CLKNAND2X2M U36 ( .A(div_counter[4]), .B(N43), .Y(
        \mult_add_66_aco/PROD_not[4] ) );
  CLKINVX1M U37 ( .A(\mult_add_66_aco/PROD_not[4] ), .Y(N82) );
  CLKNAND2X2M U38 ( .A(div_counter[5]), .B(N43), .Y(
        \mult_add_66_aco/PROD_not[5] ) );
  CLKINVX1M U39 ( .A(\mult_add_66_aco/PROD_not[5] ), .Y(N83) );
  CLKNAND2X2M U40 ( .A(N43), .B(div_counter[6]), .Y(
        \mult_add_66_aco/PROD_not[6] ) );
  CLKINVX1M U41 ( .A(\mult_add_66_aco/PROD_not[6] ), .Y(N84) );
  CLKXOR2X2M U42 ( .A(n8), .B(odd_phase_sel), .Y(n58) );
  OAI22X1M U43 ( .A0(N25), .A1(n9), .B0(N43), .B1(n10), .Y(n8) );
  CLKNAND2X2M U44 ( .A(n11), .B(n12), .Y(n59) );
  AOI22X1M U45 ( .A0(N16), .A1(n13), .B0(N44), .B1(n14), .Y(n12) );
  AOI22X1M U46 ( .A0(N26), .A1(n15), .B0(div_counter[0]), .B1(n16), .Y(n11) );
  CLKNAND2X2M U47 ( .A(n17), .B(n18), .Y(n60) );
  AOI22X1M U48 ( .A0(N17), .A1(n13), .B0(N45), .B1(n14), .Y(n18) );
  AOI22X1M U49 ( .A0(N27), .A1(n15), .B0(div_counter[1]), .B1(n16), .Y(n17) );
  CLKNAND2X2M U50 ( .A(n19), .B(n20), .Y(n61) );
  AOI22X1M U51 ( .A0(N18), .A1(n13), .B0(N46), .B1(n14), .Y(n20) );
  AOI22X1M U52 ( .A0(N28), .A1(n15), .B0(div_counter[2]), .B1(n16), .Y(n19) );
  CLKNAND2X2M U53 ( .A(n21), .B(n22), .Y(n62) );
  AOI22X1M U54 ( .A0(N19), .A1(n13), .B0(N47), .B1(n14), .Y(n22) );
  AOI22X1M U55 ( .A0(N29), .A1(n15), .B0(div_counter[3]), .B1(n16), .Y(n21) );
  CLKNAND2X2M U56 ( .A(n23), .B(n24), .Y(n63) );
  AOI22X1M U57 ( .A0(N20), .A1(n13), .B0(N48), .B1(n14), .Y(n24) );
  AOI22X1M U58 ( .A0(N30), .A1(n15), .B0(div_counter[4]), .B1(n16), .Y(n23) );
  CLKNAND2X2M U59 ( .A(n25), .B(n26), .Y(n64) );
  AOI22X1M U60 ( .A0(N21), .A1(n13), .B0(N49), .B1(n14), .Y(n26) );
  AOI22X1M U61 ( .A0(N31), .A1(n15), .B0(div_counter[5]), .B1(n16), .Y(n25) );
  CLKNAND2X2M U62 ( .A(n27), .B(n28), .Y(n65) );
  AOI22X1M U63 ( .A0(N22), .A1(n13), .B0(N50), .B1(n14), .Y(n28) );
  CLKINVX1M U64 ( .A(n10), .Y(n13) );
  NAND3X1M U65 ( .A(i_div_ratio[0]), .B(N0), .C(odd_phase_sel), .Y(n10) );
  AOI22X1M U66 ( .A0(N32), .A1(n15), .B0(div_counter[6]), .B1(n16), .Y(n27) );
  CLKXOR2X2M U67 ( .A(n29), .B(div_clk), .Y(n66) );
  OAI22X1M U68 ( .A0(N25), .A1(n9), .B0(N43), .B1(n30), .Y(n29) );
  AOI21X1M U69 ( .A0(odd_phase_sel), .A1(N0), .B0(n14), .Y(n30) );
  NOR2X1M U70 ( .A(n16), .B(i_div_ratio[0]), .Y(n14) );
  CLKINVX1M U71 ( .A(n15), .Y(n9) );
  NOR3BX1M U72 ( .AN(i_div_ratio[0]), .B(odd_phase_sel), .C(n16), .Y(n15) );
  NOR4X1M U73 ( .A(n35), .B(n36), .C(n46), .D(n47), .Y(n34) );
  CLKXOR2X2M U74 ( .A(i_div_ratio[3]), .B(div_counter[2]), .Y(n47) );
  CLKXOR2X2M U75 ( .A(i_div_ratio[2]), .B(div_counter[1]), .Y(n46) );
  CLKXOR2X2M U76 ( .A(i_div_ratio[1]), .B(div_counter[0]), .Y(n36) );
  CLKXOR2X2M U77 ( .A(i_div_ratio[7]), .B(div_counter[6]), .Y(n35) );
  XNOR2X1M U78 ( .A(div_counter[4]), .B(i_div_ratio[5]), .Y(n33) );
  XNOR2X1M U79 ( .A(div_counter[5]), .B(i_div_ratio[6]), .Y(n32) );
  XNOR2X1M U80 ( .A(div_counter[3]), .B(i_div_ratio[4]), .Y(n31) );
  NOR4X1M U81 ( .A(n52), .B(n53), .C(n54), .D(n55), .Y(n51) );
  CLKXOR2X2M U82 ( .A(half_ratio_plus1[2]), .B(div_counter[2]), .Y(n55) );
  CLKXOR2X2M U83 ( .A(half_ratio_plus1[1]), .B(div_counter[1]), .Y(n54) );
  CLKXOR2X2M U84 ( .A(half_ratio_plus1[0]), .B(div_counter[0]), .Y(n53) );
  CLKXOR2X2M U85 ( .A(half_ratio_plus1[6]), .B(div_counter[6]), .Y(n52) );
  XNOR2X1M U86 ( .A(div_counter[4]), .B(half_ratio_plus1[4]), .Y(n50) );
  XNOR2X1M U87 ( .A(div_counter[5]), .B(half_ratio_plus1[5]), .Y(n49) );
  XNOR2X1M U88 ( .A(div_counter[3]), .B(half_ratio_plus1[3]), .Y(n48) );
  CLKINVX1M U89 ( .A(n16), .Y(N0) );
  NOR4BX1M U90 ( .AN(n57), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n56) );
  NOR4X1M U91 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n57) );
endmodule


module Serializer_DATA_WIDTH8 ( CLK, RST, P_DATA, Data_Valid, Ser_En, Busy, 
        Ser_Data, Ser_Done );
  input [7:0] P_DATA;
  input CLK, RST, Data_Valid, Ser_En, Busy;
  output Ser_Data, Ser_Done;
  wire   N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, n3, n4,
         n5, n6, n7, n1, n2, n8;
  wire   [2:0] counter;
  wire   [7:1] P_DATA_Buf;

  DFFRQX2M \P_DATA_Buf_reg[7]  ( .D(N19), .CK(CLK), .RN(RST), .Q(P_DATA_Buf[7]) );
  DFFRQX2M \P_DATA_Buf_reg[6]  ( .D(N18), .CK(CLK), .RN(RST), .Q(P_DATA_Buf[6]) );
  DFFRQX2M \P_DATA_Buf_reg[5]  ( .D(N17), .CK(CLK), .RN(RST), .Q(P_DATA_Buf[5]) );
  DFFRQX2M \P_DATA_Buf_reg[4]  ( .D(N16), .CK(CLK), .RN(RST), .Q(P_DATA_Buf[4]) );
  DFFRQX2M \P_DATA_Buf_reg[3]  ( .D(N15), .CK(CLK), .RN(RST), .Q(P_DATA_Buf[3]) );
  DFFRQX2M \P_DATA_Buf_reg[2]  ( .D(N14), .CK(CLK), .RN(RST), .Q(P_DATA_Buf[2]) );
  DFFRQX2M \P_DATA_Buf_reg[1]  ( .D(N13), .CK(CLK), .RN(RST), .Q(P_DATA_Buf[1]) );
  DFFRQX2M \P_DATA_Buf_reg[0]  ( .D(N12), .CK(CLK), .RN(RST), .Q(Ser_Data) );
  DFFRQX2M \counter_reg[2]  ( .D(N22), .CK(CLK), .RN(RST), .Q(counter[2]) );
  DFFRQX2M \counter_reg[1]  ( .D(N21), .CK(CLK), .RN(RST), .Q(counter[1]) );
  DFFRQX2M \counter_reg[0]  ( .D(N20), .CK(CLK), .RN(RST), .Q(counter[0]) );
  DFFRQX2M Ser_Done_reg ( .D(N11), .CK(CLK), .RN(RST), .Q(Ser_Done) );
  NOR2X2M U3 ( .A(n8), .B(n3), .Y(N11) );
  INVX2M U4 ( .A(n1), .Y(n2) );
  AND2X2M U5 ( .A(P_DATA[7]), .B(n7), .Y(N19) );
  NOR2BX2M U6 ( .AN(Data_Valid), .B(Busy), .Y(n7) );
  OAI22X1M U7 ( .A0(counter[2]), .A1(n3), .B0(n4), .B1(n8), .Y(N22) );
  AOI2BB1X2M U8 ( .A0N(counter[1]), .A1N(n2), .B0(N20), .Y(n4) );
  NAND3X2M U9 ( .A(counter[0]), .B(n1), .C(counter[1]), .Y(n3) );
  NOR2X2M U10 ( .A(n2), .B(counter[0]), .Y(N20) );
  BUFX2M U11 ( .A(n6), .Y(n1) );
  NOR3BX2M U12 ( .AN(Ser_En), .B(Ser_Done), .C(n7), .Y(n6) );
  NOR2X2M U13 ( .A(n5), .B(n2), .Y(N21) );
  XNOR2X2M U14 ( .A(counter[0]), .B(counter[1]), .Y(n5) );
  AO22X1M U15 ( .A0(P_DATA[0]), .A1(n7), .B0(P_DATA_Buf[1]), .B1(n1), .Y(N12)
         );
  AO22X1M U16 ( .A0(P_DATA[1]), .A1(n7), .B0(P_DATA_Buf[2]), .B1(n1), .Y(N13)
         );
  AO22X1M U17 ( .A0(P_DATA[2]), .A1(n7), .B0(P_DATA_Buf[3]), .B1(n1), .Y(N14)
         );
  AO22X1M U18 ( .A0(P_DATA[3]), .A1(n7), .B0(P_DATA_Buf[4]), .B1(n1), .Y(N15)
         );
  AO22X1M U19 ( .A0(P_DATA[4]), .A1(n7), .B0(P_DATA_Buf[5]), .B1(n1), .Y(N16)
         );
  AO22X1M U20 ( .A0(P_DATA[5]), .A1(n7), .B0(P_DATA_Buf[6]), .B1(n1), .Y(N17)
         );
  AO22X1M U21 ( .A0(P_DATA[6]), .A1(n7), .B0(P_DATA_Buf[7]), .B1(n1), .Y(N18)
         );
  INVX2M U22 ( .A(counter[2]), .Y(n8) );
endmodule


module FSM ( CLK, RST, Data_Valid, PAR_EN, Ser_Done, Ser_En, MUX_Sel, Busy );
  output [1:0] MUX_Sel;
  input CLK, RST, Data_Valid, PAR_EN, Ser_Done;
  output Ser_En, Busy;
  wire   busy_comb, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n1, n2, n3, n4, n5, n6, n7;
  wire   [2:0] current_state;

  DFFRQX2M \current_state_reg[0]  ( .D(n20), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  DFFRQX2M \current_state_reg[1]  ( .D(n3), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[2]  ( .D(n19), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  DFFRQX2M Busy_reg ( .D(busy_comb), .CK(CLK), .RN(RST), .Q(Busy) );
  INVX2M U3 ( .A(Data_Valid), .Y(n1) );
  INVX2M U4 ( .A(n12), .Y(n3) );
  OAI211X2M U5 ( .A0(n16), .A1(n17), .B0(n18), .C0(n5), .Y(MUX_Sel[0]) );
  OAI21X2M U6 ( .A0(n6), .A1(n7), .B0(n16), .Y(n18) );
  NOR2X2M U7 ( .A(n1), .B(n14), .Y(n17) );
  NAND2X2M U8 ( .A(n11), .B(n4), .Y(n14) );
  AND2X2M U9 ( .A(n16), .B(n5), .Y(n10) );
  NAND2X2M U10 ( .A(n10), .B(n6), .Y(n13) );
  NAND2X2M U11 ( .A(n14), .B(n5), .Y(n12) );
  OAI31X1M U12 ( .A0(Data_Valid), .A1(current_state[2]), .A2(current_state[1]), 
        .B0(n13), .Y(n9) );
  AOI22X1M U13 ( .A0(Ser_Done), .A1(n10), .B0(n1), .B1(n4), .Y(n15) );
  NAND3X2M U14 ( .A(n11), .B(n5), .C(n15), .Y(MUX_Sel[1]) );
  NOR2X2M U15 ( .A(n8), .B(n9), .Y(n19) );
  AOI2BB2XLM U16 ( .B0(n10), .B1(n7), .A0N(n11), .A1N(current_state[2]), .Y(n8) );
  OAI32X1M U17 ( .A0(n9), .A1(current_state[2]), .A2(current_state[1]), .B0(n2), .B1(n4), .Y(n20) );
  INVX2M U18 ( .A(n9), .Y(n2) );
  OAI21X2M U19 ( .A0(current_state[2]), .A1(n1), .B0(n12), .Y(busy_comb) );
  OAI31X1M U20 ( .A0(n4), .A1(current_state[2]), .A2(current_state[1]), .B0(
        n13), .Y(Ser_En) );
  NAND2X2M U21 ( .A(current_state[1]), .B(n4), .Y(n11) );
  INVX2M U22 ( .A(current_state[2]), .Y(n5) );
  INVX2M U23 ( .A(current_state[0]), .Y(n4) );
  AND2X2M U24 ( .A(current_state[1]), .B(current_state[0]), .Y(n16) );
  INVX2M U25 ( .A(Ser_Done), .Y(n6) );
  INVX2M U26 ( .A(PAR_EN), .Y(n7) );
endmodule


module Parity_Calc ( CLK, RST, P_DATA, Busy, PAR_TYP, Data_Valid, par_bit );
  input [7:0] P_DATA;
  input CLK, RST, Busy, PAR_TYP, Data_Valid;
  output par_bit;
  wire   N7, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;
  wire   [7:0] P_DATA_Buf;

  DFFRQX2M \P_DATA_Buf_reg[4]  ( .D(n10), .CK(CLK), .RN(RST), .Q(P_DATA_Buf[4]) );
  DFFRQX2M \P_DATA_Buf_reg[0]  ( .D(n6), .CK(CLK), .RN(RST), .Q(P_DATA_Buf[0])
         );
  DFFRQX2M par_bit_reg ( .D(N7), .CK(CLK), .RN(RST), .Q(par_bit) );
  DFFRQX2M \P_DATA_Buf_reg[3]  ( .D(n9), .CK(CLK), .RN(RST), .Q(P_DATA_Buf[3])
         );
  DFFRQX2M \P_DATA_Buf_reg[5]  ( .D(n11), .CK(CLK), .RN(RST), .Q(P_DATA_Buf[5]) );
  DFFRQX2M \P_DATA_Buf_reg[1]  ( .D(n7), .CK(CLK), .RN(RST), .Q(P_DATA_Buf[1])
         );
  DFFRQX2M \P_DATA_Buf_reg[6]  ( .D(n12), .CK(CLK), .RN(RST), .Q(P_DATA_Buf[6]) );
  DFFRQX2M \P_DATA_Buf_reg[2]  ( .D(n8), .CK(CLK), .RN(RST), .Q(P_DATA_Buf[2])
         );
  DFFRQX2M \P_DATA_Buf_reg[7]  ( .D(n13), .CK(CLK), .RN(RST), .Q(P_DATA_Buf[7]) );
  NOR2BX2M U3 ( .AN(Data_Valid), .B(Busy), .Y(n1) );
  AO2B2X2M U4 ( .B0(P_DATA[0]), .B1(n1), .A0(P_DATA_Buf[0]), .A1N(n1), .Y(n6)
         );
  AO2B2X2M U5 ( .B0(P_DATA[1]), .B1(n1), .A0(P_DATA_Buf[1]), .A1N(n1), .Y(n7)
         );
  AO2B2X2M U6 ( .B0(P_DATA[2]), .B1(n1), .A0(P_DATA_Buf[2]), .A1N(n1), .Y(n8)
         );
  AO2B2X2M U7 ( .B0(P_DATA[3]), .B1(n1), .A0(P_DATA_Buf[3]), .A1N(n1), .Y(n9)
         );
  AO2B2X2M U8 ( .B0(P_DATA[4]), .B1(n1), .A0(P_DATA_Buf[4]), .A1N(n1), .Y(n10)
         );
  AO2B2X2M U9 ( .B0(P_DATA[5]), .B1(n1), .A0(P_DATA_Buf[5]), .A1N(n1), .Y(n11)
         );
  AO2B2X2M U10 ( .B0(P_DATA[6]), .B1(n1), .A0(P_DATA_Buf[6]), .A1N(n1), .Y(n12) );
  AO2B2X2M U11 ( .B0(P_DATA[7]), .B1(n1), .A0(P_DATA_Buf[7]), .A1N(n1), .Y(n13) );
  XOR3XLM U12 ( .A(n2), .B(n3), .C(PAR_TYP), .Y(N7) );
  XOR3XLM U13 ( .A(P_DATA_Buf[5]), .B(P_DATA_Buf[4]), .C(n5), .Y(n2) );
  XOR3XLM U14 ( .A(P_DATA_Buf[1]), .B(P_DATA_Buf[0]), .C(n4), .Y(n3) );
  CLKXOR2X2M U15 ( .A(P_DATA_Buf[7]), .B(P_DATA_Buf[6]), .Y(n5) );
  CLKXOR2X2M U16 ( .A(P_DATA_Buf[3]), .B(P_DATA_Buf[2]), .Y(n4) );
endmodule


module MUX ( CLK, RST, mux_sel, start_bit, ser_data, par_bit, stop_bit, TX_OUT
 );
  input [1:0] mux_sel;
  input CLK, RST, start_bit, ser_data, par_bit, stop_bit;
  output TX_OUT;
  wire   n6, N13, n2, n3, n1, n5;

  DFFSQX2M TX_OUT_reg ( .D(N13), .CK(CLK), .SN(RST), .Q(n6) );
  INVXLM U3 ( .A(n6), .Y(n1) );
  INVX8M U4 ( .A(n1), .Y(TX_OUT) );
  INVX2M U5 ( .A(mux_sel[0]), .Y(n5) );
  OAI2B2X1M U6 ( .A1N(mux_sel[1]), .A0(n2), .B0(mux_sel[1]), .B1(n3), .Y(N13)
         );
  AOI22X1M U7 ( .A0(par_bit), .A1(n5), .B0(stop_bit), .B1(mux_sel[0]), .Y(n2)
         );
  AOI22X1M U8 ( .A0(start_bit), .A1(n5), .B0(ser_data), .B1(mux_sel[0]), .Y(n3) );
endmodule


module UART_TX_DATA_WIDTH8 ( clk, rst, p_data, data_valid, par_en, par_typ, 
        tx_out, busy );
  input [7:0] p_data;
  input clk, rst, data_valid, par_en, par_typ;
  output tx_out, busy;
  wire   ser_en, ser_data, ser_done, par_bit, n1, n2;
  wire   [1:0] mux_sel;

  Serializer_DATA_WIDTH8 DUT_Serializer ( .CLK(clk), .RST(n1), .P_DATA(p_data), 
        .Data_Valid(data_valid), .Ser_En(ser_en), .Busy(busy), .Ser_Data(
        ser_data), .Ser_Done(ser_done) );
  FSM DUT_FSM ( .CLK(clk), .RST(n1), .Data_Valid(data_valid), .PAR_EN(par_en), 
        .Ser_Done(ser_done), .Ser_En(ser_en), .MUX_Sel(mux_sel), .Busy(busy)
         );
  Parity_Calc DUT_Parity_Calc ( .CLK(clk), .RST(n1), .P_DATA(p_data), .Busy(
        busy), .PAR_TYP(par_typ), .Data_Valid(data_valid), .par_bit(par_bit)
         );
  MUX DUT_MUX ( .CLK(clk), .RST(n1), .mux_sel(mux_sel), .start_bit(1'b0), 
        .ser_data(ser_data), .par_bit(par_bit), .stop_bit(1'b1), .TX_OUT(
        tx_out) );
  INVX2M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(rst), .Y(n2) );
endmodule


module Deserializer_DATA_WIDTH8 ( clk, rst, deser_enable, serial_in_bit, 
        parallel_data );
  output [7:0] parallel_data;
  input clk, rst, deser_enable, serial_in_bit;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n1, n2, n3, n4, n5, n6, n7, n8,
         n17;

  DFFRX1M \parallel_data_reg[7]  ( .D(n16), .CK(clk), .RN(rst), .Q(
        parallel_data[7]), .QN(n3) );
  DFFRX1M \parallel_data_reg[6]  ( .D(n15), .CK(clk), .RN(rst), .Q(
        parallel_data[6]), .QN(n4) );
  DFFRX1M \parallel_data_reg[5]  ( .D(n14), .CK(clk), .RN(rst), .Q(
        parallel_data[5]), .QN(n5) );
  DFFRX1M \parallel_data_reg[4]  ( .D(n13), .CK(clk), .RN(rst), .Q(
        parallel_data[4]), .QN(n6) );
  DFFRX1M \parallel_data_reg[3]  ( .D(n12), .CK(clk), .RN(rst), .Q(
        parallel_data[3]), .QN(n7) );
  DFFRX1M \parallel_data_reg[2]  ( .D(n11), .CK(clk), .RN(rst), .Q(
        parallel_data[2]), .QN(n8) );
  DFFRX1M \parallel_data_reg[1]  ( .D(n10), .CK(clk), .RN(rst), .Q(
        parallel_data[1]), .QN(n17) );
  DFFRX1M \parallel_data_reg[0]  ( .D(n9), .CK(clk), .RN(rst), .Q(
        parallel_data[0]) );
  INVX2M U2 ( .A(n1), .Y(n2) );
  OAI22X1M U3 ( .A0(n2), .A1(n8), .B0(n1), .B1(n17), .Y(n10) );
  OAI22X1M U4 ( .A0(n2), .A1(n7), .B0(n1), .B1(n8), .Y(n11) );
  OAI22X1M U5 ( .A0(n2), .A1(n6), .B0(n1), .B1(n7), .Y(n12) );
  OAI22X1M U6 ( .A0(n2), .A1(n5), .B0(n1), .B1(n6), .Y(n13) );
  OAI22X1M U7 ( .A0(n2), .A1(n4), .B0(n1), .B1(n5), .Y(n14) );
  OAI22X1M U8 ( .A0(n2), .A1(n3), .B0(n1), .B1(n4), .Y(n15) );
  BUFX2M U9 ( .A(deser_enable), .Y(n1) );
  OAI2BB2X1M U10 ( .B0(n2), .B1(n17), .A0N(parallel_data[0]), .A1N(n2), .Y(n9)
         );
  OAI2BB2X1M U11 ( .B0(n1), .B1(n3), .A0N(serial_in_bit), .A1N(n1), .Y(n16) );
endmodule


module Data_Sampling ( clk, rst, samp_enable, edge_counter, rx_serial_in, 
        prescaler, sampled_bit );
  input [5:0] edge_counter;
  input [5:0] prescaler;
  input clk, rst, samp_enable, rx_serial_in;
  output sampled_bit;
  wire   sample_stage1, sample_stage2, sample_stage3, N10, N11, N12, N13, N14,
         N15, N16, n24, n25, n26, n27, \add_37/carry[5] , \add_37/carry[4] ,
         \add_37/carry[3] , \add_37/carry[2] , \add_16/carry[4] ,
         \add_16/carry[3] , \add_16/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51;
  wire   [5:0] sample_pos_before;
  wire   [5:0] sample_pos_after;

  DFFRX1M sample_stage1_reg ( .D(n25), .CK(clk), .RN(rst), .Q(sample_stage1), 
        .QN(n21) );
  DFFRX1M sample_stage2_reg ( .D(n26), .CK(clk), .RN(rst), .Q(sample_stage2), 
        .QN(n16) );
  DFFRQX1M sample_stage3_reg ( .D(n27), .CK(clk), .RN(rst), .Q(sample_stage3)
         );
  DFFRQX1M sampled_bit_reg ( .D(n24), .CK(clk), .RN(rst), .Q(sampled_bit) );
  ADDHX1M U3 ( .A(sample_pos_after[1]), .B(sample_pos_after[0]), .CO(
        \add_37/carry[2] ), .S(N10) );
  ADDHX1M U4 ( .A(sample_pos_after[4]), .B(\add_37/carry[4] ), .CO(
        \add_37/carry[5] ), .S(N13) );
  ADDHX1M U5 ( .A(sample_pos_after[3]), .B(\add_37/carry[3] ), .CO(
        \add_37/carry[4] ), .S(N12) );
  ADDHX1M U6 ( .A(sample_pos_after[2]), .B(\add_37/carry[2] ), .CO(
        \add_37/carry[3] ), .S(N11) );
  ADDHX1M U7 ( .A(sample_pos_after[5]), .B(\add_37/carry[5] ), .CO(N15), .S(
        N14) );
  ADDHX1M U8 ( .A(prescaler[5]), .B(\add_16/carry[4] ), .CO(
        sample_pos_after[5]), .S(sample_pos_after[4]) );
  OR2X2M U9 ( .A(prescaler[2]), .B(prescaler[1]), .Y(n1) );
  ADDHX1M U10 ( .A(prescaler[2]), .B(prescaler[1]), .CO(\add_16/carry[2] ), 
        .S(sample_pos_after[1]) );
  ADDHX1M U11 ( .A(prescaler[4]), .B(\add_16/carry[3] ), .CO(\add_16/carry[4] ), .S(sample_pos_after[3]) );
  ADDHX1M U12 ( .A(prescaler[3]), .B(\add_16/carry[2] ), .CO(\add_16/carry[3] ), .S(sample_pos_after[2]) );
  OAI2BB1X1M U13 ( .A0N(prescaler[1]), .A1N(prescaler[2]), .B0(n1), .Y(
        sample_pos_before[1]) );
  OR2X1M U14 ( .A(n1), .B(prescaler[3]), .Y(n2) );
  OAI2BB1X1M U15 ( .A0N(n1), .A1N(prescaler[3]), .B0(n2), .Y(
        sample_pos_before[2]) );
  XNOR2X1M U16 ( .A(prescaler[4]), .B(n2), .Y(sample_pos_before[3]) );
  NOR3X1M U17 ( .A(prescaler[4]), .B(prescaler[5]), .C(n2), .Y(
        sample_pos_before[5]) );
  OAI21X1M U18 ( .A0(prescaler[4]), .A1(n2), .B0(prescaler[5]), .Y(n3) );
  NAND2BX1M U19 ( .AN(sample_pos_before[5]), .B(n3), .Y(sample_pos_before[4])
         );
  CLKINVX1M U20 ( .A(prescaler[1]), .Y(sample_pos_after[0]) );
  NOR2BX1M U21 ( .AN(prescaler[1]), .B(edge_counter[0]), .Y(n4) );
  OAI2B2X1M U22 ( .A1N(edge_counter[1]), .A0(n4), .B0(N10), .B1(n4), .Y(n8) );
  XNOR2X1M U23 ( .A(N14), .B(edge_counter[5]), .Y(n7) );
  NOR2BX1M U24 ( .AN(edge_counter[0]), .B(prescaler[1]), .Y(n5) );
  OAI2B2X1M U25 ( .A1N(N10), .A0(n5), .B0(edge_counter[1]), .B1(n5), .Y(n6) );
  NAND4BX1M U26 ( .AN(N15), .B(n8), .C(n7), .D(n6), .Y(n12) );
  CLKXOR2X2M U27 ( .A(N13), .B(edge_counter[4]), .Y(n11) );
  CLKXOR2X2M U28 ( .A(N11), .B(edge_counter[2]), .Y(n10) );
  CLKXOR2X2M U29 ( .A(N12), .B(edge_counter[3]), .Y(n9) );
  NOR4X1M U30 ( .A(n12), .B(n11), .C(n10), .D(n9), .Y(N16) );
  CLKMX2X2M U31 ( .A(sample_stage3), .B(rx_serial_in), .S0(n13), .Y(n27) );
  NOR2X1M U32 ( .A(n14), .B(n15), .Y(n13) );
  MXI2X1M U33 ( .A(n16), .B(n17), .S0(n18), .Y(n26) );
  NOR2X1M U34 ( .A(n19), .B(n20), .Y(n18) );
  MXI2X1M U35 ( .A(n21), .B(n17), .S0(n22), .Y(n25) );
  NOR2BX1M U36 ( .AN(samp_enable), .B(n23), .Y(n22) );
  CLKINVX1M U37 ( .A(rx_serial_in), .Y(n17) );
  CLKMX2X2M U38 ( .A(n28), .B(sampled_bit), .S0(n29), .Y(n24) );
  NAND3BX1M U39 ( .AN(n14), .B(N16), .C(n15), .Y(n29) );
  NAND4X1M U40 ( .A(n30), .B(n31), .C(n32), .D(n33), .Y(n15) );
  NOR3X1M U41 ( .A(n34), .B(n35), .C(n36), .Y(n33) );
  CLKXOR2X2M U42 ( .A(sample_pos_after[4]), .B(edge_counter[4]), .Y(n36) );
  XNOR2X1M U43 ( .A(sample_pos_after[1]), .B(n37), .Y(n35) );
  CLKXOR2X2M U44 ( .A(sample_pos_after[0]), .B(edge_counter[0]), .Y(n34) );
  XNOR2X1M U45 ( .A(edge_counter[2]), .B(sample_pos_after[2]), .Y(n32) );
  XNOR2X1M U46 ( .A(edge_counter[3]), .B(sample_pos_after[3]), .Y(n31) );
  XNOR2X1M U47 ( .A(edge_counter[5]), .B(sample_pos_after[5]), .Y(n30) );
  NAND2BX1M U48 ( .AN(n19), .B(n20), .Y(n14) );
  NAND4X1M U49 ( .A(n38), .B(n39), .C(n40), .D(n41), .Y(n20) );
  NOR3X1M U50 ( .A(n42), .B(edge_counter[5]), .C(n43), .Y(n41) );
  CLKXOR2X2M U51 ( .A(prescaler[1]), .B(edge_counter[0]), .Y(n43) );
  CLKXOR2X2M U52 ( .A(prescaler[5]), .B(edge_counter[4]), .Y(n42) );
  XNOR2X1M U53 ( .A(edge_counter[2]), .B(prescaler[3]), .Y(n40) );
  XNOR2X1M U54 ( .A(edge_counter[3]), .B(prescaler[4]), .Y(n39) );
  XNOR2X1M U55 ( .A(edge_counter[1]), .B(prescaler[2]), .Y(n38) );
  CLKNAND2X2M U56 ( .A(samp_enable), .B(n23), .Y(n19) );
  NAND4X1M U57 ( .A(n44), .B(n45), .C(n46), .D(n47), .Y(n23) );
  NOR3X1M U58 ( .A(n48), .B(n49), .C(n50), .Y(n47) );
  CLKXOR2X2M U59 ( .A(sample_pos_before[4]), .B(edge_counter[4]), .Y(n50) );
  XNOR2X1M U60 ( .A(sample_pos_before[1]), .B(n37), .Y(n49) );
  CLKINVX1M U61 ( .A(edge_counter[1]), .Y(n37) );
  CLKXOR2X2M U62 ( .A(sample_pos_after[0]), .B(edge_counter[0]), .Y(n48) );
  XNOR2X1M U63 ( .A(edge_counter[2]), .B(sample_pos_before[2]), .Y(n46) );
  XNOR2X1M U64 ( .A(edge_counter[3]), .B(sample_pos_before[3]), .Y(n45) );
  XNOR2X1M U65 ( .A(edge_counter[5]), .B(sample_pos_before[5]), .Y(n44) );
  OAI21X1M U66 ( .A0(n16), .A1(n21), .B0(n51), .Y(n28) );
  OAI21X1M U67 ( .A0(sample_stage1), .A1(sample_stage2), .B0(sample_stage3), 
        .Y(n51) );
endmodule


module Edge_Bit_Counter ( clk, rst, edge_cnt_enable, prescaler, bit_index, 
        edge_index );
  input [5:0] prescaler;
  output [3:0] bit_index;
  output [5:0] edge_index;
  input clk, rst, edge_cnt_enable;
  wire   N6, N19, N20, N21, N22, N23, N25, n6, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, N26, \add_21_aco/carry[5] , \add_21_aco/carry[4] ,
         \add_21_aco/carry[3] , \add_21_aco/carry[2] ,
         \mult_add_21_aco/PROD_not[0] , n1, n2, n3, n4, n5, n7, n8, n9, n10,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30;

  DFFRX1M \bit_index_reg[3]  ( .D(n17), .CK(clk), .RN(rst), .Q(bit_index[3]), 
        .QN(n6) );
  DFFSQX2M \edge_index_reg[0]  ( .D(\mult_add_21_aco/PROD_not[0] ), .CK(clk), 
        .SN(rst), .Q(edge_index[0]) );
  DFFRX1M \bit_index_reg[0]  ( .D(n19), .CK(clk), .RN(rst), .Q(bit_index[0]), 
        .QN(n28) );
  DFFRX1M \bit_index_reg[1]  ( .D(n18), .CK(clk), .RN(rst), .Q(bit_index[1]), 
        .QN(n29) );
  DFFRX1M \bit_index_reg[2]  ( .D(n25), .CK(clk), .RN(rst), .Q(bit_index[2]), 
        .QN(n30) );
  DFFRQX1M \edge_index_reg[1]  ( .D(N19), .CK(clk), .RN(rst), .Q(edge_index[1]) );
  DFFRQX1M \edge_index_reg[2]  ( .D(N20), .CK(clk), .RN(rst), .Q(edge_index[2]) );
  DFFRQX1M \edge_index_reg[3]  ( .D(N21), .CK(clk), .RN(rst), .Q(edge_index[3]) );
  DFFRQX1M \edge_index_reg[4]  ( .D(N22), .CK(clk), .RN(rst), .Q(edge_index[4]) );
  DFFRQX1M \edge_index_reg[5]  ( .D(N23), .CK(clk), .RN(rst), .Q(edge_index[5]) );
  AND2X2M U3 ( .A(edge_index[1]), .B(N25), .Y(n1) );
  AND2X2M U4 ( .A(edge_index[2]), .B(N25), .Y(n2) );
  AND2X2M U5 ( .A(edge_index[3]), .B(N25), .Y(n3) );
  AND2X2M U6 ( .A(edge_index[4]), .B(N25), .Y(n4) );
  AND2X2M U7 ( .A(N25), .B(edge_index[5]), .Y(n5) );
  INVX2M U8 ( .A(edge_cnt_enable), .Y(n27) );
  NOR3X2M U9 ( .A(n27), .B(N25), .C(n28), .Y(n13) );
  AOI21X2M U10 ( .A0(n28), .A1(edge_cnt_enable), .B0(N25), .Y(n16) );
  ADDHX1M U11 ( .A(n1), .B(N26), .CO(\add_21_aco/carry[2] ), .S(N19) );
  NOR2X2M U12 ( .A(N6), .B(n27), .Y(N25) );
  OAI21X2M U13 ( .A0(bit_index[1]), .A1(n27), .B0(n16), .Y(n14) );
  OAI21X2M U14 ( .A0(n11), .A1(n6), .B0(n12), .Y(n17) );
  NAND4X2M U15 ( .A(bit_index[2]), .B(bit_index[1]), .C(n13), .D(n6), .Y(n12)
         );
  AOI21X2M U16 ( .A0(edge_cnt_enable), .A1(n30), .B0(n14), .Y(n11) );
  INVX2M U17 ( .A(n15), .Y(n25) );
  AOI32X1M U18 ( .A0(bit_index[1]), .A1(n30), .A2(n13), .B0(n14), .B1(
        bit_index[2]), .Y(n15) );
  ADDHX1M U19 ( .A(n2), .B(\add_21_aco/carry[2] ), .CO(\add_21_aco/carry[3] ), 
        .S(N20) );
  ADDHX1M U20 ( .A(n3), .B(\add_21_aco/carry[3] ), .CO(\add_21_aco/carry[4] ), 
        .S(N21) );
  ADDHX1M U21 ( .A(n4), .B(\add_21_aco/carry[4] ), .CO(\add_21_aco/carry[5] ), 
        .S(N22) );
  OAI32X1M U22 ( .A0(n27), .A1(bit_index[0]), .A2(N25), .B0(n28), .B1(n26), 
        .Y(n19) );
  INVX2M U23 ( .A(N25), .Y(n26) );
  OAI2BB2X1M U24 ( .B0(n16), .B1(n29), .A0N(n29), .A1N(n13), .Y(n18) );
  CLKNAND2X2M U25 ( .A(edge_index[0]), .B(N25), .Y(
        \mult_add_21_aco/PROD_not[0] ) );
  CLKINVX1M U26 ( .A(\mult_add_21_aco/PROD_not[0] ), .Y(N26) );
  CLKXOR2X2M U27 ( .A(\add_21_aco/carry[5] ), .B(n5), .Y(N23) );
  NOR2BX1M U28 ( .AN(edge_index[0]), .B(prescaler[0]), .Y(n7) );
  OAI2B2X1M U29 ( .A1N(prescaler[1]), .A0(n7), .B0(edge_index[1]), .B1(n7), 
        .Y(n20) );
  NOR2BX1M U30 ( .AN(prescaler[0]), .B(edge_index[0]), .Y(n8) );
  OAI2B2X1M U31 ( .A1N(edge_index[1]), .A0(n8), .B0(prescaler[1]), .B1(n8), 
        .Y(n10) );
  XNOR2X1M U32 ( .A(prescaler[5]), .B(edge_index[5]), .Y(n9) );
  NAND3X1M U33 ( .A(n20), .B(n10), .C(n9), .Y(n24) );
  CLKXOR2X2M U34 ( .A(prescaler[4]), .B(edge_index[4]), .Y(n23) );
  CLKXOR2X2M U35 ( .A(prescaler[2]), .B(edge_index[2]), .Y(n22) );
  CLKXOR2X2M U36 ( .A(prescaler[3]), .B(edge_index[3]), .Y(n21) );
  NOR4X1M U37 ( .A(n24), .B(n23), .C(n22), .D(n21), .Y(N6) );
endmodule


module UART_RX_FSM ( clk, rst, rx_serial_in, parity_enable, bit_index, 
        edge_index, prescaler, parity_error, start_glitch_err, stop_error, 
        samp_enable, edge_cnt_enable, parity_chk_enable, stop_chk_enable, 
        start_chk_enable, deser_enable, data_valid );
  input [3:0] bit_index;
  input [5:0] edge_index;
  input [5:0] prescaler;
  input clk, rst, rx_serial_in, parity_enable, parity_error, start_glitch_err,
         stop_error;
  output samp_enable, edge_cnt_enable, parity_chk_enable, stop_chk_enable,
         start_chk_enable, deser_enable, data_valid;
  wire   N16, N17, N18, N19, N20, N21, data_valid_next, \add_34/carry[2] ,
         \add_34/carry[3] , \add_34/carry[4] , n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  DFFRX1M \current_state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(rst), .Q(
        current_state[0]), .QN(n21) );
  DFFRX1M \current_state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(rst), .Q(
        current_state[1]), .QN(n37) );
  DFFRX1M \current_state_reg[2]  ( .D(next_state[2]), .CK(clk), .RN(rst), .Q(
        current_state[2]), .QN(n22) );
  DFFRX1M data_valid_reg ( .D(data_valid_next), .CK(clk), .RN(rst), .Q(
        data_valid) );
  AND2X1M U3 ( .A(\add_34/carry[4] ), .B(prescaler[5]), .Y(N21) );
  CLKXOR2X2M U4 ( .A(prescaler[5]), .B(\add_34/carry[4] ), .Y(N20) );
  AND2X1M U5 ( .A(\add_34/carry[3] ), .B(prescaler[4]), .Y(\add_34/carry[4] )
         );
  CLKXOR2X2M U6 ( .A(prescaler[4]), .B(\add_34/carry[3] ), .Y(N19) );
  AND2X1M U7 ( .A(\add_34/carry[2] ), .B(prescaler[3]), .Y(\add_34/carry[3] )
         );
  CLKXOR2X2M U8 ( .A(prescaler[3]), .B(\add_34/carry[2] ), .Y(N18) );
  OR2X1M U9 ( .A(prescaler[2]), .B(prescaler[1]), .Y(\add_34/carry[2] ) );
  XNOR2X1M U10 ( .A(prescaler[1]), .B(prescaler[2]), .Y(N17) );
  CLKINVX1M U11 ( .A(prescaler[1]), .Y(N16) );
  NOR2X1M U12 ( .A(n1), .B(n2), .Y(stop_chk_enable) );
  NOR3X1M U13 ( .A(n3), .B(n4), .C(n2), .Y(start_chk_enable) );
  OAI31X1M U14 ( .A0(n5), .A1(current_state[2]), .A2(n6), .B0(n7), .Y(
        samp_enable) );
  NOR3X1M U15 ( .A(n8), .B(n9), .C(n2), .Y(parity_chk_enable) );
  OAI2B11X1M U16 ( .A1N(n10), .A0(stop_error), .B0(n1), .C0(n11), .Y(
        next_state[2]) );
  AOI31X1M U17 ( .A0(n12), .A1(n13), .A2(n14), .B0(n15), .Y(n11) );
  OAI31X1M U18 ( .A0(n8), .A1(parity_error), .A2(n16), .B0(n17), .Y(n15) );
  CLKINVX1M U19 ( .A(n18), .Y(n14) );
  CLKINVX1M U20 ( .A(parity_enable), .Y(n13) );
  NAND4X1M U21 ( .A(n1), .B(n19), .C(n20), .D(n18), .Y(next_state[1]) );
  AO21XLM U22 ( .A0(n9), .A1(parity_error), .B0(n8), .Y(n19) );
  NAND3X1M U23 ( .A(n21), .B(n22), .C(current_state[1]), .Y(n8) );
  AOI22X1M U24 ( .A0(n23), .A1(n24), .B0(n25), .B1(n10), .Y(n1) );
  NAND4X1M U25 ( .A(n17), .B(n26), .C(n27), .D(n28), .Y(next_state[0]) );
  AOI221XLM U26 ( .A0(n24), .A1(n23), .B0(n29), .B1(n30), .C0(n31), .Y(n28) );
  AOI21X1M U27 ( .A0(parity_enable), .A1(n12), .B0(n18), .Y(n31) );
  OAI21X1M U28 ( .A0(n6), .A1(n3), .B0(n7), .Y(edge_cnt_enable) );
  AND2X1M U29 ( .A(n26), .B(n32), .Y(n7) );
  OAI211X1M U30 ( .A0(n33), .A1(n25), .B0(current_state[1]), .C0(n34), .Y(n32)
         );
  MXI2X1M U31 ( .A(n35), .B(n36), .S0(current_state[2]), .Y(n34) );
  NOR2X1M U32 ( .A(n21), .B(n23), .Y(n36) );
  AND3X1M U33 ( .A(parity_error), .B(n21), .C(n9), .Y(n35) );
  NAND3BX1M U34 ( .AN(rx_serial_in), .B(n37), .C(n5), .Y(n26) );
  AND2X1M U35 ( .A(n33), .B(n38), .Y(n5) );
  CLKINVX1M U36 ( .A(n30), .Y(n6) );
  CLKNAND2X2M U37 ( .A(start_glitch_err), .B(n4), .Y(n30) );
  OAI31X1M U38 ( .A0(n18), .A1(n12), .A2(n2), .B0(n20), .Y(deser_enable) );
  NAND3BX1M U39 ( .AN(start_glitch_err), .B(n29), .C(n4), .Y(n20) );
  NOR2BX1M U40 ( .AN(n39), .B(bit_index[3]), .Y(n4) );
  CLKINVX1M U41 ( .A(n3), .Y(n29) );
  CLKNAND2X2M U42 ( .A(n40), .B(n37), .Y(n3) );
  NAND4X1M U43 ( .A(n41), .B(n42), .C(n43), .D(n44), .Y(n2) );
  NOR3X1M U44 ( .A(n45), .B(n46), .C(n47), .Y(n44) );
  CLKXOR2X2M U45 ( .A(edge_index[4]), .B(N20), .Y(n47) );
  CLKXOR2X2M U46 ( .A(edge_index[1]), .B(N17), .Y(n46) );
  CLKXOR2X2M U47 ( .A(edge_index[0]), .B(N16), .Y(n45) );
  XNOR2X1M U48 ( .A(edge_index[2]), .B(N18), .Y(n43) );
  XNOR2X1M U49 ( .A(edge_index[3]), .B(N19), .Y(n42) );
  XNOR2X1M U50 ( .A(edge_index[5]), .B(N21), .Y(n41) );
  CLKNAND2X2M U51 ( .A(n40), .B(current_state[1]), .Y(n18) );
  CLKINVX1M U52 ( .A(n38), .Y(n40) );
  CLKNAND2X2M U53 ( .A(current_state[0]), .B(n22), .Y(n38) );
  OAI21X1M U54 ( .A0(n23), .A1(n17), .B0(n27), .Y(data_valid_next) );
  NAND3BX1M U55 ( .AN(n25), .B(n10), .C(n48), .Y(n27) );
  NOR2X1M U56 ( .A(n37), .B(n33), .Y(n10) );
  CLKNAND2X2M U57 ( .A(current_state[2]), .B(n21), .Y(n33) );
  CLKNAND2X2M U58 ( .A(n49), .B(n9), .Y(n25) );
  CLKINVX1M U59 ( .A(n16), .Y(n9) );
  NAND4BBX1M U60 ( .AN(bit_index[0]), .BN(bit_index[2]), .C(bit_index[1]), .D(
        bit_index[3]), .Y(n16) );
  CLKNAND2X2M U61 ( .A(n24), .B(n48), .Y(n17) );
  CLKINVX1M U62 ( .A(stop_error), .Y(n48) );
  NOR3X1M U63 ( .A(n37), .B(n22), .C(n21), .Y(n24) );
  CLKNAND2X2M U64 ( .A(n12), .B(n49), .Y(n23) );
  AND4X1M U65 ( .A(n50), .B(n51), .C(n52), .D(n53), .Y(n49) );
  NOR3X1M U66 ( .A(n54), .B(n55), .C(n56), .Y(n53) );
  CLKXOR2X2M U67 ( .A(prescaler[0]), .B(edge_index[0]), .Y(n56) );
  CLKXOR2X2M U68 ( .A(prescaler[2]), .B(edge_index[2]), .Y(n55) );
  CLKXOR2X2M U69 ( .A(prescaler[1]), .B(edge_index[1]), .Y(n54) );
  XNOR2X1M U70 ( .A(edge_index[4]), .B(prescaler[4]), .Y(n52) );
  XNOR2X1M U71 ( .A(edge_index[5]), .B(prescaler[5]), .Y(n51) );
  XNOR2X1M U72 ( .A(edge_index[3]), .B(prescaler[3]), .Y(n50) );
  AND2X1M U73 ( .A(n39), .B(bit_index[3]), .Y(n12) );
  NOR3BX1M U74 ( .AN(bit_index[0]), .B(bit_index[1]), .C(bit_index[2]), .Y(n39) );
endmodule


module UART_RX_Parity_Check ( clk, rst, parity_type, parity_chk_enable, 
        parity_bit_rx, parallel_data, parity_error );
  input [7:0] parallel_data;
  input clk, rst, parity_type, parity_chk_enable, parity_bit_rx;
  output parity_error;
  wire   n1, n3, n4, n5, n6, n7, n8, n2;

  DFFRHQX8M parity_error_reg ( .D(n8), .CK(clk), .RN(rst), .Q(parity_error) );
  OAI2BB2X1M U2 ( .B0(n1), .B1(n2), .A0N(parity_error), .A1N(n2), .Y(n8) );
  XOR3XLM U3 ( .A(n3), .B(n4), .C(n5), .Y(n1) );
  INVX2M U4 ( .A(parity_chk_enable), .Y(n2) );
  XNOR2X2M U5 ( .A(parity_type), .B(parity_bit_rx), .Y(n5) );
  XOR3XLM U6 ( .A(parallel_data[5]), .B(parallel_data[4]), .C(n6), .Y(n4) );
  XNOR2X2M U7 ( .A(parallel_data[7]), .B(parallel_data[6]), .Y(n6) );
  XOR3XLM U8 ( .A(parallel_data[1]), .B(parallel_data[0]), .C(n7), .Y(n3) );
  XNOR2X2M U9 ( .A(parallel_data[3]), .B(parallel_data[2]), .Y(n7) );
endmodule


module UART_RX_Start_Check ( clk, rst, start_chk_enable, start_bit_sampled, 
        start_glitch_err );
  input clk, rst, start_chk_enable, start_bit_sampled;
  output start_glitch_err;
  wire   n1;

  DFFRX1M start_glitch_err_reg ( .D(n1), .CK(clk), .RN(rst), .Q(
        start_glitch_err) );
  AO2B2X2M U2 ( .B0(start_chk_enable), .B1(start_bit_sampled), .A0(
        start_glitch_err), .A1N(start_chk_enable), .Y(n1) );
endmodule


module UART_RX_Stop_Check ( clk, rst, stop_chk_enable, stop_bit_sampled, 
        stop_error );
  input clk, rst, stop_chk_enable, stop_bit_sampled;
  output stop_error;
  wire   n2, n1;

  DFFRHQX8M stop_error_reg ( .D(n2), .CK(clk), .RN(rst), .Q(stop_error) );
  OAI2BB2X1M U2 ( .B0(stop_bit_sampled), .B1(n1), .A0N(stop_error), .A1N(n1), 
        .Y(n2) );
  INVX2M U3 ( .A(stop_chk_enable), .Y(n1) );
endmodule


module UART_RX_DATA_WIDTH8 ( CLK, RST, PRESCALAR, PAR_EN, PAR_TYP, RX_IN, 
        P_DATA, Parity_Error, Stop_Error, Data_Valid );
  input [5:0] PRESCALAR;
  output [7:0] P_DATA;
  input CLK, RST, PAR_EN, PAR_TYP, RX_IN;
  output Parity_Error, Stop_Error, Data_Valid;
  wire   deser_en, sampled_bit, data_samp_en, edge_bit_cnt_en, par_chk_en,
         stop_chk_en, start_chk_en, start_glitch, n1, n2;
  wire   [5:0] edge_cnt;
  wire   [3:0] bit_cnt;

  Deserializer_DATA_WIDTH8 U_Deserializer ( .clk(CLK), .rst(n1), 
        .deser_enable(deser_en), .serial_in_bit(sampled_bit), .parallel_data(
        P_DATA) );
  Data_Sampling U_Data_Sampling ( .clk(CLK), .rst(n1), .samp_enable(
        data_samp_en), .edge_counter(edge_cnt), .rx_serial_in(RX_IN), 
        .prescaler(PRESCALAR), .sampled_bit(sampled_bit) );
  Edge_Bit_Counter U_Edge_Bit_Counter ( .clk(CLK), .rst(n1), .edge_cnt_enable(
        edge_bit_cnt_en), .prescaler(PRESCALAR), .bit_index(bit_cnt), 
        .edge_index(edge_cnt) );
  UART_RX_FSM U_FSM ( .clk(CLK), .rst(n1), .rx_serial_in(RX_IN), 
        .parity_enable(PAR_EN), .bit_index(bit_cnt), .edge_index(edge_cnt), 
        .prescaler(PRESCALAR), .parity_error(Parity_Error), .start_glitch_err(
        start_glitch), .stop_error(Stop_Error), .samp_enable(data_samp_en), 
        .edge_cnt_enable(edge_bit_cnt_en), .parity_chk_enable(par_chk_en), 
        .stop_chk_enable(stop_chk_en), .start_chk_enable(start_chk_en), 
        .deser_enable(deser_en), .data_valid(Data_Valid) );
  UART_RX_Parity_Check U_Par_Check ( .clk(CLK), .rst(n1), .parity_type(PAR_TYP), .parity_chk_enable(par_chk_en), .parity_bit_rx(sampled_bit), .parallel_data(
        P_DATA), .parity_error(Parity_Error) );
  UART_RX_Start_Check U_Start_Check ( .clk(CLK), .rst(n1), .start_chk_enable(
        start_chk_en), .start_bit_sampled(sampled_bit), .start_glitch_err(
        start_glitch) );
  UART_RX_Stop_Check U_Stop_Check ( .clk(CLK), .rst(n1), .stop_chk_enable(
        stop_chk_en), .stop_bit_sampled(sampled_bit), .stop_error(Stop_Error)
         );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module UART_TOP ( RST, TX_CLK, RX_CLK, RX_IN_S, RX_OUT_P, RX_OUT_V, TX_IN_P, 
        TX_IN_V, TX_OUT_S, TX_OUT_V, Prescale, parity_enable, parity_type, 
        parity_error, framing_error );
  output [7:0] RX_OUT_P;
  input [7:0] TX_IN_P;
  input [5:0] Prescale;
  input RST, TX_CLK, RX_CLK, RX_IN_S, TX_IN_V, parity_enable, parity_type;
  output RX_OUT_V, TX_OUT_S, TX_OUT_V, parity_error, framing_error;
  wire   n1, n2;

  UART_TX_DATA_WIDTH8 u_uart_tx ( .clk(TX_CLK), .rst(n1), .p_data(TX_IN_P), 
        .data_valid(TX_IN_V), .par_en(parity_enable), .par_typ(parity_type), 
        .tx_out(TX_OUT_S), .busy(TX_OUT_V) );
  UART_RX_DATA_WIDTH8 u_uart_rx ( .CLK(RX_CLK), .RST(n1), .PRESCALAR(Prescale), 
        .PAR_EN(parity_enable), .PAR_TYP(parity_type), .RX_IN(RX_IN_S), 
        .P_DATA(RX_OUT_P), .Parity_Error(parity_error), .Stop_Error(
        framing_error), .Data_Valid(RX_OUT_V) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module SYS_CTRL ( CLK, RST, FIFO_FULL, ALU_OUT, ALU_OUT_Valid, ALU_FUN, ALU_EN, 
        CLK_Gate_EN, Address, WrEn, RdEn, WrData, RdData, RdData_Valid, 
        RX_P_DATA, RX_D_VLD, TX_P_DATA, TX_D_VLD, clk_div_en );
  input [15:0] ALU_OUT;
  output [3:0] ALU_FUN;
  output [3:0] Address;
  output [7:0] WrData;
  input [7:0] RdData;
  input [7:0] RX_P_DATA;
  output [7:0] TX_P_DATA;
  input CLK, RST, FIFO_FULL, ALU_OUT_Valid, RdData_Valid, RX_D_VLD;
  output ALU_EN, CLK_Gate_EN, WrEn, RdEn, TX_D_VLD, clk_div_en;
  wire   n1, n13, n17, n18, n19, n22, n23, n24, n25, n27, n28, n29, n30, n31,
         n34, n35, n39, n40, n41, n42, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n54, n55, n56, n57, n58, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n4, n5, n6, n7, n9, n10, n11, n12, n14, n15,
         n16, n20, n21, n26, n32, n33, n36, n37, n38, n43, n53, n59, n60, n76,
         n77, n78, n79;
  wire   [3:0] current_state;
  wire   [3:0] stored_alu_function;

  DFFRQX2M \stored_alu_function_reg[3]  ( .D(n83), .CK(CLK), .RN(RST), .Q(
        stored_alu_function[3]) );
  DFFRQX2M \stored_alu_function_reg[2]  ( .D(n82), .CK(CLK), .RN(RST), .Q(
        stored_alu_function[2]) );
  DFFRQX2M \stored_alu_function_reg[1]  ( .D(n81), .CK(CLK), .RN(RST), .Q(
        stored_alu_function[1]) );
  DFFRQX2M \stored_alu_function_reg[0]  ( .D(n80), .CK(CLK), .RN(RST), .Q(
        stored_alu_function[0]) );
  DFFRX1M \stored_address_reg[3]  ( .D(n87), .CK(CLK), .RN(RST), .QN(n21) );
  DFFRX1M \stored_address_reg[2]  ( .D(n86), .CK(CLK), .RN(RST), .QN(n26) );
  DFFRX1M \stored_address_reg[1]  ( .D(n85), .CK(CLK), .RN(RST), .QN(n32) );
  DFFRX1M \stored_address_reg[0]  ( .D(n84), .CK(CLK), .RN(RST), .QN(n33) );
  DFFRQX2M \current_state_reg[3]  ( .D(n90), .CK(CLK), .RN(RST), .Q(
        current_state[3]) );
  DFFRQX2M \current_state_reg[0]  ( .D(n91), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  DFFRQX2M \current_state_reg[2]  ( .D(n89), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[1]  ( .D(n88), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  INVX2M U3 ( .A(1'b0), .Y(clk_div_en) );
  OAI22X1M U5 ( .A0(n52), .A1(n37), .B0(n1), .B1(n60), .Y(ALU_FUN[2]) );
  OAI22X1M U6 ( .A0(n52), .A1(n38), .B0(n1), .B1(n59), .Y(ALU_FUN[1]) );
  OAI22X1M U7 ( .A0(n52), .A1(n36), .B0(n1), .B1(n76), .Y(ALU_FUN[3]) );
  OAI22X1M U8 ( .A0(n52), .A1(n43), .B0(n1), .B1(n53), .Y(ALU_FUN[0]) );
  NOR2X2M U9 ( .A(n74), .B(n26), .Y(Address[2]) );
  AOI2B1X1M U10 ( .A1N(n57), .A0(RX_D_VLD), .B0(RdEn), .Y(n74) );
  INVX2M U11 ( .A(n46), .Y(n11) );
  INVX2M U12 ( .A(WrEn), .Y(n6) );
  INVX2M U13 ( .A(n47), .Y(n12) );
  NAND2X2M U14 ( .A(n75), .B(n14), .Y(n47) );
  AND2X2M U15 ( .A(n73), .B(n47), .Y(n52) );
  NAND2X2M U16 ( .A(n52), .B(n1), .Y(ALU_EN) );
  NAND2X2M U17 ( .A(n14), .B(n15), .Y(n46) );
  OR3X2M U18 ( .A(n64), .B(n4), .C(n62), .Y(TX_D_VLD) );
  INVX2M U19 ( .A(n56), .Y(n10) );
  OAI22X1M U20 ( .A0(n79), .A1(n61), .B0(n74), .B1(n33), .Y(Address[0]) );
  NOR2X4M U21 ( .A(n74), .B(n21), .Y(Address[3]) );
  AOI2B1X1M U22 ( .A1N(n55), .A0(n57), .B0(n79), .Y(WrEn) );
  NOR2X2M U23 ( .A(n73), .B(FIFO_FULL), .Y(n64) );
  AOI2BB2XLM U24 ( .B0(n12), .B1(n5), .A0N(n18), .A1N(n19), .Y(n27) );
  OAI22X1M U25 ( .A0(n5), .A1(n15), .B0(n34), .B1(n35), .Y(n90) );
  NOR2X2M U26 ( .A(n10), .B(n12), .Y(n34) );
  OAI211X2M U27 ( .A0(n5), .A1(n14), .B0(n27), .C0(n39), .Y(n91) );
  AND3X2M U28 ( .A(n40), .B(n24), .C(n41), .Y(n39) );
  NAND3X2M U29 ( .A(n23), .B(n77), .C(n53), .Y(n40) );
  INVX2M U30 ( .A(n35), .Y(n5) );
  NOR2X2M U31 ( .A(n53), .B(n6), .Y(WrData[0]) );
  NOR2X2M U32 ( .A(n59), .B(n6), .Y(WrData[1]) );
  NOR2X2M U33 ( .A(n60), .B(n6), .Y(WrData[2]) );
  NOR2X2M U34 ( .A(n76), .B(n6), .Y(WrData[3]) );
  NOR2X2M U35 ( .A(n77), .B(n6), .Y(WrData[4]) );
  NOR2X2M U36 ( .A(n78), .B(n6), .Y(WrData[5]) );
  NAND3X2M U37 ( .A(n20), .B(n16), .C(n58), .Y(n24) );
  NAND3BX2M U38 ( .AN(n55), .B(n25), .C(n56), .Y(n31) );
  NAND2X2M U39 ( .A(n57), .B(n24), .Y(n54) );
  NAND2X2M U40 ( .A(n61), .B(n41), .Y(n55) );
  NOR2X2M U41 ( .A(n74), .B(n32), .Y(Address[1]) );
  OAI22X1M U42 ( .A0(n1), .A1(n53), .B0(n9), .B1(n43), .Y(n80) );
  OAI22X1M U43 ( .A0(n1), .A1(n59), .B0(n9), .B1(n38), .Y(n81) );
  OAI22X1M U44 ( .A0(n1), .A1(n60), .B0(n9), .B1(n37), .Y(n82) );
  OAI22X1M U45 ( .A0(n1), .A1(n76), .B0(n9), .B1(n36), .Y(n83) );
  OAI22X1M U46 ( .A0(n7), .A1(n21), .B0(n76), .B1(n13), .Y(n87) );
  OAI22X1M U47 ( .A0(n7), .A1(n32), .B0(n59), .B1(n13), .Y(n85) );
  OAI22X1M U48 ( .A0(n7), .A1(n33), .B0(n53), .B1(n13), .Y(n84) );
  OAI22X1M U49 ( .A0(n7), .A1(n26), .B0(n60), .B1(n13), .Y(n86) );
  INVX2M U50 ( .A(n1), .Y(n9) );
  NAND2X2M U51 ( .A(n24), .B(n25), .Y(n17) );
  INVX2M U52 ( .A(n13), .Y(n7) );
  NAND2X2M U53 ( .A(n52), .B(n56), .Y(CLK_Gate_EN) );
  INVX2M U54 ( .A(n51), .Y(RdEn) );
  NOR3X2M U55 ( .A(n16), .B(current_state[1]), .C(n15), .Y(n75) );
  NOR2X2M U56 ( .A(n14), .B(current_state[3]), .Y(n58) );
  NAND2X2M U57 ( .A(RX_D_VLD), .B(n10), .Y(n1) );
  NAND3X2M U58 ( .A(current_state[2]), .B(n11), .C(current_state[1]), .Y(n51)
         );
  NAND3X2M U59 ( .A(current_state[1]), .B(n16), .C(n58), .Y(n57) );
  INVX2M U60 ( .A(current_state[2]), .Y(n16) );
  NAND3X2M U61 ( .A(n11), .B(n20), .C(current_state[2]), .Y(n56) );
  INVX2M U62 ( .A(current_state[1]), .Y(n20) );
  NAND2X2M U63 ( .A(n75), .B(current_state[0]), .Y(n73) );
  INVX2M U64 ( .A(RX_P_DATA[2]), .Y(n60) );
  INVX2M U65 ( .A(RX_P_DATA[1]), .Y(n59) );
  INVX2M U66 ( .A(current_state[0]), .Y(n14) );
  INVX2M U67 ( .A(RX_P_DATA[3]), .Y(n76) );
  INVX2M U68 ( .A(current_state[3]), .Y(n15) );
  BUFX2M U69 ( .A(n65), .Y(n4) );
  NOR3BX2M U70 ( .AN(ALU_OUT_Valid), .B(n47), .C(FIFO_FULL), .Y(n65) );
  NOR3BX2M U71 ( .AN(RdData_Valid), .B(n51), .C(FIFO_FULL), .Y(n62) );
  NOR3BX2M U72 ( .AN(n42), .B(n78), .C(n18), .Y(n23) );
  NOR3X2M U73 ( .A(n59), .B(RX_P_DATA[6]), .C(RX_P_DATA[2]), .Y(n42) );
  OAI211X2M U74 ( .A0(RX_D_VLD), .A1(n48), .B0(n49), .C0(n50), .Y(n35) );
  OA22X2M U75 ( .A0(n51), .A1(RdData_Valid), .B0(n47), .B1(ALU_OUT_Valid), .Y(
        n50) );
  OAI2BB1X2M U76 ( .A0N(n51), .A1N(n52), .B0(FIFO_FULL), .Y(n49) );
  AOI211X2M U77 ( .A0(n11), .A1(n20), .B0(n54), .C0(n31), .Y(n48) );
  OAI221X1M U78 ( .A0(n18), .A1(n19), .B0(n5), .B1(n20), .C0(n22), .Y(n88) );
  AOI32X1M U79 ( .A0(n23), .A1(RX_P_DATA[0]), .A2(RX_P_DATA[4]), .B0(n5), .B1(
        n17), .Y(n22) );
  OAI2BB1X2M U80 ( .A0N(RdData[0]), .A1N(n62), .B0(n72), .Y(TX_P_DATA[0]) );
  AOI22X1M U81 ( .A0(ALU_OUT[8]), .A1(n64), .B0(ALU_OUT[0]), .B1(n4), .Y(n72)
         );
  OAI2BB1X2M U82 ( .A0N(RdData[1]), .A1N(n62), .B0(n71), .Y(TX_P_DATA[1]) );
  AOI22X1M U83 ( .A0(ALU_OUT[9]), .A1(n64), .B0(ALU_OUT[1]), .B1(n4), .Y(n71)
         );
  OAI2BB1X2M U84 ( .A0N(RdData[2]), .A1N(n62), .B0(n70), .Y(TX_P_DATA[2]) );
  AOI22X1M U85 ( .A0(ALU_OUT[10]), .A1(n64), .B0(ALU_OUT[2]), .B1(n4), .Y(n70)
         );
  OAI2BB1X2M U86 ( .A0N(RdData[3]), .A1N(n62), .B0(n69), .Y(TX_P_DATA[3]) );
  AOI22X1M U87 ( .A0(ALU_OUT[11]), .A1(n64), .B0(ALU_OUT[3]), .B1(n4), .Y(n69)
         );
  OAI2BB1X2M U88 ( .A0N(RdData[4]), .A1N(n62), .B0(n68), .Y(TX_P_DATA[4]) );
  AOI22X1M U89 ( .A0(ALU_OUT[12]), .A1(n64), .B0(ALU_OUT[4]), .B1(n4), .Y(n68)
         );
  OAI2BB1X2M U90 ( .A0N(RdData[5]), .A1N(n62), .B0(n67), .Y(TX_P_DATA[5]) );
  AOI22X1M U91 ( .A0(ALU_OUT[13]), .A1(n64), .B0(ALU_OUT[5]), .B1(n4), .Y(n67)
         );
  OAI2BB1X2M U92 ( .A0N(RdData[6]), .A1N(n62), .B0(n66), .Y(TX_P_DATA[6]) );
  AOI22X1M U93 ( .A0(ALU_OUT[14]), .A1(n64), .B0(ALU_OUT[6]), .B1(n4), .Y(n66)
         );
  OAI2BB1X2M U94 ( .A0N(RdData[7]), .A1N(n62), .B0(n63), .Y(TX_P_DATA[7]) );
  AOI22X1M U95 ( .A0(ALU_OUT[15]), .A1(n64), .B0(ALU_OUT[7]), .B1(n4), .Y(n63)
         );
  NOR2BX2M U96 ( .AN(RX_P_DATA[6]), .B(n6), .Y(WrData[6]) );
  NOR2BX2M U97 ( .AN(RX_P_DATA[7]), .B(n6), .Y(WrData[7]) );
  NAND4X2M U98 ( .A(n5), .B(RX_P_DATA[3]), .C(RX_P_DATA[7]), .D(n45), .Y(n18)
         );
  NOR3X2M U99 ( .A(n46), .B(current_state[2]), .C(current_state[1]), .Y(n45)
         );
  INVX2M U100 ( .A(RX_P_DATA[0]), .Y(n53) );
  NAND3X2M U101 ( .A(current_state[2]), .B(n20), .C(n58), .Y(n61) );
  NAND3X2M U102 ( .A(current_state[1]), .B(current_state[2]), .C(n58), .Y(n41)
         );
  NAND3X2M U103 ( .A(n11), .B(n16), .C(current_state[1]), .Y(n25) );
  OAI211X2M U104 ( .A0(n5), .A1(n16), .B0(n27), .C0(n28), .Y(n89) );
  AOI32X1M U105 ( .A0(n29), .A1(RX_P_DATA[6]), .A2(n30), .B0(n5), .B1(n31), 
        .Y(n28) );
  NOR4X1M U106 ( .A(RX_P_DATA[5]), .B(RX_P_DATA[1]), .C(n53), .D(n60), .Y(n30)
         );
  NOR2X2M U107 ( .A(n18), .B(n77), .Y(n29) );
  INVX2M U108 ( .A(RX_D_VLD), .Y(n79) );
  INVX2M U109 ( .A(stored_alu_function[2]), .Y(n37) );
  INVX2M U110 ( .A(stored_alu_function[1]), .Y(n38) );
  INVX2M U111 ( .A(stored_alu_function[3]), .Y(n36) );
  INVX2M U112 ( .A(stored_alu_function[0]), .Y(n43) );
  NAND2X2M U113 ( .A(RX_D_VLD), .B(n17), .Y(n13) );
  NAND4X2M U114 ( .A(RX_P_DATA[2]), .B(n53), .C(RX_P_DATA[6]), .D(n44), .Y(n19) );
  NOR3X2M U115 ( .A(RX_P_DATA[1]), .B(RX_P_DATA[5]), .C(RX_P_DATA[4]), .Y(n44)
         );
  INVX2M U116 ( .A(RX_P_DATA[4]), .Y(n77) );
  INVX2M U117 ( .A(RX_P_DATA[5]), .Y(n78) );
endmodule


module REG_FILE ( CLK, RST, WrData, Address, WrEn, RdEn, RdData_Valid, RdData, 
        REG0, REG1, REG2, REG3 );
  input [7:0] WrData;
  input [3:0] Address;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, WrEn, RdEn;
  output RdData_Valid;
  wire   N11, N12, N13, N14, \reg_file[15][7] , \reg_file[15][6] ,
         \reg_file[15][5] , \reg_file[15][4] , \reg_file[15][3] ,
         \reg_file[15][2] , \reg_file[15][1] , \reg_file[15][0] ,
         \reg_file[14][7] , \reg_file[14][6] , \reg_file[14][5] ,
         \reg_file[14][4] , \reg_file[14][3] , \reg_file[14][2] ,
         \reg_file[14][1] , \reg_file[14][0] , \reg_file[13][7] ,
         \reg_file[13][6] , \reg_file[13][5] , \reg_file[13][4] ,
         \reg_file[13][3] , \reg_file[13][2] , \reg_file[13][1] ,
         \reg_file[13][0] , \reg_file[12][7] , \reg_file[12][6] ,
         \reg_file[12][5] , \reg_file[12][4] , \reg_file[12][3] ,
         \reg_file[12][2] , \reg_file[12][1] , \reg_file[12][0] ,
         \reg_file[11][7] , \reg_file[11][6] , \reg_file[11][5] ,
         \reg_file[11][4] , \reg_file[11][3] , \reg_file[11][2] ,
         \reg_file[11][1] , \reg_file[11][0] , \reg_file[10][7] ,
         \reg_file[10][6] , \reg_file[10][5] , \reg_file[10][4] ,
         \reg_file[10][3] , \reg_file[10][2] , \reg_file[10][1] ,
         \reg_file[10][0] , \reg_file[9][7] , \reg_file[9][6] ,
         \reg_file[9][5] , \reg_file[9][4] , \reg_file[9][3] ,
         \reg_file[9][2] , \reg_file[9][1] , \reg_file[9][0] ,
         \reg_file[8][7] , \reg_file[8][6] , \reg_file[8][5] ,
         \reg_file[8][4] , \reg_file[8][3] , \reg_file[8][2] ,
         \reg_file[8][1] , \reg_file[8][0] , \reg_file[7][7] ,
         \reg_file[7][6] , \reg_file[7][5] , \reg_file[7][4] ,
         \reg_file[7][3] , \reg_file[7][2] , \reg_file[7][1] ,
         \reg_file[7][0] , \reg_file[6][7] , \reg_file[6][6] ,
         \reg_file[6][5] , \reg_file[6][4] , \reg_file[6][3] ,
         \reg_file[6][2] , \reg_file[6][1] , \reg_file[6][0] ,
         \reg_file[5][7] , \reg_file[5][6] , \reg_file[5][5] ,
         \reg_file[5][4] , \reg_file[5][3] , \reg_file[5][2] ,
         \reg_file[5][1] , \reg_file[5][0] , \reg_file[4][7] ,
         \reg_file[4][6] , \reg_file[4][5] , \reg_file[4][4] ,
         \reg_file[4][3] , \reg_file[4][2] , \reg_file[4][1] ,
         \reg_file[4][0] , N36, N37, N38, N39, N40, N41, N42, N43, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];

  DFFRQX2M \RdData_reg[7]  ( .D(n47), .CK(CLK), .RN(n205), .Q(RdData[7]) );
  DFFRQX2M \RdData_reg[6]  ( .D(n46), .CK(CLK), .RN(n205), .Q(RdData[6]) );
  DFFRQX2M \RdData_reg[5]  ( .D(n45), .CK(CLK), .RN(n205), .Q(RdData[5]) );
  DFFRQX2M \RdData_reg[4]  ( .D(n44), .CK(CLK), .RN(n205), .Q(RdData[4]) );
  DFFRQX2M \RdData_reg[3]  ( .D(n43), .CK(CLK), .RN(n205), .Q(RdData[3]) );
  DFFRQX2M \RdData_reg[2]  ( .D(n42), .CK(CLK), .RN(n205), .Q(RdData[2]) );
  DFFRQX2M \RdData_reg[1]  ( .D(n41), .CK(CLK), .RN(n205), .Q(RdData[1]) );
  DFFRQX2M \RdData_reg[0]  ( .D(n40), .CK(CLK), .RN(n209), .Q(RdData[0]) );
  DFFRQX2M \reg_file_reg[13][7]  ( .D(n160), .CK(CLK), .RN(n213), .Q(
        \reg_file[13][7] ) );
  DFFRQX2M \reg_file_reg[13][6]  ( .D(n159), .CK(CLK), .RN(n213), .Q(
        \reg_file[13][6] ) );
  DFFRQX2M \reg_file_reg[13][5]  ( .D(n158), .CK(CLK), .RN(n212), .Q(
        \reg_file[13][5] ) );
  DFFRQX2M \reg_file_reg[13][4]  ( .D(n157), .CK(CLK), .RN(n212), .Q(
        \reg_file[13][4] ) );
  DFFRQX2M \reg_file_reg[13][3]  ( .D(n156), .CK(CLK), .RN(n212), .Q(
        \reg_file[13][3] ) );
  DFFRQX2M \reg_file_reg[13][2]  ( .D(n155), .CK(CLK), .RN(n212), .Q(
        \reg_file[13][2] ) );
  DFFRQX2M \reg_file_reg[13][1]  ( .D(n154), .CK(CLK), .RN(n212), .Q(
        \reg_file[13][1] ) );
  DFFRQX2M \reg_file_reg[13][0]  ( .D(n153), .CK(CLK), .RN(n212), .Q(
        \reg_file[13][0] ) );
  DFFRQX2M \reg_file_reg[9][7]  ( .D(n128), .CK(CLK), .RN(n210), .Q(
        \reg_file[9][7] ) );
  DFFRQX2M \reg_file_reg[9][6]  ( .D(n127), .CK(CLK), .RN(n210), .Q(
        \reg_file[9][6] ) );
  DFFRQX2M \reg_file_reg[9][5]  ( .D(n126), .CK(CLK), .RN(n210), .Q(
        \reg_file[9][5] ) );
  DFFRQX2M \reg_file_reg[9][4]  ( .D(n125), .CK(CLK), .RN(n210), .Q(
        \reg_file[9][4] ) );
  DFFRQX2M \reg_file_reg[9][3]  ( .D(n124), .CK(CLK), .RN(n210), .Q(
        \reg_file[9][3] ) );
  DFFRQX2M \reg_file_reg[9][2]  ( .D(n123), .CK(CLK), .RN(n210), .Q(
        \reg_file[9][2] ) );
  DFFRQX2M \reg_file_reg[9][1]  ( .D(n122), .CK(CLK), .RN(n210), .Q(
        \reg_file[9][1] ) );
  DFFRQX2M \reg_file_reg[9][0]  ( .D(n121), .CK(CLK), .RN(n210), .Q(
        \reg_file[9][0] ) );
  DFFRQX2M \reg_file_reg[5][7]  ( .D(n96), .CK(CLK), .RN(n208), .Q(
        \reg_file[5][7] ) );
  DFFRQX2M \reg_file_reg[5][6]  ( .D(n95), .CK(CLK), .RN(n208), .Q(
        \reg_file[5][6] ) );
  DFFRQX2M \reg_file_reg[5][5]  ( .D(n94), .CK(CLK), .RN(n208), .Q(
        \reg_file[5][5] ) );
  DFFRQX2M \reg_file_reg[5][4]  ( .D(n93), .CK(CLK), .RN(n208), .Q(
        \reg_file[5][4] ) );
  DFFRQX2M \reg_file_reg[5][3]  ( .D(n92), .CK(CLK), .RN(n208), .Q(
        \reg_file[5][3] ) );
  DFFRQX2M \reg_file_reg[5][2]  ( .D(n91), .CK(CLK), .RN(n208), .Q(
        \reg_file[5][2] ) );
  DFFRQX2M \reg_file_reg[5][1]  ( .D(n90), .CK(CLK), .RN(n208), .Q(
        \reg_file[5][1] ) );
  DFFRQX2M \reg_file_reg[5][0]  ( .D(n89), .CK(CLK), .RN(n208), .Q(
        \reg_file[5][0] ) );
  DFFRQX2M \reg_file_reg[15][7]  ( .D(n176), .CK(CLK), .RN(n205), .Q(
        \reg_file[15][7] ) );
  DFFRQX2M \reg_file_reg[15][6]  ( .D(n175), .CK(CLK), .RN(n214), .Q(
        \reg_file[15][6] ) );
  DFFRQX2M \reg_file_reg[15][5]  ( .D(n174), .CK(CLK), .RN(n214), .Q(
        \reg_file[15][5] ) );
  DFFRQX2M \reg_file_reg[15][4]  ( .D(n173), .CK(CLK), .RN(n213), .Q(
        \reg_file[15][4] ) );
  DFFRQX2M \reg_file_reg[15][3]  ( .D(n172), .CK(CLK), .RN(n213), .Q(
        \reg_file[15][3] ) );
  DFFRQX2M \reg_file_reg[15][2]  ( .D(n171), .CK(CLK), .RN(n213), .Q(
        \reg_file[15][2] ) );
  DFFRQX2M \reg_file_reg[15][1]  ( .D(n170), .CK(CLK), .RN(n213), .Q(
        \reg_file[15][1] ) );
  DFFRQX2M \reg_file_reg[15][0]  ( .D(n169), .CK(CLK), .RN(n213), .Q(
        \reg_file[15][0] ) );
  DFFRQX2M \reg_file_reg[11][7]  ( .D(n144), .CK(CLK), .RN(n212), .Q(
        \reg_file[11][7] ) );
  DFFRQX2M \reg_file_reg[11][6]  ( .D(n143), .CK(CLK), .RN(n211), .Q(
        \reg_file[11][6] ) );
  DFFRQX2M \reg_file_reg[11][5]  ( .D(n142), .CK(CLK), .RN(n211), .Q(
        \reg_file[11][5] ) );
  DFFRQX2M \reg_file_reg[11][4]  ( .D(n141), .CK(CLK), .RN(n211), .Q(
        \reg_file[11][4] ) );
  DFFRQX2M \reg_file_reg[11][3]  ( .D(n140), .CK(CLK), .RN(n211), .Q(
        \reg_file[11][3] ) );
  DFFRQX2M \reg_file_reg[11][2]  ( .D(n139), .CK(CLK), .RN(n211), .Q(
        \reg_file[11][2] ) );
  DFFRQX2M \reg_file_reg[11][1]  ( .D(n138), .CK(CLK), .RN(n211), .Q(
        \reg_file[11][1] ) );
  DFFRQX2M \reg_file_reg[11][0]  ( .D(n137), .CK(CLK), .RN(n211), .Q(
        \reg_file[11][0] ) );
  DFFRQX2M \reg_file_reg[7][7]  ( .D(n112), .CK(CLK), .RN(n209), .Q(
        \reg_file[7][7] ) );
  DFFRQX2M \reg_file_reg[7][6]  ( .D(n111), .CK(CLK), .RN(n209), .Q(
        \reg_file[7][6] ) );
  DFFRQX2M \reg_file_reg[7][5]  ( .D(n110), .CK(CLK), .RN(n209), .Q(
        \reg_file[7][5] ) );
  DFFRQX2M \reg_file_reg[7][4]  ( .D(n109), .CK(CLK), .RN(n209), .Q(
        \reg_file[7][4] ) );
  DFFRQX2M \reg_file_reg[7][3]  ( .D(n108), .CK(CLK), .RN(n209), .Q(
        \reg_file[7][3] ) );
  DFFRQX2M \reg_file_reg[7][2]  ( .D(n107), .CK(CLK), .RN(n209), .Q(
        \reg_file[7][2] ) );
  DFFRQX2M \reg_file_reg[7][1]  ( .D(n106), .CK(CLK), .RN(n209), .Q(
        \reg_file[7][1] ) );
  DFFRQX2M \reg_file_reg[7][0]  ( .D(n105), .CK(CLK), .RN(n209), .Q(
        \reg_file[7][0] ) );
  DFFRQX2M \reg_file_reg[14][7]  ( .D(n168), .CK(CLK), .RN(n213), .Q(
        \reg_file[14][7] ) );
  DFFRQX2M \reg_file_reg[14][6]  ( .D(n167), .CK(CLK), .RN(n213), .Q(
        \reg_file[14][6] ) );
  DFFRQX2M \reg_file_reg[14][5]  ( .D(n166), .CK(CLK), .RN(n213), .Q(
        \reg_file[14][5] ) );
  DFFRQX2M \reg_file_reg[14][4]  ( .D(n165), .CK(CLK), .RN(n213), .Q(
        \reg_file[14][4] ) );
  DFFRQX2M \reg_file_reg[14][3]  ( .D(n164), .CK(CLK), .RN(n213), .Q(
        \reg_file[14][3] ) );
  DFFRQX2M \reg_file_reg[14][2]  ( .D(n163), .CK(CLK), .RN(n213), .Q(
        \reg_file[14][2] ) );
  DFFRQX2M \reg_file_reg[14][1]  ( .D(n162), .CK(CLK), .RN(n213), .Q(
        \reg_file[14][1] ) );
  DFFRQX2M \reg_file_reg[14][0]  ( .D(n161), .CK(CLK), .RN(n213), .Q(
        \reg_file[14][0] ) );
  DFFRQX2M \reg_file_reg[10][7]  ( .D(n136), .CK(CLK), .RN(n211), .Q(
        \reg_file[10][7] ) );
  DFFRQX2M \reg_file_reg[10][6]  ( .D(n135), .CK(CLK), .RN(n211), .Q(
        \reg_file[10][6] ) );
  DFFRQX2M \reg_file_reg[10][5]  ( .D(n134), .CK(CLK), .RN(n211), .Q(
        \reg_file[10][5] ) );
  DFFRQX2M \reg_file_reg[10][4]  ( .D(n133), .CK(CLK), .RN(n211), .Q(
        \reg_file[10][4] ) );
  DFFRQX2M \reg_file_reg[10][3]  ( .D(n132), .CK(CLK), .RN(n211), .Q(
        \reg_file[10][3] ) );
  DFFRQX2M \reg_file_reg[10][2]  ( .D(n131), .CK(CLK), .RN(n211), .Q(
        \reg_file[10][2] ) );
  DFFRQX2M \reg_file_reg[10][1]  ( .D(n130), .CK(CLK), .RN(n211), .Q(
        \reg_file[10][1] ) );
  DFFRQX2M \reg_file_reg[10][0]  ( .D(n129), .CK(CLK), .RN(n211), .Q(
        \reg_file[10][0] ) );
  DFFRQX2M \reg_file_reg[6][7]  ( .D(n104), .CK(CLK), .RN(n209), .Q(
        \reg_file[6][7] ) );
  DFFRQX2M \reg_file_reg[6][6]  ( .D(n103), .CK(CLK), .RN(n209), .Q(
        \reg_file[6][6] ) );
  DFFRQX2M \reg_file_reg[6][5]  ( .D(n102), .CK(CLK), .RN(n209), .Q(
        \reg_file[6][5] ) );
  DFFRQX2M \reg_file_reg[6][4]  ( .D(n101), .CK(CLK), .RN(n209), .Q(
        \reg_file[6][4] ) );
  DFFRQX2M \reg_file_reg[6][3]  ( .D(n100), .CK(CLK), .RN(n209), .Q(
        \reg_file[6][3] ) );
  DFFRQX2M \reg_file_reg[6][2]  ( .D(n99), .CK(CLK), .RN(n208), .Q(
        \reg_file[6][2] ) );
  DFFRQX2M \reg_file_reg[6][1]  ( .D(n98), .CK(CLK), .RN(n208), .Q(
        \reg_file[6][1] ) );
  DFFRQX2M \reg_file_reg[6][0]  ( .D(n97), .CK(CLK), .RN(n208), .Q(
        \reg_file[6][0] ) );
  DFFRQX2M \reg_file_reg[12][7]  ( .D(n152), .CK(CLK), .RN(n212), .Q(
        \reg_file[12][7] ) );
  DFFRQX2M \reg_file_reg[12][6]  ( .D(n151), .CK(CLK), .RN(n212), .Q(
        \reg_file[12][6] ) );
  DFFRQX2M \reg_file_reg[12][5]  ( .D(n150), .CK(CLK), .RN(n212), .Q(
        \reg_file[12][5] ) );
  DFFRQX2M \reg_file_reg[12][4]  ( .D(n149), .CK(CLK), .RN(n212), .Q(
        \reg_file[12][4] ) );
  DFFRQX2M \reg_file_reg[12][3]  ( .D(n148), .CK(CLK), .RN(n212), .Q(
        \reg_file[12][3] ) );
  DFFRQX2M \reg_file_reg[12][2]  ( .D(n147), .CK(CLK), .RN(n212), .Q(
        \reg_file[12][2] ) );
  DFFRQX2M \reg_file_reg[12][1]  ( .D(n146), .CK(CLK), .RN(n212), .Q(
        \reg_file[12][1] ) );
  DFFRQX2M \reg_file_reg[12][0]  ( .D(n145), .CK(CLK), .RN(n212), .Q(
        \reg_file[12][0] ) );
  DFFRQX2M \reg_file_reg[8][7]  ( .D(n120), .CK(CLK), .RN(n210), .Q(
        \reg_file[8][7] ) );
  DFFRQX2M \reg_file_reg[8][6]  ( .D(n119), .CK(CLK), .RN(n210), .Q(
        \reg_file[8][6] ) );
  DFFRQX2M \reg_file_reg[8][5]  ( .D(n118), .CK(CLK), .RN(n210), .Q(
        \reg_file[8][5] ) );
  DFFRQX2M \reg_file_reg[8][4]  ( .D(n117), .CK(CLK), .RN(n210), .Q(
        \reg_file[8][4] ) );
  DFFRQX2M \reg_file_reg[8][3]  ( .D(n116), .CK(CLK), .RN(n210), .Q(
        \reg_file[8][3] ) );
  DFFRQX2M \reg_file_reg[8][2]  ( .D(n115), .CK(CLK), .RN(n210), .Q(
        \reg_file[8][2] ) );
  DFFRQX2M \reg_file_reg[8][1]  ( .D(n114), .CK(CLK), .RN(n210), .Q(
        \reg_file[8][1] ) );
  DFFRQX2M \reg_file_reg[8][0]  ( .D(n113), .CK(CLK), .RN(n209), .Q(
        \reg_file[8][0] ) );
  DFFRQX2M \reg_file_reg[4][7]  ( .D(n88), .CK(CLK), .RN(n208), .Q(
        \reg_file[4][7] ) );
  DFFRQX2M \reg_file_reg[4][6]  ( .D(n87), .CK(CLK), .RN(n208), .Q(
        \reg_file[4][6] ) );
  DFFRQX2M \reg_file_reg[4][5]  ( .D(n86), .CK(CLK), .RN(n208), .Q(
        \reg_file[4][5] ) );
  DFFRQX2M \reg_file_reg[4][4]  ( .D(n85), .CK(CLK), .RN(n208), .Q(
        \reg_file[4][4] ) );
  DFFRQX2M \reg_file_reg[4][3]  ( .D(n84), .CK(CLK), .RN(n207), .Q(
        \reg_file[4][3] ) );
  DFFRQX2M \reg_file_reg[4][2]  ( .D(n83), .CK(CLK), .RN(n207), .Q(
        \reg_file[4][2] ) );
  DFFRQX2M \reg_file_reg[4][1]  ( .D(n82), .CK(CLK), .RN(n207), .Q(
        \reg_file[4][1] ) );
  DFFRQX2M \reg_file_reg[4][0]  ( .D(n81), .CK(CLK), .RN(n207), .Q(
        \reg_file[4][0] ) );
  DFFRQX2M \reg_file_reg[3][0]  ( .D(n73), .CK(CLK), .RN(n207), .Q(REG3[0]) );
  DFFRQX2M \reg_file_reg[3][7]  ( .D(n80), .CK(CLK), .RN(n207), .Q(REG3[7]) );
  DFFSQX2M \reg_file_reg[2][0]  ( .D(n65), .CK(CLK), .SN(n205), .Q(REG2[0]) );
  DFFRQX2M \reg_file_reg[2][1]  ( .D(n66), .CK(CLK), .RN(n206), .Q(REG2[1]) );
  DFFRQX2M \reg_file_reg[3][1]  ( .D(n74), .CK(CLK), .RN(n207), .Q(REG3[1]) );
  DFFSQX2M \reg_file_reg[3][5]  ( .D(n78), .CK(CLK), .SN(n205), .Q(REG3[5]) );
  DFFRQX2M \reg_file_reg[2][2]  ( .D(n67), .CK(CLK), .RN(n207), .Q(REG2[2]) );
  DFFRQX2M \reg_file_reg[3][4]  ( .D(n77), .CK(CLK), .RN(n207), .Q(REG3[4]) );
  DFFRQX2M \reg_file_reg[3][6]  ( .D(n79), .CK(CLK), .RN(n207), .Q(REG3[6]) );
  DFFRQX2M \reg_file_reg[3][3]  ( .D(n76), .CK(CLK), .RN(n207), .Q(REG3[3]) );
  DFFRQX2M \reg_file_reg[3][2]  ( .D(n75), .CK(CLK), .RN(n207), .Q(REG3[2]) );
  DFFSQX2M \reg_file_reg[2][7]  ( .D(n72), .CK(CLK), .SN(n205), .Q(REG2[7]) );
  DFFRQX2M \reg_file_reg[2][5]  ( .D(n70), .CK(CLK), .RN(n207), .Q(REG2[5]) );
  DFFRQX2M \reg_file_reg[2][6]  ( .D(n71), .CK(CLK), .RN(n207), .Q(REG2[6]) );
  DFFRQX2M \reg_file_reg[2][4]  ( .D(n69), .CK(CLK), .RN(n207), .Q(REG2[4]) );
  DFFRQX2M \reg_file_reg[2][3]  ( .D(n68), .CK(CLK), .RN(n206), .Q(REG2[3]) );
  DFFRQX2M RdData_Valid_reg ( .D(n48), .CK(CLK), .RN(n205), .Q(RdData_Valid)
         );
  DFFRQX2M \reg_file_reg[0][1]  ( .D(n50), .CK(CLK), .RN(n205), .Q(REG0[1]) );
  DFFRQX2M \reg_file_reg[0][0]  ( .D(n49), .CK(CLK), .RN(n205), .Q(REG0[0]) );
  DFFRQX2M \reg_file_reg[0][2]  ( .D(n51), .CK(CLK), .RN(n205), .Q(REG0[2]) );
  DFFRQX2M \reg_file_reg[0][3]  ( .D(n52), .CK(CLK), .RN(n206), .Q(REG0[3]) );
  DFFRQX2M \reg_file_reg[0][4]  ( .D(n53), .CK(CLK), .RN(n206), .Q(REG0[4]) );
  DFFRQX2M \reg_file_reg[0][5]  ( .D(n54), .CK(CLK), .RN(n206), .Q(REG0[5]) );
  DFFRQX2M \reg_file_reg[0][6]  ( .D(n55), .CK(CLK), .RN(n206), .Q(REG0[6]) );
  DFFRQX2M \reg_file_reg[1][6]  ( .D(n63), .CK(CLK), .RN(n206), .Q(REG1[6]) );
  DFFRQX2M \reg_file_reg[0][7]  ( .D(n56), .CK(CLK), .RN(n206), .Q(REG0[7]) );
  DFFRQX2M \reg_file_reg[1][5]  ( .D(n62), .CK(CLK), .RN(n206), .Q(REG1[5]) );
  DFFRQX2M \reg_file_reg[1][4]  ( .D(n61), .CK(CLK), .RN(n206), .Q(REG1[4]) );
  DFFRQX2M \reg_file_reg[1][1]  ( .D(n58), .CK(CLK), .RN(n206), .Q(REG1[1]) );
  DFFRQX2M \reg_file_reg[1][7]  ( .D(n64), .CK(CLK), .RN(n206), .Q(REG1[7]) );
  DFFRQX2M \reg_file_reg[1][3]  ( .D(n60), .CK(CLK), .RN(n206), .Q(REG1[3]) );
  DFFRQX2M \reg_file_reg[1][2]  ( .D(n59), .CK(CLK), .RN(n206), .Q(REG1[2]) );
  DFFRQX2M \reg_file_reg[1][0]  ( .D(n57), .CK(CLK), .RN(n206), .Q(REG1[0]) );
  NOR2BX2M U3 ( .AN(n38), .B(n203), .Y(n32) );
  NOR2BX2M U4 ( .AN(N13), .B(n199), .Y(n23) );
  NOR2BX2M U5 ( .AN(N13), .B(n204), .Y(n26) );
  NOR2BX2M U6 ( .AN(n27), .B(n203), .Y(n18) );
  NOR2X2M U7 ( .A(n204), .B(N13), .Y(n20) );
  NOR2X2M U8 ( .A(n199), .B(N13), .Y(n15) );
  INVX2M U9 ( .A(n200), .Y(n201) );
  INVX2M U10 ( .A(n198), .Y(n199) );
  INVX2M U11 ( .A(n200), .Y(n202) );
  BUFX2M U12 ( .A(n203), .Y(n200) );
  BUFX2M U13 ( .A(n204), .Y(n198) );
  NOR2BX2M U14 ( .AN(n27), .B(N11), .Y(n16) );
  NOR2BX2M U15 ( .AN(n38), .B(N11), .Y(n30) );
  NAND2X2M U16 ( .A(n18), .B(n15), .Y(n17) );
  NAND2X2M U17 ( .A(n30), .B(n15), .Y(n29) );
  NAND2X2M U18 ( .A(n32), .B(n15), .Y(n31) );
  NAND2X2M U19 ( .A(n30), .B(n20), .Y(n33) );
  NAND2X2M U20 ( .A(n32), .B(n20), .Y(n34) );
  NAND2X2M U21 ( .A(n20), .B(n16), .Y(n19) );
  NAND2X2M U22 ( .A(n20), .B(n18), .Y(n21) );
  NAND2X2M U23 ( .A(n23), .B(n16), .Y(n22) );
  NAND2X2M U24 ( .A(n23), .B(n18), .Y(n24) );
  NAND2X2M U25 ( .A(n26), .B(n16), .Y(n25) );
  NAND2X2M U26 ( .A(n26), .B(n18), .Y(n28) );
  NAND2X2M U27 ( .A(n30), .B(n23), .Y(n35) );
  NAND2X2M U28 ( .A(n32), .B(n23), .Y(n36) );
  NAND2X2M U29 ( .A(n30), .B(n26), .Y(n37) );
  NAND2X2M U30 ( .A(n32), .B(n26), .Y(n39) );
  NAND2X2M U31 ( .A(n15), .B(n16), .Y(n14) );
  INVX2M U32 ( .A(n12), .Y(n220) );
  NAND2BX2M U33 ( .AN(WrEn), .B(RdEn), .Y(n12) );
  NOR2BX2M U34 ( .AN(WrEn), .B(RdEn), .Y(n13) );
  NOR2BX2M U35 ( .AN(n13), .B(N14), .Y(n27) );
  AND2X2M U36 ( .A(N14), .B(n13), .Y(n38) );
  BUFX2M U37 ( .A(n219), .Y(n205) );
  BUFX2M U38 ( .A(n219), .Y(n206) );
  BUFX2M U39 ( .A(n218), .Y(n207) );
  BUFX2M U40 ( .A(n218), .Y(n208) );
  BUFX2M U41 ( .A(n217), .Y(n209) );
  BUFX2M U42 ( .A(n217), .Y(n210) );
  BUFX2M U43 ( .A(n216), .Y(n211) );
  BUFX2M U44 ( .A(n216), .Y(n212) );
  BUFX2M U45 ( .A(n215), .Y(n213) );
  BUFX2M U46 ( .A(n215), .Y(n214) );
  INVX2M U47 ( .A(N11), .Y(n203) );
  INVX2M U48 ( .A(WrData[0]), .Y(n228) );
  INVX2M U49 ( .A(WrData[1]), .Y(n227) );
  INVX2M U50 ( .A(WrData[2]), .Y(n226) );
  INVX2M U51 ( .A(WrData[3]), .Y(n225) );
  INVX2M U52 ( .A(WrData[4]), .Y(n224) );
  INVX2M U53 ( .A(WrData[5]), .Y(n223) );
  INVX2M U54 ( .A(N12), .Y(n204) );
  BUFX2M U55 ( .A(RST), .Y(n218) );
  BUFX2M U56 ( .A(RST), .Y(n217) );
  BUFX2M U57 ( .A(RST), .Y(n216) );
  BUFX2M U58 ( .A(RST), .Y(n215) );
  BUFX2M U59 ( .A(RST), .Y(n219) );
  AO22X1M U60 ( .A0(N43), .A1(n220), .B0(RdData[0]), .B1(n12), .Y(n40) );
  MX4X1M U61 ( .A(n4), .B(n2), .C(n3), .D(n1), .S0(N14), .S1(N13), .Y(N43) );
  MX4X1M U62 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(N11), 
        .S1(n199), .Y(n4) );
  MX4X1M U63 ( .A(\reg_file[8][0] ), .B(\reg_file[9][0] ), .C(
        \reg_file[10][0] ), .D(\reg_file[11][0] ), .S0(N11), .S1(n199), .Y(n2)
         );
  AO22X1M U64 ( .A0(N42), .A1(n220), .B0(RdData[1]), .B1(n12), .Y(n41) );
  MX4X1M U65 ( .A(n8), .B(n6), .C(n7), .D(n5), .S0(N14), .S1(N13), .Y(N42) );
  MX4X1M U66 ( .A(\reg_file[8][1] ), .B(\reg_file[9][1] ), .C(
        \reg_file[10][1] ), .D(\reg_file[11][1] ), .S0(N11), .S1(n199), .Y(n6)
         );
  MX4X1M U67 ( .A(\reg_file[12][1] ), .B(\reg_file[13][1] ), .C(
        \reg_file[14][1] ), .D(\reg_file[15][1] ), .S0(n201), .S1(n199), .Y(n5) );
  AO22X1M U68 ( .A0(N41), .A1(n220), .B0(RdData[2]), .B1(n12), .Y(n42) );
  MX4X1M U69 ( .A(n177), .B(n10), .C(n11), .D(n9), .S0(N14), .S1(N13), .Y(N41)
         );
  MX4X1M U70 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n201), 
        .S1(N12), .Y(n177) );
  MX4X1M U71 ( .A(\reg_file[8][2] ), .B(\reg_file[9][2] ), .C(
        \reg_file[10][2] ), .D(\reg_file[11][2] ), .S0(n201), .S1(N12), .Y(n10) );
  AO22X1M U72 ( .A0(N40), .A1(n220), .B0(RdData[3]), .B1(n12), .Y(n43) );
  MX4X1M U73 ( .A(n181), .B(n179), .C(n180), .D(n178), .S0(N14), .S1(N13), .Y(
        N40) );
  MX4X1M U74 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n201), 
        .S1(N12), .Y(n181) );
  MX4X1M U75 ( .A(\reg_file[8][3] ), .B(\reg_file[9][3] ), .C(
        \reg_file[10][3] ), .D(\reg_file[11][3] ), .S0(n201), .S1(N12), .Y(
        n179) );
  AO22X1M U76 ( .A0(N39), .A1(n220), .B0(RdData[4]), .B1(n12), .Y(n44) );
  MX4X1M U77 ( .A(n185), .B(n183), .C(n184), .D(n182), .S0(N14), .S1(N13), .Y(
        N39) );
  MX4X1M U78 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n202), 
        .S1(N12), .Y(n185) );
  MX4X1M U79 ( .A(\reg_file[8][4] ), .B(\reg_file[9][4] ), .C(
        \reg_file[10][4] ), .D(\reg_file[11][4] ), .S0(n201), .S1(N12), .Y(
        n183) );
  AO22X1M U80 ( .A0(N38), .A1(n220), .B0(RdData[5]), .B1(n12), .Y(n45) );
  MX4X1M U81 ( .A(n189), .B(n187), .C(n188), .D(n186), .S0(N14), .S1(N13), .Y(
        N38) );
  MX4X1M U82 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n202), 
        .S1(N12), .Y(n189) );
  MX4X1M U83 ( .A(\reg_file[8][5] ), .B(\reg_file[9][5] ), .C(
        \reg_file[10][5] ), .D(\reg_file[11][5] ), .S0(n202), .S1(N12), .Y(
        n187) );
  AO22X1M U84 ( .A0(N37), .A1(n220), .B0(RdData[6]), .B1(n12), .Y(n46) );
  MX4X1M U85 ( .A(n193), .B(n191), .C(n192), .D(n190), .S0(N14), .S1(N13), .Y(
        N37) );
  MX4X1M U86 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n202), 
        .S1(N12), .Y(n193) );
  MX4X1M U87 ( .A(\reg_file[8][6] ), .B(\reg_file[9][6] ), .C(
        \reg_file[10][6] ), .D(\reg_file[11][6] ), .S0(n202), .S1(N12), .Y(
        n191) );
  AO22X1M U88 ( .A0(N36), .A1(n220), .B0(RdData[7]), .B1(n12), .Y(n47) );
  MX4X1M U89 ( .A(n197), .B(n195), .C(n196), .D(n194), .S0(N14), .S1(N13), .Y(
        N36) );
  MX4X1M U90 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n202), 
        .S1(N12), .Y(n197) );
  MX4X1M U91 ( .A(\reg_file[8][7] ), .B(\reg_file[9][7] ), .C(
        \reg_file[10][7] ), .D(\reg_file[11][7] ), .S0(n202), .S1(N12), .Y(
        n195) );
  MX4X1M U92 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n201), 
        .S1(n199), .Y(n8) );
  MX4X1M U93 ( .A(\reg_file[4][0] ), .B(\reg_file[5][0] ), .C(\reg_file[6][0] ), .D(\reg_file[7][0] ), .S0(N11), .S1(n199), .Y(n3) );
  MX4X1M U94 ( .A(\reg_file[4][1] ), .B(\reg_file[5][1] ), .C(\reg_file[6][1] ), .D(\reg_file[7][1] ), .S0(n201), .S1(n199), .Y(n7) );
  MX4X1M U95 ( .A(\reg_file[4][2] ), .B(\reg_file[5][2] ), .C(\reg_file[6][2] ), .D(\reg_file[7][2] ), .S0(n201), .S1(N12), .Y(n11) );
  MX4X1M U96 ( .A(\reg_file[4][3] ), .B(\reg_file[5][3] ), .C(\reg_file[6][3] ), .D(\reg_file[7][3] ), .S0(n201), .S1(N12), .Y(n180) );
  MX4X1M U97 ( .A(\reg_file[4][4] ), .B(\reg_file[5][4] ), .C(\reg_file[6][4] ), .D(\reg_file[7][4] ), .S0(n201), .S1(N12), .Y(n184) );
  MX4X1M U98 ( .A(\reg_file[4][5] ), .B(\reg_file[5][5] ), .C(\reg_file[6][5] ), .D(\reg_file[7][5] ), .S0(n202), .S1(N12), .Y(n188) );
  MX4X1M U99 ( .A(\reg_file[4][6] ), .B(\reg_file[5][6] ), .C(\reg_file[6][6] ), .D(\reg_file[7][6] ), .S0(n202), .S1(N12), .Y(n192) );
  MX4X1M U100 ( .A(\reg_file[4][7] ), .B(\reg_file[5][7] ), .C(
        \reg_file[6][7] ), .D(\reg_file[7][7] ), .S0(n202), .S1(N12), .Y(n196)
         );
  MX4X1M U101 ( .A(\reg_file[12][0] ), .B(\reg_file[13][0] ), .C(
        \reg_file[14][0] ), .D(\reg_file[15][0] ), .S0(n202), .S1(n199), .Y(n1) );
  MX4X1M U102 ( .A(\reg_file[12][2] ), .B(\reg_file[13][2] ), .C(
        \reg_file[14][2] ), .D(\reg_file[15][2] ), .S0(n201), .S1(n199), .Y(n9) );
  MX4X1M U103 ( .A(\reg_file[12][3] ), .B(\reg_file[13][3] ), .C(
        \reg_file[14][3] ), .D(\reg_file[15][3] ), .S0(n201), .S1(n199), .Y(
        n178) );
  MX4X1M U104 ( .A(\reg_file[12][4] ), .B(\reg_file[13][4] ), .C(
        \reg_file[14][4] ), .D(\reg_file[15][4] ), .S0(n201), .S1(N12), .Y(
        n182) );
  MX4X1M U105 ( .A(\reg_file[12][5] ), .B(\reg_file[13][5] ), .C(
        \reg_file[14][5] ), .D(\reg_file[15][5] ), .S0(n202), .S1(n199), .Y(
        n186) );
  MX4X1M U106 ( .A(\reg_file[12][6] ), .B(\reg_file[13][6] ), .C(
        \reg_file[14][6] ), .D(\reg_file[15][6] ), .S0(n202), .S1(n199), .Y(
        n190) );
  MX4X1M U107 ( .A(\reg_file[12][7] ), .B(\reg_file[13][7] ), .C(
        \reg_file[14][7] ), .D(\reg_file[15][7] ), .S0(n202), .S1(n199), .Y(
        n194) );
  INVX2M U108 ( .A(WrData[6]), .Y(n222) );
  INVX2M U109 ( .A(WrData[7]), .Y(n221) );
  OAI2BB2X1M U110 ( .B0(n14), .B1(n228), .A0N(REG0[0]), .A1N(n14), .Y(n49) );
  OAI2BB2X1M U111 ( .B0(n14), .B1(n227), .A0N(REG0[1]), .A1N(n14), .Y(n50) );
  OAI2BB2X1M U112 ( .B0(n14), .B1(n226), .A0N(REG0[2]), .A1N(n14), .Y(n51) );
  OAI2BB2X1M U113 ( .B0(n14), .B1(n225), .A0N(REG0[3]), .A1N(n14), .Y(n52) );
  OAI2BB2X1M U114 ( .B0(n14), .B1(n224), .A0N(REG0[4]), .A1N(n14), .Y(n53) );
  OAI2BB2X1M U115 ( .B0(n14), .B1(n223), .A0N(REG0[5]), .A1N(n14), .Y(n54) );
  OAI2BB2X1M U116 ( .B0(n14), .B1(n222), .A0N(REG0[6]), .A1N(n14), .Y(n55) );
  OAI2BB2X1M U117 ( .B0(n14), .B1(n221), .A0N(REG0[7]), .A1N(n14), .Y(n56) );
  OAI2BB2X1M U118 ( .B0(n228), .B1(n17), .A0N(REG1[0]), .A1N(n17), .Y(n57) );
  OAI2BB2X1M U119 ( .B0(n227), .B1(n17), .A0N(REG1[1]), .A1N(n17), .Y(n58) );
  OAI2BB2X1M U120 ( .B0(n226), .B1(n17), .A0N(REG1[2]), .A1N(n17), .Y(n59) );
  OAI2BB2X1M U121 ( .B0(n225), .B1(n17), .A0N(REG1[3]), .A1N(n17), .Y(n60) );
  OAI2BB2X1M U122 ( .B0(n224), .B1(n17), .A0N(REG1[4]), .A1N(n17), .Y(n61) );
  OAI2BB2X1M U123 ( .B0(n223), .B1(n17), .A0N(REG1[5]), .A1N(n17), .Y(n62) );
  OAI2BB2X1M U124 ( .B0(n222), .B1(n17), .A0N(REG1[6]), .A1N(n17), .Y(n63) );
  OAI2BB2X1M U125 ( .B0(n221), .B1(n17), .A0N(REG1[7]), .A1N(n17), .Y(n64) );
  OAI2BB2X1M U126 ( .B0(n228), .B1(n22), .A0N(\reg_file[4][0] ), .A1N(n22), 
        .Y(n81) );
  OAI2BB2X1M U127 ( .B0(n227), .B1(n22), .A0N(\reg_file[4][1] ), .A1N(n22), 
        .Y(n82) );
  OAI2BB2X1M U128 ( .B0(n226), .B1(n22), .A0N(\reg_file[4][2] ), .A1N(n22), 
        .Y(n83) );
  OAI2BB2X1M U129 ( .B0(n225), .B1(n22), .A0N(\reg_file[4][3] ), .A1N(n22), 
        .Y(n84) );
  OAI2BB2X1M U130 ( .B0(n224), .B1(n22), .A0N(\reg_file[4][4] ), .A1N(n22), 
        .Y(n85) );
  OAI2BB2X1M U131 ( .B0(n223), .B1(n22), .A0N(\reg_file[4][5] ), .A1N(n22), 
        .Y(n86) );
  OAI2BB2X1M U132 ( .B0(n222), .B1(n22), .A0N(\reg_file[4][6] ), .A1N(n22), 
        .Y(n87) );
  OAI2BB2X1M U133 ( .B0(n221), .B1(n22), .A0N(\reg_file[4][7] ), .A1N(n22), 
        .Y(n88) );
  OAI2BB2X1M U134 ( .B0(n228), .B1(n24), .A0N(\reg_file[5][0] ), .A1N(n24), 
        .Y(n89) );
  OAI2BB2X1M U135 ( .B0(n227), .B1(n24), .A0N(\reg_file[5][1] ), .A1N(n24), 
        .Y(n90) );
  OAI2BB2X1M U136 ( .B0(n226), .B1(n24), .A0N(\reg_file[5][2] ), .A1N(n24), 
        .Y(n91) );
  OAI2BB2X1M U137 ( .B0(n225), .B1(n24), .A0N(\reg_file[5][3] ), .A1N(n24), 
        .Y(n92) );
  OAI2BB2X1M U138 ( .B0(n224), .B1(n24), .A0N(\reg_file[5][4] ), .A1N(n24), 
        .Y(n93) );
  OAI2BB2X1M U139 ( .B0(n223), .B1(n24), .A0N(\reg_file[5][5] ), .A1N(n24), 
        .Y(n94) );
  OAI2BB2X1M U140 ( .B0(n222), .B1(n24), .A0N(\reg_file[5][6] ), .A1N(n24), 
        .Y(n95) );
  OAI2BB2X1M U141 ( .B0(n221), .B1(n24), .A0N(\reg_file[5][7] ), .A1N(n24), 
        .Y(n96) );
  OAI2BB2X1M U142 ( .B0(n228), .B1(n25), .A0N(\reg_file[6][0] ), .A1N(n25), 
        .Y(n97) );
  OAI2BB2X1M U143 ( .B0(n227), .B1(n25), .A0N(\reg_file[6][1] ), .A1N(n25), 
        .Y(n98) );
  OAI2BB2X1M U144 ( .B0(n226), .B1(n25), .A0N(\reg_file[6][2] ), .A1N(n25), 
        .Y(n99) );
  OAI2BB2X1M U145 ( .B0(n225), .B1(n25), .A0N(\reg_file[6][3] ), .A1N(n25), 
        .Y(n100) );
  OAI2BB2X1M U146 ( .B0(n224), .B1(n25), .A0N(\reg_file[6][4] ), .A1N(n25), 
        .Y(n101) );
  OAI2BB2X1M U147 ( .B0(n223), .B1(n25), .A0N(\reg_file[6][5] ), .A1N(n25), 
        .Y(n102) );
  OAI2BB2X1M U148 ( .B0(n222), .B1(n25), .A0N(\reg_file[6][6] ), .A1N(n25), 
        .Y(n103) );
  OAI2BB2X1M U149 ( .B0(n221), .B1(n25), .A0N(\reg_file[6][7] ), .A1N(n25), 
        .Y(n104) );
  OAI2BB2X1M U150 ( .B0(n228), .B1(n28), .A0N(\reg_file[7][0] ), .A1N(n28), 
        .Y(n105) );
  OAI2BB2X1M U151 ( .B0(n227), .B1(n28), .A0N(\reg_file[7][1] ), .A1N(n28), 
        .Y(n106) );
  OAI2BB2X1M U152 ( .B0(n226), .B1(n28), .A0N(\reg_file[7][2] ), .A1N(n28), 
        .Y(n107) );
  OAI2BB2X1M U153 ( .B0(n225), .B1(n28), .A0N(\reg_file[7][3] ), .A1N(n28), 
        .Y(n108) );
  OAI2BB2X1M U154 ( .B0(n224), .B1(n28), .A0N(\reg_file[7][4] ), .A1N(n28), 
        .Y(n109) );
  OAI2BB2X1M U155 ( .B0(n223), .B1(n28), .A0N(\reg_file[7][5] ), .A1N(n28), 
        .Y(n110) );
  OAI2BB2X1M U156 ( .B0(n222), .B1(n28), .A0N(\reg_file[7][6] ), .A1N(n28), 
        .Y(n111) );
  OAI2BB2X1M U157 ( .B0(n221), .B1(n28), .A0N(\reg_file[7][7] ), .A1N(n28), 
        .Y(n112) );
  OAI2BB2X1M U158 ( .B0(n228), .B1(n29), .A0N(\reg_file[8][0] ), .A1N(n29), 
        .Y(n113) );
  OAI2BB2X1M U159 ( .B0(n227), .B1(n29), .A0N(\reg_file[8][1] ), .A1N(n29), 
        .Y(n114) );
  OAI2BB2X1M U160 ( .B0(n226), .B1(n29), .A0N(\reg_file[8][2] ), .A1N(n29), 
        .Y(n115) );
  OAI2BB2X1M U161 ( .B0(n225), .B1(n29), .A0N(\reg_file[8][3] ), .A1N(n29), 
        .Y(n116) );
  OAI2BB2X1M U162 ( .B0(n224), .B1(n29), .A0N(\reg_file[8][4] ), .A1N(n29), 
        .Y(n117) );
  OAI2BB2X1M U163 ( .B0(n223), .B1(n29), .A0N(\reg_file[8][5] ), .A1N(n29), 
        .Y(n118) );
  OAI2BB2X1M U164 ( .B0(n222), .B1(n29), .A0N(\reg_file[8][6] ), .A1N(n29), 
        .Y(n119) );
  OAI2BB2X1M U165 ( .B0(n221), .B1(n29), .A0N(\reg_file[8][7] ), .A1N(n29), 
        .Y(n120) );
  OAI2BB2X1M U166 ( .B0(n228), .B1(n31), .A0N(\reg_file[9][0] ), .A1N(n31), 
        .Y(n121) );
  OAI2BB2X1M U167 ( .B0(n227), .B1(n31), .A0N(\reg_file[9][1] ), .A1N(n31), 
        .Y(n122) );
  OAI2BB2X1M U168 ( .B0(n226), .B1(n31), .A0N(\reg_file[9][2] ), .A1N(n31), 
        .Y(n123) );
  OAI2BB2X1M U169 ( .B0(n225), .B1(n31), .A0N(\reg_file[9][3] ), .A1N(n31), 
        .Y(n124) );
  OAI2BB2X1M U170 ( .B0(n224), .B1(n31), .A0N(\reg_file[9][4] ), .A1N(n31), 
        .Y(n125) );
  OAI2BB2X1M U171 ( .B0(n223), .B1(n31), .A0N(\reg_file[9][5] ), .A1N(n31), 
        .Y(n126) );
  OAI2BB2X1M U172 ( .B0(n222), .B1(n31), .A0N(\reg_file[9][6] ), .A1N(n31), 
        .Y(n127) );
  OAI2BB2X1M U173 ( .B0(n221), .B1(n31), .A0N(\reg_file[9][7] ), .A1N(n31), 
        .Y(n128) );
  OAI2BB2X1M U174 ( .B0(n228), .B1(n33), .A0N(\reg_file[10][0] ), .A1N(n33), 
        .Y(n129) );
  OAI2BB2X1M U175 ( .B0(n227), .B1(n33), .A0N(\reg_file[10][1] ), .A1N(n33), 
        .Y(n130) );
  OAI2BB2X1M U176 ( .B0(n226), .B1(n33), .A0N(\reg_file[10][2] ), .A1N(n33), 
        .Y(n131) );
  OAI2BB2X1M U177 ( .B0(n225), .B1(n33), .A0N(\reg_file[10][3] ), .A1N(n33), 
        .Y(n132) );
  OAI2BB2X1M U178 ( .B0(n224), .B1(n33), .A0N(\reg_file[10][4] ), .A1N(n33), 
        .Y(n133) );
  OAI2BB2X1M U179 ( .B0(n223), .B1(n33), .A0N(\reg_file[10][5] ), .A1N(n33), 
        .Y(n134) );
  OAI2BB2X1M U180 ( .B0(n222), .B1(n33), .A0N(\reg_file[10][6] ), .A1N(n33), 
        .Y(n135) );
  OAI2BB2X1M U181 ( .B0(n221), .B1(n33), .A0N(\reg_file[10][7] ), .A1N(n33), 
        .Y(n136) );
  OAI2BB2X1M U182 ( .B0(n228), .B1(n34), .A0N(\reg_file[11][0] ), .A1N(n34), 
        .Y(n137) );
  OAI2BB2X1M U183 ( .B0(n227), .B1(n34), .A0N(\reg_file[11][1] ), .A1N(n34), 
        .Y(n138) );
  OAI2BB2X1M U184 ( .B0(n226), .B1(n34), .A0N(\reg_file[11][2] ), .A1N(n34), 
        .Y(n139) );
  OAI2BB2X1M U185 ( .B0(n225), .B1(n34), .A0N(\reg_file[11][3] ), .A1N(n34), 
        .Y(n140) );
  OAI2BB2X1M U186 ( .B0(n224), .B1(n34), .A0N(\reg_file[11][4] ), .A1N(n34), 
        .Y(n141) );
  OAI2BB2X1M U187 ( .B0(n223), .B1(n34), .A0N(\reg_file[11][5] ), .A1N(n34), 
        .Y(n142) );
  OAI2BB2X1M U188 ( .B0(n222), .B1(n34), .A0N(\reg_file[11][6] ), .A1N(n34), 
        .Y(n143) );
  OAI2BB2X1M U189 ( .B0(n221), .B1(n34), .A0N(\reg_file[11][7] ), .A1N(n34), 
        .Y(n144) );
  OAI2BB2X1M U190 ( .B0(n228), .B1(n35), .A0N(\reg_file[12][0] ), .A1N(n35), 
        .Y(n145) );
  OAI2BB2X1M U191 ( .B0(n227), .B1(n35), .A0N(\reg_file[12][1] ), .A1N(n35), 
        .Y(n146) );
  OAI2BB2X1M U192 ( .B0(n226), .B1(n35), .A0N(\reg_file[12][2] ), .A1N(n35), 
        .Y(n147) );
  OAI2BB2X1M U193 ( .B0(n225), .B1(n35), .A0N(\reg_file[12][3] ), .A1N(n35), 
        .Y(n148) );
  OAI2BB2X1M U194 ( .B0(n224), .B1(n35), .A0N(\reg_file[12][4] ), .A1N(n35), 
        .Y(n149) );
  OAI2BB2X1M U195 ( .B0(n223), .B1(n35), .A0N(\reg_file[12][5] ), .A1N(n35), 
        .Y(n150) );
  OAI2BB2X1M U196 ( .B0(n222), .B1(n35), .A0N(\reg_file[12][6] ), .A1N(n35), 
        .Y(n151) );
  OAI2BB2X1M U197 ( .B0(n221), .B1(n35), .A0N(\reg_file[12][7] ), .A1N(n35), 
        .Y(n152) );
  OAI2BB2X1M U198 ( .B0(n228), .B1(n36), .A0N(\reg_file[13][0] ), .A1N(n36), 
        .Y(n153) );
  OAI2BB2X1M U199 ( .B0(n227), .B1(n36), .A0N(\reg_file[13][1] ), .A1N(n36), 
        .Y(n154) );
  OAI2BB2X1M U200 ( .B0(n226), .B1(n36), .A0N(\reg_file[13][2] ), .A1N(n36), 
        .Y(n155) );
  OAI2BB2X1M U201 ( .B0(n225), .B1(n36), .A0N(\reg_file[13][3] ), .A1N(n36), 
        .Y(n156) );
  OAI2BB2X1M U202 ( .B0(n224), .B1(n36), .A0N(\reg_file[13][4] ), .A1N(n36), 
        .Y(n157) );
  OAI2BB2X1M U203 ( .B0(n223), .B1(n36), .A0N(\reg_file[13][5] ), .A1N(n36), 
        .Y(n158) );
  OAI2BB2X1M U204 ( .B0(n222), .B1(n36), .A0N(\reg_file[13][6] ), .A1N(n36), 
        .Y(n159) );
  OAI2BB2X1M U205 ( .B0(n221), .B1(n36), .A0N(\reg_file[13][7] ), .A1N(n36), 
        .Y(n160) );
  OAI2BB2X1M U206 ( .B0(n228), .B1(n37), .A0N(\reg_file[14][0] ), .A1N(n37), 
        .Y(n161) );
  OAI2BB2X1M U207 ( .B0(n227), .B1(n37), .A0N(\reg_file[14][1] ), .A1N(n37), 
        .Y(n162) );
  OAI2BB2X1M U208 ( .B0(n226), .B1(n37), .A0N(\reg_file[14][2] ), .A1N(n37), 
        .Y(n163) );
  OAI2BB2X1M U209 ( .B0(n225), .B1(n37), .A0N(\reg_file[14][3] ), .A1N(n37), 
        .Y(n164) );
  OAI2BB2X1M U210 ( .B0(n224), .B1(n37), .A0N(\reg_file[14][4] ), .A1N(n37), 
        .Y(n165) );
  OAI2BB2X1M U211 ( .B0(n223), .B1(n37), .A0N(\reg_file[14][5] ), .A1N(n37), 
        .Y(n166) );
  OAI2BB2X1M U212 ( .B0(n222), .B1(n37), .A0N(\reg_file[14][6] ), .A1N(n37), 
        .Y(n167) );
  OAI2BB2X1M U213 ( .B0(n221), .B1(n37), .A0N(\reg_file[14][7] ), .A1N(n37), 
        .Y(n168) );
  OAI2BB2X1M U214 ( .B0(n228), .B1(n39), .A0N(\reg_file[15][0] ), .A1N(n39), 
        .Y(n169) );
  OAI2BB2X1M U215 ( .B0(n227), .B1(n39), .A0N(\reg_file[15][1] ), .A1N(n39), 
        .Y(n170) );
  OAI2BB2X1M U216 ( .B0(n226), .B1(n39), .A0N(\reg_file[15][2] ), .A1N(n39), 
        .Y(n171) );
  OAI2BB2X1M U217 ( .B0(n225), .B1(n39), .A0N(\reg_file[15][3] ), .A1N(n39), 
        .Y(n172) );
  OAI2BB2X1M U218 ( .B0(n224), .B1(n39), .A0N(\reg_file[15][4] ), .A1N(n39), 
        .Y(n173) );
  OAI2BB2X1M U219 ( .B0(n223), .B1(n39), .A0N(\reg_file[15][5] ), .A1N(n39), 
        .Y(n174) );
  OAI2BB2X1M U220 ( .B0(n222), .B1(n39), .A0N(\reg_file[15][6] ), .A1N(n39), 
        .Y(n175) );
  OAI2BB2X1M U221 ( .B0(n221), .B1(n39), .A0N(\reg_file[15][7] ), .A1N(n39), 
        .Y(n176) );
  OAI2BB2X1M U222 ( .B0(n227), .B1(n19), .A0N(REG2[1]), .A1N(n19), .Y(n66) );
  OAI2BB2X1M U223 ( .B0(n226), .B1(n19), .A0N(REG2[2]), .A1N(n19), .Y(n67) );
  OAI2BB2X1M U224 ( .B0(n225), .B1(n19), .A0N(REG2[3]), .A1N(n19), .Y(n68) );
  OAI2BB2X1M U225 ( .B0(n224), .B1(n19), .A0N(REG2[4]), .A1N(n19), .Y(n69) );
  OAI2BB2X1M U226 ( .B0(n223), .B1(n19), .A0N(REG2[5]), .A1N(n19), .Y(n70) );
  OAI2BB2X1M U227 ( .B0(n222), .B1(n19), .A0N(REG2[6]), .A1N(n19), .Y(n71) );
  OAI2BB2X1M U228 ( .B0(n228), .B1(n21), .A0N(REG3[0]), .A1N(n21), .Y(n73) );
  OAI2BB2X1M U229 ( .B0(n227), .B1(n21), .A0N(REG3[1]), .A1N(n21), .Y(n74) );
  OAI2BB2X1M U230 ( .B0(n226), .B1(n21), .A0N(REG3[2]), .A1N(n21), .Y(n75) );
  OAI2BB2X1M U231 ( .B0(n225), .B1(n21), .A0N(REG3[3]), .A1N(n21), .Y(n76) );
  OAI2BB2X1M U232 ( .B0(n224), .B1(n21), .A0N(REG3[4]), .A1N(n21), .Y(n77) );
  OAI2BB2X1M U233 ( .B0(n222), .B1(n21), .A0N(REG3[6]), .A1N(n21), .Y(n79) );
  OAI2BB2X1M U234 ( .B0(n221), .B1(n21), .A0N(REG3[7]), .A1N(n21), .Y(n80) );
  OAI2BB2X1M U235 ( .B0(n228), .B1(n19), .A0N(REG2[0]), .A1N(n19), .Y(n65) );
  OAI2BB2X1M U236 ( .B0(n221), .B1(n19), .A0N(REG2[7]), .A1N(n19), .Y(n72) );
  OAI2BB2X1M U237 ( .B0(n223), .B1(n21), .A0N(REG3[5]), .A1N(n21), .Y(n78) );
  OAI2BB1X2M U238 ( .A0N(RdData_Valid), .A1N(n13), .B0(n12), .Y(n48) );
endmodule


module ALU_OPERAND_WIDTH8_DW_div_uns_0 ( a, b, quotient, remainder, 
        divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22;

  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n14), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n16), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n17), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n18), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n15), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n18), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n17), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n18), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n18), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n18), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n18), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n18), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n14), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n13), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n14), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n16), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n15), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n15), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n16), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n17), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n15), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n16), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n17), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n16), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n17), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n17), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n12), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n13), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  INVX2M U1 ( .A(b[0]), .Y(n19) );
  XNOR2X2M U2 ( .A(n19), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n19), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n19), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n19), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n19), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n19), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  XNOR2X2M U8 ( .A(n19), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  OR2X2M U9 ( .A(n19), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  NAND2X2M U10 ( .A(n3), .B(n4), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U11 ( .A(a[5]), .Y(n4) );
  INVX2M U12 ( .A(n19), .Y(n3) );
  NAND2X2M U13 ( .A(n5), .B(n6), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U14 ( .A(a[4]), .Y(n6) );
  INVX2M U15 ( .A(n19), .Y(n5) );
  NAND2X2M U16 ( .A(n7), .B(n8), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U17 ( .A(a[3]), .Y(n8) );
  INVX2M U18 ( .A(n19), .Y(n7) );
  NAND2X2M U19 ( .A(n7), .B(n9), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U20 ( .A(a[2]), .Y(n9) );
  NAND2X2M U21 ( .A(n7), .B(n10), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U22 ( .A(a[1]), .Y(n10) );
  NAND2X2M U23 ( .A(n7), .B(n11), .Y(\u_div/CryTmp[0][1] ) );
  NAND2X2M U24 ( .A(n1), .B(n2), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U25 ( .A(a[6]), .Y(n2) );
  INVX2M U26 ( .A(n19), .Y(n1) );
  INVX2M U27 ( .A(b[6]), .Y(n13) );
  INVX2M U28 ( .A(a[0]), .Y(n11) );
  INVX2M U29 ( .A(b[1]), .Y(n18) );
  INVX2M U30 ( .A(b[2]), .Y(n17) );
  INVX2M U31 ( .A(b[3]), .Y(n16) );
  INVX2M U32 ( .A(b[4]), .Y(n15) );
  INVX2M U33 ( .A(b[5]), .Y(n14) );
  INVX2M U34 ( .A(b[7]), .Y(n12) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U40 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U41 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U46 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U47 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U51 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U52 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U55 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U56 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U58 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U59 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U60 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U61 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U62 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U63 ( .A(\u_div/CryTmp[7][1] ), .B(n20), .C(n18), .D(n17), .Y(
        quotient[7]) );
  AND3X1M U64 ( .A(n20), .B(n17), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U65 ( .A(\u_div/CryTmp[5][3] ), .B(n20), .Y(quotient[5]) );
  AND2X1M U66 ( .A(n21), .B(n16), .Y(n20) );
  AND2X1M U67 ( .A(\u_div/CryTmp[4][4] ), .B(n21), .Y(quotient[4]) );
  AND3X1M U68 ( .A(n22), .B(n15), .C(n14), .Y(n21) );
  AND3X1M U69 ( .A(n22), .B(n14), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U70 ( .A(\u_div/CryTmp[2][6] ), .B(n22), .Y(quotient[2]) );
  NOR2X1M U71 ( .A(b[6]), .B(b[7]), .Y(n22) );
  AND2X1M U72 ( .A(\u_div/CryTmp[1][7] ), .B(n12), .Y(quotient[1]) );
endmodule


module ALU_OPERAND_WIDTH8_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  INVX2M U1 ( .A(B[6]), .Y(n3) );
  XNOR2X2M U2 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U3 ( .A(B[0]), .Y(n9) );
  INVX2M U4 ( .A(B[2]), .Y(n7) );
  INVX2M U5 ( .A(B[3]), .Y(n6) );
  INVX2M U6 ( .A(B[4]), .Y(n5) );
  INVX2M U7 ( .A(B[5]), .Y(n4) );
  INVX2M U8 ( .A(B[1]), .Y(n8) );
  NAND2X2M U9 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U10 ( .A(A[0]), .Y(n1) );
  INVX2M U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1M U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module ALU_OPERAND_WIDTH8_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_OPERAND_WIDTH8_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27;

  NAND2X2M U2 ( .A(A[7]), .B(B[7]), .Y(n15) );
  AOI21BX2M U3 ( .A0(n18), .A1(A[12]), .B0N(n19), .Y(n1) );
  INVX2M U4 ( .A(n9), .Y(SUM[6]) );
  INVX2M U5 ( .A(A[6]), .Y(n9) );
  XNOR2X2M U6 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  XNOR2X2M U7 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U8 ( .A(B[7]), .Y(n8) );
  BUFX2M U9 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U10 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U11 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U12 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U13 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U14 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U15 ( .A(n10), .B(n11), .Y(SUM[9]) );
  NOR2X1M U16 ( .A(n12), .B(n13), .Y(n11) );
  CLKXOR2X2M U17 ( .A(n14), .B(n15), .Y(SUM[8]) );
  NAND2BX1M U18 ( .AN(n16), .B(n17), .Y(n14) );
  OAI21X1M U19 ( .A0(A[12]), .A1(n18), .B0(B[12]), .Y(n19) );
  XOR3XLM U20 ( .A(B[12]), .B(A[12]), .C(n18), .Y(SUM[12]) );
  OAI21BX1M U21 ( .A0(n20), .A1(n21), .B0N(n22), .Y(n18) );
  XNOR2X1M U22 ( .A(n21), .B(n23), .Y(SUM[11]) );
  NOR2X1M U23 ( .A(n22), .B(n20), .Y(n23) );
  NOR2X1M U24 ( .A(B[11]), .B(A[11]), .Y(n20) );
  AND2X1M U25 ( .A(B[11]), .B(A[11]), .Y(n22) );
  OA21X1M U26 ( .A0(n24), .A1(n25), .B0(n26), .Y(n21) );
  CLKXOR2X2M U27 ( .A(n27), .B(n25), .Y(SUM[10]) );
  AOI2BB1X1M U28 ( .A0N(n10), .A1N(n13), .B0(n12), .Y(n25) );
  AND2X1M U29 ( .A(B[9]), .B(A[9]), .Y(n12) );
  NOR2X1M U30 ( .A(B[9]), .B(A[9]), .Y(n13) );
  OA21X1M U31 ( .A0(n15), .A1(n16), .B0(n17), .Y(n10) );
  CLKNAND2X2M U32 ( .A(B[8]), .B(A[8]), .Y(n17) );
  NOR2X1M U33 ( .A(B[8]), .B(A[8]), .Y(n16) );
  NAND2BX1M U34 ( .AN(n24), .B(n26), .Y(n27) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n26) );
  NOR2X1M U36 ( .A(B[10]), .B(A[10]), .Y(n24) );
endmodule


module ALU_OPERAND_WIDTH8_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  ALU_OPERAND_WIDTH8_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , 
        \A1[9] , \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , 
        \A1[2] , \A1[1] , \A1[0] }), .B({n10, n16, n15, n14, n13, n11, n12, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(
        PRODUCT[15:2]) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n7), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n9), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n6), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n5), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n8), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n4), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n3), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  AND2X2M U2 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][6] ), .Y(n22) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U12 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U13 ( .A(\ab[0][7] ), .Y(n23) );
  INVX2M U14 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U15 ( .A(\ab[0][5] ), .Y(n21) );
  INVX2M U16 ( .A(\ab[0][3] ), .Y(n19) );
  AND2X2M U17 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n11) );
  AND2X2M U18 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n12) );
  CLKXOR2X2M U19 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  AND2X2M U20 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n13) );
  CLKXOR2X2M U21 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U22 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U23 ( .A(\ab[0][2] ), .Y(n18) );
  AND2X2M U24 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n14) );
  AND2X2M U25 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n15) );
  AND2X2M U26 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  CLKXOR2X2M U27 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  XNOR2X2M U28 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U29 ( .A(\SUMB[7][1] ), .Y(n17) );
  CLKXOR2X2M U30 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XNOR2X2M U31 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  XNOR2X2M U32 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  XNOR2X2M U33 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U34 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U35 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  INVX2M U36 ( .A(A[1]), .Y(n38) );
  INVX2M U37 ( .A(A[0]), .Y(n39) );
  INVX2M U38 ( .A(A[2]), .Y(n37) );
  INVX2M U39 ( .A(B[6]), .Y(n25) );
  XNOR2X2M U40 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U41 ( .A(A[3]), .Y(n36) );
  INVX2M U42 ( .A(A[4]), .Y(n35) );
  INVX2M U43 ( .A(A[5]), .Y(n34) );
  INVX2M U44 ( .A(A[7]), .Y(n32) );
  INVX2M U45 ( .A(A[6]), .Y(n33) );
  INVX2M U46 ( .A(B[2]), .Y(n29) );
  INVX2M U47 ( .A(B[3]), .Y(n28) );
  INVX2M U48 ( .A(B[7]), .Y(n24) );
  INVX2M U49 ( .A(B[5]), .Y(n26) );
  INVX2M U50 ( .A(B[4]), .Y(n27) );
  INVX2M U51 ( .A(B[0]), .Y(n31) );
  INVX2M U52 ( .A(B[1]), .Y(n30) );
  NOR2X1M U54 ( .A(n32), .B(n24), .Y(\ab[7][7] ) );
  NOR2X1M U55 ( .A(n32), .B(n25), .Y(\ab[7][6] ) );
  NOR2X1M U56 ( .A(n32), .B(n26), .Y(\ab[7][5] ) );
  NOR2X1M U57 ( .A(n32), .B(n27), .Y(\ab[7][4] ) );
  NOR2X1M U58 ( .A(n32), .B(n28), .Y(\ab[7][3] ) );
  NOR2X1M U59 ( .A(n32), .B(n29), .Y(\ab[7][2] ) );
  NOR2X1M U60 ( .A(n32), .B(n30), .Y(\ab[7][1] ) );
  NOR2X1M U61 ( .A(n32), .B(n31), .Y(\ab[7][0] ) );
  NOR2X1M U62 ( .A(n24), .B(n33), .Y(\ab[6][7] ) );
  NOR2X1M U63 ( .A(n25), .B(n33), .Y(\ab[6][6] ) );
  NOR2X1M U64 ( .A(n26), .B(n33), .Y(\ab[6][5] ) );
  NOR2X1M U65 ( .A(n27), .B(n33), .Y(\ab[6][4] ) );
  NOR2X1M U66 ( .A(n28), .B(n33), .Y(\ab[6][3] ) );
  NOR2X1M U67 ( .A(n29), .B(n33), .Y(\ab[6][2] ) );
  NOR2X1M U68 ( .A(n30), .B(n33), .Y(\ab[6][1] ) );
  NOR2X1M U69 ( .A(n31), .B(n33), .Y(\ab[6][0] ) );
  NOR2X1M U70 ( .A(n24), .B(n34), .Y(\ab[5][7] ) );
  NOR2X1M U71 ( .A(n25), .B(n34), .Y(\ab[5][6] ) );
  NOR2X1M U72 ( .A(n26), .B(n34), .Y(\ab[5][5] ) );
  NOR2X1M U73 ( .A(n27), .B(n34), .Y(\ab[5][4] ) );
  NOR2X1M U74 ( .A(n28), .B(n34), .Y(\ab[5][3] ) );
  NOR2X1M U75 ( .A(n29), .B(n34), .Y(\ab[5][2] ) );
  NOR2X1M U76 ( .A(n30), .B(n34), .Y(\ab[5][1] ) );
  NOR2X1M U77 ( .A(n31), .B(n34), .Y(\ab[5][0] ) );
  NOR2X1M U78 ( .A(n24), .B(n35), .Y(\ab[4][7] ) );
  NOR2X1M U79 ( .A(n25), .B(n35), .Y(\ab[4][6] ) );
  NOR2X1M U80 ( .A(n26), .B(n35), .Y(\ab[4][5] ) );
  NOR2X1M U81 ( .A(n27), .B(n35), .Y(\ab[4][4] ) );
  NOR2X1M U82 ( .A(n28), .B(n35), .Y(\ab[4][3] ) );
  NOR2X1M U83 ( .A(n29), .B(n35), .Y(\ab[4][2] ) );
  NOR2X1M U84 ( .A(n30), .B(n35), .Y(\ab[4][1] ) );
  NOR2X1M U85 ( .A(n31), .B(n35), .Y(\ab[4][0] ) );
  NOR2X1M U86 ( .A(n24), .B(n36), .Y(\ab[3][7] ) );
  NOR2X1M U87 ( .A(n25), .B(n36), .Y(\ab[3][6] ) );
  NOR2X1M U88 ( .A(n26), .B(n36), .Y(\ab[3][5] ) );
  NOR2X1M U89 ( .A(n27), .B(n36), .Y(\ab[3][4] ) );
  NOR2X1M U90 ( .A(n28), .B(n36), .Y(\ab[3][3] ) );
  NOR2X1M U91 ( .A(n29), .B(n36), .Y(\ab[3][2] ) );
  NOR2X1M U92 ( .A(n30), .B(n36), .Y(\ab[3][1] ) );
  NOR2X1M U93 ( .A(n31), .B(n36), .Y(\ab[3][0] ) );
  NOR2X1M U94 ( .A(n24), .B(n37), .Y(\ab[2][7] ) );
  NOR2X1M U95 ( .A(n25), .B(n37), .Y(\ab[2][6] ) );
  NOR2X1M U96 ( .A(n26), .B(n37), .Y(\ab[2][5] ) );
  NOR2X1M U97 ( .A(n27), .B(n37), .Y(\ab[2][4] ) );
  NOR2X1M U98 ( .A(n28), .B(n37), .Y(\ab[2][3] ) );
  NOR2X1M U99 ( .A(n29), .B(n37), .Y(\ab[2][2] ) );
  NOR2X1M U100 ( .A(n30), .B(n37), .Y(\ab[2][1] ) );
  NOR2X1M U101 ( .A(n31), .B(n37), .Y(\ab[2][0] ) );
  NOR2X1M U102 ( .A(n24), .B(n38), .Y(\ab[1][7] ) );
  NOR2X1M U103 ( .A(n25), .B(n38), .Y(\ab[1][6] ) );
  NOR2X1M U104 ( .A(n26), .B(n38), .Y(\ab[1][5] ) );
  NOR2X1M U105 ( .A(n27), .B(n38), .Y(\ab[1][4] ) );
  NOR2X1M U106 ( .A(n28), .B(n38), .Y(\ab[1][3] ) );
  NOR2X1M U107 ( .A(n29), .B(n38), .Y(\ab[1][2] ) );
  NOR2X1M U108 ( .A(n30), .B(n38), .Y(\ab[1][1] ) );
  NOR2X1M U109 ( .A(n31), .B(n38), .Y(\ab[1][0] ) );
  NOR2X1M U110 ( .A(n24), .B(n39), .Y(\ab[0][7] ) );
  NOR2X1M U111 ( .A(n25), .B(n39), .Y(\ab[0][6] ) );
  NOR2X1M U112 ( .A(n26), .B(n39), .Y(\ab[0][5] ) );
  NOR2X1M U113 ( .A(n27), .B(n39), .Y(\ab[0][4] ) );
  NOR2X1M U114 ( .A(n28), .B(n39), .Y(\ab[0][3] ) );
  NOR2X1M U115 ( .A(n29), .B(n39), .Y(\ab[0][2] ) );
  NOR2X1M U116 ( .A(n30), .B(n39), .Y(\ab[0][1] ) );
  NOR2X1M U117 ( .A(n31), .B(n39), .Y(PRODUCT[0]) );
endmodule


module ALU_OPERAND_WIDTH8 ( CLK, RST, EN, A, B, ALU_FUN, ALU_OUT, OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input CLK, RST, EN;
  output OUT_VALID;
  wire   N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103, N104,
         N105, N106, N107, N108, N109, N110, N111, N112, N113, N114, N115,
         N116, N117, N118, N119, N120, N121, N122, N123, N124, N125, N126,
         N127, N128, N129, N130, N131, N132, N133, N158, N160, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177;

  ALU_OPERAND_WIDTH8_DW_div_uns_0 div_33 ( .a({n12, n11, n10, n9, n8, n7, n6, 
        n5}), .b({B[7], n4, B[5:0]}), .quotient({N133, N132, N131, N130, N129, 
        N128, N127, N126}) );
  ALU_OPERAND_WIDTH8_DW01_sub_0 sub_31 ( .A({1'b0, n12, n11, n10, n9, n8, n7, 
        n6, n5}), .B({1'b0, B[7], n4, B[5:0]}), .CI(1'b0), .DIFF({N109, N108, 
        N107, N106, N105, N104, N103, N102, N101}) );
  ALU_OPERAND_WIDTH8_DW01_add_0 add_30 ( .A({1'b0, n12, n11, n10, n9, n8, n7, 
        n6, n5}), .B({1'b0, B[7], n4, B[5:0]}), .CI(1'b0), .SUM({N100, N99, 
        N98, N97, N96, N95, N94, N93, N92}) );
  ALU_OPERAND_WIDTH8_DW02_mult_0 mult_32 ( .A({n12, n11, n10, n9, n8, n7, n6, 
        n5}), .B({B[7], n4, B[5:0]}), .TC(1'b0), .PRODUCT({N125, N124, N123, 
        N122, N121, N120, N119, N118, N117, N116, N115, N114, N113, N112, N111, 
        N110}) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(n144), .CK(CLK), .RN(RST), .Q(ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(n143), .CK(CLK), .RN(RST), .Q(ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(n142), .CK(CLK), .RN(RST), .Q(ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(n141), .CK(CLK), .RN(RST), .Q(ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(n140), .CK(CLK), .RN(RST), .Q(ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(n139), .CK(CLK), .RN(RST), .Q(ALU_OUT[2]) );
  DFFRQX2M \ALU_OUT_reg[15]  ( .D(n154), .CK(CLK), .RN(RST), .Q(ALU_OUT[15])
         );
  DFFRQX2M \ALU_OUT_reg[14]  ( .D(n155), .CK(CLK), .RN(RST), .Q(ALU_OUT[14])
         );
  DFFRQX2M \ALU_OUT_reg[13]  ( .D(n156), .CK(CLK), .RN(RST), .Q(ALU_OUT[13])
         );
  DFFRQX2M \ALU_OUT_reg[12]  ( .D(n157), .CK(CLK), .RN(RST), .Q(ALU_OUT[12])
         );
  DFFRQX2M \ALU_OUT_reg[11]  ( .D(n158), .CK(CLK), .RN(RST), .Q(ALU_OUT[11])
         );
  DFFRQX2M \ALU_OUT_reg[10]  ( .D(n159), .CK(CLK), .RN(RST), .Q(ALU_OUT[10])
         );
  DFFRQX2M \ALU_OUT_reg[9]  ( .D(n160), .CK(CLK), .RN(RST), .Q(ALU_OUT[9]) );
  DFFRQX2M \ALU_OUT_reg[1]  ( .D(n138), .CK(CLK), .RN(RST), .Q(ALU_OUT[1]) );
  DFFRQX2M \ALU_OUT_reg[0]  ( .D(n137), .CK(CLK), .RN(RST), .Q(ALU_OUT[0]) );
  DFFRQX2M \ALU_OUT_reg[8]  ( .D(n145), .CK(CLK), .RN(RST), .Q(ALU_OUT[8]) );
  DFFRQX2M OUT_VALID_reg ( .D(n3), .CK(CLK), .RN(RST), .Q(OUT_VALID) );
  AND2X2M U3 ( .A(EN), .B(n130), .Y(n3) );
  BUFX2M U4 ( .A(A[6]), .Y(n11) );
  NOR2X2M U7 ( .A(n13), .B(n50), .Y(n127) );
  INVX2M U8 ( .A(n114), .Y(n174) );
  INVX2M U9 ( .A(n76), .Y(n175) );
  NOR3X2M U10 ( .A(n51), .B(n59), .C(n52), .Y(n131) );
  NOR4X1M U11 ( .A(n133), .B(n48), .C(n49), .D(n55), .Y(n132) );
  NAND2X2M U12 ( .A(n114), .B(n112), .Y(n133) );
  NAND2X2M U13 ( .A(n136), .B(n56), .Y(n76) );
  AND2X2M U14 ( .A(n136), .B(n129), .Y(n50) );
  AND2X2M U15 ( .A(n56), .B(n134), .Y(n59) );
  NOR2X2M U16 ( .A(n177), .B(n176), .Y(n136) );
  NAND2X2M U17 ( .A(n135), .B(n115), .Y(n114) );
  AND2X2M U18 ( .A(n115), .B(n134), .Y(n48) );
  AND2X2M U19 ( .A(n129), .B(n134), .Y(n49) );
  NAND2X2M U20 ( .A(n135), .B(n129), .Y(n112) );
  NAND2X2M U21 ( .A(n112), .B(n113), .Y(n60) );
  AND2X2M U22 ( .A(n55), .B(n129), .Y(n46) );
  AND2X2M U23 ( .A(n55), .B(n115), .Y(n47) );
  AND2X2M U24 ( .A(n56), .B(n135), .Y(n52) );
  BUFX2M U25 ( .A(n58), .Y(n13) );
  OAI2BB1X2M U26 ( .A0N(n115), .A1N(n136), .B0(n113), .Y(n58) );
  INVX2M U27 ( .A(n40), .Y(n153) );
  AOI22X1M U28 ( .A0(N133), .A1(n47), .B0(N117), .B1(n46), .Y(n107) );
  NOR2X2M U29 ( .A(n176), .B(ALU_FUN[2]), .Y(n55) );
  NOR2X2M U30 ( .A(n177), .B(ALU_FUN[1]), .Y(n135) );
  AND3X2M U31 ( .A(n135), .B(ALU_FUN[0]), .C(ALU_FUN[3]), .Y(n51) );
  NOR2X2M U32 ( .A(ALU_FUN[3]), .B(ALU_FUN[0]), .Y(n129) );
  NOR2BX2M U33 ( .AN(ALU_FUN[3]), .B(ALU_FUN[0]), .Y(n56) );
  NOR2X2M U34 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n134) );
  NOR2BX2M U35 ( .AN(ALU_FUN[0]), .B(ALU_FUN[3]), .Y(n115) );
  NAND3X2M U36 ( .A(ALU_FUN[0]), .B(n134), .C(ALU_FUN[3]), .Y(n113) );
  NAND4BX1M U37 ( .AN(n40), .B(n55), .C(ALU_FUN[3]), .D(ALU_FUN[0]), .Y(n68)
         );
  INVX2M U38 ( .A(ALU_FUN[2]), .Y(n177) );
  INVX2M U39 ( .A(ALU_FUN[1]), .Y(n176) );
  INVX2M U40 ( .A(n3), .Y(n14) );
  AND2X2M U41 ( .A(n46), .B(n3), .Y(n120) );
  AOI222X1M U42 ( .A0(N110), .A1(n46), .B0(n174), .B1(n5), .C0(N126), .C1(n47), 
        .Y(n45) );
  AOI222X1M U43 ( .A0(N127), .A1(n47), .B0(n50), .B1(n171), .C0(n174), .C1(n6), 
        .Y(n65) );
  AOI222X1M U44 ( .A0(N112), .A1(n46), .B0(n7), .B1(n174), .C0(N128), .C1(n47), 
        .Y(n71) );
  AOI222X1M U45 ( .A0(N113), .A1(n46), .B0(n8), .B1(n174), .C0(N129), .C1(n47), 
        .Y(n79) );
  AOI222X1M U46 ( .A0(N114), .A1(n46), .B0(n9), .B1(n174), .C0(N130), .C1(n47), 
        .Y(n86) );
  AOI222X1M U47 ( .A0(N115), .A1(n46), .B0(n10), .B1(n174), .C0(N131), .C1(n47), .Y(n93) );
  INVX2M U48 ( .A(n4), .Y(n152) );
  AOI222X1M U49 ( .A0(N116), .A1(n46), .B0(n11), .B1(n174), .C0(N132), .C1(n47), .Y(n100) );
  AOI21X2M U50 ( .A0(n127), .A1(n128), .B0(n14), .Y(n118) );
  NAND2X2M U51 ( .A(N109), .B(n48), .Y(n128) );
  OAI222X1M U52 ( .A0(n103), .A1(n152), .B0(n4), .B1(n104), .C0(n76), .C1(n167), .Y(n102) );
  AOI221XLM U53 ( .A0(n59), .A1(n166), .B0(n11), .B1(n60), .C0(n174), .Y(n103)
         );
  AOI221XLM U54 ( .A0(n11), .A1(n59), .B0(n13), .B1(n166), .C0(n50), .Y(n104)
         );
  NAND4X2M U55 ( .A(n127), .B(n76), .C(n131), .D(n132), .Y(n130) );
  INVX2M U56 ( .A(n57), .Y(n172) );
  AOI221XLM U57 ( .A0(n173), .A1(n13), .B0(n59), .B1(n5), .C0(n50), .Y(n57) );
  INVX2M U58 ( .A(n11), .Y(n166) );
  INVX2M U59 ( .A(n7), .Y(n170) );
  INVX2M U60 ( .A(n8), .Y(n169) );
  INVX2M U61 ( .A(n9), .Y(n168) );
  INVX2M U62 ( .A(n10), .Y(n167) );
  INVX2M U63 ( .A(n5), .Y(n173) );
  INVX2M U64 ( .A(n12), .Y(n146) );
  INVX2M U65 ( .A(n6), .Y(n171) );
  BUFX2M U66 ( .A(A[7]), .Y(n12) );
  BUFX2M U67 ( .A(B[6]), .Y(n4) );
  AO22X1M U68 ( .A0(ALU_OUT[0]), .A1(n14), .B0(n3), .B1(n41), .Y(n137) );
  NAND4BX1M U69 ( .AN(n42), .B(n43), .C(n44), .D(n45), .Y(n41) );
  AOI22X1M U70 ( .A0(N101), .A1(n48), .B0(N92), .B1(n49), .Y(n44) );
  AOI222X1M U71 ( .A0(n50), .A1(n173), .B0(n6), .B1(n51), .C0(N160), .C1(n52), 
        .Y(n43) );
  BUFX2M U72 ( .A(A[5]), .Y(n10) );
  AO22X1M U73 ( .A0(ALU_OUT[1]), .A1(n14), .B0(n3), .B1(n61), .Y(n138) );
  NAND4BX1M U74 ( .AN(n62), .B(n63), .C(n64), .D(n65), .Y(n61) );
  AOI222X1M U75 ( .A0(N160), .A1(n52), .B0(n175), .B1(n5), .C0(n7), .C1(n51), 
        .Y(n63) );
  AOI222X1M U76 ( .A0(N93), .A1(n49), .B0(N111), .B1(n46), .C0(N102), .C1(n48), 
        .Y(n64) );
  BUFX2M U77 ( .A(A[4]), .Y(n9) );
  AO21XLM U78 ( .A0(ALU_OUT[2]), .A1(n14), .B0(n69), .Y(n139) );
  AOI31X2M U79 ( .A0(n70), .A1(n71), .A2(n72), .B0(n14), .Y(n69) );
  AOI22X1M U80 ( .A0(N103), .A1(n48), .B0(N94), .B1(n49), .Y(n70) );
  AOI221XLM U81 ( .A0(n8), .A1(n51), .B0(n50), .B1(n170), .C0(n73), .Y(n72) );
  BUFX2M U82 ( .A(A[3]), .Y(n8) );
  AO21XLM U83 ( .A0(ALU_OUT[3]), .A1(n14), .B0(n77), .Y(n140) );
  AOI31X2M U84 ( .A0(n78), .A1(n79), .A2(n80), .B0(n14), .Y(n77) );
  AOI22X1M U85 ( .A0(N104), .A1(n48), .B0(N95), .B1(n49), .Y(n78) );
  AOI221XLM U86 ( .A0(n9), .A1(n51), .B0(n50), .B1(n169), .C0(n81), .Y(n80) );
  BUFX2M U87 ( .A(A[2]), .Y(n7) );
  INVX2M U88 ( .A(n125), .Y(n155) );
  AOI221XLM U89 ( .A0(ALU_OUT[14]), .A1(n14), .B0(N124), .B1(n120), .C0(n118), 
        .Y(n125) );
  INVX2M U90 ( .A(n126), .Y(n154) );
  AOI221XLM U91 ( .A0(ALU_OUT[15]), .A1(n14), .B0(N125), .B1(n120), .C0(n118), 
        .Y(n126) );
  BUFX2M U92 ( .A(A[1]), .Y(n6) );
  BUFX2M U93 ( .A(A[0]), .Y(n5) );
  AO21XLM U94 ( .A0(ALU_OUT[4]), .A1(n14), .B0(n84), .Y(n141) );
  AOI31X2M U95 ( .A0(n85), .A1(n86), .A2(n87), .B0(n14), .Y(n84) );
  AOI22X1M U96 ( .A0(N105), .A1(n48), .B0(N96), .B1(n49), .Y(n85) );
  AOI221XLM U97 ( .A0(n10), .A1(n51), .B0(n50), .B1(n168), .C0(n88), .Y(n87)
         );
  INVX2M U98 ( .A(n121), .Y(n159) );
  AOI221XLM U99 ( .A0(ALU_OUT[10]), .A1(n14), .B0(N120), .B1(n120), .C0(n118), 
        .Y(n121) );
  INVX2M U100 ( .A(n122), .Y(n158) );
  AOI221XLM U101 ( .A0(ALU_OUT[11]), .A1(n14), .B0(N121), .B1(n120), .C0(n118), 
        .Y(n122) );
  INVX2M U102 ( .A(n124), .Y(n156) );
  AOI221XLM U103 ( .A0(ALU_OUT[13]), .A1(n14), .B0(N123), .B1(n120), .C0(n118), 
        .Y(n124) );
  INVX2M U104 ( .A(n123), .Y(n157) );
  AOI221XLM U105 ( .A0(ALU_OUT[12]), .A1(n14), .B0(N122), .B1(n120), .C0(n118), 
        .Y(n123) );
  INVX2M U106 ( .A(n26), .Y(n150) );
  INVX2M U107 ( .A(n119), .Y(n160) );
  AOI221XLM U108 ( .A0(ALU_OUT[9]), .A1(n14), .B0(N119), .B1(n120), .C0(n118), 
        .Y(n119) );
  AO21XLM U109 ( .A0(ALU_OUT[5]), .A1(n14), .B0(n91), .Y(n142) );
  AOI31X2M U110 ( .A0(n92), .A1(n93), .A2(n94), .B0(n14), .Y(n91) );
  AOI22X1M U111 ( .A0(N106), .A1(n48), .B0(N97), .B1(n49), .Y(n92) );
  AOI221XLM U112 ( .A0(n11), .A1(n51), .B0(n50), .B1(n167), .C0(n95), .Y(n94)
         );
  AO21XLM U113 ( .A0(ALU_OUT[7]), .A1(n14), .B0(n105), .Y(n144) );
  AOI31X2M U114 ( .A0(n106), .A1(n107), .A2(n108), .B0(n14), .Y(n105) );
  AOI22X1M U115 ( .A0(N108), .A1(n48), .B0(N99), .B1(n49), .Y(n106) );
  AOI221XLM U116 ( .A0(n50), .A1(n146), .B0(n12), .B1(n174), .C0(n109), .Y(
        n108) );
  OAI211X2M U117 ( .A0(n116), .A1(n14), .B0(n161), .C0(n117), .Y(n145) );
  NAND2X2M U118 ( .A(ALU_OUT[8]), .B(n14), .Y(n117) );
  INVX2M U119 ( .A(n118), .Y(n161) );
  AOI222X1M U120 ( .A0(N100), .A1(n49), .B0(n12), .B1(n175), .C0(N118), .C1(
        n46), .Y(n116) );
  OAI21X2M U121 ( .A0(n53), .A1(n147), .B0(n54), .Y(n42) );
  AOI221XLM U122 ( .A0(n59), .A1(n173), .B0(n5), .B1(n60), .C0(n174), .Y(n53)
         );
  AOI32X1M U123 ( .A0(n55), .A1(n56), .A2(N158), .B0(n172), .B1(n147), .Y(n54)
         );
  INVX2M U124 ( .A(B[0]), .Y(n147) );
  AO21XLM U125 ( .A0(ALU_OUT[6]), .A1(n14), .B0(n98), .Y(n143) );
  AOI31X2M U126 ( .A0(n99), .A1(n100), .A2(n101), .B0(n14), .Y(n98) );
  AOI22X1M U127 ( .A0(N107), .A1(n48), .B0(N98), .B1(n49), .Y(n99) );
  AOI221XLM U128 ( .A0(n12), .A1(n51), .B0(n50), .B1(n166), .C0(n102), .Y(n101) );
  OAI222X1M U129 ( .A0(n74), .A1(n149), .B0(B[2]), .B1(n75), .C0(n171), .C1(
        n76), .Y(n73) );
  AOI221XLM U130 ( .A0(n59), .A1(n170), .B0(n7), .B1(n60), .C0(n174), .Y(n74)
         );
  AOI221XLM U131 ( .A0(n7), .A1(n59), .B0(n13), .B1(n170), .C0(n50), .Y(n75)
         );
  OAI222X1M U132 ( .A0(n82), .A1(n151), .B0(B[3]), .B1(n83), .C0(n76), .C1(
        n170), .Y(n81) );
  AOI221XLM U133 ( .A0(n59), .A1(n169), .B0(n8), .B1(n60), .C0(n174), .Y(n82)
         );
  AOI221XLM U134 ( .A0(n8), .A1(n59), .B0(n13), .B1(n169), .C0(n50), .Y(n83)
         );
  OAI222X1M U135 ( .A0(n89), .A1(n164), .B0(B[4]), .B1(n90), .C0(n76), .C1(
        n169), .Y(n88) );
  INVX2M U136 ( .A(B[4]), .Y(n164) );
  AOI221XLM U137 ( .A0(n59), .A1(n168), .B0(n9), .B1(n60), .C0(n174), .Y(n89)
         );
  AOI221XLM U138 ( .A0(n9), .A1(n59), .B0(n13), .B1(n168), .C0(n50), .Y(n90)
         );
  OAI222X1M U139 ( .A0(n96), .A1(n163), .B0(B[5]), .B1(n97), .C0(n76), .C1(
        n168), .Y(n95) );
  INVX2M U140 ( .A(B[5]), .Y(n163) );
  AOI221XLM U141 ( .A0(n59), .A1(n167), .B0(n10), .B1(n60), .C0(n174), .Y(n96)
         );
  AOI221XLM U142 ( .A0(n10), .A1(n59), .B0(n13), .B1(n167), .C0(n50), .Y(n97)
         );
  OAI222X1M U143 ( .A0(n110), .A1(n162), .B0(B[7]), .B1(n111), .C0(n76), .C1(
        n166), .Y(n109) );
  INVX2M U144 ( .A(B[7]), .Y(n162) );
  AOI221XLM U145 ( .A0(n59), .A1(n146), .B0(n12), .B1(n60), .C0(n174), .Y(n110) );
  AOI221XLM U146 ( .A0(n12), .A1(n59), .B0(n13), .B1(n146), .C0(n50), .Y(n111)
         );
  INVX2M U147 ( .A(n15), .Y(n148) );
  OAI221X1M U148 ( .A0(B[1]), .A1(n66), .B0(n67), .B1(n165), .C0(n68), .Y(n62)
         );
  INVX2M U149 ( .A(B[1]), .Y(n165) );
  AOI221XLM U150 ( .A0(n59), .A1(n171), .B0(n6), .B1(n60), .C0(n174), .Y(n67)
         );
  AOI221XLM U151 ( .A0(n6), .A1(n59), .B0(n13), .B1(n171), .C0(n50), .Y(n66)
         );
  INVX2M U152 ( .A(B[2]), .Y(n149) );
  INVX2M U153 ( .A(B[3]), .Y(n151) );
  NOR2X1M U154 ( .A(n146), .B(B[7]), .Y(n37) );
  NAND2BX1M U155 ( .AN(B[4]), .B(n9), .Y(n30) );
  NAND2BX1M U156 ( .AN(n9), .B(B[4]), .Y(n19) );
  CLKNAND2X2M U157 ( .A(n30), .B(n19), .Y(n32) );
  NOR2X1M U158 ( .A(n151), .B(n8), .Y(n27) );
  NOR2X1M U159 ( .A(n149), .B(n7), .Y(n18) );
  NOR2X1M U160 ( .A(n147), .B(n5), .Y(n15) );
  CLKNAND2X2M U161 ( .A(n7), .B(n149), .Y(n29) );
  NAND2BX1M U162 ( .AN(n18), .B(n29), .Y(n24) );
  AOI21X1M U163 ( .A0(n15), .A1(n171), .B0(B[1]), .Y(n16) );
  AOI211X1M U164 ( .A0(n6), .A1(n148), .B0(n24), .C0(n16), .Y(n17) );
  CLKNAND2X2M U165 ( .A(n8), .B(n151), .Y(n28) );
  OAI31X1M U166 ( .A0(n27), .A1(n18), .A2(n17), .B0(n28), .Y(n20) );
  NAND2BX1M U167 ( .AN(n10), .B(B[5]), .Y(n35) );
  OAI211X1M U168 ( .A0(n32), .A1(n20), .B0(n19), .C0(n35), .Y(n21) );
  NAND2BX1M U169 ( .AN(B[5]), .B(n10), .Y(n31) );
  XNOR2X1M U170 ( .A(n11), .B(n4), .Y(n34) );
  AOI32X1M U171 ( .A0(n21), .A1(n31), .A2(n34), .B0(n4), .B1(n166), .Y(n22) );
  CLKNAND2X2M U172 ( .A(B[7]), .B(n146), .Y(n38) );
  OAI21X1M U173 ( .A0(n37), .A1(n22), .B0(n38), .Y(N160) );
  CLKNAND2X2M U174 ( .A(n5), .B(n147), .Y(n25) );
  OA21X1M U175 ( .A0(n25), .A1(n171), .B0(B[1]), .Y(n23) );
  AOI211X1M U176 ( .A0(n25), .A1(n171), .B0(n24), .C0(n23), .Y(n26) );
  AOI31X1M U177 ( .A0(n150), .A1(n29), .A2(n28), .B0(n27), .Y(n33) );
  OAI2B11X1M U178 ( .A1N(n33), .A0(n32), .B0(n31), .C0(n30), .Y(n36) );
  AOI32X1M U179 ( .A0(n36), .A1(n35), .A2(n34), .B0(n11), .B1(n152), .Y(n39)
         );
  AOI2B1X1M U180 ( .A1N(n39), .A0(n38), .B0(n37), .Y(n40) );
  NOR2X1M U181 ( .A(N160), .B(n153), .Y(N158) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module SYS_TOP ( RST_N, UART_CLK, REF_CLK, UART_RX_IN, UART_TX_O, parity_error, 
        framing_error );
  input RST_N, UART_CLK, REF_CLK, UART_RX_IN;
  output UART_TX_O, parity_error, framing_error;
  wire   SYNC_UART_RST, SYNC_REF_RST, UART_RX_V_OUT, UART_RX_V_SYNC,
         UART_TX_VLD, UART_TX_CLK, UART_TX_Busy_PULSE, FIFO_FULL,
         UART_TX_V_SYNC, UART_TX_Busy, UART_RX_CLK, RF_RdData_VLD, RF_WrEn,
         RF_RdEn, ALU_EN, ALU_OUT_VLD, CLKG_EN, ALU_CLK, n1, n2, n3, n4, n5,
         n6, n7;
  wire   [7:0] UART_RX_OUT;
  wire   [7:0] UART_RX_SYNC;
  wire   [7:0] UART_TX_IN;
  wire   [7:0] UART_TX_SYNC;
  wire   [7:0] DIV_RATIO;
  wire   [7:0] UART_Config;
  wire   [7:0] DIV_RATIO_RX;
  wire   [7:0] RF_RdData;
  wire   [3:0] RF_Address;
  wire   [7:0] RF_WrData;
  wire   [3:0] ALU_FUN;
  wire   [15:0] ALU_OUT;
  wire   [7:0] Operand_A;
  wire   [7:0] Operand_B;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4;

  RST_SYNC_NUM_STAGES2_0 U0_RST_SYNC ( .CLK(UART_CLK), .RST(RST_N), .SYNC_RST(
        SYNC_UART_RST) );
  RST_SYNC_NUM_STAGES2_1 U1_RST_SYNC ( .CLK(REF_CLK), .RST(RST_N), .SYNC_RST(
        SYNC_REF_RST) );
  DATA_SYNC_BUS_WIDTH8_NUM_STAGES2 U0_ref_sync ( .CLK(REF_CLK), .RST(n4), 
        .Bus_Enable(UART_RX_V_OUT), .Unsync_Bus(UART_RX_OUT), .Sync_Bus(
        UART_RX_SYNC), .Enable_Pulse(UART_RX_V_SYNC) );
  ASYNC_FIFO_DATA_WIDTH8_ADDRESS_WIDTH3_MEMORY_DEPTH8_BUS_WIDTH4 U0_UART_FIFO ( 
        .W_CLK(REF_CLK), .W_RST(n4), .W_INC(UART_TX_VLD), .R_CLK(UART_TX_CLK), 
        .R_RST(n6), .R_INC(UART_TX_Busy_PULSE), .WR_DATA(UART_TX_IN), 
        .RD_DATA(UART_TX_SYNC), .FULL(FIFO_FULL), .EMPTY(UART_TX_V_SYNC) );
  PULSE_GEN U0_PULSE_GEN ( .clk(UART_TX_CLK), .rst_n(n6), .level_in(
        UART_TX_Busy), .pulse_out(UART_TX_Busy_PULSE) );
  CLK_DIV_0 U0_ClkDiv ( .i_ref_clk(UART_CLK), .i_rst_n(n6), .i_clk_en(1'b1), 
        .i_div_ratio(DIV_RATIO), .o_div_clk(UART_TX_CLK) );
  CLK_DIV_RX_MUX U0_CLKDIV_MUX ( .PreScale(UART_Config[7:2]), .Div_Ratio({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, DIV_RATIO_RX[2:0]}) );
  CLK_DIV_1 U1_ClkDiv ( .i_ref_clk(UART_CLK), .i_rst_n(n6), .i_clk_en(1'b1), 
        .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, DIV_RATIO_RX[2:0]}), 
        .o_div_clk(UART_RX_CLK) );
  UART_TOP U0_UART ( .RST(n6), .TX_CLK(UART_TX_CLK), .RX_CLK(UART_RX_CLK), 
        .RX_IN_S(UART_RX_IN), .RX_OUT_P(UART_RX_OUT), .RX_OUT_V(UART_RX_V_OUT), 
        .TX_IN_P(UART_TX_SYNC), .TX_IN_V(n1), .TX_OUT_S(UART_TX_O), .TX_OUT_V(
        UART_TX_Busy), .Prescale(UART_Config[7:2]), .parity_enable(
        UART_Config[0]), .parity_type(UART_Config[1]), .parity_error(
        parity_error), .framing_error(framing_error) );
  SYS_CTRL U0_SYS_CTRL ( .CLK(REF_CLK), .RST(n4), .FIFO_FULL(FIFO_FULL), 
        .ALU_OUT(ALU_OUT), .ALU_OUT_Valid(ALU_OUT_VLD), .ALU_FUN(ALU_FUN), 
        .ALU_EN(ALU_EN), .CLK_Gate_EN(CLKG_EN), .Address(RF_Address), .WrEn(
        RF_WrEn), .RdEn(RF_RdEn), .WrData(RF_WrData), .RdData(RF_RdData), 
        .RdData_Valid(RF_RdData_VLD), .RX_P_DATA(UART_RX_SYNC), .RX_D_VLD(
        UART_RX_V_SYNC), .TX_P_DATA(UART_TX_IN), .TX_D_VLD(UART_TX_VLD) );
  REG_FILE U0_RegFile ( .CLK(REF_CLK), .RST(n4), .WrData(RF_WrData), .Address(
        {RF_Address[3:2], n3, n2}), .WrEn(RF_WrEn), .RdEn(RF_RdEn), 
        .RdData_Valid(RF_RdData_VLD), .RdData(RF_RdData), .REG0(Operand_A), 
        .REG1(Operand_B), .REG2(UART_Config), .REG3(DIV_RATIO) );
  ALU_OPERAND_WIDTH8 U0_ALU ( .CLK(ALU_CLK), .RST(n4), .EN(ALU_EN), .A(
        Operand_A), .B(Operand_B), .ALU_FUN(ALU_FUN), .ALU_OUT(ALU_OUT), 
        .OUT_VALID(ALU_OUT_VLD) );
  CLK_GATE U0_CLK_GATE ( .CLK_EN(CLKG_EN), .CLK(REF_CLK), .GATED_CLK(ALU_CLK)
         );
  BUFX2M U2 ( .A(RF_Address[0]), .Y(n2) );
  BUFX2M U3 ( .A(RF_Address[1]), .Y(n3) );
  INVX2M U4 ( .A(UART_TX_V_SYNC), .Y(n1) );
  INVX4M U5 ( .A(n5), .Y(n4) );
  INVX2M U6 ( .A(SYNC_REF_RST), .Y(n5) );
  INVX4M U7 ( .A(n7), .Y(n6) );
  INVX2M U8 ( .A(SYNC_UART_RST), .Y(n7) );
endmodule

