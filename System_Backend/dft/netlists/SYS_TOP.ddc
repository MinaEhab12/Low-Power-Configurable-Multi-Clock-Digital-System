/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Sun Sep 28 22:41:04 2025
/////////////////////////////////////////////////////////////


module RST_SYNC_NUM_STAGES2_test_0 ( CLK, RST, SYNC_RST, test_si, test_se );
  input CLK, RST, test_si, test_se;
  output SYNC_RST;
  wire   \sync_reg[0] ;

  SDFFRQX2M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .SI(\sync_reg[0] ), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(SYNC_RST) );
  SDFFRQX2M \sync_reg_reg[0]  ( .D(1'b1), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(\sync_reg[0] ) );
endmodule


module RST_SYNC_NUM_STAGES2_test_1 ( CLK, RST, SYNC_RST, test_si, test_se );
  input CLK, RST, test_si, test_se;
  output SYNC_RST;
  wire   \sync_reg[0] ;

  SDFFRQX2M \sync_reg_reg[0]  ( .D(1'b1), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(\sync_reg[0] ) );
  SDFFRQX1M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .SI(\sync_reg[0] ), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(SYNC_RST) );
endmodule


module DATA_SYNC_BUS_WIDTH8_NUM_STAGES2_test_1 ( CLK, RST, Bus_Enable, 
        Unsync_Bus, Sync_Bus, Enable_Pulse, test_si, test_so, test_se );
  input [7:0] Unsync_Bus;
  output [7:0] Sync_Bus;
  input CLK, RST, Bus_Enable, test_si, test_se;
  output Enable_Pulse, test_so;
  wire   enable_sync_dly, n1, n4, n6, n8, n10, n12, n14, n16, n18, n23;
  wire   [1:0] Multi_FF_bus_en;
  assign test_so = enable_sync_dly;

  SDFFRQX2M enable_sync_dly_reg ( .D(Multi_FF_bus_en[1]), .SI(Sync_Bus[7]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(enable_sync_dly) );
  SDFFRQX2M \Sync_Bus_reg[0]  ( .D(n18), .SI(Multi_FF_bus_en[1]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(Sync_Bus[0]) );
  SDFFRQX2M \Sync_Bus_reg[7]  ( .D(n4), .SI(Sync_Bus[6]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(Sync_Bus[7]) );
  SDFFRQX2M \Sync_Bus_reg[3]  ( .D(n12), .SI(Sync_Bus[2]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(Sync_Bus[3]) );
  SDFFRQX2M \Sync_Bus_reg[4]  ( .D(n10), .SI(Sync_Bus[3]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(Sync_Bus[4]) );
  SDFFRQX2M \Sync_Bus_reg[6]  ( .D(n6), .SI(Sync_Bus[5]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(Sync_Bus[6]) );
  SDFFRQX2M \Sync_Bus_reg[2]  ( .D(n14), .SI(Sync_Bus[1]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(Sync_Bus[2]) );
  SDFFRQX2M \Sync_Bus_reg[1]  ( .D(n16), .SI(Sync_Bus[0]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(Sync_Bus[1]) );
  SDFFRQX2M \Sync_Bus_reg[5]  ( .D(n8), .SI(Sync_Bus[4]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(Sync_Bus[5]) );
  SDFFRQX2M Enable_Pulse_reg ( .D(n23), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(Enable_Pulse) );
  SDFFRQX2M \Multi_FF_bus_en_reg[0]  ( .D(Bus_Enable), .SI(Enable_Pulse), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(Multi_FF_bus_en[0]) );
  SDFFRQX1M \Multi_FF_bus_en_reg[1]  ( .D(Multi_FF_bus_en[0]), .SI(
        Multi_FF_bus_en[0]), .SE(test_se), .CK(CLK), .RN(RST), .Q(
        Multi_FF_bus_en[1]) );
  INVX2M U4 ( .A(n1), .Y(n23) );
  NAND2BX2M U5 ( .AN(enable_sync_dly), .B(Multi_FF_bus_en[1]), .Y(n1) );
  AO22X1M U6 ( .A0(Unsync_Bus[7]), .A1(n23), .B0(Sync_Bus[7]), .B1(n1), .Y(n4)
         );
  AO22X1M U7 ( .A0(Unsync_Bus[6]), .A1(n23), .B0(Sync_Bus[6]), .B1(n1), .Y(n6)
         );
  AO22X1M U8 ( .A0(Unsync_Bus[5]), .A1(n23), .B0(Sync_Bus[5]), .B1(n1), .Y(n8)
         );
  AO22X1M U9 ( .A0(Unsync_Bus[4]), .A1(n23), .B0(Sync_Bus[4]), .B1(n1), .Y(n10) );
  AO22X1M U10 ( .A0(Unsync_Bus[3]), .A1(n23), .B0(Sync_Bus[3]), .B1(n1), .Y(
        n12) );
  AO22X1M U11 ( .A0(Unsync_Bus[2]), .A1(n23), .B0(Sync_Bus[2]), .B1(n1), .Y(
        n14) );
  AO22X1M U12 ( .A0(Unsync_Bus[1]), .A1(n23), .B0(Sync_Bus[1]), .B1(n1), .Y(
        n16) );
  AO22X1M U25 ( .A0(Unsync_Bus[0]), .A1(n23), .B0(Sync_Bus[0]), .B1(n1), .Y(
        n18) );
endmodule


module DF_SYNC_BUS_WIDTH4_test_0 ( i_clk, i_rst_n, i_async_data, o_sync_data, 
        test_si, test_se );
  input [3:0] i_async_data;
  output [3:0] o_sync_data;
  input i_clk, i_rst_n, test_si, test_se;

  wire   [3:0] sync_stage1;

  SDFFRQX2M \sync_stage2_reg[1]  ( .D(sync_stage1[1]), .SI(o_sync_data[0]), 
        .SE(test_se), .CK(i_clk), .RN(i_rst_n), .Q(o_sync_data[1]) );
  SDFFRQX2M \sync_stage2_reg[0]  ( .D(sync_stage1[0]), .SI(sync_stage1[3]), 
        .SE(test_se), .CK(i_clk), .RN(i_rst_n), .Q(o_sync_data[0]) );
  SDFFRQX2M \sync_stage2_reg[3]  ( .D(sync_stage1[3]), .SI(o_sync_data[2]), 
        .SE(test_se), .CK(i_clk), .RN(i_rst_n), .Q(o_sync_data[3]) );
  SDFFRQX2M \sync_stage2_reg[2]  ( .D(sync_stage1[2]), .SI(o_sync_data[1]), 
        .SE(test_se), .CK(i_clk), .RN(i_rst_n), .Q(o_sync_data[2]) );
  SDFFRQX2M \sync_stage1_reg[3]  ( .D(i_async_data[3]), .SI(sync_stage1[2]), 
        .SE(test_se), .CK(i_clk), .RN(i_rst_n), .Q(sync_stage1[3]) );
  SDFFRQX2M \sync_stage1_reg[2]  ( .D(i_async_data[2]), .SI(sync_stage1[1]), 
        .SE(test_se), .CK(i_clk), .RN(i_rst_n), .Q(sync_stage1[2]) );
  SDFFRQX2M \sync_stage1_reg[1]  ( .D(i_async_data[1]), .SI(sync_stage1[0]), 
        .SE(test_se), .CK(i_clk), .RN(i_rst_n), .Q(sync_stage1[1]) );
  SDFFRQX2M \sync_stage1_reg[0]  ( .D(i_async_data[0]), .SI(test_si), .SE(
        test_se), .CK(i_clk), .RN(i_rst_n), .Q(sync_stage1[0]) );
endmodule


module DF_SYNC_BUS_WIDTH4_test_1 ( i_clk, i_rst_n, i_async_data, o_sync_data, 
        test_si, test_se );
  input [3:0] i_async_data;
  output [3:0] o_sync_data;
  input i_clk, i_rst_n, test_si, test_se;

  wire   [3:0] sync_stage1;

  SDFFRQX2M \sync_stage2_reg[3]  ( .D(sync_stage1[3]), .SI(o_sync_data[2]), 
        .SE(test_se), .CK(i_clk), .RN(i_rst_n), .Q(o_sync_data[3]) );
  SDFFRQX2M \sync_stage2_reg[2]  ( .D(sync_stage1[2]), .SI(o_sync_data[1]), 
        .SE(test_se), .CK(i_clk), .RN(i_rst_n), .Q(o_sync_data[2]) );
  SDFFRQX2M \sync_stage2_reg[1]  ( .D(sync_stage1[1]), .SI(o_sync_data[0]), 
        .SE(test_se), .CK(i_clk), .RN(i_rst_n), .Q(o_sync_data[1]) );
  SDFFRQX2M \sync_stage2_reg[0]  ( .D(sync_stage1[0]), .SI(sync_stage1[3]), 
        .SE(test_se), .CK(i_clk), .RN(i_rst_n), .Q(o_sync_data[0]) );
  SDFFRQX2M \sync_stage1_reg[3]  ( .D(i_async_data[3]), .SI(sync_stage1[2]), 
        .SE(test_se), .CK(i_clk), .RN(i_rst_n), .Q(sync_stage1[3]) );
  SDFFRQX2M \sync_stage1_reg[2]  ( .D(i_async_data[2]), .SI(sync_stage1[1]), 
        .SE(test_se), .CK(i_clk), .RN(i_rst_n), .Q(sync_stage1[2]) );
  SDFFRQX2M \sync_stage1_reg[1]  ( .D(i_async_data[1]), .SI(sync_stage1[0]), 
        .SE(test_se), .CK(i_clk), .RN(i_rst_n), .Q(sync_stage1[1]) );
  SDFFRQX2M \sync_stage1_reg[0]  ( .D(i_async_data[0]), .SI(test_si), .SE(
        test_se), .CK(i_clk), .RN(i_rst_n), .Q(sync_stage1[0]) );
endmodule


module FIFO_MEM_CNTRL_ADDRESS_WIDTH3_MEMORY_DEPTH8_DATA_WIDTH8_test_1 ( i_wclk, 
        i_wrst_n, i_wen, i_wdata, i_waddr, i_raddr, o_rdata, test_si2, 
        test_si1, test_so2, test_so1, test_se );
  input [7:0] i_wdata;
  input [2:0] i_waddr;
  input [2:0] i_raddr;
  output [7:0] o_rdata;
  input i_wclk, i_wrst_n, i_wen, test_si2, test_si1, test_se;
  output test_so2, test_so1;
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
         \memory[0][0] , n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n182, n183,
         n184, n185, n186;
  assign N10 = i_raddr[0];
  assign N11 = i_raddr[1];
  assign N12 = i_raddr[2];
  assign test_so2 = \memory[7][7] ;
  assign test_so1 = \memory[3][6] ;

  SDFFRQX2M \memory_reg[5][7]  ( .D(n132), .SI(\memory[5][6] ), .SE(n186), 
        .CK(i_wclk), .RN(n164), .Q(\memory[5][7] ) );
  SDFFRQX2M \memory_reg[5][6]  ( .D(n131), .SI(\memory[5][5] ), .SE(n185), 
        .CK(i_wclk), .RN(n164), .Q(\memory[5][6] ) );
  SDFFRQX2M \memory_reg[5][5]  ( .D(n130), .SI(\memory[5][4] ), .SE(n184), 
        .CK(i_wclk), .RN(n164), .Q(\memory[5][5] ) );
  SDFFRQX2M \memory_reg[5][4]  ( .D(n129), .SI(\memory[5][3] ), .SE(n183), 
        .CK(i_wclk), .RN(n164), .Q(\memory[5][4] ) );
  SDFFRQX2M \memory_reg[5][3]  ( .D(n128), .SI(\memory[5][2] ), .SE(n186), 
        .CK(i_wclk), .RN(n164), .Q(\memory[5][3] ) );
  SDFFRQX2M \memory_reg[5][2]  ( .D(n127), .SI(\memory[5][1] ), .SE(n185), 
        .CK(i_wclk), .RN(n164), .Q(\memory[5][2] ) );
  SDFFRQX2M \memory_reg[5][1]  ( .D(n126), .SI(\memory[5][0] ), .SE(n184), 
        .CK(i_wclk), .RN(n164), .Q(\memory[5][1] ) );
  SDFFRQX2M \memory_reg[5][0]  ( .D(n125), .SI(\memory[4][7] ), .SE(n183), 
        .CK(i_wclk), .RN(n164), .Q(\memory[5][0] ) );
  SDFFRQX2M \memory_reg[1][7]  ( .D(n100), .SI(\memory[1][6] ), .SE(n186), 
        .CK(i_wclk), .RN(n167), .Q(\memory[1][7] ) );
  SDFFRQX2M \memory_reg[1][6]  ( .D(n99), .SI(\memory[1][5] ), .SE(n185), .CK(
        i_wclk), .RN(n167), .Q(\memory[1][6] ) );
  SDFFRQX2M \memory_reg[1][5]  ( .D(n98), .SI(\memory[1][4] ), .SE(n184), .CK(
        i_wclk), .RN(n167), .Q(\memory[1][5] ) );
  SDFFRQX2M \memory_reg[1][4]  ( .D(n97), .SI(\memory[1][3] ), .SE(n183), .CK(
        i_wclk), .RN(n167), .Q(\memory[1][4] ) );
  SDFFRQX2M \memory_reg[1][3]  ( .D(n96), .SI(\memory[1][2] ), .SE(n186), .CK(
        i_wclk), .RN(n167), .Q(\memory[1][3] ) );
  SDFFRQX2M \memory_reg[1][2]  ( .D(n95), .SI(\memory[1][1] ), .SE(n185), .CK(
        i_wclk), .RN(n167), .Q(\memory[1][2] ) );
  SDFFRQX2M \memory_reg[1][1]  ( .D(n94), .SI(\memory[1][0] ), .SE(n184), .CK(
        i_wclk), .RN(n167), .Q(\memory[1][1] ) );
  SDFFRQX2M \memory_reg[1][0]  ( .D(n93), .SI(\memory[0][7] ), .SE(n183), .CK(
        i_wclk), .RN(n167), .Q(\memory[1][0] ) );
  SDFFRQX2M \memory_reg[7][7]  ( .D(n148), .SI(\memory[7][6] ), .SE(n186), 
        .CK(i_wclk), .RN(n163), .Q(\memory[7][7] ) );
  SDFFRQX2M \memory_reg[7][6]  ( .D(n147), .SI(\memory[7][5] ), .SE(n185), 
        .CK(i_wclk), .RN(n163), .Q(\memory[7][6] ) );
  SDFFRQX2M \memory_reg[7][5]  ( .D(n146), .SI(\memory[7][4] ), .SE(n184), 
        .CK(i_wclk), .RN(n163), .Q(\memory[7][5] ) );
  SDFFRQX2M \memory_reg[7][4]  ( .D(n145), .SI(\memory[7][3] ), .SE(n183), 
        .CK(i_wclk), .RN(n163), .Q(\memory[7][4] ) );
  SDFFRQX2M \memory_reg[7][3]  ( .D(n144), .SI(\memory[7][2] ), .SE(n186), 
        .CK(i_wclk), .RN(n163), .Q(\memory[7][3] ) );
  SDFFRQX2M \memory_reg[7][2]  ( .D(n143), .SI(\memory[7][1] ), .SE(n185), 
        .CK(i_wclk), .RN(n163), .Q(\memory[7][2] ) );
  SDFFRQX2M \memory_reg[7][1]  ( .D(n142), .SI(\memory[7][0] ), .SE(n184), 
        .CK(i_wclk), .RN(n163), .Q(\memory[7][1] ) );
  SDFFRQX2M \memory_reg[7][0]  ( .D(n141), .SI(\memory[6][7] ), .SE(n183), 
        .CK(i_wclk), .RN(n163), .Q(\memory[7][0] ) );
  SDFFRQX2M \memory_reg[3][7]  ( .D(n116), .SI(test_si2), .SE(n186), .CK(
        i_wclk), .RN(n165), .Q(\memory[3][7] ) );
  SDFFRQX2M \memory_reg[3][6]  ( .D(n115), .SI(\memory[3][5] ), .SE(n185), 
        .CK(i_wclk), .RN(n165), .Q(\memory[3][6] ) );
  SDFFRQX2M \memory_reg[3][5]  ( .D(n114), .SI(\memory[3][4] ), .SE(n184), 
        .CK(i_wclk), .RN(n165), .Q(\memory[3][5] ) );
  SDFFRQX2M \memory_reg[3][4]  ( .D(n113), .SI(\memory[3][3] ), .SE(n183), 
        .CK(i_wclk), .RN(n165), .Q(\memory[3][4] ) );
  SDFFRQX2M \memory_reg[3][3]  ( .D(n112), .SI(\memory[3][2] ), .SE(n186), 
        .CK(i_wclk), .RN(n166), .Q(\memory[3][3] ) );
  SDFFRQX2M \memory_reg[3][2]  ( .D(n111), .SI(\memory[3][1] ), .SE(n185), 
        .CK(i_wclk), .RN(n166), .Q(\memory[3][2] ) );
  SDFFRQX2M \memory_reg[3][1]  ( .D(n110), .SI(\memory[3][0] ), .SE(n184), 
        .CK(i_wclk), .RN(n166), .Q(\memory[3][1] ) );
  SDFFRQX2M \memory_reg[3][0]  ( .D(n109), .SI(\memory[2][7] ), .SE(n183), 
        .CK(i_wclk), .RN(n166), .Q(\memory[3][0] ) );
  SDFFRQX2M \memory_reg[6][7]  ( .D(n140), .SI(\memory[6][6] ), .SE(n186), 
        .CK(i_wclk), .RN(n163), .Q(\memory[6][7] ) );
  SDFFRQX2M \memory_reg[6][6]  ( .D(n139), .SI(\memory[6][5] ), .SE(n185), 
        .CK(i_wclk), .RN(n163), .Q(\memory[6][6] ) );
  SDFFRQX2M \memory_reg[6][5]  ( .D(n138), .SI(\memory[6][4] ), .SE(n184), 
        .CK(i_wclk), .RN(n163), .Q(\memory[6][5] ) );
  SDFFRQX2M \memory_reg[6][4]  ( .D(n137), .SI(\memory[6][3] ), .SE(n183), 
        .CK(i_wclk), .RN(n163), .Q(\memory[6][4] ) );
  SDFFRQX2M \memory_reg[6][3]  ( .D(n136), .SI(\memory[6][2] ), .SE(n186), 
        .CK(i_wclk), .RN(n164), .Q(\memory[6][3] ) );
  SDFFRQX2M \memory_reg[6][2]  ( .D(n135), .SI(\memory[6][1] ), .SE(n185), 
        .CK(i_wclk), .RN(n164), .Q(\memory[6][2] ) );
  SDFFRQX2M \memory_reg[6][1]  ( .D(n134), .SI(\memory[6][0] ), .SE(n184), 
        .CK(i_wclk), .RN(n164), .Q(\memory[6][1] ) );
  SDFFRQX2M \memory_reg[6][0]  ( .D(n133), .SI(\memory[5][7] ), .SE(n183), 
        .CK(i_wclk), .RN(n164), .Q(\memory[6][0] ) );
  SDFFRQX2M \memory_reg[2][7]  ( .D(n108), .SI(\memory[2][6] ), .SE(n186), 
        .CK(i_wclk), .RN(n166), .Q(\memory[2][7] ) );
  SDFFRQX2M \memory_reg[2][6]  ( .D(n107), .SI(\memory[2][5] ), .SE(n185), 
        .CK(i_wclk), .RN(n166), .Q(\memory[2][6] ) );
  SDFFRQX2M \memory_reg[2][5]  ( .D(n106), .SI(\memory[2][4] ), .SE(n184), 
        .CK(i_wclk), .RN(n166), .Q(\memory[2][5] ) );
  SDFFRQX2M \memory_reg[2][4]  ( .D(n105), .SI(\memory[2][3] ), .SE(n183), 
        .CK(i_wclk), .RN(n166), .Q(\memory[2][4] ) );
  SDFFRQX2M \memory_reg[2][3]  ( .D(n104), .SI(\memory[2][2] ), .SE(n186), 
        .CK(i_wclk), .RN(n166), .Q(\memory[2][3] ) );
  SDFFRQX2M \memory_reg[2][2]  ( .D(n103), .SI(\memory[2][1] ), .SE(n185), 
        .CK(i_wclk), .RN(n166), .Q(\memory[2][2] ) );
  SDFFRQX2M \memory_reg[2][1]  ( .D(n102), .SI(\memory[2][0] ), .SE(n184), 
        .CK(i_wclk), .RN(n166), .Q(\memory[2][1] ) );
  SDFFRQX2M \memory_reg[2][0]  ( .D(n101), .SI(\memory[1][7] ), .SE(n183), 
        .CK(i_wclk), .RN(n166), .Q(\memory[2][0] ) );
  SDFFRQX2M \memory_reg[4][7]  ( .D(n124), .SI(\memory[4][6] ), .SE(n186), 
        .CK(i_wclk), .RN(n165), .Q(\memory[4][7] ) );
  SDFFRQX2M \memory_reg[4][6]  ( .D(n123), .SI(\memory[4][5] ), .SE(n185), 
        .CK(i_wclk), .RN(n165), .Q(\memory[4][6] ) );
  SDFFRQX2M \memory_reg[4][5]  ( .D(n122), .SI(\memory[4][4] ), .SE(n184), 
        .CK(i_wclk), .RN(n165), .Q(\memory[4][5] ) );
  SDFFRQX2M \memory_reg[4][4]  ( .D(n121), .SI(\memory[4][3] ), .SE(n183), 
        .CK(i_wclk), .RN(n165), .Q(\memory[4][4] ) );
  SDFFRQX2M \memory_reg[4][3]  ( .D(n120), .SI(\memory[4][2] ), .SE(n186), 
        .CK(i_wclk), .RN(n165), .Q(\memory[4][3] ) );
  SDFFRQX2M \memory_reg[4][2]  ( .D(n119), .SI(\memory[4][1] ), .SE(n185), 
        .CK(i_wclk), .RN(n165), .Q(\memory[4][2] ) );
  SDFFRQX2M \memory_reg[4][1]  ( .D(n118), .SI(\memory[4][0] ), .SE(n184), 
        .CK(i_wclk), .RN(n165), .Q(\memory[4][1] ) );
  SDFFRQX2M \memory_reg[4][0]  ( .D(n117), .SI(\memory[3][7] ), .SE(n183), 
        .CK(i_wclk), .RN(n165), .Q(\memory[4][0] ) );
  SDFFRQX2M \memory_reg[0][7]  ( .D(n92), .SI(\memory[0][6] ), .SE(n186), .CK(
        i_wclk), .RN(n167), .Q(\memory[0][7] ) );
  SDFFRQX2M \memory_reg[0][6]  ( .D(n91), .SI(\memory[0][5] ), .SE(n185), .CK(
        i_wclk), .RN(n167), .Q(\memory[0][6] ) );
  SDFFRQX2M \memory_reg[0][5]  ( .D(n90), .SI(\memory[0][4] ), .SE(n184), .CK(
        i_wclk), .RN(n167), .Q(\memory[0][5] ) );
  SDFFRQX2M \memory_reg[0][4]  ( .D(n89), .SI(\memory[0][3] ), .SE(n183), .CK(
        i_wclk), .RN(n167), .Q(\memory[0][4] ) );
  SDFFRQX2M \memory_reg[0][3]  ( .D(n88), .SI(\memory[0][2] ), .SE(n186), .CK(
        i_wclk), .RN(n168), .Q(\memory[0][3] ) );
  SDFFRQX2M \memory_reg[0][2]  ( .D(n87), .SI(\memory[0][1] ), .SE(n185), .CK(
        i_wclk), .RN(n168), .Q(\memory[0][2] ) );
  SDFFRQX2M \memory_reg[0][1]  ( .D(n86), .SI(\memory[0][0] ), .SE(n184), .CK(
        i_wclk), .RN(n168), .Q(\memory[0][1] ) );
  SDFFRQX2M \memory_reg[0][0]  ( .D(n85), .SI(test_si1), .SE(n183), .CK(i_wclk), .RN(n168), .Q(\memory[0][0] ) );
  BUFX2M U66 ( .A(n82), .Y(n159) );
  BUFX2M U67 ( .A(n83), .Y(n158) );
  BUFX2M U68 ( .A(n84), .Y(n157) );
  BUFX2M U69 ( .A(n78), .Y(n160) );
  BUFX2M U70 ( .A(n162), .Y(n167) );
  BUFX2M U71 ( .A(n162), .Y(n166) );
  BUFX2M U72 ( .A(n161), .Y(n165) );
  BUFX2M U73 ( .A(n161), .Y(n164) );
  BUFX2M U74 ( .A(n161), .Y(n163) );
  BUFX2M U75 ( .A(n162), .Y(n168) );
  BUFX2M U76 ( .A(i_wrst_n), .Y(n162) );
  BUFX2M U77 ( .A(i_wrst_n), .Y(n161) );
  NAND3X2M U78 ( .A(n169), .B(n178), .C(n81), .Y(n80) );
  NAND3X2M U79 ( .A(n169), .B(n178), .C(n76), .Y(n75) );
  NAND3X2M U80 ( .A(i_waddr[0]), .B(n76), .C(i_waddr[1]), .Y(n79) );
  NAND3X2M U81 ( .A(n76), .B(n178), .C(i_waddr[0]), .Y(n77) );
  NOR2BX2M U82 ( .AN(i_wen), .B(i_waddr[2]), .Y(n76) );
  OAI2BB2X1M U83 ( .B0(n75), .B1(n170), .A0N(\memory[0][0] ), .A1N(n75), .Y(
        n85) );
  OAI2BB2X1M U84 ( .B0(n75), .B1(n171), .A0N(\memory[0][1] ), .A1N(n75), .Y(
        n86) );
  OAI2BB2X1M U85 ( .B0(n75), .B1(n172), .A0N(\memory[0][2] ), .A1N(n75), .Y(
        n87) );
  OAI2BB2X1M U86 ( .B0(n75), .B1(n173), .A0N(\memory[0][3] ), .A1N(n75), .Y(
        n88) );
  OAI2BB2X1M U87 ( .B0(n75), .B1(n174), .A0N(\memory[0][4] ), .A1N(n75), .Y(
        n89) );
  OAI2BB2X1M U88 ( .B0(n75), .B1(n175), .A0N(\memory[0][5] ), .A1N(n75), .Y(
        n90) );
  OAI2BB2X1M U89 ( .B0(n75), .B1(n176), .A0N(\memory[0][6] ), .A1N(n75), .Y(
        n91) );
  OAI2BB2X1M U90 ( .B0(n75), .B1(n177), .A0N(\memory[0][7] ), .A1N(n75), .Y(
        n92) );
  OAI2BB2X1M U91 ( .B0(n170), .B1(n79), .A0N(\memory[3][0] ), .A1N(n79), .Y(
        n109) );
  OAI2BB2X1M U92 ( .B0(n171), .B1(n79), .A0N(\memory[3][1] ), .A1N(n79), .Y(
        n110) );
  OAI2BB2X1M U93 ( .B0(n172), .B1(n79), .A0N(\memory[3][2] ), .A1N(n79), .Y(
        n111) );
  OAI2BB2X1M U94 ( .B0(n173), .B1(n79), .A0N(\memory[3][3] ), .A1N(n79), .Y(
        n112) );
  OAI2BB2X1M U95 ( .B0(n174), .B1(n79), .A0N(\memory[3][4] ), .A1N(n79), .Y(
        n113) );
  OAI2BB2X1M U96 ( .B0(n175), .B1(n79), .A0N(\memory[3][5] ), .A1N(n79), .Y(
        n114) );
  OAI2BB2X1M U97 ( .B0(n176), .B1(n79), .A0N(\memory[3][6] ), .A1N(n79), .Y(
        n115) );
  OAI2BB2X1M U98 ( .B0(n177), .B1(n79), .A0N(\memory[3][7] ), .A1N(n79), .Y(
        n116) );
  OAI2BB2X1M U99 ( .B0(n170), .B1(n77), .A0N(\memory[1][0] ), .A1N(n77), .Y(
        n93) );
  OAI2BB2X1M U100 ( .B0(n171), .B1(n77), .A0N(\memory[1][1] ), .A1N(n77), .Y(
        n94) );
  OAI2BB2X1M U101 ( .B0(n172), .B1(n77), .A0N(\memory[1][2] ), .A1N(n77), .Y(
        n95) );
  OAI2BB2X1M U102 ( .B0(n173), .B1(n77), .A0N(\memory[1][3] ), .A1N(n77), .Y(
        n96) );
  OAI2BB2X1M U103 ( .B0(n174), .B1(n77), .A0N(\memory[1][4] ), .A1N(n77), .Y(
        n97) );
  OAI2BB2X1M U104 ( .B0(n175), .B1(n77), .A0N(\memory[1][5] ), .A1N(n77), .Y(
        n98) );
  OAI2BB2X1M U105 ( .B0(n176), .B1(n77), .A0N(\memory[1][6] ), .A1N(n77), .Y(
        n99) );
  OAI2BB2X1M U106 ( .B0(n177), .B1(n77), .A0N(\memory[1][7] ), .A1N(n77), .Y(
        n100) );
  OAI2BB2X1M U107 ( .B0(n170), .B1(n80), .A0N(\memory[4][0] ), .A1N(n80), .Y(
        n117) );
  OAI2BB2X1M U108 ( .B0(n171), .B1(n80), .A0N(\memory[4][1] ), .A1N(n80), .Y(
        n118) );
  OAI2BB2X1M U109 ( .B0(n172), .B1(n80), .A0N(\memory[4][2] ), .A1N(n80), .Y(
        n119) );
  OAI2BB2X1M U110 ( .B0(n173), .B1(n80), .A0N(\memory[4][3] ), .A1N(n80), .Y(
        n120) );
  OAI2BB2X1M U111 ( .B0(n174), .B1(n80), .A0N(\memory[4][4] ), .A1N(n80), .Y(
        n121) );
  OAI2BB2X1M U112 ( .B0(n175), .B1(n80), .A0N(\memory[4][5] ), .A1N(n80), .Y(
        n122) );
  OAI2BB2X1M U113 ( .B0(n176), .B1(n80), .A0N(\memory[4][6] ), .A1N(n80), .Y(
        n123) );
  OAI2BB2X1M U114 ( .B0(n177), .B1(n80), .A0N(\memory[4][7] ), .A1N(n80), .Y(
        n124) );
  OAI2BB2X1M U115 ( .B0(n170), .B1(n160), .A0N(\memory[2][0] ), .A1N(n160), 
        .Y(n101) );
  OAI2BB2X1M U116 ( .B0(n171), .B1(n160), .A0N(\memory[2][1] ), .A1N(n160), 
        .Y(n102) );
  OAI2BB2X1M U117 ( .B0(n172), .B1(n160), .A0N(\memory[2][2] ), .A1N(n160), 
        .Y(n103) );
  OAI2BB2X1M U118 ( .B0(n173), .B1(n160), .A0N(\memory[2][3] ), .A1N(n160), 
        .Y(n104) );
  OAI2BB2X1M U119 ( .B0(n174), .B1(n160), .A0N(\memory[2][4] ), .A1N(n160), 
        .Y(n105) );
  OAI2BB2X1M U120 ( .B0(n175), .B1(n160), .A0N(\memory[2][5] ), .A1N(n160), 
        .Y(n106) );
  OAI2BB2X1M U121 ( .B0(n176), .B1(n160), .A0N(\memory[2][6] ), .A1N(n160), 
        .Y(n107) );
  OAI2BB2X1M U122 ( .B0(n177), .B1(n160), .A0N(\memory[2][7] ), .A1N(n160), 
        .Y(n108) );
  AND2X2M U123 ( .A(i_waddr[2]), .B(i_wen), .Y(n81) );
  NAND3X2M U124 ( .A(n76), .B(n169), .C(i_waddr[1]), .Y(n78) );
  INVX2M U125 ( .A(i_wdata[0]), .Y(n170) );
  INVX2M U126 ( .A(i_wdata[1]), .Y(n171) );
  INVX2M U127 ( .A(i_wdata[2]), .Y(n172) );
  INVX2M U128 ( .A(i_wdata[3]), .Y(n173) );
  INVX2M U129 ( .A(i_wdata[4]), .Y(n174) );
  INVX2M U130 ( .A(i_wdata[5]), .Y(n175) );
  INVX2M U131 ( .A(i_wdata[6]), .Y(n176) );
  INVX2M U132 ( .A(i_wdata[7]), .Y(n177) );
  OAI2BB2X1M U133 ( .B0(n170), .B1(n159), .A0N(\memory[5][0] ), .A1N(n159), 
        .Y(n125) );
  OAI2BB2X1M U134 ( .B0(n171), .B1(n159), .A0N(\memory[5][1] ), .A1N(n159), 
        .Y(n126) );
  OAI2BB2X1M U135 ( .B0(n172), .B1(n159), .A0N(\memory[5][2] ), .A1N(n159), 
        .Y(n127) );
  OAI2BB2X1M U136 ( .B0(n173), .B1(n159), .A0N(\memory[5][3] ), .A1N(n159), 
        .Y(n128) );
  OAI2BB2X1M U137 ( .B0(n174), .B1(n159), .A0N(\memory[5][4] ), .A1N(n159), 
        .Y(n129) );
  OAI2BB2X1M U138 ( .B0(n175), .B1(n159), .A0N(\memory[5][5] ), .A1N(n159), 
        .Y(n130) );
  OAI2BB2X1M U139 ( .B0(n176), .B1(n159), .A0N(\memory[5][6] ), .A1N(n159), 
        .Y(n131) );
  OAI2BB2X1M U140 ( .B0(n177), .B1(n159), .A0N(\memory[5][7] ), .A1N(n159), 
        .Y(n132) );
  OAI2BB2X1M U141 ( .B0(n170), .B1(n158), .A0N(\memory[6][0] ), .A1N(n158), 
        .Y(n133) );
  OAI2BB2X1M U142 ( .B0(n171), .B1(n158), .A0N(\memory[6][1] ), .A1N(n158), 
        .Y(n134) );
  OAI2BB2X1M U143 ( .B0(n172), .B1(n158), .A0N(\memory[6][2] ), .A1N(n158), 
        .Y(n135) );
  OAI2BB2X1M U144 ( .B0(n173), .B1(n158), .A0N(\memory[6][3] ), .A1N(n158), 
        .Y(n136) );
  OAI2BB2X1M U145 ( .B0(n174), .B1(n158), .A0N(\memory[6][4] ), .A1N(n158), 
        .Y(n137) );
  OAI2BB2X1M U146 ( .B0(n175), .B1(n158), .A0N(\memory[6][5] ), .A1N(n158), 
        .Y(n138) );
  OAI2BB2X1M U147 ( .B0(n176), .B1(n158), .A0N(\memory[6][6] ), .A1N(n158), 
        .Y(n139) );
  OAI2BB2X1M U148 ( .B0(n177), .B1(n158), .A0N(\memory[6][7] ), .A1N(n158), 
        .Y(n140) );
  OAI2BB2X1M U149 ( .B0(n170), .B1(n157), .A0N(\memory[7][0] ), .A1N(n157), 
        .Y(n141) );
  OAI2BB2X1M U150 ( .B0(n171), .B1(n157), .A0N(\memory[7][1] ), .A1N(n157), 
        .Y(n142) );
  OAI2BB2X1M U151 ( .B0(n172), .B1(n157), .A0N(\memory[7][2] ), .A1N(n157), 
        .Y(n143) );
  OAI2BB2X1M U152 ( .B0(n173), .B1(n157), .A0N(\memory[7][3] ), .A1N(n157), 
        .Y(n144) );
  OAI2BB2X1M U153 ( .B0(n174), .B1(n157), .A0N(\memory[7][4] ), .A1N(n157), 
        .Y(n145) );
  OAI2BB2X1M U154 ( .B0(n175), .B1(n157), .A0N(\memory[7][5] ), .A1N(n157), 
        .Y(n146) );
  OAI2BB2X1M U155 ( .B0(n176), .B1(n157), .A0N(\memory[7][6] ), .A1N(n157), 
        .Y(n147) );
  OAI2BB2X1M U156 ( .B0(n177), .B1(n157), .A0N(\memory[7][7] ), .A1N(n157), 
        .Y(n148) );
  NAND3X2M U157 ( .A(i_waddr[1]), .B(n169), .C(n81), .Y(n83) );
  NAND3X2M U158 ( .A(i_waddr[1]), .B(i_waddr[0]), .C(n81), .Y(n84) );
  NAND3X2M U159 ( .A(i_waddr[0]), .B(n178), .C(n81), .Y(n82) );
  INVX2M U160 ( .A(i_waddr[1]), .Y(n178) );
  INVX2M U161 ( .A(i_waddr[0]), .Y(n169) );
  MX2X2M U162 ( .A(n154), .B(n153), .S0(N12), .Y(o_rdata[7]) );
  MX4X1M U163 ( .A(\memory[4][7] ), .B(\memory[5][7] ), .C(\memory[6][7] ), 
        .D(\memory[7][7] ), .S0(n155), .S1(N11), .Y(n153) );
  MX4X1M U164 ( .A(\memory[0][7] ), .B(\memory[1][7] ), .C(\memory[2][7] ), 
        .D(\memory[3][7] ), .S0(n156), .S1(N11), .Y(n154) );
  MX2X2M U165 ( .A(n66), .B(n65), .S0(N12), .Y(o_rdata[0]) );
  MX4X1M U166 ( .A(\memory[4][0] ), .B(\memory[5][0] ), .C(\memory[6][0] ), 
        .D(\memory[7][0] ), .S0(n155), .S1(N11), .Y(n65) );
  MX4X1M U167 ( .A(\memory[0][0] ), .B(\memory[1][0] ), .C(\memory[2][0] ), 
        .D(\memory[3][0] ), .S0(n156), .S1(N11), .Y(n66) );
  MX2X2M U168 ( .A(n68), .B(n67), .S0(N12), .Y(o_rdata[1]) );
  MX4X1M U169 ( .A(\memory[4][1] ), .B(\memory[5][1] ), .C(\memory[6][1] ), 
        .D(\memory[7][1] ), .S0(n155), .S1(N11), .Y(n67) );
  MX4X1M U170 ( .A(\memory[0][1] ), .B(\memory[1][1] ), .C(\memory[2][1] ), 
        .D(\memory[3][1] ), .S0(n156), .S1(N11), .Y(n68) );
  MX2X2M U171 ( .A(n70), .B(n69), .S0(N12), .Y(o_rdata[2]) );
  MX4X1M U172 ( .A(\memory[4][2] ), .B(\memory[5][2] ), .C(\memory[6][2] ), 
        .D(\memory[7][2] ), .S0(n155), .S1(N11), .Y(n69) );
  MX4X1M U173 ( .A(\memory[0][2] ), .B(\memory[1][2] ), .C(\memory[2][2] ), 
        .D(\memory[3][2] ), .S0(n156), .S1(N11), .Y(n70) );
  MX2X2M U174 ( .A(n72), .B(n71), .S0(N12), .Y(o_rdata[3]) );
  MX4X1M U175 ( .A(\memory[4][3] ), .B(\memory[5][3] ), .C(\memory[6][3] ), 
        .D(\memory[7][3] ), .S0(n155), .S1(N11), .Y(n71) );
  MX4X1M U176 ( .A(\memory[0][3] ), .B(\memory[1][3] ), .C(\memory[2][3] ), 
        .D(\memory[3][3] ), .S0(n156), .S1(N11), .Y(n72) );
  MX2X2M U177 ( .A(n74), .B(n73), .S0(N12), .Y(o_rdata[4]) );
  MX4X1M U178 ( .A(\memory[4][4] ), .B(\memory[5][4] ), .C(\memory[6][4] ), 
        .D(\memory[7][4] ), .S0(n155), .S1(N11), .Y(n73) );
  MX4X1M U179 ( .A(\memory[0][4] ), .B(\memory[1][4] ), .C(\memory[2][4] ), 
        .D(\memory[3][4] ), .S0(n156), .S1(N11), .Y(n74) );
  MX2X2M U180 ( .A(n150), .B(n149), .S0(N12), .Y(o_rdata[5]) );
  MX4X1M U181 ( .A(\memory[4][5] ), .B(\memory[5][5] ), .C(\memory[6][5] ), 
        .D(\memory[7][5] ), .S0(n155), .S1(N11), .Y(n149) );
  MX4X1M U182 ( .A(\memory[0][5] ), .B(\memory[1][5] ), .C(\memory[2][5] ), 
        .D(\memory[3][5] ), .S0(n156), .S1(N11), .Y(n150) );
  MX2X2M U183 ( .A(n152), .B(n151), .S0(N12), .Y(o_rdata[6]) );
  MX4X1M U184 ( .A(\memory[4][6] ), .B(\memory[5][6] ), .C(\memory[6][6] ), 
        .D(\memory[7][6] ), .S0(n155), .S1(N11), .Y(n151) );
  MX4X1M U185 ( .A(\memory[0][6] ), .B(\memory[1][6] ), .C(\memory[2][6] ), 
        .D(\memory[3][6] ), .S0(n156), .S1(N11), .Y(n152) );
  BUFX2M U186 ( .A(N10), .Y(n156) );
  BUFX2M U187 ( .A(N10), .Y(n155) );
  INVXLM U188 ( .A(test_se), .Y(n182) );
  INVXLM U189 ( .A(n182), .Y(n183) );
  INVXLM U190 ( .A(n182), .Y(n184) );
  INVXLM U191 ( .A(n182), .Y(n185) );
  INVXLM U192 ( .A(n182), .Y(n186) );
endmodule


module FIFO_RD_ADDRESS_WIDTH3_test_1 ( i_rclk, i_rrst_n, i_rinc, i_rq2_wptr, 
        o_rempty, o_raddr, o_rptr, test_si, test_so, test_se );
  input [3:0] i_rq2_wptr;
  output [2:0] o_raddr;
  output [3:0] o_rptr;
  input i_rclk, i_rrst_n, i_rinc, test_si, test_se;
  output o_rempty, test_so;
  wire   N83, N84, N85, N86, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n1, n2, n11, n12;
  assign test_so = N86;

  SDFFRQX2M \o_rptr_reg[0]  ( .D(N83), .SI(test_si), .SE(test_se), .CK(i_rclk), 
        .RN(i_rrst_n), .Q(o_rptr[0]) );
  SDFFRQX2M \o_rptr_reg[3]  ( .D(N86), .SI(o_rptr[2]), .SE(test_se), .CK(
        i_rclk), .RN(i_rrst_n), .Q(o_rptr[3]) );
  SDFFRQX2M \o_rptr_reg[2]  ( .D(N85), .SI(o_rptr[1]), .SE(test_se), .CK(
        i_rclk), .RN(i_rrst_n), .Q(o_rptr[2]) );
  SDFFRQX2M \o_rptr_reg[1]  ( .D(N84), .SI(o_rptr[0]), .SE(test_se), .CK(
        i_rclk), .RN(i_rrst_n), .Q(o_rptr[1]) );
  SDFFRQX2M \rptr_bin_reg[3]  ( .D(n25), .SI(o_raddr[2]), .SE(test_se), .CK(
        i_rclk), .RN(i_rrst_n), .Q(N86) );
  SDFFRQX2M \rptr_bin_reg[0]  ( .D(n28), .SI(o_rptr[3]), .SE(test_se), .CK(
        i_rclk), .RN(i_rrst_n), .Q(o_raddr[0]) );
  SDFFRQX2M \rptr_bin_reg[2]  ( .D(n26), .SI(o_raddr[1]), .SE(test_se), .CK(
        i_rclk), .RN(i_rrst_n), .Q(o_raddr[2]) );
  SDFFRQX2M \rptr_bin_reg[1]  ( .D(n27), .SI(o_raddr[0]), .SE(test_se), .CK(
        i_rclk), .RN(i_rrst_n), .Q(o_raddr[1]) );
  NOR2X2M U11 ( .A(n2), .B(n20), .Y(n19) );
  INVX2M U12 ( .A(n15), .Y(o_rempty) );
  XNOR2X2M U13 ( .A(o_rptr[2]), .B(i_rq2_wptr[2]), .Y(n24) );
  XNOR2X2M U14 ( .A(n11), .B(o_raddr[1]), .Y(N84) );
  XNOR2X2M U15 ( .A(o_raddr[2]), .B(n18), .Y(n26) );
  XNOR2X2M U16 ( .A(o_raddr[1]), .B(n2), .Y(N83) );
  XNOR2X2M U17 ( .A(o_raddr[0]), .B(n20), .Y(n28) );
  NAND4X2M U18 ( .A(n21), .B(n22), .C(n23), .D(n24), .Y(n15) );
  XNOR2X2M U19 ( .A(o_rptr[1]), .B(i_rq2_wptr[1]), .Y(n21) );
  XNOR2X2M U20 ( .A(o_rptr[0]), .B(i_rq2_wptr[0]), .Y(n22) );
  XNOR2X2M U21 ( .A(o_rptr[3]), .B(i_rq2_wptr[3]), .Y(n23) );
  NAND2X2M U22 ( .A(o_raddr[1]), .B(n19), .Y(n18) );
  OAI21X2M U23 ( .A0(N86), .A1(n11), .B0(n17), .Y(N85) );
  INVX2M U24 ( .A(o_raddr[2]), .Y(n11) );
  NAND2X2M U25 ( .A(i_rinc), .B(n15), .Y(n20) );
  NAND2X2M U26 ( .A(N86), .B(n11), .Y(n17) );
  OAI211X2M U27 ( .A0(n1), .A1(n12), .B0(n16), .C0(n17), .Y(n25) );
  NAND3X2M U28 ( .A(n1), .B(n12), .C(o_raddr[2]), .Y(n16) );
  INVX2M U29 ( .A(N86), .Y(n12) );
  INVX2M U30 ( .A(n18), .Y(n1) );
  INVX2M U31 ( .A(o_raddr[0]), .Y(n2) );
  CLKXOR2X2M U32 ( .A(o_raddr[1]), .B(n19), .Y(n27) );
endmodule


module FIFO_WR_ADDRESS_WIDTH3_test_1 ( i_wclk, i_wrst_n, i_winc, i_wq2_rptr, 
        o_wfull, o_waddr, o_wptr, test_si, test_so, test_se );
  input [3:0] i_wq2_rptr;
  output [2:0] o_waddr;
  output [3:0] o_wptr;
  input i_wclk, i_wrst_n, i_winc, test_si, test_se;
  output o_wfull, test_so;
  wire   N84, N85, N86, N93, n3, n4, n5, n6, n8, n9, n10, n11, n12, n16, n19,
         n21, n24, n1;
  assign test_so = N86;

  SDFFRQX2M \wptr_bin_reg[3]  ( .D(n16), .SI(o_waddr[2]), .SE(test_se), .CK(
        i_wclk), .RN(i_wrst_n), .Q(N86) );
  SDFFRQX2M \wptr_bin_reg[2]  ( .D(n19), .SI(o_waddr[1]), .SE(test_se), .CK(
        i_wclk), .RN(i_wrst_n), .Q(o_waddr[2]) );
  SDFFRQX2M \wptr_bin_reg[0]  ( .D(n24), .SI(o_wptr[3]), .SE(test_se), .CK(
        i_wclk), .RN(i_wrst_n), .Q(o_waddr[0]) );
  SDFFRQX2M \o_wptr_reg[0]  ( .D(N93), .SI(test_si), .SE(test_se), .CK(i_wclk), 
        .RN(i_wrst_n), .Q(o_wptr[0]) );
  SDFFRQX2M \o_wptr_reg[1]  ( .D(N84), .SI(o_wptr[0]), .SE(test_se), .CK(
        i_wclk), .RN(i_wrst_n), .Q(o_wptr[1]) );
  SDFFRQX2M \o_wptr_reg[3]  ( .D(N86), .SI(o_wptr[2]), .SE(test_se), .CK(
        i_wclk), .RN(i_wrst_n), .Q(o_wptr[3]) );
  SDFFRQX2M \o_wptr_reg[2]  ( .D(N85), .SI(o_wptr[1]), .SE(test_se), .CK(
        i_wclk), .RN(i_wrst_n), .Q(o_wptr[2]) );
  SDFFRQX2M \wptr_bin_reg[1]  ( .D(n21), .SI(n1), .SE(test_se), .CK(i_wclk), 
        .RN(i_wrst_n), .Q(o_waddr[1]) );
  NOR2X2M U3 ( .A(n1), .B(n8), .Y(n6) );
  NAND2X2M U4 ( .A(i_winc), .B(n3), .Y(n8) );
  INVX2M U5 ( .A(n3), .Y(o_wfull) );
  XNOR2X2M U6 ( .A(o_waddr[2]), .B(n5), .Y(n19) );
  XNOR2X2M U7 ( .A(N86), .B(n4), .Y(n16) );
  NAND2BX2M U8 ( .AN(n5), .B(o_waddr[2]), .Y(n4) );
  XNOR2X2M U9 ( .A(o_waddr[0]), .B(n8), .Y(n24) );
  NAND4X2M U10 ( .A(n9), .B(n10), .C(n11), .D(n12), .Y(n3) );
  XNOR2X2M U11 ( .A(o_wptr[0]), .B(i_wq2_rptr[0]), .Y(n9) );
  XNOR2X2M U12 ( .A(o_wptr[1]), .B(i_wq2_rptr[1]), .Y(n10) );
  CLKXOR2X2M U13 ( .A(o_wptr[2]), .B(i_wq2_rptr[2]), .Y(n11) );
  NAND2X2M U14 ( .A(o_waddr[1]), .B(n6), .Y(n5) );
  CLKXOR2X2M U15 ( .A(o_wptr[3]), .B(i_wq2_rptr[3]), .Y(n12) );
  CLKXOR2X2M U16 ( .A(o_waddr[1]), .B(n6), .Y(n21) );
  XNOR2X2M U17 ( .A(o_waddr[1]), .B(n1), .Y(N93) );
  INVX2M U18 ( .A(o_waddr[0]), .Y(n1) );
  CLKXOR2X2M U19 ( .A(o_waddr[2]), .B(o_waddr[1]), .Y(N84) );
  CLKXOR2X2M U20 ( .A(o_waddr[2]), .B(N86), .Y(N85) );
endmodule



    module ASYNC_FIFO_DATA_WIDTH8_ADDRESS_WIDTH3_MEMORY_DEPTH8_BUS_WIDTH4_test_1 ( 
        W_CLK, W_RST, W_INC, R_CLK, R_RST, R_INC, WR_DATA, RD_DATA, FULL, 
        EMPTY, test_si2, test_si1, test_so2, test_so1, test_se );
  input [7:0] WR_DATA;
  output [7:0] RD_DATA;
  input W_CLK, W_RST, W_INC, R_CLK, R_RST, R_INC, test_si2, test_si1, test_se;
  output FULL, EMPTY, test_so2, test_so1;
  wire   _0_net_, n1, n2, n3, n4, n5;
  wire   [3:0] rptr;
  wire   [3:0] wq2_rptr;
  wire   [3:0] wptr;
  wire   [3:0] rq2_wptr;
  wire   [2:0] raddr;
  wire   [2:0] waddr;
  assign test_so2 = rq2_wptr[3];

  NOR2BX2M U1 ( .AN(W_INC), .B(FULL), .Y(_0_net_) );
  INVX2M U2 ( .A(n2), .Y(n1) );
  INVX2M U3 ( .A(W_RST), .Y(n2) );
  DF_SYNC_BUS_WIDTH4_test_0 sync_r2w ( .i_clk(W_CLK), .i_rst_n(n1), 
        .i_async_data(rptr), .o_sync_data(wq2_rptr), .test_si(n3), .test_se(
        test_se) );
  DF_SYNC_BUS_WIDTH4_test_1 sync_w2r ( .i_clk(R_CLK), .i_rst_n(R_RST), 
        .i_async_data(wptr), .o_sync_data(rq2_wptr), .test_si(wq2_rptr[3]), 
        .test_se(test_se) );
  FIFO_MEM_CNTRL_ADDRESS_WIDTH3_MEMORY_DEPTH8_DATA_WIDTH8_test_1 FIFO_Memory ( 
        .i_wclk(W_CLK), .i_wrst_n(n1), .i_wen(_0_net_), .i_wdata(WR_DATA), 
        .i_waddr(waddr), .i_raddr(raddr), .o_rdata(RD_DATA), .test_si2(
        test_si2), .test_si1(test_si1), .test_so2(n5), .test_so1(test_so1), 
        .test_se(test_se) );
  FIFO_RD_ADDRESS_WIDTH3_test_1 U_FIFO_RD ( .i_rclk(R_CLK), .i_rrst_n(R_RST), 
        .i_rinc(R_INC), .i_rq2_wptr(rq2_wptr), .o_rempty(EMPTY), .o_raddr(
        raddr), .o_rptr(rptr), .test_si(n5), .test_so(n4), .test_se(test_se)
         );
  FIFO_WR_ADDRESS_WIDTH3_test_1 U_FIFO_WR ( .i_wclk(W_CLK), .i_wrst_n(n1), 
        .i_winc(W_INC), .i_wq2_rptr(wq2_rptr), .o_wfull(FULL), .o_waddr(waddr), 
        .o_wptr(wptr), .test_si(n4), .test_so(n3), .test_se(test_se) );
endmodule


module PULSE_GEN_test_1 ( clk, rst_n, level_in, pulse_out, test_si, test_so, 
        test_se );
  input clk, rst_n, level_in, test_si, test_se;
  output pulse_out, test_so;
  wire   level_d2, level_d1;
  assign test_so = level_d2;

  SDFFRQX2M level_d1_reg ( .D(level_in), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst_n), .Q(level_d1) );
  SDFFRQX2M level_d2_reg ( .D(level_d1), .SI(level_d1), .SE(test_se), .CK(clk), 
        .RN(rst_n), .Q(level_d2) );
  NOR2BX2M U5 ( .AN(level_d1), .B(level_d2), .Y(pulse_out) );
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


module CLK_DIV_test_0 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, o_div_clk, 
        test_si, test_so, test_se );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en, test_si, test_se;
  output o_div_clk, test_so;
  wire   N0, div_clk, odd_phase_sel, N16, N17, N18, N19, N20, N21, N22, N25,
         N26, N27, N28, N29, N30, N31, N32, N43, N44, N45, N46, N47, N48, N49,
         N50, n46, n47, n48, n49, n50, n51, n52, n53, n54, N84, N83, N82, N81,
         N80, N79, N78, N77, N76, N75, N74, N73, N72, N71,
         \mult_add_84_aco/PROD_not[0] , \mult_add_84_aco/PROD_not[1] ,
         \mult_add_84_aco/PROD_not[2] , \mult_add_84_aco/PROD_not[3] ,
         \mult_add_84_aco/PROD_not[4] , \mult_add_84_aco/PROD_not[5] ,
         \mult_add_84_aco/PROD_not[6] , \mult_add_66_aco/PROD_not[0] ,
         \mult_add_66_aco/PROD_not[1] , \mult_add_66_aco/PROD_not[2] ,
         \mult_add_66_aco/PROD_not[3] , \mult_add_66_aco/PROD_not[4] ,
         \mult_add_66_aco/PROD_not[5] , \mult_add_66_aco/PROD_not[6] , n1, n2,
         n3, n4, n5, n6, n7, n8, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66;
  wire   [6:0] half_ratio_plus1;
  wire   [6:0] div_counter;
  assign test_so = odd_phase_sel;

  SDFFRQX2M div_clk_reg ( .D(n46), .SI(test_si), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rst_n), .Q(div_clk) );
  SDFFRQX2M odd_phase_sel_reg ( .D(n54), .SI(div_counter[6]), .SE(test_se), 
        .CK(i_ref_clk), .RN(i_rst_n), .Q(odd_phase_sel) );
  SDFFRQX2M \div_counter_reg[5]  ( .D(n48), .SI(div_counter[4]), .SE(test_se), 
        .CK(i_ref_clk), .RN(i_rst_n), .Q(div_counter[5]) );
  SDFFRQX2M \div_counter_reg[4]  ( .D(n49), .SI(div_counter[3]), .SE(test_se), 
        .CK(i_ref_clk), .RN(i_rst_n), .Q(div_counter[4]) );
  SDFFRQX2M \div_counter_reg[3]  ( .D(n50), .SI(div_counter[2]), .SE(test_se), 
        .CK(i_ref_clk), .RN(i_rst_n), .Q(div_counter[3]) );
  SDFFSQX2M \div_counter_reg[0]  ( .D(n53), .SI(div_clk), .SE(test_se), .CK(
        i_ref_clk), .SN(i_rst_n), .Q(div_counter[0]) );
  SDFFRQX2M \div_counter_reg[2]  ( .D(n51), .SI(div_counter[1]), .SE(test_se), 
        .CK(i_ref_clk), .RN(i_rst_n), .Q(div_counter[2]) );
  SDFFRQX2M \div_counter_reg[1]  ( .D(n52), .SI(div_counter[0]), .SE(test_se), 
        .CK(i_ref_clk), .RN(i_rst_n), .Q(div_counter[1]) );
  SDFFRQX2M \div_counter_reg[6]  ( .D(n47), .SI(div_counter[5]), .SE(test_se), 
        .CK(i_ref_clk), .RN(i_rst_n), .Q(div_counter[6]) );
  AND2X2M U8 ( .A(div_counter[0]), .B(N25), .Y(n1) );
  AND2X2M U9 ( .A(div_counter[1]), .B(N25), .Y(n2) );
  AND2X2M U13 ( .A(div_counter[2]), .B(N25), .Y(n3) );
  AND2X2M U15 ( .A(div_counter[3]), .B(N25), .Y(n4) );
  AND2X2M U16 ( .A(div_counter[4]), .B(N25), .Y(n5) );
  AND2X2M U17 ( .A(div_counter[5]), .B(N25), .Y(n6) );
  AND2X2M U18 ( .A(N25), .B(div_counter[6]), .Y(n7) );
  NAND4X2M U19 ( .A(n40), .B(n41), .C(n42), .D(n43), .Y(N43) );
  NAND2BX2M U20 ( .AN(n65), .B(i_clk_en), .Y(n25) );
  MX2X2M U21 ( .A(i_ref_clk), .B(div_clk), .S0(N0), .Y(o_div_clk) );
  NAND4X2M U22 ( .A(n57), .B(n58), .C(n59), .D(n60), .Y(N25) );
  CLKNAND2X2M U23 ( .A(div_counter[0]), .B(N43), .Y(
        \mult_add_66_aco/PROD_not[0] ) );
  CLKINVX1M U24 ( .A(\mult_add_66_aco/PROD_not[0] ), .Y(N78) );
  CLKNAND2X2M U25 ( .A(div_counter[1]), .B(N43), .Y(
        \mult_add_66_aco/PROD_not[1] ) );
  CLKINVX1M U26 ( .A(\mult_add_66_aco/PROD_not[1] ), .Y(N79) );
  CLKNAND2X2M U27 ( .A(div_counter[2]), .B(N43), .Y(
        \mult_add_66_aco/PROD_not[2] ) );
  CLKINVX1M U28 ( .A(\mult_add_66_aco/PROD_not[2] ), .Y(N80) );
  CLKNAND2X2M U29 ( .A(div_counter[3]), .B(N43), .Y(
        \mult_add_66_aco/PROD_not[3] ) );
  CLKINVX1M U30 ( .A(\mult_add_66_aco/PROD_not[3] ), .Y(N81) );
  CLKNAND2X2M U31 ( .A(div_counter[4]), .B(N43), .Y(
        \mult_add_66_aco/PROD_not[4] ) );
  CLKINVX1M U32 ( .A(\mult_add_66_aco/PROD_not[4] ), .Y(N82) );
  CLKNAND2X2M U33 ( .A(div_counter[5]), .B(N43), .Y(
        \mult_add_66_aco/PROD_not[5] ) );
  CLKINVX1M U34 ( .A(\mult_add_66_aco/PROD_not[5] ), .Y(N83) );
  CLKNAND2X2M U35 ( .A(N43), .B(div_counter[6]), .Y(
        \mult_add_66_aco/PROD_not[6] ) );
  CLKINVX1M U36 ( .A(\mult_add_66_aco/PROD_not[6] ), .Y(N84) );
  CLKNAND2X2M U37 ( .A(div_counter[0]), .B(N43), .Y(
        \mult_add_84_aco/PROD_not[0] ) );
  CLKINVX1M U38 ( .A(\mult_add_84_aco/PROD_not[0] ), .Y(N71) );
  CLKNAND2X2M U39 ( .A(div_counter[1]), .B(N43), .Y(
        \mult_add_84_aco/PROD_not[1] ) );
  CLKINVX1M U40 ( .A(\mult_add_84_aco/PROD_not[1] ), .Y(N72) );
  CLKNAND2X2M U41 ( .A(div_counter[2]), .B(N43), .Y(
        \mult_add_84_aco/PROD_not[2] ) );
  CLKINVX1M U42 ( .A(\mult_add_84_aco/PROD_not[2] ), .Y(N73) );
  CLKNAND2X2M U43 ( .A(div_counter[3]), .B(N43), .Y(
        \mult_add_84_aco/PROD_not[3] ) );
  CLKINVX1M U44 ( .A(\mult_add_84_aco/PROD_not[3] ), .Y(N74) );
  CLKNAND2X2M U45 ( .A(div_counter[4]), .B(N43), .Y(
        \mult_add_84_aco/PROD_not[4] ) );
  CLKINVX1M U46 ( .A(\mult_add_84_aco/PROD_not[4] ), .Y(N75) );
  CLKNAND2X2M U47 ( .A(div_counter[5]), .B(N43), .Y(
        \mult_add_84_aco/PROD_not[5] ) );
  CLKINVX1M U48 ( .A(\mult_add_84_aco/PROD_not[5] ), .Y(N76) );
  CLKNAND2X2M U49 ( .A(N43), .B(div_counter[6]), .Y(
        \mult_add_84_aco/PROD_not[6] ) );
  CLKINVX1M U50 ( .A(\mult_add_84_aco/PROD_not[6] ), .Y(N77) );
  CLKXOR2X2M U51 ( .A(n8), .B(odd_phase_sel), .Y(n54) );
  OAI22X1M U52 ( .A0(N25), .A1(n18), .B0(N43), .B1(n19), .Y(n8) );
  CLKNAND2X2M U53 ( .A(n20), .B(n21), .Y(n53) );
  AOI22X1M U54 ( .A0(N16), .A1(n22), .B0(N44), .B1(n23), .Y(n21) );
  AOI22X1M U55 ( .A0(N26), .A1(n24), .B0(div_counter[0]), .B1(n25), .Y(n20) );
  CLKNAND2X2M U56 ( .A(n26), .B(n27), .Y(n52) );
  AOI22X1M U57 ( .A0(N17), .A1(n22), .B0(N45), .B1(n23), .Y(n27) );
  AOI22X1M U58 ( .A0(N27), .A1(n24), .B0(div_counter[1]), .B1(n25), .Y(n26) );
  CLKNAND2X2M U59 ( .A(n28), .B(n29), .Y(n51) );
  AOI22X1M U60 ( .A0(N18), .A1(n22), .B0(N46), .B1(n23), .Y(n29) );
  AOI22X1M U61 ( .A0(N28), .A1(n24), .B0(div_counter[2]), .B1(n25), .Y(n28) );
  CLKNAND2X2M U62 ( .A(n30), .B(n31), .Y(n50) );
  AOI22X1M U63 ( .A0(N19), .A1(n22), .B0(N47), .B1(n23), .Y(n31) );
  AOI22X1M U64 ( .A0(N29), .A1(n24), .B0(div_counter[3]), .B1(n25), .Y(n30) );
  CLKNAND2X2M U65 ( .A(n32), .B(n33), .Y(n49) );
  AOI22X1M U66 ( .A0(N20), .A1(n22), .B0(N48), .B1(n23), .Y(n33) );
  AOI22X1M U67 ( .A0(N30), .A1(n24), .B0(div_counter[4]), .B1(n25), .Y(n32) );
  CLKNAND2X2M U68 ( .A(n34), .B(n35), .Y(n48) );
  AOI22X1M U69 ( .A0(N21), .A1(n22), .B0(N49), .B1(n23), .Y(n35) );
  AOI22X1M U70 ( .A0(N31), .A1(n24), .B0(div_counter[5]), .B1(n25), .Y(n34) );
  CLKNAND2X2M U71 ( .A(n36), .B(n37), .Y(n47) );
  AOI22X1M U72 ( .A0(N22), .A1(n22), .B0(N50), .B1(n23), .Y(n37) );
  CLKINVX1M U73 ( .A(n19), .Y(n22) );
  NAND3X1M U74 ( .A(i_div_ratio[0]), .B(N0), .C(odd_phase_sel), .Y(n19) );
  AOI22X1M U75 ( .A0(N32), .A1(n24), .B0(div_counter[6]), .B1(n25), .Y(n36) );
  CLKXOR2X2M U76 ( .A(n38), .B(div_clk), .Y(n46) );
  OAI22X1M U77 ( .A0(N25), .A1(n18), .B0(N43), .B1(n39), .Y(n38) );
  AOI21X1M U78 ( .A0(odd_phase_sel), .A1(N0), .B0(n23), .Y(n39) );
  NOR2X1M U79 ( .A(n25), .B(i_div_ratio[0]), .Y(n23) );
  CLKINVX1M U80 ( .A(n24), .Y(n18) );
  NOR3BX1M U81 ( .AN(i_div_ratio[0]), .B(odd_phase_sel), .C(n25), .Y(n24) );
  NOR4X1M U82 ( .A(n44), .B(n45), .C(n55), .D(n56), .Y(n43) );
  CLKXOR2X2M U83 ( .A(i_div_ratio[3]), .B(div_counter[2]), .Y(n56) );
  CLKXOR2X2M U84 ( .A(i_div_ratio[2]), .B(div_counter[1]), .Y(n55) );
  CLKXOR2X2M U85 ( .A(i_div_ratio[1]), .B(div_counter[0]), .Y(n45) );
  CLKXOR2X2M U86 ( .A(i_div_ratio[7]), .B(div_counter[6]), .Y(n44) );
  XNOR2X1M U87 ( .A(div_counter[4]), .B(i_div_ratio[5]), .Y(n42) );
  XNOR2X1M U88 ( .A(div_counter[5]), .B(i_div_ratio[6]), .Y(n41) );
  XNOR2X1M U89 ( .A(div_counter[3]), .B(i_div_ratio[4]), .Y(n40) );
  NOR4X1M U90 ( .A(n61), .B(n62), .C(n63), .D(n64), .Y(n60) );
  CLKXOR2X2M U91 ( .A(half_ratio_plus1[2]), .B(div_counter[2]), .Y(n64) );
  CLKXOR2X2M U92 ( .A(half_ratio_plus1[1]), .B(div_counter[1]), .Y(n63) );
  CLKXOR2X2M U93 ( .A(half_ratio_plus1[0]), .B(div_counter[0]), .Y(n62) );
  CLKXOR2X2M U94 ( .A(half_ratio_plus1[6]), .B(div_counter[6]), .Y(n61) );
  XNOR2X1M U95 ( .A(div_counter[4]), .B(half_ratio_plus1[4]), .Y(n59) );
  XNOR2X1M U96 ( .A(div_counter[5]), .B(half_ratio_plus1[5]), .Y(n58) );
  XNOR2X1M U97 ( .A(div_counter[3]), .B(half_ratio_plus1[3]), .Y(n57) );
  CLKINVX1M U98 ( .A(n25), .Y(N0) );
  NOR4BX1M U99 ( .AN(n66), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n65) );
  NOR4X1M U100 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n66) );
  CLK_DIV_0_DW01_inc_0 add_35 ( .A(i_div_ratio[7:1]), .SUM(half_ratio_plus1)
         );
  CLK_DIV_0_DW01_inc_2 add_66_aco ( .A({N84, N83, N82, N81, N80, N79, N78}), 
        .SUM({N22, N21, N20, N19, N18, N17, N16}) );
  CLK_DIV_0_DW01_inc_3 add_74_aco ( .A({n7, n6, n5, n4, n3, n2, n1}), .SUM({
        N32, N31, N30, N29, N28, N27, N26}) );
  CLK_DIV_0_DW01_inc_1 add_84_aco ( .A({N77, N76, N75, N74, N73, N72, N71}), 
        .SUM({N50, N49, N48, N47, N46, N45, N44}) );
endmodule


module CLK_DIV_RX_MUX ( PreScale, Div_Ratio );
  input [5:0] PreScale;
  output [7:0] Div_Ratio;
  wire   n1, n2, n3;

  AND2X2M U13 ( .A(n1), .B(n2), .Y(Div_Ratio[2]) );
  AND2X2M U14 ( .A(n2), .B(n3), .Y(Div_Ratio[1]) );
  OAI21X2M U15 ( .A0(n1), .A1(n3), .B0(n2), .Y(Div_Ratio[0]) );
  NOR3BX2M U16 ( .AN(PreScale[4]), .B(PreScale[3]), .C(PreScale[5]), .Y(n3) );
  NOR3BX2M U17 ( .AN(PreScale[3]), .B(PreScale[4]), .C(PreScale[5]), .Y(n1) );
  NOR3X2M U18 ( .A(PreScale[2]), .B(PreScale[1]), .C(PreScale[0]), .Y(n2) );
  INVX2M U3 ( .A(1'b1), .Y(Div_Ratio[3]) );
  INVX2M U5 ( .A(1'b1), .Y(Div_Ratio[4]) );
  INVX2M U7 ( .A(1'b1), .Y(Div_Ratio[5]) );
  INVX2M U9 ( .A(1'b1), .Y(Div_Ratio[6]) );
  INVX2M U11 ( .A(1'b1), .Y(Div_Ratio[7]) );
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


module CLK_DIV_test_1 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, o_div_clk, 
        test_si, test_so, test_se );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en, test_si, test_se;
  output o_div_clk, test_so;
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
         n3, n4, n5, n6, n7, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76;
  wire   [6:0] half_ratio_plus1;
  wire   [6:0] div_counter;
  assign test_so = odd_phase_sel;

  SDFFRQX2M div_clk_reg ( .D(n76), .SI(test_si), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rst_n), .Q(div_clk) );
  SDFFRQX2M odd_phase_sel_reg ( .D(n68), .SI(div_counter[6]), .SE(test_se), 
        .CK(i_ref_clk), .RN(i_rst_n), .Q(odd_phase_sel) );
  SDFFRQX2M \div_counter_reg[5]  ( .D(n74), .SI(div_counter[4]), .SE(test_se), 
        .CK(i_ref_clk), .RN(i_rst_n), .Q(div_counter[5]) );
  SDFFRQX2M \div_counter_reg[4]  ( .D(n73), .SI(div_counter[3]), .SE(test_se), 
        .CK(i_ref_clk), .RN(i_rst_n), .Q(div_counter[4]) );
  SDFFRQX2M \div_counter_reg[3]  ( .D(n72), .SI(div_counter[2]), .SE(test_se), 
        .CK(i_ref_clk), .RN(i_rst_n), .Q(div_counter[3]) );
  SDFFRQX2M \div_counter_reg[2]  ( .D(n71), .SI(div_counter[1]), .SE(test_se), 
        .CK(i_ref_clk), .RN(i_rst_n), .Q(div_counter[2]) );
  SDFFRQX2M \div_counter_reg[1]  ( .D(n70), .SI(div_counter[0]), .SE(test_se), 
        .CK(i_ref_clk), .RN(i_rst_n), .Q(div_counter[1]) );
  SDFFRQX2M \div_counter_reg[6]  ( .D(n75), .SI(div_counter[5]), .SE(test_se), 
        .CK(i_ref_clk), .RN(i_rst_n), .Q(div_counter[6]) );
  SDFFSQX1M \div_counter_reg[0]  ( .D(n69), .SI(div_clk), .SE(test_se), .CK(
        i_ref_clk), .SN(i_rst_n), .Q(div_counter[0]) );
  AND2X2M U8 ( .A(div_counter[0]), .B(N25), .Y(n1) );
  AND2X2M U9 ( .A(div_counter[1]), .B(N25), .Y(n2) );
  AND2X2M U13 ( .A(div_counter[2]), .B(N25), .Y(n3) );
  AND2X2M U15 ( .A(div_counter[3]), .B(N25), .Y(n4) );
  AND2X2M U16 ( .A(div_counter[4]), .B(N25), .Y(n5) );
  AND2X2M U17 ( .A(div_counter[5]), .B(N25), .Y(n6) );
  AND2X2M U18 ( .A(N25), .B(div_counter[6]), .Y(n7) );
  NAND4X2M U20 ( .A(n41), .B(n42), .C(n43), .D(n44), .Y(N43) );
  NAND2BX2M U21 ( .AN(n66), .B(i_clk_en), .Y(n26) );
  MX2X2M U22 ( .A(i_ref_clk), .B(div_clk), .S0(N0), .Y(o_div_clk) );
  NAND4X2M U23 ( .A(n58), .B(n59), .C(n60), .D(n61), .Y(N25) );
  CLKNAND2X2M U24 ( .A(div_counter[0]), .B(N43), .Y(
        \mult_add_84_aco/PROD_not[0] ) );
  CLKINVX1M U25 ( .A(\mult_add_84_aco/PROD_not[0] ), .Y(N71) );
  CLKNAND2X2M U26 ( .A(div_counter[1]), .B(N43), .Y(
        \mult_add_84_aco/PROD_not[1] ) );
  CLKINVX1M U27 ( .A(\mult_add_84_aco/PROD_not[1] ), .Y(N72) );
  CLKNAND2X2M U28 ( .A(div_counter[2]), .B(N43), .Y(
        \mult_add_84_aco/PROD_not[2] ) );
  CLKINVX1M U29 ( .A(\mult_add_84_aco/PROD_not[2] ), .Y(N73) );
  CLKNAND2X2M U30 ( .A(div_counter[3]), .B(N43), .Y(
        \mult_add_84_aco/PROD_not[3] ) );
  CLKINVX1M U31 ( .A(\mult_add_84_aco/PROD_not[3] ), .Y(N74) );
  CLKNAND2X2M U32 ( .A(div_counter[4]), .B(N43), .Y(
        \mult_add_84_aco/PROD_not[4] ) );
  CLKINVX1M U33 ( .A(\mult_add_84_aco/PROD_not[4] ), .Y(N75) );
  CLKNAND2X2M U34 ( .A(div_counter[5]), .B(N43), .Y(
        \mult_add_84_aco/PROD_not[5] ) );
  CLKINVX1M U35 ( .A(\mult_add_84_aco/PROD_not[5] ), .Y(N76) );
  CLKNAND2X2M U36 ( .A(N43), .B(div_counter[6]), .Y(
        \mult_add_84_aco/PROD_not[6] ) );
  CLKINVX1M U37 ( .A(\mult_add_84_aco/PROD_not[6] ), .Y(N77) );
  CLKNAND2X2M U38 ( .A(div_counter[0]), .B(N43), .Y(
        \mult_add_66_aco/PROD_not[0] ) );
  CLKINVX1M U39 ( .A(\mult_add_66_aco/PROD_not[0] ), .Y(N78) );
  CLKNAND2X2M U40 ( .A(div_counter[1]), .B(N43), .Y(
        \mult_add_66_aco/PROD_not[1] ) );
  CLKINVX1M U41 ( .A(\mult_add_66_aco/PROD_not[1] ), .Y(N79) );
  CLKNAND2X2M U42 ( .A(div_counter[2]), .B(N43), .Y(
        \mult_add_66_aco/PROD_not[2] ) );
  CLKINVX1M U43 ( .A(\mult_add_66_aco/PROD_not[2] ), .Y(N80) );
  CLKNAND2X2M U44 ( .A(div_counter[3]), .B(N43), .Y(
        \mult_add_66_aco/PROD_not[3] ) );
  CLKINVX1M U45 ( .A(\mult_add_66_aco/PROD_not[3] ), .Y(N81) );
  CLKNAND2X2M U46 ( .A(div_counter[4]), .B(N43), .Y(
        \mult_add_66_aco/PROD_not[4] ) );
  CLKINVX1M U47 ( .A(\mult_add_66_aco/PROD_not[4] ), .Y(N82) );
  CLKNAND2X2M U48 ( .A(div_counter[5]), .B(N43), .Y(
        \mult_add_66_aco/PROD_not[5] ) );
  CLKINVX1M U49 ( .A(\mult_add_66_aco/PROD_not[5] ), .Y(N83) );
  CLKNAND2X2M U50 ( .A(N43), .B(div_counter[6]), .Y(
        \mult_add_66_aco/PROD_not[6] ) );
  CLKINVX1M U51 ( .A(\mult_add_66_aco/PROD_not[6] ), .Y(N84) );
  CLKXOR2X2M U52 ( .A(n18), .B(odd_phase_sel), .Y(n68) );
  OAI22X1M U53 ( .A0(N25), .A1(n19), .B0(N43), .B1(n20), .Y(n18) );
  CLKNAND2X2M U54 ( .A(n21), .B(n22), .Y(n69) );
  AOI22X1M U55 ( .A0(N16), .A1(n23), .B0(N44), .B1(n24), .Y(n22) );
  AOI22X1M U56 ( .A0(N26), .A1(n25), .B0(div_counter[0]), .B1(n26), .Y(n21) );
  CLKNAND2X2M U57 ( .A(n27), .B(n28), .Y(n70) );
  AOI22X1M U58 ( .A0(N17), .A1(n23), .B0(N45), .B1(n24), .Y(n28) );
  AOI22X1M U59 ( .A0(N27), .A1(n25), .B0(div_counter[1]), .B1(n26), .Y(n27) );
  CLKNAND2X2M U60 ( .A(n29), .B(n30), .Y(n71) );
  AOI22X1M U61 ( .A0(N18), .A1(n23), .B0(N46), .B1(n24), .Y(n30) );
  AOI22X1M U62 ( .A0(N28), .A1(n25), .B0(div_counter[2]), .B1(n26), .Y(n29) );
  CLKNAND2X2M U63 ( .A(n31), .B(n32), .Y(n72) );
  AOI22X1M U64 ( .A0(N19), .A1(n23), .B0(N47), .B1(n24), .Y(n32) );
  AOI22X1M U65 ( .A0(N29), .A1(n25), .B0(div_counter[3]), .B1(n26), .Y(n31) );
  CLKNAND2X2M U66 ( .A(n33), .B(n34), .Y(n73) );
  AOI22X1M U67 ( .A0(N20), .A1(n23), .B0(N48), .B1(n24), .Y(n34) );
  AOI22X1M U68 ( .A0(N30), .A1(n25), .B0(div_counter[4]), .B1(n26), .Y(n33) );
  CLKNAND2X2M U69 ( .A(n35), .B(n36), .Y(n74) );
  AOI22X1M U70 ( .A0(N21), .A1(n23), .B0(N49), .B1(n24), .Y(n36) );
  AOI22X1M U71 ( .A0(N31), .A1(n25), .B0(div_counter[5]), .B1(n26), .Y(n35) );
  CLKNAND2X2M U72 ( .A(n37), .B(n38), .Y(n75) );
  AOI22X1M U73 ( .A0(N22), .A1(n23), .B0(N50), .B1(n24), .Y(n38) );
  CLKINVX1M U74 ( .A(n20), .Y(n23) );
  NAND3X1M U75 ( .A(i_div_ratio[0]), .B(N0), .C(odd_phase_sel), .Y(n20) );
  AOI22X1M U76 ( .A0(N32), .A1(n25), .B0(div_counter[6]), .B1(n26), .Y(n37) );
  CLKXOR2X2M U77 ( .A(n39), .B(div_clk), .Y(n76) );
  OAI22X1M U78 ( .A0(N25), .A1(n19), .B0(N43), .B1(n40), .Y(n39) );
  AOI21X1M U79 ( .A0(odd_phase_sel), .A1(N0), .B0(n24), .Y(n40) );
  NOR2X1M U80 ( .A(n26), .B(i_div_ratio[0]), .Y(n24) );
  CLKINVX1M U81 ( .A(n25), .Y(n19) );
  NOR3BX1M U82 ( .AN(i_div_ratio[0]), .B(odd_phase_sel), .C(n26), .Y(n25) );
  NOR4X1M U83 ( .A(n45), .B(n55), .C(n56), .D(n57), .Y(n44) );
  CLKXOR2X2M U84 ( .A(i_div_ratio[3]), .B(div_counter[2]), .Y(n57) );
  CLKXOR2X2M U85 ( .A(i_div_ratio[2]), .B(div_counter[1]), .Y(n56) );
  CLKXOR2X2M U86 ( .A(i_div_ratio[1]), .B(div_counter[0]), .Y(n55) );
  CLKXOR2X2M U87 ( .A(i_div_ratio[7]), .B(div_counter[6]), .Y(n45) );
  XNOR2X1M U88 ( .A(div_counter[4]), .B(i_div_ratio[5]), .Y(n43) );
  XNOR2X1M U89 ( .A(div_counter[5]), .B(i_div_ratio[6]), .Y(n42) );
  XNOR2X1M U90 ( .A(div_counter[3]), .B(i_div_ratio[4]), .Y(n41) );
  NOR4X1M U91 ( .A(n62), .B(n63), .C(n64), .D(n65), .Y(n61) );
  CLKXOR2X2M U92 ( .A(half_ratio_plus1[2]), .B(div_counter[2]), .Y(n65) );
  CLKXOR2X2M U93 ( .A(half_ratio_plus1[1]), .B(div_counter[1]), .Y(n64) );
  CLKXOR2X2M U94 ( .A(half_ratio_plus1[0]), .B(div_counter[0]), .Y(n63) );
  CLKXOR2X2M U95 ( .A(half_ratio_plus1[6]), .B(div_counter[6]), .Y(n62) );
  XNOR2X1M U96 ( .A(div_counter[4]), .B(half_ratio_plus1[4]), .Y(n60) );
  XNOR2X1M U97 ( .A(div_counter[5]), .B(half_ratio_plus1[5]), .Y(n59) );
  XNOR2X1M U98 ( .A(div_counter[3]), .B(half_ratio_plus1[3]), .Y(n58) );
  CLKINVX1M U99 ( .A(n26), .Y(N0) );
  NOR4BX1M U100 ( .AN(n67), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n66) );
  NOR4X1M U101 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n67) );
  CLK_DIV_1_DW01_inc_0 add_35 ( .A(i_div_ratio[7:1]), .SUM(half_ratio_plus1)
         );
  CLK_DIV_1_DW01_inc_1 add_66_aco ( .A({N84, N83, N82, N81, N80, N79, N78}), 
        .SUM({N22, N21, N20, N19, N18, N17, N16}) );
  CLK_DIV_1_DW01_inc_3 add_74_aco ( .A({n7, n6, n5, n4, n3, n2, n1}), .SUM({
        N32, N31, N30, N29, N28, N27, N26}) );
  CLK_DIV_1_DW01_inc_2 add_84_aco ( .A({N77, N76, N75, N74, N73, N72, N71}), 
        .SUM({N50, N49, N48, N47, N46, N45, N44}) );
endmodule


module Serializer_DATA_WIDTH8_test_1 ( CLK, RST, P_DATA, Data_Valid, Ser_En, 
        Busy, Ser_Data, Ser_Done, test_si, test_so, test_se );
  input [7:0] P_DATA;
  input CLK, RST, Data_Valid, Ser_En, Busy, test_si, test_se;
  output Ser_Data, Ser_Done, test_so;
  wire   N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, n15, n16,
         n17, n18, n19, n14, n20, n21, n24, n25;
  wire   [2:0] counter;
  wire   [7:1] P_DATA_Buf;
  assign test_so = counter[2];

  SDFFRQX2M \P_DATA_Buf_reg[6]  ( .D(N18), .SI(P_DATA_Buf[5]), .SE(n25), .CK(
        CLK), .RN(RST), .Q(P_DATA_Buf[6]) );
  SDFFRQX2M \P_DATA_Buf_reg[5]  ( .D(N17), .SI(P_DATA_Buf[4]), .SE(n25), .CK(
        CLK), .RN(RST), .Q(P_DATA_Buf[5]) );
  SDFFRQX2M \P_DATA_Buf_reg[4]  ( .D(N16), .SI(P_DATA_Buf[3]), .SE(n25), .CK(
        CLK), .RN(RST), .Q(P_DATA_Buf[4]) );
  SDFFRQX2M \P_DATA_Buf_reg[3]  ( .D(N15), .SI(P_DATA_Buf[2]), .SE(n25), .CK(
        CLK), .RN(RST), .Q(P_DATA_Buf[3]) );
  SDFFRQX2M \P_DATA_Buf_reg[2]  ( .D(N14), .SI(P_DATA_Buf[1]), .SE(n25), .CK(
        CLK), .RN(RST), .Q(P_DATA_Buf[2]) );
  SDFFRQX2M \P_DATA_Buf_reg[1]  ( .D(N13), .SI(Ser_Data), .SE(n25), .CK(CLK), 
        .RN(RST), .Q(P_DATA_Buf[1]) );
  SDFFRQX2M \P_DATA_Buf_reg[0]  ( .D(N12), .SI(test_si), .SE(n25), .CK(CLK), 
        .RN(RST), .Q(Ser_Data) );
  SDFFRQX2M \counter_reg[2]  ( .D(N22), .SI(counter[1]), .SE(n25), .CK(CLK), 
        .RN(RST), .Q(counter[2]) );
  SDFFRQX2M \counter_reg[1]  ( .D(N21), .SI(counter[0]), .SE(n25), .CK(CLK), 
        .RN(RST), .Q(counter[1]) );
  SDFFRQX2M \counter_reg[0]  ( .D(N20), .SI(Ser_Done), .SE(n25), .CK(CLK), 
        .RN(RST), .Q(counter[0]) );
  SDFFRQX2M Ser_Done_reg ( .D(N11), .SI(P_DATA_Buf[7]), .SE(n25), .CK(CLK), 
        .RN(RST), .Q(Ser_Done) );
  SDFFRQX1M \P_DATA_Buf_reg[7]  ( .D(N19), .SI(P_DATA_Buf[6]), .SE(n25), .CK(
        CLK), .RN(RST), .Q(P_DATA_Buf[7]) );
  NOR2X2M U16 ( .A(n21), .B(n15), .Y(N11) );
  INVX2M U17 ( .A(n14), .Y(n20) );
  AND2X2M U18 ( .A(P_DATA[7]), .B(n19), .Y(N19) );
  NOR2BX2M U19 ( .AN(Data_Valid), .B(Busy), .Y(n19) );
  OAI22X1M U20 ( .A0(counter[2]), .A1(n15), .B0(n16), .B1(n21), .Y(N22) );
  AOI2BB1X2M U21 ( .A0N(counter[1]), .A1N(n20), .B0(N20), .Y(n16) );
  NAND3X2M U22 ( .A(counter[0]), .B(n14), .C(counter[1]), .Y(n15) );
  NOR2X2M U23 ( .A(n20), .B(counter[0]), .Y(N20) );
  BUFX2M U24 ( .A(n18), .Y(n14) );
  NOR3BX2M U25 ( .AN(Ser_En), .B(Ser_Done), .C(n19), .Y(n18) );
  NOR2X2M U26 ( .A(n17), .B(n20), .Y(N21) );
  XNOR2X2M U27 ( .A(counter[0]), .B(counter[1]), .Y(n17) );
  AO22X1M U28 ( .A0(P_DATA[0]), .A1(n19), .B0(P_DATA_Buf[1]), .B1(n14), .Y(N12) );
  AO22X1M U29 ( .A0(P_DATA[1]), .A1(n19), .B0(P_DATA_Buf[2]), .B1(n14), .Y(N13) );
  AO22X1M U30 ( .A0(P_DATA[2]), .A1(n19), .B0(P_DATA_Buf[3]), .B1(n14), .Y(N14) );
  AO22X1M U31 ( .A0(P_DATA[3]), .A1(n19), .B0(P_DATA_Buf[4]), .B1(n14), .Y(N15) );
  AO22X1M U32 ( .A0(P_DATA[4]), .A1(n19), .B0(P_DATA_Buf[5]), .B1(n14), .Y(N16) );
  AO22X1M U33 ( .A0(P_DATA[5]), .A1(n19), .B0(P_DATA_Buf[6]), .B1(n14), .Y(N17) );
  AO22X1M U34 ( .A0(P_DATA[6]), .A1(n19), .B0(P_DATA_Buf[7]), .B1(n14), .Y(N18) );
  INVX2M U35 ( .A(counter[2]), .Y(n21) );
  INVXLM U36 ( .A(test_se), .Y(n24) );
  INVXLM U37 ( .A(n24), .Y(n25) );
endmodule


module FSM_test_1 ( CLK, RST, Data_Valid, PAR_EN, Ser_Done, Ser_En, MUX_Sel, 
        Busy, test_si, test_so, test_se );
  output [1:0] MUX_Sel;
  input CLK, RST, Data_Valid, PAR_EN, Ser_Done, test_si, test_se;
  output Ser_En, Busy, test_so;
  wire   busy_comb, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n5, n6, n7, n8, n9, n10, n11;
  wire   [2:0] current_state;
  assign test_so = current_state[2];

  SDFFRQX2M \current_state_reg[0]  ( .D(n24), .SI(Busy), .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[0]) );
  SDFFRQX2M Busy_reg ( .D(busy_comb), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(Busy) );
  SDFFRQX2M \current_state_reg[1]  ( .D(n7), .SI(n8), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(current_state[1]) );
  SDFFRQX2M \current_state_reg[2]  ( .D(n23), .SI(current_state[1]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(current_state[2]) );
  INVX2M U7 ( .A(n16), .Y(n7) );
  INVX2M U8 ( .A(Data_Valid), .Y(n5) );
  OAI211X2M U9 ( .A0(n20), .A1(n21), .B0(n22), .C0(n9), .Y(MUX_Sel[0]) );
  NOR2X2M U10 ( .A(n5), .B(n18), .Y(n21) );
  OAI21X2M U11 ( .A0(n10), .A1(n11), .B0(n20), .Y(n22) );
  NAND2X2M U12 ( .A(n15), .B(n8), .Y(n18) );
  AND2X2M U13 ( .A(n20), .B(n9), .Y(n14) );
  NAND2X2M U14 ( .A(n14), .B(n10), .Y(n17) );
  NAND2X2M U15 ( .A(n18), .B(n9), .Y(n16) );
  OAI31X1M U16 ( .A0(Data_Valid), .A1(current_state[2]), .A2(current_state[1]), 
        .B0(n17), .Y(n13) );
  OAI32X1M U17 ( .A0(n13), .A1(current_state[2]), .A2(current_state[1]), .B0(
        n6), .B1(n8), .Y(n24) );
  INVX2M U18 ( .A(n13), .Y(n6) );
  AOI22X1M U19 ( .A0(Ser_Done), .A1(n14), .B0(n5), .B1(n8), .Y(n19) );
  NAND3X2M U20 ( .A(n15), .B(n9), .C(n19), .Y(MUX_Sel[1]) );
  NOR2X2M U21 ( .A(n12), .B(n13), .Y(n23) );
  AOI2BB2XLM U22 ( .B0(n14), .B1(n11), .A0N(n15), .A1N(current_state[2]), .Y(
        n12) );
  NAND2X2M U23 ( .A(current_state[1]), .B(n8), .Y(n15) );
  INVX2M U24 ( .A(current_state[2]), .Y(n9) );
  INVX2M U25 ( .A(current_state[0]), .Y(n8) );
  OAI31X1M U26 ( .A0(n8), .A1(current_state[2]), .A2(current_state[1]), .B0(
        n17), .Y(Ser_En) );
  AND2X2M U27 ( .A(current_state[1]), .B(current_state[0]), .Y(n20) );
  INVX2M U28 ( .A(Ser_Done), .Y(n10) );
  OAI21X2M U29 ( .A0(current_state[2]), .A1(n5), .B0(n16), .Y(busy_comb) );
  INVX2M U30 ( .A(PAR_EN), .Y(n11) );
endmodule


module Parity_Calc_test_1 ( CLK, RST, P_DATA, Busy, PAR_TYP, Data_Valid, 
        par_bit, test_si, test_se );
  input [7:0] P_DATA;
  input CLK, RST, Busy, PAR_TYP, Data_Valid, test_si, test_se;
  output par_bit;
  wire   N7, n1, n2, n3, n4, n5, n8, n10, n12, n14, n16, n18, n20, n22, n9,
         n11;
  wire   [7:0] P_DATA_Buf;

  SDFFRQX2M par_bit_reg ( .D(N7), .SI(P_DATA_Buf[7]), .SE(n11), .CK(CLK), .RN(
        RST), .Q(par_bit) );
  SDFFRQX2M \P_DATA_Buf_reg[5]  ( .D(n18), .SI(P_DATA_Buf[4]), .SE(n11), .CK(
        CLK), .RN(RST), .Q(P_DATA_Buf[5]) );
  SDFFRQX2M \P_DATA_Buf_reg[1]  ( .D(n10), .SI(P_DATA_Buf[0]), .SE(n11), .CK(
        CLK), .RN(RST), .Q(P_DATA_Buf[1]) );
  SDFFRQX2M \P_DATA_Buf_reg[4]  ( .D(n16), .SI(P_DATA_Buf[3]), .SE(n11), .CK(
        CLK), .RN(RST), .Q(P_DATA_Buf[4]) );
  SDFFRQX2M \P_DATA_Buf_reg[0]  ( .D(n8), .SI(test_si), .SE(n11), .CK(CLK), 
        .RN(RST), .Q(P_DATA_Buf[0]) );
  SDFFRQX2M \P_DATA_Buf_reg[6]  ( .D(n20), .SI(P_DATA_Buf[5]), .SE(n11), .CK(
        CLK), .RN(RST), .Q(P_DATA_Buf[6]) );
  SDFFRQX2M \P_DATA_Buf_reg[2]  ( .D(n12), .SI(P_DATA_Buf[1]), .SE(n11), .CK(
        CLK), .RN(RST), .Q(P_DATA_Buf[2]) );
  SDFFRQX2M \P_DATA_Buf_reg[7]  ( .D(n22), .SI(P_DATA_Buf[6]), .SE(n11), .CK(
        CLK), .RN(RST), .Q(P_DATA_Buf[7]) );
  SDFFRQX2M \P_DATA_Buf_reg[3]  ( .D(n14), .SI(P_DATA_Buf[2]), .SE(n11), .CK(
        CLK), .RN(RST), .Q(P_DATA_Buf[3]) );
  XOR3XLM U3 ( .A(n2), .B(n3), .C(PAR_TYP), .Y(N7) );
  XOR3XLM U4 ( .A(P_DATA_Buf[5]), .B(P_DATA_Buf[4]), .C(n5), .Y(n2) );
  XOR3XLM U5 ( .A(P_DATA_Buf[1]), .B(P_DATA_Buf[0]), .C(n4), .Y(n3) );
  CLKXOR2X2M U6 ( .A(P_DATA_Buf[7]), .B(P_DATA_Buf[6]), .Y(n5) );
  CLKXOR2X2M U7 ( .A(P_DATA_Buf[3]), .B(P_DATA_Buf[2]), .Y(n4) );
  NOR2BX2M U8 ( .AN(Data_Valid), .B(Busy), .Y(n1) );
  AO2B2X2M U9 ( .B0(P_DATA[0]), .B1(n1), .A0(P_DATA_Buf[0]), .A1N(n1), .Y(n8)
         );
  AO2B2X2M U10 ( .B0(P_DATA[1]), .B1(n1), .A0(P_DATA_Buf[1]), .A1N(n1), .Y(n10) );
  AO2B2X2M U11 ( .B0(P_DATA[2]), .B1(n1), .A0(P_DATA_Buf[2]), .A1N(n1), .Y(n12) );
  AO2B2X2M U12 ( .B0(P_DATA[3]), .B1(n1), .A0(P_DATA_Buf[3]), .A1N(n1), .Y(n14) );
  AO2B2X2M U13 ( .B0(P_DATA[4]), .B1(n1), .A0(P_DATA_Buf[4]), .A1N(n1), .Y(n16) );
  AO2B2X2M U14 ( .B0(P_DATA[5]), .B1(n1), .A0(P_DATA_Buf[5]), .A1N(n1), .Y(n18) );
  AO2B2X2M U15 ( .B0(P_DATA[6]), .B1(n1), .A0(P_DATA_Buf[6]), .A1N(n1), .Y(n20) );
  AO2B2X2M U16 ( .B0(P_DATA[7]), .B1(n1), .A0(P_DATA_Buf[7]), .A1N(n1), .Y(n22) );
  INVXLM U26 ( .A(test_se), .Y(n9) );
  INVXLM U27 ( .A(n9), .Y(n11) );
endmodule


module MUX_test_1 ( CLK, RST, mux_sel, start_bit, ser_data, par_bit, stop_bit, 
        TX_OUT, test_si, test_se );
  input [1:0] mux_sel;
  input CLK, RST, start_bit, ser_data, par_bit, stop_bit, test_si, test_se;
  output TX_OUT;
  wire   N13, n3, n4, n2, n7;

  INVX8M U5 ( .A(n2), .Y(TX_OUT) );
  INVX2M U7 ( .A(mux_sel[0]), .Y(n7) );
  OAI2B2X1M U8 ( .A1N(mux_sel[1]), .A0(n3), .B0(mux_sel[1]), .B1(n4), .Y(N13)
         );
  AOI22X1M U9 ( .A0(start_bit), .A1(n7), .B0(ser_data), .B1(mux_sel[0]), .Y(n4) );
  AOI22X1M U10 ( .A0(par_bit), .A1(n7), .B0(stop_bit), .B1(mux_sel[0]), .Y(n3)
         );
  SDFFSX1M TX_OUT_reg ( .D(N13), .SI(test_si), .SE(test_se), .CK(CLK), .SN(RST), .QN(n2) );
endmodule


module UART_TX_DATA_WIDTH8_test_1 ( clk, rst, p_data, data_valid, par_en, 
        par_typ, tx_out, busy, test_si, test_so, test_se );
  input [7:0] p_data;
  input clk, rst, data_valid, par_en, par_typ, test_si, test_se;
  output tx_out, busy, test_so;
  wire   ser_en, ser_data, ser_done, par_bit, n1, n2, n4;
  wire   [1:0] mux_sel;

  INVX2M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(rst), .Y(n2) );
  Serializer_DATA_WIDTH8_test_1 DUT_Serializer ( .CLK(clk), .RST(n1), .P_DATA(
        p_data), .Data_Valid(data_valid), .Ser_En(ser_en), .Busy(busy), 
        .Ser_Data(ser_data), .Ser_Done(ser_done), .test_si(par_bit), .test_so(
        test_so), .test_se(test_se) );
  FSM_test_1 DUT_FSM ( .CLK(clk), .RST(n1), .Data_Valid(data_valid), .PAR_EN(
        par_en), .Ser_Done(ser_done), .Ser_En(ser_en), .MUX_Sel(mux_sel), 
        .Busy(busy), .test_si(test_si), .test_so(n4), .test_se(test_se) );
  Parity_Calc_test_1 DUT_Parity_Calc ( .CLK(clk), .RST(n1), .P_DATA(p_data), 
        .Busy(busy), .PAR_TYP(par_typ), .Data_Valid(data_valid), .par_bit(
        par_bit), .test_si(tx_out), .test_se(test_se) );
  MUX_test_1 DUT_MUX ( .CLK(clk), .RST(n1), .mux_sel(mux_sel), .start_bit(1'b0), .ser_data(ser_data), .par_bit(par_bit), .stop_bit(1'b1), .TX_OUT(tx_out), 
        .test_si(n4), .test_se(test_se) );
endmodule


module Deserializer_DATA_WIDTH8_test_1 ( clk, rst, deser_enable, serial_in_bit, 
        parallel_data, test_so, test_se );
  output [7:0] parallel_data;
  input clk, rst, deser_enable, serial_in_bit, test_se;
  output test_so;
  wire   n10, n12, n14, n16, n18, n20, n22, n24, n1, n2, n3, n4, n5, n6, n7,
         n8, n25;
  assign test_so = n3;

  INVX2M U2 ( .A(n1), .Y(n2) );
  OAI22X1M U3 ( .A0(n2), .A1(n8), .B0(n1), .B1(n25), .Y(n12) );
  OAI22X1M U4 ( .A0(n2), .A1(n7), .B0(n1), .B1(n8), .Y(n14) );
  OAI22X1M U5 ( .A0(n2), .A1(n6), .B0(n1), .B1(n7), .Y(n16) );
  OAI22X1M U6 ( .A0(n2), .A1(n5), .B0(n1), .B1(n6), .Y(n18) );
  OAI22X1M U7 ( .A0(n2), .A1(n4), .B0(n1), .B1(n5), .Y(n20) );
  OAI22X1M U8 ( .A0(n2), .A1(n3), .B0(n1), .B1(n4), .Y(n22) );
  BUFX2M U9 ( .A(deser_enable), .Y(n1) );
  OAI2BB2X1M U10 ( .B0(n2), .B1(n25), .A0N(parallel_data[0]), .A1N(n2), .Y(n10) );
  OAI2BB2X1M U11 ( .B0(n1), .B1(n3), .A0N(serial_in_bit), .A1N(n1), .Y(n24) );
  SDFFRX1M \parallel_data_reg[7]  ( .D(n24), .SI(n4), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(parallel_data[7]), .QN(n3) );
  SDFFRX1M \parallel_data_reg[6]  ( .D(n22), .SI(n5), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(parallel_data[6]), .QN(n4) );
  SDFFRX1M \parallel_data_reg[5]  ( .D(n20), .SI(n6), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(parallel_data[5]), .QN(n5) );
  SDFFRX1M \parallel_data_reg[4]  ( .D(n18), .SI(n7), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(parallel_data[4]), .QN(n6) );
  SDFFRX1M \parallel_data_reg[3]  ( .D(n16), .SI(n8), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(parallel_data[3]), .QN(n7) );
  SDFFRX1M \parallel_data_reg[2]  ( .D(n14), .SI(n25), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(parallel_data[2]), .QN(n8) );
  SDFFRX1M \parallel_data_reg[1]  ( .D(n12), .SI(parallel_data[0]), .SE(
        test_se), .CK(clk), .RN(rst), .Q(parallel_data[1]), .QN(n25) );
  SDFFRX1M \parallel_data_reg[0]  ( .D(n10), .SI(serial_in_bit), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(parallel_data[0]) );
endmodule


module Data_Sampling_test_1 ( clk, rst, samp_enable, edge_counter, 
        rx_serial_in, prescaler, sampled_bit, test_si, test_se );
  input [5:0] edge_counter;
  input [5:0] prescaler;
  input clk, rst, samp_enable, rx_serial_in, test_si, test_se;
  output sampled_bit;
  wire   sample_stage1, sample_stage2, sample_stage3, N10, N11, N12, N13, N14,
         N15, N16, n28, n29, n30, n31, \add_37/carry[5] , \add_37/carry[4] ,
         \add_37/carry[3] , \add_37/carry[2] , \add_16/carry[4] ,
         \add_16/carry[3] , \add_16/carry[2] , n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n19, n20, n21, n22, n23, n24, n25, n26, n27, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59;
  wire   [5:0] sample_pos_before;
  wire   [5:0] sample_pos_after;

  SDFFRX1M sample_stage1_reg ( .D(n29), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(sample_stage1), .QN(n33) );
  SDFFRX1M sample_stage2_reg ( .D(n30), .SI(n33), .SE(test_se), .CK(clk), .RN(
        rst), .Q(sample_stage2), .QN(n24) );
  ADDHX1M U8 ( .A(sample_pos_after[1]), .B(sample_pos_after[0]), .CO(
        \add_37/carry[2] ), .S(N10) );
  ADDHX1M U9 ( .A(sample_pos_after[4]), .B(\add_37/carry[4] ), .CO(
        \add_37/carry[5] ), .S(N13) );
  ADDHX1M U10 ( .A(sample_pos_after[3]), .B(\add_37/carry[3] ), .CO(
        \add_37/carry[4] ), .S(N12) );
  ADDHX1M U14 ( .A(sample_pos_after[2]), .B(\add_37/carry[2] ), .CO(
        \add_37/carry[3] ), .S(N11) );
  ADDHX1M U15 ( .A(sample_pos_after[5]), .B(\add_37/carry[5] ), .CO(N15), .S(
        N14) );
  ADDHX1M U16 ( .A(prescaler[5]), .B(\add_16/carry[4] ), .CO(
        sample_pos_after[5]), .S(sample_pos_after[4]) );
  OR2X2M U17 ( .A(prescaler[2]), .B(prescaler[1]), .Y(n5) );
  ADDHX1M U18 ( .A(prescaler[2]), .B(prescaler[1]), .CO(\add_16/carry[2] ), 
        .S(sample_pos_after[1]) );
  ADDHX1M U19 ( .A(prescaler[4]), .B(\add_16/carry[3] ), .CO(\add_16/carry[4] ), .S(sample_pos_after[3]) );
  ADDHX1M U20 ( .A(prescaler[3]), .B(\add_16/carry[2] ), .CO(\add_16/carry[3] ), .S(sample_pos_after[2]) );
  OAI2BB1X1M U21 ( .A0N(prescaler[1]), .A1N(prescaler[2]), .B0(n5), .Y(
        sample_pos_before[1]) );
  OR2X1M U22 ( .A(n5), .B(prescaler[3]), .Y(n6) );
  OAI2BB1X1M U23 ( .A0N(n5), .A1N(prescaler[3]), .B0(n6), .Y(
        sample_pos_before[2]) );
  XNOR2X1M U24 ( .A(prescaler[4]), .B(n6), .Y(sample_pos_before[3]) );
  NOR3X1M U25 ( .A(prescaler[4]), .B(prescaler[5]), .C(n6), .Y(
        sample_pos_before[5]) );
  OAI21X1M U26 ( .A0(prescaler[4]), .A1(n6), .B0(prescaler[5]), .Y(n7) );
  NAND2BX1M U27 ( .AN(sample_pos_before[5]), .B(n7), .Y(sample_pos_before[4])
         );
  CLKINVX1M U28 ( .A(prescaler[1]), .Y(sample_pos_after[0]) );
  NOR2BX1M U29 ( .AN(prescaler[1]), .B(edge_counter[0]), .Y(n8) );
  OAI2B2X1M U30 ( .A1N(edge_counter[1]), .A0(n8), .B0(N10), .B1(n8), .Y(n12)
         );
  XNOR2X1M U31 ( .A(N14), .B(edge_counter[5]), .Y(n11) );
  NOR2BX1M U32 ( .AN(edge_counter[0]), .B(prescaler[1]), .Y(n9) );
  OAI2B2X1M U33 ( .A1N(N10), .A0(n9), .B0(edge_counter[1]), .B1(n9), .Y(n10)
         );
  NAND4BX1M U34 ( .AN(N15), .B(n12), .C(n11), .D(n10), .Y(n20) );
  CLKXOR2X2M U35 ( .A(N13), .B(edge_counter[4]), .Y(n19) );
  CLKXOR2X2M U36 ( .A(N11), .B(edge_counter[2]), .Y(n14) );
  CLKXOR2X2M U37 ( .A(N12), .B(edge_counter[3]), .Y(n13) );
  NOR4X1M U38 ( .A(n20), .B(n19), .C(n14), .D(n13), .Y(N16) );
  CLKMX2X2M U39 ( .A(sample_stage3), .B(rx_serial_in), .S0(n21), .Y(n31) );
  NOR2X1M U40 ( .A(n22), .B(n23), .Y(n21) );
  MXI2X1M U41 ( .A(n24), .B(n25), .S0(n26), .Y(n30) );
  NOR2X1M U42 ( .A(n27), .B(n32), .Y(n26) );
  MXI2X1M U43 ( .A(n33), .B(n25), .S0(n34), .Y(n29) );
  NOR2BX1M U44 ( .AN(samp_enable), .B(n35), .Y(n34) );
  CLKINVX1M U45 ( .A(rx_serial_in), .Y(n25) );
  CLKMX2X2M U46 ( .A(n36), .B(sampled_bit), .S0(n37), .Y(n28) );
  NAND3BX1M U47 ( .AN(n22), .B(N16), .C(n23), .Y(n37) );
  NAND4X1M U48 ( .A(n38), .B(n39), .C(n40), .D(n41), .Y(n23) );
  NOR3X1M U49 ( .A(n42), .B(n43), .C(n44), .Y(n41) );
  CLKXOR2X2M U50 ( .A(sample_pos_after[4]), .B(edge_counter[4]), .Y(n44) );
  XNOR2X1M U51 ( .A(sample_pos_after[1]), .B(n45), .Y(n43) );
  CLKXOR2X2M U52 ( .A(sample_pos_after[0]), .B(edge_counter[0]), .Y(n42) );
  XNOR2X1M U53 ( .A(edge_counter[2]), .B(sample_pos_after[2]), .Y(n40) );
  XNOR2X1M U54 ( .A(edge_counter[3]), .B(sample_pos_after[3]), .Y(n39) );
  XNOR2X1M U55 ( .A(edge_counter[5]), .B(sample_pos_after[5]), .Y(n38) );
  NAND2BX1M U56 ( .AN(n27), .B(n32), .Y(n22) );
  NAND4X1M U57 ( .A(n46), .B(n47), .C(n48), .D(n49), .Y(n32) );
  NOR3X1M U58 ( .A(n50), .B(edge_counter[5]), .C(n51), .Y(n49) );
  CLKXOR2X2M U59 ( .A(prescaler[1]), .B(edge_counter[0]), .Y(n51) );
  CLKXOR2X2M U60 ( .A(prescaler[5]), .B(edge_counter[4]), .Y(n50) );
  XNOR2X1M U61 ( .A(edge_counter[2]), .B(prescaler[3]), .Y(n48) );
  XNOR2X1M U62 ( .A(edge_counter[3]), .B(prescaler[4]), .Y(n47) );
  XNOR2X1M U63 ( .A(edge_counter[1]), .B(prescaler[2]), .Y(n46) );
  CLKNAND2X2M U64 ( .A(samp_enable), .B(n35), .Y(n27) );
  NAND4X1M U65 ( .A(n52), .B(n53), .C(n54), .D(n55), .Y(n35) );
  NOR3X1M U66 ( .A(n56), .B(n57), .C(n58), .Y(n55) );
  CLKXOR2X2M U67 ( .A(sample_pos_before[4]), .B(edge_counter[4]), .Y(n58) );
  XNOR2X1M U68 ( .A(sample_pos_before[1]), .B(n45), .Y(n57) );
  CLKINVX1M U69 ( .A(edge_counter[1]), .Y(n45) );
  CLKXOR2X2M U70 ( .A(sample_pos_after[0]), .B(edge_counter[0]), .Y(n56) );
  XNOR2X1M U71 ( .A(edge_counter[2]), .B(sample_pos_before[2]), .Y(n54) );
  XNOR2X1M U72 ( .A(edge_counter[3]), .B(sample_pos_before[3]), .Y(n53) );
  XNOR2X1M U73 ( .A(edge_counter[5]), .B(sample_pos_before[5]), .Y(n52) );
  OAI21X1M U74 ( .A0(n24), .A1(n33), .B0(n59), .Y(n36) );
  OAI21X1M U75 ( .A0(sample_stage1), .A1(sample_stage2), .B0(sample_stage3), 
        .Y(n59) );
  SDFFRQX2M sample_stage3_reg ( .D(n31), .SI(n24), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(sample_stage3) );
  SDFFRQX2M sampled_bit_reg ( .D(n28), .SI(sample_stage3), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sampled_bit) );
endmodule


module Edge_Bit_Counter_test_1 ( clk, rst, edge_cnt_enable, prescaler, 
        bit_index, edge_index, test_si, test_se );
  input [5:0] prescaler;
  output [3:0] bit_index;
  output [5:0] edge_index;
  input clk, rst, edge_cnt_enable, test_si, test_se;
  wire   N6, N19, N20, N21, N22, N23, N25, n16, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, N26, \add_21_aco/carry[5] , \add_21_aco/carry[4] ,
         \add_21_aco/carry[3] , \add_21_aco/carry[2] ,
         \mult_add_21_aco/PROD_not[0] , n1, n2, n3, n14, n15, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n53, n54;

  SDFFSQX1M \edge_index_reg[0]  ( .D(\mult_add_21_aco/PROD_not[0] ), .SI(n16), 
        .SE(n54), .CK(clk), .SN(rst), .Q(edge_index[0]) );
  SDFFRX1M \bit_index_reg[3]  ( .D(n27), .SI(n50), .SE(n54), .CK(clk), .RN(rst), .Q(bit_index[3]), .QN(n16) );
  SDFFRX1M \bit_index_reg[0]  ( .D(n29), .SI(test_si), .SE(n54), .CK(clk), 
        .RN(rst), .Q(bit_index[0]), .QN(n48) );
  SDFFRX1M \bit_index_reg[1]  ( .D(n28), .SI(n48), .SE(n54), .CK(clk), .RN(rst), .Q(bit_index[1]), .QN(n49) );
  SDFFRX1M \bit_index_reg[2]  ( .D(n45), .SI(n49), .SE(n54), .CK(clk), .RN(rst), .Q(bit_index[2]), .QN(n50) );
  AND2X2M U6 ( .A(edge_index[1]), .B(N25), .Y(n1) );
  AND2X2M U14 ( .A(edge_index[2]), .B(N25), .Y(n2) );
  AND2X2M U15 ( .A(edge_index[3]), .B(N25), .Y(n3) );
  AND2X2M U16 ( .A(edge_index[4]), .B(N25), .Y(n14) );
  AND2X2M U17 ( .A(N25), .B(edge_index[5]), .Y(n15) );
  INVX2M U28 ( .A(edge_cnt_enable), .Y(n47) );
  NOR3X2M U29 ( .A(n47), .B(N25), .C(n48), .Y(n23) );
  AOI21X2M U30 ( .A0(n48), .A1(edge_cnt_enable), .B0(N25), .Y(n26) );
  ADDHX1M U31 ( .A(n1), .B(N26), .CO(\add_21_aco/carry[2] ), .S(N19) );
  NOR2X2M U32 ( .A(N6), .B(n47), .Y(N25) );
  ADDHX1M U33 ( .A(n2), .B(\add_21_aco/carry[2] ), .CO(\add_21_aco/carry[3] ), 
        .S(N20) );
  ADDHX1M U34 ( .A(n3), .B(\add_21_aco/carry[3] ), .CO(\add_21_aco/carry[4] ), 
        .S(N21) );
  ADDHX1M U35 ( .A(n14), .B(\add_21_aco/carry[4] ), .CO(\add_21_aco/carry[5] ), 
        .S(N22) );
  INVX2M U36 ( .A(n25), .Y(n45) );
  AOI32X1M U37 ( .A0(bit_index[1]), .A1(n50), .A2(n23), .B0(n24), .B1(
        bit_index[2]), .Y(n25) );
  OAI21X2M U38 ( .A0(n21), .A1(n16), .B0(n22), .Y(n27) );
  NAND4X2M U39 ( .A(bit_index[2]), .B(bit_index[1]), .C(n23), .D(n16), .Y(n22)
         );
  AOI21X2M U40 ( .A0(edge_cnt_enable), .A1(n50), .B0(n24), .Y(n21) );
  OAI21X2M U41 ( .A0(bit_index[1]), .A1(n47), .B0(n26), .Y(n24) );
  OAI2BB2X1M U42 ( .B0(n26), .B1(n49), .A0N(n49), .A1N(n23), .Y(n28) );
  OAI32X1M U43 ( .A0(n47), .A1(bit_index[0]), .A2(N25), .B0(n48), .B1(n46), 
        .Y(n29) );
  INVX2M U44 ( .A(N25), .Y(n46) );
  CLKNAND2X2M U45 ( .A(edge_index[0]), .B(N25), .Y(
        \mult_add_21_aco/PROD_not[0] ) );
  CLKINVX1M U46 ( .A(\mult_add_21_aco/PROD_not[0] ), .Y(N26) );
  CLKXOR2X2M U47 ( .A(\add_21_aco/carry[5] ), .B(n15), .Y(N23) );
  NOR2BX1M U48 ( .AN(edge_index[0]), .B(prescaler[0]), .Y(n36) );
  OAI2B2X1M U49 ( .A1N(prescaler[1]), .A0(n36), .B0(edge_index[1]), .B1(n36), 
        .Y(n40) );
  NOR2BX1M U50 ( .AN(prescaler[0]), .B(edge_index[0]), .Y(n37) );
  OAI2B2X1M U51 ( .A1N(edge_index[1]), .A0(n37), .B0(prescaler[1]), .B1(n37), 
        .Y(n39) );
  XNOR2X1M U52 ( .A(prescaler[5]), .B(edge_index[5]), .Y(n38) );
  NAND3X1M U53 ( .A(n40), .B(n39), .C(n38), .Y(n44) );
  CLKXOR2X2M U54 ( .A(prescaler[4]), .B(edge_index[4]), .Y(n43) );
  CLKXOR2X2M U55 ( .A(prescaler[2]), .B(edge_index[2]), .Y(n42) );
  CLKXOR2X2M U56 ( .A(prescaler[3]), .B(edge_index[3]), .Y(n41) );
  NOR4X1M U57 ( .A(n44), .B(n43), .C(n42), .D(n41), .Y(N6) );
  INVXLM U58 ( .A(test_se), .Y(n53) );
  INVXLM U59 ( .A(n53), .Y(n54) );
  SDFFRQX2M \edge_index_reg[1]  ( .D(N19), .SI(edge_index[0]), .SE(n54), .CK(
        clk), .RN(rst), .Q(edge_index[1]) );
  SDFFRQX2M \edge_index_reg[2]  ( .D(N20), .SI(edge_index[1]), .SE(n54), .CK(
        clk), .RN(rst), .Q(edge_index[2]) );
  SDFFRQX2M \edge_index_reg[3]  ( .D(N21), .SI(edge_index[2]), .SE(n54), .CK(
        clk), .RN(rst), .Q(edge_index[3]) );
  SDFFRQX2M \edge_index_reg[4]  ( .D(N22), .SI(edge_index[3]), .SE(n54), .CK(
        clk), .RN(rst), .Q(edge_index[4]) );
  SDFFRQX2M \edge_index_reg[5]  ( .D(N23), .SI(edge_index[4]), .SE(n54), .CK(
        clk), .RN(rst), .Q(edge_index[5]) );
endmodule


module UART_RX_FSM_test_1 ( clk, rst, rx_serial_in, parity_enable, bit_index, 
        edge_index, prescaler, parity_error, start_glitch_err, stop_error, 
        samp_enable, edge_cnt_enable, parity_chk_enable, stop_chk_enable, 
        start_chk_enable, deser_enable, data_valid, test_se );
  input [3:0] bit_index;
  input [5:0] edge_index;
  input [5:0] prescaler;
  input clk, rst, rx_serial_in, parity_enable, parity_error, start_glitch_err,
         stop_error, test_se;
  output samp_enable, edge_cnt_enable, parity_chk_enable, stop_chk_enable,
         start_chk_enable, deser_enable, data_valid;
  wire   N16, N17, N18, N19, N20, N21, data_valid_next, \add_34/carry[2] ,
         \add_34/carry[3] , \add_34/carry[4] , n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  SDFFRX1M \current_state_reg[0]  ( .D(next_state[0]), .SI(edge_index[5]), 
        .SE(test_se), .CK(clk), .RN(rst), .Q(current_state[0]), .QN(n27) );
  AND2X1M U5 ( .A(\add_34/carry[4] ), .B(prescaler[5]), .Y(N21) );
  CLKXOR2X2M U6 ( .A(prescaler[5]), .B(\add_34/carry[4] ), .Y(N20) );
  AND2X1M U7 ( .A(\add_34/carry[3] ), .B(prescaler[4]), .Y(\add_34/carry[4] )
         );
  CLKXOR2X2M U8 ( .A(prescaler[4]), .B(\add_34/carry[3] ), .Y(N19) );
  AND2X1M U9 ( .A(\add_34/carry[2] ), .B(prescaler[3]), .Y(\add_34/carry[3] )
         );
  CLKXOR2X2M U10 ( .A(prescaler[3]), .B(\add_34/carry[2] ), .Y(N18) );
  OR2X1M U11 ( .A(prescaler[2]), .B(prescaler[1]), .Y(\add_34/carry[2] ) );
  XNOR2X1M U12 ( .A(prescaler[1]), .B(prescaler[2]), .Y(N17) );
  CLKINVX1M U13 ( .A(prescaler[1]), .Y(N16) );
  NOR2X1M U14 ( .A(n3), .B(n4), .Y(stop_chk_enable) );
  NOR3X1M U15 ( .A(n5), .B(n6), .C(n4), .Y(start_chk_enable) );
  OAI31X1M U16 ( .A0(n7), .A1(current_state[2]), .A2(n8), .B0(n9), .Y(
        samp_enable) );
  NOR3X1M U17 ( .A(n10), .B(n11), .C(n4), .Y(parity_chk_enable) );
  OAI2B11X1M U18 ( .A1N(n12), .A0(stop_error), .B0(n3), .C0(n13), .Y(
        next_state[2]) );
  AOI31X1M U19 ( .A0(n14), .A1(n15), .A2(n16), .B0(n17), .Y(n13) );
  OAI31X1M U20 ( .A0(n10), .A1(parity_error), .A2(n18), .B0(n19), .Y(n17) );
  CLKINVX1M U25 ( .A(n20), .Y(n16) );
  CLKINVX1M U26 ( .A(parity_enable), .Y(n15) );
  NAND4X1M U27 ( .A(n3), .B(n25), .C(n26), .D(n20), .Y(next_state[1]) );
  AO21XLM U28 ( .A0(n11), .A1(parity_error), .B0(n10), .Y(n25) );
  NAND3X1M U29 ( .A(n27), .B(n28), .C(current_state[1]), .Y(n10) );
  AOI22X1M U30 ( .A0(n29), .A1(n30), .B0(n31), .B1(n12), .Y(n3) );
  NAND4X1M U31 ( .A(n19), .B(n32), .C(n33), .D(n34), .Y(next_state[0]) );
  AOI221XLM U32 ( .A0(n30), .A1(n29), .B0(n35), .B1(n36), .C0(n37), .Y(n34) );
  AOI21X1M U33 ( .A0(parity_enable), .A1(n14), .B0(n20), .Y(n37) );
  OAI21X1M U34 ( .A0(n8), .A1(n5), .B0(n9), .Y(edge_cnt_enable) );
  AND2X1M U35 ( .A(n32), .B(n38), .Y(n9) );
  OAI211X1M U36 ( .A0(n39), .A1(n31), .B0(current_state[1]), .C0(n40), .Y(n38)
         );
  MXI2X1M U37 ( .A(n41), .B(n42), .S0(current_state[2]), .Y(n40) );
  NOR2X1M U38 ( .A(n27), .B(n29), .Y(n42) );
  AND3X1M U39 ( .A(parity_error), .B(n27), .C(n11), .Y(n41) );
  NAND3BX1M U40 ( .AN(rx_serial_in), .B(n43), .C(n7), .Y(n32) );
  AND2X1M U41 ( .A(n39), .B(n44), .Y(n7) );
  CLKINVX1M U42 ( .A(n36), .Y(n8) );
  CLKNAND2X2M U43 ( .A(start_glitch_err), .B(n6), .Y(n36) );
  OAI31X1M U44 ( .A0(n20), .A1(n14), .A2(n4), .B0(n26), .Y(deser_enable) );
  NAND3BX1M U45 ( .AN(start_glitch_err), .B(n35), .C(n6), .Y(n26) );
  NOR2BX1M U46 ( .AN(n45), .B(bit_index[3]), .Y(n6) );
  CLKINVX1M U47 ( .A(n5), .Y(n35) );
  CLKNAND2X2M U48 ( .A(n46), .B(n43), .Y(n5) );
  NAND4X1M U49 ( .A(n47), .B(n48), .C(n49), .D(n50), .Y(n4) );
  NOR3X1M U50 ( .A(n51), .B(n52), .C(n53), .Y(n50) );
  CLKXOR2X2M U51 ( .A(edge_index[4]), .B(N20), .Y(n53) );
  CLKXOR2X2M U52 ( .A(edge_index[1]), .B(N17), .Y(n52) );
  CLKXOR2X2M U53 ( .A(edge_index[0]), .B(N16), .Y(n51) );
  XNOR2X1M U54 ( .A(edge_index[2]), .B(N18), .Y(n49) );
  XNOR2X1M U55 ( .A(edge_index[3]), .B(N19), .Y(n48) );
  XNOR2X1M U56 ( .A(edge_index[5]), .B(N21), .Y(n47) );
  CLKNAND2X2M U57 ( .A(n46), .B(current_state[1]), .Y(n20) );
  CLKINVX1M U58 ( .A(n44), .Y(n46) );
  CLKNAND2X2M U59 ( .A(current_state[0]), .B(n28), .Y(n44) );
  OAI21X1M U60 ( .A0(n29), .A1(n19), .B0(n33), .Y(data_valid_next) );
  NAND3BX1M U61 ( .AN(n31), .B(n12), .C(n54), .Y(n33) );
  NOR2X1M U62 ( .A(n43), .B(n39), .Y(n12) );
  CLKNAND2X2M U63 ( .A(current_state[2]), .B(n27), .Y(n39) );
  CLKNAND2X2M U64 ( .A(n55), .B(n11), .Y(n31) );
  CLKINVX1M U65 ( .A(n18), .Y(n11) );
  NAND4BBX1M U66 ( .AN(bit_index[0]), .BN(bit_index[2]), .C(bit_index[1]), .D(
        bit_index[3]), .Y(n18) );
  CLKNAND2X2M U67 ( .A(n30), .B(n54), .Y(n19) );
  CLKINVX1M U68 ( .A(stop_error), .Y(n54) );
  NOR3X1M U69 ( .A(n43), .B(n28), .C(n27), .Y(n30) );
  CLKNAND2X2M U72 ( .A(n14), .B(n55), .Y(n29) );
  AND4X1M U73 ( .A(n56), .B(n57), .C(n58), .D(n59), .Y(n55) );
  NOR3X1M U74 ( .A(n60), .B(n61), .C(n62), .Y(n59) );
  CLKXOR2X2M U75 ( .A(prescaler[0]), .B(edge_index[0]), .Y(n62) );
  CLKXOR2X2M U76 ( .A(prescaler[2]), .B(edge_index[2]), .Y(n61) );
  CLKXOR2X2M U77 ( .A(prescaler[1]), .B(edge_index[1]), .Y(n60) );
  XNOR2X1M U78 ( .A(edge_index[4]), .B(prescaler[4]), .Y(n58) );
  XNOR2X1M U79 ( .A(edge_index[5]), .B(prescaler[5]), .Y(n57) );
  XNOR2X1M U80 ( .A(edge_index[3]), .B(prescaler[3]), .Y(n56) );
  AND2X1M U81 ( .A(n45), .B(bit_index[3]), .Y(n14) );
  NOR3BX1M U82 ( .AN(bit_index[0]), .B(bit_index[1]), .C(bit_index[2]), .Y(n45) );
  SDFFRX1M \current_state_reg[1]  ( .D(next_state[1]), .SI(current_state[0]), 
        .SE(test_se), .CK(clk), .RN(rst), .Q(current_state[1]), .QN(n43) );
  SDFFRX1M \current_state_reg[2]  ( .D(next_state[2]), .SI(current_state[1]), 
        .SE(test_se), .CK(clk), .RN(rst), .Q(current_state[2]), .QN(n28) );
  SDFFRQX2M data_valid_reg ( .D(data_valid_next), .SI(current_state[2]), .SE(
        test_se), .CK(clk), .RN(rst), .Q(data_valid) );
endmodule


module UART_RX_Parity_Check_test_1 ( clk, rst, parity_type, parity_chk_enable, 
        parity_bit_rx, parallel_data, parity_error, test_si, test_se );
  input [7:0] parallel_data;
  input clk, rst, parity_type, parity_chk_enable, parity_bit_rx, test_si,
         test_se;
  output parity_error;
  wire   n1, n3, n4, n5, n6, n7, n9, n10;

  OAI2BB2X1M U3 ( .B0(n1), .B1(n10), .A0N(parity_error), .A1N(n10), .Y(n9) );
  XOR3XLM U4 ( .A(n3), .B(n4), .C(n5), .Y(n1) );
  INVX2M U5 ( .A(parity_chk_enable), .Y(n10) );
  XNOR2X2M U6 ( .A(parity_type), .B(parity_bit_rx), .Y(n5) );
  XOR3XLM U7 ( .A(parallel_data[5]), .B(parallel_data[4]), .C(n6), .Y(n4) );
  XNOR2X2M U8 ( .A(parallel_data[7]), .B(parallel_data[6]), .Y(n6) );
  XOR3XLM U9 ( .A(parallel_data[1]), .B(parallel_data[0]), .C(n7), .Y(n3) );
  XNOR2X2M U11 ( .A(parallel_data[3]), .B(parallel_data[2]), .Y(n7) );
  SDFFRHQX8M parity_error_reg ( .D(n9), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(parity_error) );
endmodule


module UART_RX_Start_Check_test_1 ( clk, rst, start_chk_enable, 
        start_bit_sampled, start_glitch_err, test_si, test_se );
  input clk, rst, start_chk_enable, start_bit_sampled, test_si, test_se;
  output start_glitch_err;
  wire   n2;

  AO2B2X2M U2 ( .B0(start_chk_enable), .B1(start_bit_sampled), .A0(
        start_glitch_err), .A1N(start_chk_enable), .Y(n2) );
  SDFFRX1M start_glitch_err_reg ( .D(n2), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(start_glitch_err) );
endmodule


module UART_RX_Stop_Check_test_1 ( clk, rst, stop_chk_enable, stop_bit_sampled, 
        stop_error, test_si, test_se );
  input clk, rst, stop_chk_enable, stop_bit_sampled, test_si, test_se;
  output stop_error;
  wire   n3, n4, n7, n8;

  OAI2BB2X1M U3 ( .B0(stop_bit_sampled), .B1(n4), .A0N(n8), .A1N(n4), .Y(n3)
         );
  INVX2M U5 ( .A(stop_chk_enable), .Y(n4) );
  INVXLM U6 ( .A(stop_error), .Y(n7) );
  INVXLM U7 ( .A(n7), .Y(n8) );
  SDFFRHQX8M stop_error_reg ( .D(n3), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(stop_error) );
endmodule


module UART_RX_DATA_WIDTH8_test_1 ( CLK, RST, PRESCALAR, PAR_EN, PAR_TYP, 
        RX_IN, P_DATA, Parity_Error, Stop_Error, Data_Valid, test_si2, 
        test_si1, test_so1, test_se );
  input [5:0] PRESCALAR;
  output [7:0] P_DATA;
  input CLK, RST, PAR_EN, PAR_TYP, RX_IN, test_si2, test_si1, test_se;
  output Parity_Error, Stop_Error, Data_Valid, test_so1;
  wire   deser_en, sampled_bit, data_samp_en, edge_bit_cnt_en, par_chk_en,
         stop_chk_en, start_chk_en, start_glitch, n1, n2, n3, n7, n8;
  wire   [5:0] edge_cnt;
  wire   [3:0] bit_cnt;
  assign test_so1 = start_glitch;

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
  INVXLM U3 ( .A(Stop_Error), .Y(n7) );
  INVXLM U4 ( .A(n7), .Y(n8) );
  Deserializer_DATA_WIDTH8_test_1 U_Deserializer ( .clk(CLK), .rst(n1), 
        .deser_enable(deser_en), .serial_in_bit(sampled_bit), .parallel_data(
        P_DATA), .test_so(n3), .test_se(test_se) );
  Data_Sampling_test_1 U_Data_Sampling ( .clk(CLK), .rst(n1), .samp_enable(
        data_samp_en), .edge_counter(edge_cnt), .rx_serial_in(RX_IN), 
        .prescaler(PRESCALAR), .sampled_bit(sampled_bit), .test_si(test_si1), 
        .test_se(test_se) );
  Edge_Bit_Counter_test_1 U_Edge_Bit_Counter ( .clk(CLK), .rst(n1), 
        .edge_cnt_enable(edge_bit_cnt_en), .prescaler(PRESCALAR), .bit_index(
        bit_cnt), .edge_index(edge_cnt), .test_si(n3), .test_se(test_se) );
  UART_RX_FSM_test_1 U_FSM ( .clk(CLK), .rst(n1), .rx_serial_in(RX_IN), 
        .parity_enable(PAR_EN), .bit_index(bit_cnt), .edge_index(edge_cnt), 
        .prescaler(PRESCALAR), .parity_error(Parity_Error), .start_glitch_err(
        start_glitch), .stop_error(n8), .samp_enable(data_samp_en), 
        .edge_cnt_enable(edge_bit_cnt_en), .parity_chk_enable(par_chk_en), 
        .stop_chk_enable(stop_chk_en), .start_chk_enable(start_chk_en), 
        .deser_enable(deser_en), .data_valid(Data_Valid), .test_se(test_se) );
  UART_RX_Parity_Check_test_1 U_Par_Check ( .clk(CLK), .rst(n1), .parity_type(
        PAR_TYP), .parity_chk_enable(par_chk_en), .parity_bit_rx(sampled_bit), 
        .parallel_data(P_DATA), .parity_error(Parity_Error), .test_si(
        Data_Valid), .test_se(test_se) );
  UART_RX_Start_Check_test_1 U_Start_Check ( .clk(CLK), .rst(n1), 
        .start_chk_enable(start_chk_en), .start_bit_sampled(sampled_bit), 
        .start_glitch_err(start_glitch), .test_si(Parity_Error), .test_se(
        test_se) );
  UART_RX_Stop_Check_test_1 U_Stop_Check ( .clk(CLK), .rst(n1), 
        .stop_chk_enable(stop_chk_en), .stop_bit_sampled(sampled_bit), 
        .stop_error(Stop_Error), .test_si(test_si2), .test_se(test_se) );
endmodule


module UART_TOP_test_1 ( RST, TX_CLK, RX_CLK, RX_IN_S, RX_OUT_P, RX_OUT_V, 
        TX_IN_P, TX_IN_V, TX_OUT_S, TX_OUT_V, Prescale, parity_enable, 
        parity_type, parity_error, framing_error, test_si2, test_si1, test_so1, 
        test_se );
  output [7:0] RX_OUT_P;
  input [7:0] TX_IN_P;
  input [5:0] Prescale;
  input RST, TX_CLK, RX_CLK, RX_IN_S, TX_IN_V, parity_enable, parity_type,
         test_si2, test_si1, test_se;
  output RX_OUT_V, TX_OUT_S, TX_OUT_V, parity_error, framing_error, test_so1;
  wire   n1, n2, n4;

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
  UART_TX_DATA_WIDTH8_test_1 u_uart_tx ( .clk(TX_CLK), .rst(n1), .p_data(
        TX_IN_P), .data_valid(TX_IN_V), .par_en(parity_enable), .par_typ(
        parity_type), .tx_out(TX_OUT_S), .busy(TX_OUT_V), .test_si(n4), 
        .test_so(test_so1), .test_se(test_se) );
  UART_RX_DATA_WIDTH8_test_1 u_uart_rx ( .CLK(RX_CLK), .RST(n1), .PRESCALAR(
        Prescale), .PAR_EN(parity_enable), .PAR_TYP(parity_type), .RX_IN(
        RX_IN_S), .P_DATA(RX_OUT_P), .Parity_Error(parity_error), .Stop_Error(
        framing_error), .Data_Valid(RX_OUT_V), .test_si2(test_si2), .test_si1(
        test_si1), .test_so1(n4), .test_se(test_se) );
endmodule


module SYS_CTRL_test_1 ( CLK, RST, FIFO_FULL, ALU_OUT, ALU_OUT_Valid, ALU_FUN, 
        ALU_EN, CLK_Gate_EN, Address, WrEn, RdEn, WrData, RdData, RdData_Valid, 
        RX_P_DATA, RX_D_VLD, TX_P_DATA, TX_D_VLD, clk_div_en, test_si2, 
        test_si1, test_so2, test_so1, test_se );
  input [15:0] ALU_OUT;
  output [3:0] ALU_FUN;
  output [3:0] Address;
  output [7:0] WrData;
  input [7:0] RdData;
  input [7:0] RX_P_DATA;
  output [7:0] TX_P_DATA;
  input CLK, RST, FIFO_FULL, ALU_OUT_Valid, RdData_Valid, RX_D_VLD, test_si2,
         test_si1, test_se;
  output ALU_EN, CLK_Gate_EN, WrEn, RdEn, TX_D_VLD, clk_div_en, test_so2,
         test_so1;
  wire   n1, n13, n17, n18, n19, n22, n23, n24, n25, n27, n28, n29, n30, n31,
         n34, n35, n39, n40, n41, n42, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n54, n55, n56, n57, n58, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n81, n83, n85, n87, n96, n97, n98,
         n99, n100, n101, n102, n103, n5, n6, n7, n8, n10, n11, n12, n14, n15,
         n16, n20, n21, n26, n32, n33, n36, n37, n38, n43, n53, n59, n60, n76,
         n77, n78, n79, n104, n105, n106, n107, n108, n112, n113;
  wire   [3:0] current_state;
  wire   [3:0] stored_alu_function;
  assign test_so2 = stored_alu_function[3];
  assign test_so1 = stored_alu_function[1];

  SDFFRQX2M \stored_alu_function_reg[3]  ( .D(n87), .SI(stored_alu_function[2]), .SE(test_se), .CK(CLK), .RN(RST), .Q(stored_alu_function[3]) );
  SDFFRQX2M \stored_alu_function_reg[2]  ( .D(n85), .SI(test_si2), .SE(test_se), .CK(CLK), .RN(RST), .Q(stored_alu_function[2]) );
  SDFFRQX2M \stored_alu_function_reg[0]  ( .D(n81), .SI(n105), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(stored_alu_function[0]) );
  SDFFRX1M \stored_address_reg[2]  ( .D(n98), .SI(n107), .SE(test_se), .CK(CLK), .RN(RST), .Q(n106), .QN(n32) );
  SDFFRX1M \stored_address_reg[1]  ( .D(n97), .SI(n108), .SE(test_se), .CK(CLK), .RN(RST), .Q(n107), .QN(n33) );
  SDFFRX1M \stored_address_reg[0]  ( .D(n96), .SI(n16), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n108), .QN(n36) );
  SDFFRQX2M \current_state_reg[3]  ( .D(n102), .SI(n20), .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[3]) );
  SDFFRQX2M \current_state_reg[0]  ( .D(n103), .SI(test_si1), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(current_state[0]) );
  SDFFRQX2M \current_state_reg[2]  ( .D(n101), .SI(n21), .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[2]) );
  SDFFRQX2M \current_state_reg[1]  ( .D(n100), .SI(n15), .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[1]) );
  SDFFRX1M \stored_address_reg[3]  ( .D(n99), .SI(n106), .SE(test_se), .CK(CLK), .RN(RST), .Q(n105), .QN(n26) );
  NOR2X2M U6 ( .A(n74), .B(n32), .Y(Address[2]) );
  OAI22X1M U7 ( .A0(n52), .A1(n38), .B0(n1), .B1(n76), .Y(ALU_FUN[2]) );
  OAI22X1M U8 ( .A0(n52), .A1(n43), .B0(n1), .B1(n60), .Y(ALU_FUN[1]) );
  OAI22X1M U9 ( .A0(n52), .A1(n37), .B0(n1), .B1(n77), .Y(ALU_FUN[3]) );
  OAI22X1M U10 ( .A0(n52), .A1(n53), .B0(n1), .B1(n59), .Y(ALU_FUN[0]) );
  AOI2B1X1M U11 ( .A1N(n57), .A0(RX_D_VLD), .B0(RdEn), .Y(n74) );
  INVX2M U12 ( .A(n46), .Y(n12) );
  INVX2M U13 ( .A(WrEn), .Y(n7) );
  INVX2M U14 ( .A(n47), .Y(n14) );
  OAI211X2M U15 ( .A0(n6), .A1(n15), .B0(n27), .C0(n39), .Y(n103) );
  AND3X2M U16 ( .A(n40), .B(n24), .C(n41), .Y(n39) );
  NAND3X2M U17 ( .A(n23), .B(n78), .C(n59), .Y(n40) );
  NAND2X2M U18 ( .A(n75), .B(n15), .Y(n47) );
  INVX2M U19 ( .A(n35), .Y(n6) );
  NAND3BX2M U20 ( .AN(n55), .B(n25), .C(n56), .Y(n31) );
  NAND2X2M U21 ( .A(n15), .B(n16), .Y(n46) );
  OR3X2M U22 ( .A(n64), .B(n5), .C(n62), .Y(TX_D_VLD) );
  NAND2X2M U23 ( .A(n61), .B(n41), .Y(n55) );
  OAI22X1M U24 ( .A0(n104), .A1(n61), .B0(n74), .B1(n36), .Y(Address[0]) );
  NOR2X4M U25 ( .A(n74), .B(n26), .Y(Address[3]) );
  AOI2B1X1M U26 ( .A1N(n55), .A0(n57), .B0(n104), .Y(WrEn) );
  NOR2X2M U27 ( .A(n73), .B(FIFO_FULL), .Y(n64) );
  NOR2X2M U28 ( .A(n59), .B(n7), .Y(WrData[0]) );
  NOR2X2M U29 ( .A(n60), .B(n7), .Y(WrData[1]) );
  NOR2X2M U30 ( .A(n76), .B(n7), .Y(WrData[2]) );
  NOR2X2M U31 ( .A(n77), .B(n7), .Y(WrData[3]) );
  NOR2X2M U32 ( .A(n78), .B(n7), .Y(WrData[4]) );
  NOR2X2M U33 ( .A(n79), .B(n7), .Y(WrData[5]) );
  AOI2BB2XLM U34 ( .B0(n14), .B1(n6), .A0N(n18), .A1N(n19), .Y(n27) );
  OAI22X1M U35 ( .A0(n6), .A1(n16), .B0(n34), .B1(n35), .Y(n102) );
  NOR2X2M U36 ( .A(n11), .B(n14), .Y(n34) );
  NAND3X2M U37 ( .A(n21), .B(n20), .C(n58), .Y(n24) );
  AND2X2M U38 ( .A(n73), .B(n47), .Y(n52) );
  NAND2X2M U39 ( .A(n57), .B(n24), .Y(n54) );
  NOR2X2M U40 ( .A(n74), .B(n33), .Y(Address[1]) );
  OAI22X1M U41 ( .A0(n1), .A1(n59), .B0(n10), .B1(n53), .Y(n81) );
  OAI22X1M U42 ( .A0(n1), .A1(n60), .B0(n10), .B1(n43), .Y(n83) );
  OAI22X1M U43 ( .A0(n1), .A1(n76), .B0(n10), .B1(n38), .Y(n85) );
  OAI22X1M U44 ( .A0(n1), .A1(n77), .B0(n10), .B1(n37), .Y(n87) );
  OAI22X1M U45 ( .A0(n8), .A1(n26), .B0(n77), .B1(n13), .Y(n99) );
  OAI22X1M U46 ( .A0(n8), .A1(n33), .B0(n60), .B1(n13), .Y(n97) );
  OAI22X1M U47 ( .A0(n8), .A1(n36), .B0(n59), .B1(n13), .Y(n96) );
  OAI22X1M U48 ( .A0(n8), .A1(n32), .B0(n76), .B1(n13), .Y(n98) );
  INVX2M U49 ( .A(n1), .Y(n10) );
  NAND2X2M U50 ( .A(n24), .B(n25), .Y(n17) );
  INVX2M U51 ( .A(n13), .Y(n8) );
  INVX2M U52 ( .A(n56), .Y(n11) );
  NAND2X2M U53 ( .A(n52), .B(n1), .Y(ALU_EN) );
  NAND2X2M U54 ( .A(n52), .B(n56), .Y(CLK_Gate_EN) );
  NOR3BX2M U55 ( .AN(n42), .B(n79), .C(n18), .Y(n23) );
  NOR3X2M U56 ( .A(n60), .B(RX_P_DATA[6]), .C(RX_P_DATA[2]), .Y(n42) );
  INVX2M U57 ( .A(n51), .Y(RdEn) );
  OAI211X2M U58 ( .A0(RX_D_VLD), .A1(n48), .B0(n49), .C0(n50), .Y(n35) );
  OA22X2M U59 ( .A0(n51), .A1(RdData_Valid), .B0(n47), .B1(ALU_OUT_Valid), .Y(
        n50) );
  OAI2BB1X2M U60 ( .A0N(n51), .A1N(n52), .B0(FIFO_FULL), .Y(n49) );
  AOI211X2M U61 ( .A0(n12), .A1(n21), .B0(n54), .C0(n31), .Y(n48) );
  NOR3X2M U62 ( .A(n20), .B(current_state[1]), .C(n16), .Y(n75) );
  NOR2X2M U63 ( .A(n15), .B(current_state[3]), .Y(n58) );
  OAI221X1M U64 ( .A0(n18), .A1(n19), .B0(n6), .B1(n21), .C0(n22), .Y(n100) );
  AOI32X1M U65 ( .A0(n23), .A1(RX_P_DATA[0]), .A2(RX_P_DATA[4]), .B0(n6), .B1(
        n17), .Y(n22) );
  NAND3X2M U66 ( .A(current_state[2]), .B(n12), .C(current_state[1]), .Y(n51)
         );
  NAND4X2M U67 ( .A(n6), .B(RX_P_DATA[3]), .C(RX_P_DATA[7]), .D(n45), .Y(n18)
         );
  NOR3X2M U68 ( .A(n46), .B(current_state[2]), .C(current_state[1]), .Y(n45)
         );
  NAND3X2M U69 ( .A(current_state[1]), .B(n20), .C(n58), .Y(n57) );
  INVX2M U70 ( .A(current_state[2]), .Y(n20) );
  INVX2M U71 ( .A(current_state[1]), .Y(n21) );
  NAND3X2M U72 ( .A(current_state[2]), .B(n21), .C(n58), .Y(n61) );
  INVX2M U73 ( .A(current_state[0]), .Y(n15) );
  INVX2M U74 ( .A(current_state[3]), .Y(n16) );
  BUFX2M U75 ( .A(n65), .Y(n5) );
  NOR3BX2M U76 ( .AN(ALU_OUT_Valid), .B(n47), .C(FIFO_FULL), .Y(n65) );
  NOR3BX2M U77 ( .AN(RdData_Valid), .B(n51), .C(FIFO_FULL), .Y(n62) );
  NOR2BX2M U78 ( .AN(RX_P_DATA[6]), .B(n7), .Y(WrData[6]) );
  NOR2BX2M U79 ( .AN(RX_P_DATA[7]), .B(n7), .Y(WrData[7]) );
  OAI211X2M U80 ( .A0(n6), .A1(n20), .B0(n27), .C0(n28), .Y(n101) );
  AOI32X1M U81 ( .A0(n29), .A1(RX_P_DATA[6]), .A2(n30), .B0(n6), .B1(n31), .Y(
        n28) );
  NOR4X1M U82 ( .A(RX_P_DATA[5]), .B(RX_P_DATA[1]), .C(n59), .D(n76), .Y(n30)
         );
  NOR2X2M U83 ( .A(n18), .B(n78), .Y(n29) );
  NAND3X2M U84 ( .A(n12), .B(n21), .C(current_state[2]), .Y(n56) );
  NAND3X2M U85 ( .A(current_state[1]), .B(current_state[2]), .C(n58), .Y(n41)
         );
  OAI2BB1X2M U86 ( .A0N(RdData[0]), .A1N(n62), .B0(n72), .Y(TX_P_DATA[0]) );
  AOI22X1M U87 ( .A0(ALU_OUT[8]), .A1(n64), .B0(ALU_OUT[0]), .B1(n5), .Y(n72)
         );
  OAI2BB1X2M U88 ( .A0N(RdData[1]), .A1N(n62), .B0(n71), .Y(TX_P_DATA[1]) );
  AOI22X1M U89 ( .A0(ALU_OUT[9]), .A1(n64), .B0(ALU_OUT[1]), .B1(n5), .Y(n71)
         );
  OAI2BB1X2M U90 ( .A0N(RdData[2]), .A1N(n62), .B0(n70), .Y(TX_P_DATA[2]) );
  AOI22X1M U91 ( .A0(ALU_OUT[10]), .A1(n64), .B0(ALU_OUT[2]), .B1(n5), .Y(n70)
         );
  OAI2BB1X2M U92 ( .A0N(RdData[3]), .A1N(n62), .B0(n69), .Y(TX_P_DATA[3]) );
  AOI22X1M U93 ( .A0(ALU_OUT[11]), .A1(n64), .B0(ALU_OUT[3]), .B1(n5), .Y(n69)
         );
  OAI2BB1X2M U94 ( .A0N(RdData[4]), .A1N(n62), .B0(n68), .Y(TX_P_DATA[4]) );
  AOI22X1M U95 ( .A0(ALU_OUT[12]), .A1(n64), .B0(ALU_OUT[4]), .B1(n5), .Y(n68)
         );
  OAI2BB1X2M U96 ( .A0N(RdData[5]), .A1N(n62), .B0(n67), .Y(TX_P_DATA[5]) );
  AOI22X1M U97 ( .A0(ALU_OUT[13]), .A1(n64), .B0(ALU_OUT[5]), .B1(n5), .Y(n67)
         );
  OAI2BB1X2M U98 ( .A0N(RdData[6]), .A1N(n62), .B0(n66), .Y(TX_P_DATA[6]) );
  AOI22X1M U99 ( .A0(ALU_OUT[14]), .A1(n64), .B0(ALU_OUT[6]), .B1(n5), .Y(n66)
         );
  OAI2BB1X2M U100 ( .A0N(RdData[7]), .A1N(n62), .B0(n63), .Y(TX_P_DATA[7]) );
  AOI22X1M U101 ( .A0(ALU_OUT[15]), .A1(n64), .B0(ALU_OUT[7]), .B1(n5), .Y(n63) );
  NAND2X2M U102 ( .A(n75), .B(current_state[0]), .Y(n73) );
  NAND3X2M U103 ( .A(n12), .B(n20), .C(current_state[1]), .Y(n25) );
  INVX2M U104 ( .A(RX_D_VLD), .Y(n104) );
  NAND2X2M U105 ( .A(RX_D_VLD), .B(n11), .Y(n1) );
  NAND2X2M U106 ( .A(RX_D_VLD), .B(n17), .Y(n13) );
  INVX2M U107 ( .A(RX_P_DATA[0]), .Y(n59) );
  INVX2M U108 ( .A(RX_P_DATA[2]), .Y(n76) );
  INVX2M U109 ( .A(RX_P_DATA[1]), .Y(n60) );
  NAND4X2M U110 ( .A(RX_P_DATA[2]), .B(n59), .C(RX_P_DATA[6]), .D(n44), .Y(n19) );
  NOR3X2M U111 ( .A(RX_P_DATA[1]), .B(RX_P_DATA[5]), .C(RX_P_DATA[4]), .Y(n44)
         );
  INVX2M U112 ( .A(RX_P_DATA[4]), .Y(n78) );
  INVX2M U113 ( .A(RX_P_DATA[3]), .Y(n77) );
  INVX2M U114 ( .A(RX_P_DATA[5]), .Y(n79) );
  INVX2M U115 ( .A(stored_alu_function[2]), .Y(n38) );
  INVX2M U116 ( .A(n113), .Y(n43) );
  INVX2M U117 ( .A(stored_alu_function[0]), .Y(n53) );
  INVX2M U118 ( .A(stored_alu_function[3]), .Y(n37) );
  INVXLM U131 ( .A(stored_alu_function[1]), .Y(n112) );
  INVXLM U132 ( .A(n112), .Y(n113) );
  SDFFRHQX8M \stored_alu_function_reg[1]  ( .D(n83), .SI(
        stored_alu_function[0]), .SE(test_se), .CK(CLK), .RN(RST), .Q(
        stored_alu_function[1]) );
  INVX2M U3 ( .A(1'b0), .Y(clk_div_en) );
endmodule


module REG_FILE_test_1 ( CLK, RST, WrData, Address, WrEn, RdEn, RdData_Valid, 
        RdData, REG0, REG1, REG2, REG3, test_si2, test_si1, test_so2, test_so1, 
        test_se );
  input [7:0] WrData;
  input [3:0] Address;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, WrEn, RdEn, test_si2, test_si1, test_se;
  output RdData_Valid, test_so2, test_so1;
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
         \reg_file[4][0] , N36, N37, N38, N39, N40, N41, N42, N43, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n314, n315, n316,
         n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360,
         n361, n362, n363, n364, n365, n366, n370, n371, n372, n373, n374,
         n375;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];
  assign test_so2 = \reg_file[15][7] ;
  assign test_so1 = \reg_file[6][1] ;

  SDFFRQX2M \RdData_reg[7]  ( .D(n184), .SI(RdData[6]), .SE(n372), .CK(CLK), 
        .RN(n344), .Q(RdData[7]) );
  SDFFRQX2M \RdData_reg[6]  ( .D(n183), .SI(RdData[5]), .SE(n371), .CK(CLK), 
        .RN(n343), .Q(RdData[6]) );
  SDFFRQX2M \RdData_reg[5]  ( .D(n182), .SI(RdData[4]), .SE(n370), .CK(CLK), 
        .RN(n343), .Q(RdData[5]) );
  SDFFRQX2M \RdData_reg[4]  ( .D(n181), .SI(RdData[3]), .SE(n373), .CK(CLK), 
        .RN(n343), .Q(RdData[4]) );
  SDFFRQX2M \RdData_reg[3]  ( .D(n180), .SI(RdData[2]), .SE(n372), .CK(CLK), 
        .RN(n343), .Q(RdData[3]) );
  SDFFRQX2M \RdData_reg[2]  ( .D(n179), .SI(RdData[1]), .SE(n371), .CK(CLK), 
        .RN(n343), .Q(RdData[2]) );
  SDFFRQX2M \RdData_reg[1]  ( .D(n178), .SI(RdData[0]), .SE(n370), .CK(CLK), 
        .RN(n343), .Q(RdData[1]) );
  SDFFRQX2M \RdData_reg[0]  ( .D(n177), .SI(RdData_Valid), .SE(n373), .CK(CLK), 
        .RN(n347), .Q(RdData[0]) );
  SDFFRQX2M \reg_file_reg[13][7]  ( .D(n297), .SI(\reg_file[13][6] ), .SE(n372), .CK(CLK), .RN(n351), .Q(\reg_file[13][7] ) );
  SDFFRQX2M \reg_file_reg[13][6]  ( .D(n296), .SI(\reg_file[13][5] ), .SE(n371), .CK(CLK), .RN(n351), .Q(\reg_file[13][6] ) );
  SDFFRQX2M \reg_file_reg[13][5]  ( .D(n295), .SI(\reg_file[13][4] ), .SE(n370), .CK(CLK), .RN(n351), .Q(\reg_file[13][5] ) );
  SDFFRQX2M \reg_file_reg[13][4]  ( .D(n294), .SI(\reg_file[13][3] ), .SE(n373), .CK(CLK), .RN(n351), .Q(\reg_file[13][4] ) );
  SDFFRQX2M \reg_file_reg[13][3]  ( .D(n293), .SI(\reg_file[13][2] ), .SE(n372), .CK(CLK), .RN(n351), .Q(\reg_file[13][3] ) );
  SDFFRQX2M \reg_file_reg[13][2]  ( .D(n292), .SI(\reg_file[13][1] ), .SE(n371), .CK(CLK), .RN(n351), .Q(\reg_file[13][2] ) );
  SDFFRQX2M \reg_file_reg[13][1]  ( .D(n291), .SI(\reg_file[13][0] ), .SE(n370), .CK(CLK), .RN(n351), .Q(\reg_file[13][1] ) );
  SDFFRQX2M \reg_file_reg[13][0]  ( .D(n290), .SI(\reg_file[12][7] ), .SE(n373), .CK(CLK), .RN(n351), .Q(\reg_file[13][0] ) );
  SDFFRQX2M \reg_file_reg[9][7]  ( .D(n265), .SI(\reg_file[9][6] ), .SE(n372), 
        .CK(CLK), .RN(n349), .Q(\reg_file[9][7] ) );
  SDFFRQX2M \reg_file_reg[9][6]  ( .D(n264), .SI(\reg_file[9][5] ), .SE(n371), 
        .CK(CLK), .RN(n349), .Q(\reg_file[9][6] ) );
  SDFFRQX2M \reg_file_reg[9][5]  ( .D(n263), .SI(\reg_file[9][4] ), .SE(n370), 
        .CK(CLK), .RN(n349), .Q(\reg_file[9][5] ) );
  SDFFRQX2M \reg_file_reg[9][4]  ( .D(n262), .SI(\reg_file[9][3] ), .SE(n373), 
        .CK(CLK), .RN(n349), .Q(\reg_file[9][4] ) );
  SDFFRQX2M \reg_file_reg[9][3]  ( .D(n261), .SI(\reg_file[9][2] ), .SE(n372), 
        .CK(CLK), .RN(n349), .Q(\reg_file[9][3] ) );
  SDFFRQX2M \reg_file_reg[9][2]  ( .D(n260), .SI(\reg_file[9][1] ), .SE(n371), 
        .CK(CLK), .RN(n349), .Q(\reg_file[9][2] ) );
  SDFFRQX2M \reg_file_reg[9][1]  ( .D(n259), .SI(\reg_file[9][0] ), .SE(n370), 
        .CK(CLK), .RN(n349), .Q(\reg_file[9][1] ) );
  SDFFRQX2M \reg_file_reg[9][0]  ( .D(n258), .SI(\reg_file[8][7] ), .SE(n373), 
        .CK(CLK), .RN(n348), .Q(\reg_file[9][0] ) );
  SDFFRQX2M \reg_file_reg[5][7]  ( .D(n233), .SI(\reg_file[5][6] ), .SE(n372), 
        .CK(CLK), .RN(n347), .Q(\reg_file[5][7] ) );
  SDFFRQX2M \reg_file_reg[5][6]  ( .D(n232), .SI(\reg_file[5][5] ), .SE(n371), 
        .CK(CLK), .RN(n347), .Q(\reg_file[5][6] ) );
  SDFFRQX2M \reg_file_reg[5][5]  ( .D(n231), .SI(\reg_file[5][4] ), .SE(n370), 
        .CK(CLK), .RN(n346), .Q(\reg_file[5][5] ) );
  SDFFRQX2M \reg_file_reg[5][4]  ( .D(n230), .SI(\reg_file[5][3] ), .SE(n373), 
        .CK(CLK), .RN(n346), .Q(\reg_file[5][4] ) );
  SDFFRQX2M \reg_file_reg[5][3]  ( .D(n229), .SI(\reg_file[5][2] ), .SE(n372), 
        .CK(CLK), .RN(n346), .Q(\reg_file[5][3] ) );
  SDFFRQX2M \reg_file_reg[5][2]  ( .D(n228), .SI(\reg_file[5][1] ), .SE(n371), 
        .CK(CLK), .RN(n346), .Q(\reg_file[5][2] ) );
  SDFFRQX2M \reg_file_reg[5][1]  ( .D(n227), .SI(\reg_file[5][0] ), .SE(n370), 
        .CK(CLK), .RN(n346), .Q(\reg_file[5][1] ) );
  SDFFRQX2M \reg_file_reg[5][0]  ( .D(n226), .SI(\reg_file[4][7] ), .SE(n373), 
        .CK(CLK), .RN(n346), .Q(\reg_file[5][0] ) );
  SDFFRQX2M \reg_file_reg[15][7]  ( .D(n313), .SI(\reg_file[15][6] ), .SE(n372), .CK(CLK), .RN(n343), .Q(\reg_file[15][7] ) );
  SDFFRQX2M \reg_file_reg[15][6]  ( .D(n312), .SI(\reg_file[15][5] ), .SE(n371), .CK(CLK), .RN(n352), .Q(\reg_file[15][6] ) );
  SDFFRQX2M \reg_file_reg[15][5]  ( .D(n311), .SI(\reg_file[15][4] ), .SE(n370), .CK(CLK), .RN(n352), .Q(\reg_file[15][5] ) );
  SDFFRQX2M \reg_file_reg[15][4]  ( .D(n310), .SI(\reg_file[15][3] ), .SE(n373), .CK(CLK), .RN(n352), .Q(\reg_file[15][4] ) );
  SDFFRQX2M \reg_file_reg[15][3]  ( .D(n309), .SI(\reg_file[15][2] ), .SE(n372), .CK(CLK), .RN(n352), .Q(\reg_file[15][3] ) );
  SDFFRQX2M \reg_file_reg[15][2]  ( .D(n308), .SI(\reg_file[15][1] ), .SE(n371), .CK(CLK), .RN(n352), .Q(\reg_file[15][2] ) );
  SDFFRQX2M \reg_file_reg[15][1]  ( .D(n307), .SI(\reg_file[15][0] ), .SE(n370), .CK(CLK), .RN(n352), .Q(\reg_file[15][1] ) );
  SDFFRQX2M \reg_file_reg[15][0]  ( .D(n306), .SI(\reg_file[14][7] ), .SE(n373), .CK(CLK), .RN(n352), .Q(\reg_file[15][0] ) );
  SDFFRQX2M \reg_file_reg[11][7]  ( .D(n281), .SI(\reg_file[11][6] ), .SE(n372), .CK(CLK), .RN(n350), .Q(\reg_file[11][7] ) );
  SDFFRQX2M \reg_file_reg[11][6]  ( .D(n280), .SI(\reg_file[11][5] ), .SE(n371), .CK(CLK), .RN(n350), .Q(\reg_file[11][6] ) );
  SDFFRQX2M \reg_file_reg[11][5]  ( .D(n279), .SI(\reg_file[11][4] ), .SE(n370), .CK(CLK), .RN(n350), .Q(\reg_file[11][5] ) );
  SDFFRQX2M \reg_file_reg[11][4]  ( .D(n278), .SI(\reg_file[11][3] ), .SE(n373), .CK(CLK), .RN(n350), .Q(\reg_file[11][4] ) );
  SDFFRQX2M \reg_file_reg[11][3]  ( .D(n277), .SI(\reg_file[11][2] ), .SE(n372), .CK(CLK), .RN(n350), .Q(\reg_file[11][3] ) );
  SDFFRQX2M \reg_file_reg[11][2]  ( .D(n276), .SI(\reg_file[11][1] ), .SE(n371), .CK(CLK), .RN(n350), .Q(\reg_file[11][2] ) );
  SDFFRQX2M \reg_file_reg[11][1]  ( .D(n275), .SI(\reg_file[11][0] ), .SE(n370), .CK(CLK), .RN(n350), .Q(\reg_file[11][1] ) );
  SDFFRQX2M \reg_file_reg[11][0]  ( .D(n274), .SI(\reg_file[10][7] ), .SE(n373), .CK(CLK), .RN(n350), .Q(\reg_file[11][0] ) );
  SDFFRQX2M \reg_file_reg[7][7]  ( .D(n249), .SI(\reg_file[7][6] ), .SE(n372), 
        .CK(CLK), .RN(n348), .Q(\reg_file[7][7] ) );
  SDFFRQX2M \reg_file_reg[7][6]  ( .D(n248), .SI(\reg_file[7][5] ), .SE(n371), 
        .CK(CLK), .RN(n348), .Q(\reg_file[7][6] ) );
  SDFFRQX2M \reg_file_reg[7][5]  ( .D(n247), .SI(\reg_file[7][4] ), .SE(n370), 
        .CK(CLK), .RN(n348), .Q(\reg_file[7][5] ) );
  SDFFRQX2M \reg_file_reg[7][4]  ( .D(n246), .SI(\reg_file[7][3] ), .SE(n373), 
        .CK(CLK), .RN(n348), .Q(\reg_file[7][4] ) );
  SDFFRQX2M \reg_file_reg[7][3]  ( .D(n245), .SI(\reg_file[7][2] ), .SE(n372), 
        .CK(CLK), .RN(n348), .Q(\reg_file[7][3] ) );
  SDFFRQX2M \reg_file_reg[7][2]  ( .D(n244), .SI(\reg_file[7][1] ), .SE(n371), 
        .CK(CLK), .RN(n347), .Q(\reg_file[7][2] ) );
  SDFFRQX2M \reg_file_reg[7][1]  ( .D(n243), .SI(\reg_file[7][0] ), .SE(n370), 
        .CK(CLK), .RN(n347), .Q(\reg_file[7][1] ) );
  SDFFRQX2M \reg_file_reg[7][0]  ( .D(n242), .SI(\reg_file[6][7] ), .SE(n373), 
        .CK(CLK), .RN(n347), .Q(\reg_file[7][0] ) );
  SDFFRQX2M \reg_file_reg[14][7]  ( .D(n305), .SI(\reg_file[14][6] ), .SE(n372), .CK(CLK), .RN(n352), .Q(\reg_file[14][7] ) );
  SDFFRQX2M \reg_file_reg[14][6]  ( .D(n304), .SI(\reg_file[14][5] ), .SE(n371), .CK(CLK), .RN(n352), .Q(\reg_file[14][6] ) );
  SDFFRQX2M \reg_file_reg[14][5]  ( .D(n303), .SI(\reg_file[14][4] ), .SE(n370), .CK(CLK), .RN(n352), .Q(\reg_file[14][5] ) );
  SDFFRQX2M \reg_file_reg[14][4]  ( .D(n302), .SI(\reg_file[14][3] ), .SE(n373), .CK(CLK), .RN(n352), .Q(\reg_file[14][4] ) );
  SDFFRQX2M \reg_file_reg[14][3]  ( .D(n301), .SI(\reg_file[14][2] ), .SE(n372), .CK(CLK), .RN(n352), .Q(\reg_file[14][3] ) );
  SDFFRQX2M \reg_file_reg[14][2]  ( .D(n300), .SI(\reg_file[14][1] ), .SE(n371), .CK(CLK), .RN(n351), .Q(\reg_file[14][2] ) );
  SDFFRQX2M \reg_file_reg[14][1]  ( .D(n299), .SI(\reg_file[14][0] ), .SE(n370), .CK(CLK), .RN(n351), .Q(\reg_file[14][1] ) );
  SDFFRQX2M \reg_file_reg[14][0]  ( .D(n298), .SI(\reg_file[13][7] ), .SE(n373), .CK(CLK), .RN(n351), .Q(\reg_file[14][0] ) );
  SDFFRQX2M \reg_file_reg[10][7]  ( .D(n273), .SI(\reg_file[10][6] ), .SE(n372), .CK(CLK), .RN(n350), .Q(\reg_file[10][7] ) );
  SDFFRQX2M \reg_file_reg[10][6]  ( .D(n272), .SI(\reg_file[10][5] ), .SE(n371), .CK(CLK), .RN(n349), .Q(\reg_file[10][6] ) );
  SDFFRQX2M \reg_file_reg[10][5]  ( .D(n271), .SI(\reg_file[10][4] ), .SE(n370), .CK(CLK), .RN(n349), .Q(\reg_file[10][5] ) );
  SDFFRQX2M \reg_file_reg[10][4]  ( .D(n270), .SI(\reg_file[10][3] ), .SE(n373), .CK(CLK), .RN(n349), .Q(\reg_file[10][4] ) );
  SDFFRQX2M \reg_file_reg[10][3]  ( .D(n269), .SI(\reg_file[10][2] ), .SE(n372), .CK(CLK), .RN(n349), .Q(\reg_file[10][3] ) );
  SDFFRQX2M \reg_file_reg[10][2]  ( .D(n268), .SI(\reg_file[10][1] ), .SE(n371), .CK(CLK), .RN(n349), .Q(\reg_file[10][2] ) );
  SDFFRQX2M \reg_file_reg[10][1]  ( .D(n267), .SI(\reg_file[10][0] ), .SE(n370), .CK(CLK), .RN(n349), .Q(\reg_file[10][1] ) );
  SDFFRQX2M \reg_file_reg[10][0]  ( .D(n266), .SI(\reg_file[9][7] ), .SE(n373), 
        .CK(CLK), .RN(n349), .Q(\reg_file[10][0] ) );
  SDFFRQX2M \reg_file_reg[6][7]  ( .D(n241), .SI(\reg_file[6][6] ), .SE(n372), 
        .CK(CLK), .RN(n347), .Q(\reg_file[6][7] ) );
  SDFFRQX2M \reg_file_reg[6][6]  ( .D(n240), .SI(\reg_file[6][5] ), .SE(n371), 
        .CK(CLK), .RN(n347), .Q(\reg_file[6][6] ) );
  SDFFRQX2M \reg_file_reg[6][5]  ( .D(n239), .SI(\reg_file[6][4] ), .SE(n370), 
        .CK(CLK), .RN(n347), .Q(\reg_file[6][5] ) );
  SDFFRQX2M \reg_file_reg[6][4]  ( .D(n238), .SI(\reg_file[6][3] ), .SE(n373), 
        .CK(CLK), .RN(n347), .Q(\reg_file[6][4] ) );
  SDFFRQX2M \reg_file_reg[6][3]  ( .D(n237), .SI(\reg_file[6][2] ), .SE(n372), 
        .CK(CLK), .RN(n347), .Q(\reg_file[6][3] ) );
  SDFFRQX2M \reg_file_reg[6][2]  ( .D(n236), .SI(test_si2), .SE(n371), .CK(CLK), .RN(n347), .Q(\reg_file[6][2] ) );
  SDFFRQX2M \reg_file_reg[6][0]  ( .D(n234), .SI(\reg_file[5][7] ), .SE(n373), 
        .CK(CLK), .RN(n347), .Q(\reg_file[6][0] ) );
  SDFFRQX2M \reg_file_reg[12][7]  ( .D(n289), .SI(\reg_file[12][6] ), .SE(n372), .CK(CLK), .RN(n351), .Q(\reg_file[12][7] ) );
  SDFFRQX2M \reg_file_reg[12][6]  ( .D(n288), .SI(\reg_file[12][5] ), .SE(n371), .CK(CLK), .RN(n351), .Q(\reg_file[12][6] ) );
  SDFFRQX2M \reg_file_reg[12][5]  ( .D(n287), .SI(\reg_file[12][4] ), .SE(n370), .CK(CLK), .RN(n351), .Q(\reg_file[12][5] ) );
  SDFFRQX2M \reg_file_reg[12][4]  ( .D(n286), .SI(\reg_file[12][3] ), .SE(n373), .CK(CLK), .RN(n350), .Q(\reg_file[12][4] ) );
  SDFFRQX2M \reg_file_reg[12][3]  ( .D(n285), .SI(\reg_file[12][2] ), .SE(n372), .CK(CLK), .RN(n350), .Q(\reg_file[12][3] ) );
  SDFFRQX2M \reg_file_reg[12][2]  ( .D(n284), .SI(\reg_file[12][1] ), .SE(n371), .CK(CLK), .RN(n350), .Q(\reg_file[12][2] ) );
  SDFFRQX2M \reg_file_reg[12][1]  ( .D(n283), .SI(\reg_file[12][0] ), .SE(n370), .CK(CLK), .RN(n350), .Q(\reg_file[12][1] ) );
  SDFFRQX2M \reg_file_reg[12][0]  ( .D(n282), .SI(\reg_file[11][7] ), .SE(n373), .CK(CLK), .RN(n350), .Q(\reg_file[12][0] ) );
  SDFFRQX2M \reg_file_reg[8][7]  ( .D(n257), .SI(\reg_file[8][6] ), .SE(n372), 
        .CK(CLK), .RN(n348), .Q(\reg_file[8][7] ) );
  SDFFRQX2M \reg_file_reg[8][6]  ( .D(n256), .SI(\reg_file[8][5] ), .SE(n371), 
        .CK(CLK), .RN(n348), .Q(\reg_file[8][6] ) );
  SDFFRQX2M \reg_file_reg[8][5]  ( .D(n255), .SI(\reg_file[8][4] ), .SE(n370), 
        .CK(CLK), .RN(n348), .Q(\reg_file[8][5] ) );
  SDFFRQX2M \reg_file_reg[8][4]  ( .D(n254), .SI(\reg_file[8][3] ), .SE(n373), 
        .CK(CLK), .RN(n348), .Q(\reg_file[8][4] ) );
  SDFFRQX2M \reg_file_reg[8][3]  ( .D(n253), .SI(\reg_file[8][2] ), .SE(n372), 
        .CK(CLK), .RN(n348), .Q(\reg_file[8][3] ) );
  SDFFRQX2M \reg_file_reg[8][2]  ( .D(n252), .SI(\reg_file[8][1] ), .SE(n371), 
        .CK(CLK), .RN(n348), .Q(\reg_file[8][2] ) );
  SDFFRQX2M \reg_file_reg[8][1]  ( .D(n251), .SI(\reg_file[8][0] ), .SE(n370), 
        .CK(CLK), .RN(n348), .Q(\reg_file[8][1] ) );
  SDFFRQX2M \reg_file_reg[8][0]  ( .D(n250), .SI(\reg_file[7][7] ), .SE(n373), 
        .CK(CLK), .RN(n348), .Q(\reg_file[8][0] ) );
  SDFFRQX2M \reg_file_reg[4][7]  ( .D(n225), .SI(\reg_file[4][6] ), .SE(n372), 
        .CK(CLK), .RN(n346), .Q(\reg_file[4][7] ) );
  SDFFRQX2M \reg_file_reg[4][6]  ( .D(n224), .SI(\reg_file[4][5] ), .SE(n371), 
        .CK(CLK), .RN(n346), .Q(\reg_file[4][6] ) );
  SDFFRQX2M \reg_file_reg[4][5]  ( .D(n223), .SI(\reg_file[4][4] ), .SE(n370), 
        .CK(CLK), .RN(n346), .Q(\reg_file[4][5] ) );
  SDFFRQX2M \reg_file_reg[4][4]  ( .D(n222), .SI(\reg_file[4][3] ), .SE(n373), 
        .CK(CLK), .RN(n346), .Q(\reg_file[4][4] ) );
  SDFFRQX2M \reg_file_reg[4][3]  ( .D(n221), .SI(\reg_file[4][2] ), .SE(n372), 
        .CK(CLK), .RN(n346), .Q(\reg_file[4][3] ) );
  SDFFRQX2M \reg_file_reg[4][2]  ( .D(n220), .SI(\reg_file[4][1] ), .SE(n371), 
        .CK(CLK), .RN(n346), .Q(\reg_file[4][2] ) );
  SDFFRQX2M \reg_file_reg[4][1]  ( .D(n219), .SI(\reg_file[4][0] ), .SE(n370), 
        .CK(CLK), .RN(n346), .Q(\reg_file[4][1] ) );
  SDFFRQX2M \reg_file_reg[4][0]  ( .D(n218), .SI(REG3[7]), .SE(n373), .CK(CLK), 
        .RN(n346), .Q(\reg_file[4][0] ) );
  SDFFSQX2M \reg_file_reg[2][0]  ( .D(n202), .SI(REG1[7]), .SE(test_se), .CK(
        CLK), .SN(n343), .Q(REG2[0]) );
  SDFFRQX2M \reg_file_reg[2][1]  ( .D(n203), .SI(REG2[0]), .SE(n372), .CK(CLK), 
        .RN(n345), .Q(REG2[1]) );
  SDFFRQX2M \reg_file_reg[1][6]  ( .D(n200), .SI(REG1[5]), .SE(n371), .CK(CLK), 
        .RN(n344), .Q(REG1[6]) );
  SDFFRQX2M \reg_file_reg[0][7]  ( .D(n193), .SI(REG0[6]), .SE(n370), .CK(CLK), 
        .RN(n344), .Q(REG0[7]) );
  SDFFRQX2M \reg_file_reg[0][6]  ( .D(n192), .SI(REG0[5]), .SE(n373), .CK(CLK), 
        .RN(n344), .Q(REG0[6]) );
  SDFFRQX2M \reg_file_reg[0][5]  ( .D(n191), .SI(REG0[4]), .SE(n372), .CK(CLK), 
        .RN(n344), .Q(REG0[5]) );
  SDFFRQX2M \reg_file_reg[0][4]  ( .D(n190), .SI(REG0[3]), .SE(n371), .CK(CLK), 
        .RN(n344), .Q(REG0[4]) );
  SDFFRQX2M \reg_file_reg[0][3]  ( .D(n189), .SI(REG0[2]), .SE(n370), .CK(CLK), 
        .RN(n344), .Q(REG0[3]) );
  SDFFRQX2M \reg_file_reg[0][2]  ( .D(n188), .SI(REG0[1]), .SE(n373), .CK(CLK), 
        .RN(n344), .Q(REG0[2]) );
  SDFFRQX2M \reg_file_reg[0][1]  ( .D(n187), .SI(REG0[0]), .SE(n372), .CK(CLK), 
        .RN(n343), .Q(REG0[1]) );
  SDFFRQX2M \reg_file_reg[0][0]  ( .D(n186), .SI(RdData[7]), .SE(n371), .CK(
        CLK), .RN(n343), .Q(REG0[0]) );
  SDFFRQX2M \reg_file_reg[1][5]  ( .D(n199), .SI(REG1[4]), .SE(n370), .CK(CLK), 
        .RN(n345), .Q(REG1[5]) );
  SDFFRQX2M \reg_file_reg[1][4]  ( .D(n198), .SI(REG1[3]), .SE(n373), .CK(CLK), 
        .RN(n344), .Q(REG1[4]) );
  SDFFRQX2M \reg_file_reg[1][1]  ( .D(n195), .SI(REG1[0]), .SE(n372), .CK(CLK), 
        .RN(n344), .Q(REG1[1]) );
  SDFFRQX2M \reg_file_reg[1][7]  ( .D(n201), .SI(REG1[6]), .SE(n371), .CK(CLK), 
        .RN(n344), .Q(REG1[7]) );
  SDFFRQX2M \reg_file_reg[1][3]  ( .D(n197), .SI(REG1[2]), .SE(n370), .CK(CLK), 
        .RN(n344), .Q(REG1[3]) );
  SDFFRQX2M \reg_file_reg[1][2]  ( .D(n196), .SI(REG1[1]), .SE(n373), .CK(CLK), 
        .RN(n344), .Q(REG1[2]) );
  SDFFRQX2M \reg_file_reg[1][0]  ( .D(n194), .SI(REG0[7]), .SE(n372), .CK(CLK), 
        .RN(n344), .Q(REG1[0]) );
  SDFFRQX2M RdData_Valid_reg ( .D(n185), .SI(test_si1), .SE(n371), .CK(CLK), 
        .RN(n343), .Q(RdData_Valid) );
  SDFFRQX2M \reg_file_reg[3][0]  ( .D(n210), .SI(REG2[7]), .SE(n370), .CK(CLK), 
        .RN(n345), .Q(REG3[0]) );
  SDFFRQX2M \reg_file_reg[3][7]  ( .D(n217), .SI(REG3[6]), .SE(n373), .CK(CLK), 
        .RN(n345), .Q(REG3[7]) );
  SDFFSQX2M \reg_file_reg[3][5]  ( .D(n215), .SI(REG3[4]), .SE(n370), .CK(CLK), 
        .SN(n343), .Q(REG3[5]) );
  SDFFRQX2M \reg_file_reg[3][4]  ( .D(n214), .SI(REG3[3]), .SE(n372), .CK(CLK), 
        .RN(n345), .Q(REG3[4]) );
  SDFFRQX2M \reg_file_reg[3][6]  ( .D(n216), .SI(REG3[5]), .SE(n371), .CK(CLK), 
        .RN(n345), .Q(REG3[6]) );
  SDFFRQX2M \reg_file_reg[3][3]  ( .D(n213), .SI(REG3[2]), .SE(n370), .CK(CLK), 
        .RN(n345), .Q(REG3[3]) );
  SDFFRQX2M \reg_file_reg[3][1]  ( .D(n211), .SI(REG3[0]), .SE(n373), .CK(CLK), 
        .RN(n345), .Q(REG3[1]) );
  SDFFRQX2M \reg_file_reg[2][2]  ( .D(n204), .SI(REG2[1]), .SE(n372), .CK(CLK), 
        .RN(n345), .Q(REG2[2]) );
  SDFFRQX2M \reg_file_reg[3][2]  ( .D(n212), .SI(REG3[1]), .SE(n371), .CK(CLK), 
        .RN(n345), .Q(REG3[2]) );
  SDFFRQX2M \reg_file_reg[2][5]  ( .D(n207), .SI(REG2[4]), .SE(n370), .CK(CLK), 
        .RN(n345), .Q(REG2[5]) );
  SDFFRQX2M \reg_file_reg[2][6]  ( .D(n208), .SI(REG2[5]), .SE(n373), .CK(CLK), 
        .RN(n345), .Q(REG2[6]) );
  SDFFRQX2M \reg_file_reg[2][4]  ( .D(n206), .SI(REG2[3]), .SE(n372), .CK(CLK), 
        .RN(n345), .Q(REG2[4]) );
  SDFFRQX2M \reg_file_reg[2][3]  ( .D(n205), .SI(REG2[2]), .SE(n371), .CK(CLK), 
        .RN(n345), .Q(REG2[3]) );
  SDFFSQX1M \reg_file_reg[2][7]  ( .D(n209), .SI(REG2[6]), .SE(n373), .CK(CLK), 
        .SN(RST), .Q(REG2[7]) );
  NOR2BX2M U141 ( .AN(n175), .B(n341), .Y(n169) );
  NOR2BX2M U142 ( .AN(N13), .B(n337), .Y(n160) );
  NOR2BX2M U143 ( .AN(N13), .B(n342), .Y(n163) );
  NOR2BX2M U144 ( .AN(n164), .B(n341), .Y(n155) );
  NOR2X2M U145 ( .A(n342), .B(N13), .Y(n157) );
  NOR2X2M U146 ( .A(n337), .B(N13), .Y(n152) );
  INVX2M U147 ( .A(n338), .Y(n339) );
  INVX2M U148 ( .A(n336), .Y(n337) );
  INVX2M U149 ( .A(n338), .Y(n340) );
  BUFX2M U150 ( .A(n341), .Y(n338) );
  BUFX2M U151 ( .A(n342), .Y(n336) );
  NOR2BX2M U152 ( .AN(n164), .B(N11), .Y(n153) );
  NOR2BX2M U153 ( .AN(n175), .B(N11), .Y(n167) );
  NAND2X2M U154 ( .A(n155), .B(n152), .Y(n154) );
  NAND2X2M U155 ( .A(n167), .B(n152), .Y(n166) );
  NAND2X2M U156 ( .A(n169), .B(n152), .Y(n168) );
  NAND2X2M U157 ( .A(n167), .B(n157), .Y(n170) );
  NAND2X2M U158 ( .A(n169), .B(n157), .Y(n171) );
  NAND2X2M U159 ( .A(n157), .B(n153), .Y(n156) );
  NAND2X2M U160 ( .A(n157), .B(n155), .Y(n158) );
  NAND2X2M U161 ( .A(n160), .B(n153), .Y(n159) );
  NAND2X2M U162 ( .A(n160), .B(n155), .Y(n161) );
  NAND2X2M U163 ( .A(n163), .B(n153), .Y(n162) );
  NAND2X2M U164 ( .A(n163), .B(n155), .Y(n165) );
  NAND2X2M U165 ( .A(n167), .B(n160), .Y(n172) );
  NAND2X2M U166 ( .A(n169), .B(n160), .Y(n173) );
  NAND2X2M U167 ( .A(n167), .B(n163), .Y(n174) );
  NAND2X2M U168 ( .A(n169), .B(n163), .Y(n176) );
  NAND2X2M U169 ( .A(n152), .B(n153), .Y(n151) );
  INVX2M U170 ( .A(n149), .Y(n358) );
  NAND2BX2M U171 ( .AN(WrEn), .B(RdEn), .Y(n149) );
  NOR2BX2M U172 ( .AN(WrEn), .B(RdEn), .Y(n150) );
  NOR2BX2M U173 ( .AN(n150), .B(N14), .Y(n164) );
  AND2X2M U174 ( .A(N14), .B(n150), .Y(n175) );
  BUFX2M U175 ( .A(n357), .Y(n344) );
  BUFX2M U176 ( .A(n356), .Y(n345) );
  BUFX2M U177 ( .A(n356), .Y(n346) );
  BUFX2M U178 ( .A(n355), .Y(n347) );
  BUFX2M U179 ( .A(n355), .Y(n348) );
  BUFX2M U180 ( .A(n354), .Y(n349) );
  BUFX2M U181 ( .A(n354), .Y(n350) );
  BUFX2M U182 ( .A(n353), .Y(n351) );
  BUFX2M U183 ( .A(n357), .Y(n343) );
  BUFX2M U184 ( .A(n353), .Y(n352) );
  INVX2M U185 ( .A(N11), .Y(n341) );
  INVX2M U186 ( .A(WrData[0]), .Y(n366) );
  INVX2M U187 ( .A(WrData[1]), .Y(n365) );
  INVX2M U188 ( .A(WrData[2]), .Y(n364) );
  INVX2M U189 ( .A(WrData[3]), .Y(n363) );
  INVX2M U190 ( .A(WrData[4]), .Y(n362) );
  INVX2M U191 ( .A(WrData[5]), .Y(n361) );
  INVX2M U192 ( .A(N12), .Y(n342) );
  BUFX2M U193 ( .A(RST), .Y(n356) );
  BUFX2M U194 ( .A(RST), .Y(n355) );
  BUFX2M U195 ( .A(RST), .Y(n354) );
  BUFX2M U196 ( .A(RST), .Y(n353) );
  BUFX2M U197 ( .A(RST), .Y(n357) );
  AO22X1M U198 ( .A0(N43), .A1(n358), .B0(RdData[0]), .B1(n149), .Y(n177) );
  MX4X1M U199 ( .A(n142), .B(n140), .C(n141), .D(n139), .S0(N14), .S1(N13), 
        .Y(N43) );
  MX4X1M U200 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(N11), 
        .S1(n337), .Y(n142) );
  MX4X1M U201 ( .A(\reg_file[8][0] ), .B(\reg_file[9][0] ), .C(
        \reg_file[10][0] ), .D(\reg_file[11][0] ), .S0(N11), .S1(n337), .Y(
        n140) );
  AO22X1M U202 ( .A0(N42), .A1(n358), .B0(RdData[1]), .B1(n149), .Y(n178) );
  MX4X1M U203 ( .A(n146), .B(n144), .C(n145), .D(n143), .S0(N14), .S1(N13), 
        .Y(N42) );
  MX4X1M U204 ( .A(\reg_file[8][1] ), .B(\reg_file[9][1] ), .C(
        \reg_file[10][1] ), .D(\reg_file[11][1] ), .S0(N11), .S1(n337), .Y(
        n144) );
  MX4X1M U205 ( .A(\reg_file[12][1] ), .B(\reg_file[13][1] ), .C(
        \reg_file[14][1] ), .D(\reg_file[15][1] ), .S0(n339), .S1(n337), .Y(
        n143) );
  AO22X1M U206 ( .A0(N41), .A1(n358), .B0(RdData[2]), .B1(n149), .Y(n179) );
  MX4X1M U207 ( .A(n315), .B(n148), .C(n314), .D(n147), .S0(N14), .S1(N13), 
        .Y(N41) );
  MX4X1M U208 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n339), 
        .S1(N12), .Y(n315) );
  MX4X1M U209 ( .A(\reg_file[8][2] ), .B(\reg_file[9][2] ), .C(
        \reg_file[10][2] ), .D(\reg_file[11][2] ), .S0(n339), .S1(N12), .Y(
        n148) );
  AO22X1M U210 ( .A0(N40), .A1(n358), .B0(RdData[3]), .B1(n149), .Y(n180) );
  MX4X1M U211 ( .A(n319), .B(n317), .C(n318), .D(n316), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4X1M U212 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n339), 
        .S1(N12), .Y(n319) );
  MX4X1M U213 ( .A(\reg_file[8][3] ), .B(\reg_file[9][3] ), .C(
        \reg_file[10][3] ), .D(\reg_file[11][3] ), .S0(n339), .S1(N12), .Y(
        n317) );
  AO22X1M U214 ( .A0(N39), .A1(n358), .B0(RdData[4]), .B1(n149), .Y(n181) );
  MX4X1M U215 ( .A(n323), .B(n321), .C(n322), .D(n320), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4X1M U216 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n340), 
        .S1(N12), .Y(n323) );
  MX4X1M U217 ( .A(\reg_file[8][4] ), .B(\reg_file[9][4] ), .C(
        \reg_file[10][4] ), .D(\reg_file[11][4] ), .S0(n339), .S1(N12), .Y(
        n321) );
  AO22X1M U218 ( .A0(N38), .A1(n358), .B0(RdData[5]), .B1(n149), .Y(n182) );
  MX4X1M U219 ( .A(n327), .B(n325), .C(n326), .D(n324), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U220 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n340), 
        .S1(N12), .Y(n327) );
  MX4X1M U221 ( .A(\reg_file[8][5] ), .B(\reg_file[9][5] ), .C(
        \reg_file[10][5] ), .D(\reg_file[11][5] ), .S0(n340), .S1(N12), .Y(
        n325) );
  AO22X1M U222 ( .A0(N37), .A1(n358), .B0(RdData[6]), .B1(n149), .Y(n183) );
  MX4X1M U223 ( .A(n331), .B(n329), .C(n330), .D(n328), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U224 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n340), 
        .S1(N12), .Y(n331) );
  MX4X1M U225 ( .A(\reg_file[8][6] ), .B(\reg_file[9][6] ), .C(
        \reg_file[10][6] ), .D(\reg_file[11][6] ), .S0(n340), .S1(N12), .Y(
        n329) );
  AO22X1M U226 ( .A0(N36), .A1(n358), .B0(RdData[7]), .B1(n149), .Y(n184) );
  MX4X1M U227 ( .A(n335), .B(n333), .C(n334), .D(n332), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U228 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n340), 
        .S1(N12), .Y(n335) );
  MX4X1M U229 ( .A(\reg_file[8][7] ), .B(\reg_file[9][7] ), .C(
        \reg_file[10][7] ), .D(\reg_file[11][7] ), .S0(n340), .S1(N12), .Y(
        n333) );
  MX4X1M U230 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n339), 
        .S1(n337), .Y(n146) );
  MX4X1M U231 ( .A(\reg_file[4][0] ), .B(\reg_file[5][0] ), .C(
        \reg_file[6][0] ), .D(\reg_file[7][0] ), .S0(N11), .S1(n337), .Y(n141)
         );
  MX4X1M U232 ( .A(\reg_file[4][1] ), .B(\reg_file[5][1] ), .C(n375), .D(
        \reg_file[7][1] ), .S0(n339), .S1(n337), .Y(n145) );
  MX4X1M U233 ( .A(\reg_file[4][2] ), .B(\reg_file[5][2] ), .C(
        \reg_file[6][2] ), .D(\reg_file[7][2] ), .S0(n339), .S1(N12), .Y(n314)
         );
  MX4X1M U234 ( .A(\reg_file[4][3] ), .B(\reg_file[5][3] ), .C(
        \reg_file[6][3] ), .D(\reg_file[7][3] ), .S0(n339), .S1(N12), .Y(n318)
         );
  MX4X1M U235 ( .A(\reg_file[4][4] ), .B(\reg_file[5][4] ), .C(
        \reg_file[6][4] ), .D(\reg_file[7][4] ), .S0(n339), .S1(N12), .Y(n322)
         );
  MX4X1M U236 ( .A(\reg_file[4][5] ), .B(\reg_file[5][5] ), .C(
        \reg_file[6][5] ), .D(\reg_file[7][5] ), .S0(n340), .S1(N12), .Y(n326)
         );
  MX4X1M U237 ( .A(\reg_file[4][6] ), .B(\reg_file[5][6] ), .C(
        \reg_file[6][6] ), .D(\reg_file[7][6] ), .S0(n340), .S1(N12), .Y(n330)
         );
  MX4X1M U238 ( .A(\reg_file[4][7] ), .B(\reg_file[5][7] ), .C(
        \reg_file[6][7] ), .D(\reg_file[7][7] ), .S0(n340), .S1(N12), .Y(n334)
         );
  MX4X1M U239 ( .A(\reg_file[12][0] ), .B(\reg_file[13][0] ), .C(
        \reg_file[14][0] ), .D(\reg_file[15][0] ), .S0(n340), .S1(n337), .Y(
        n139) );
  MX4X1M U240 ( .A(\reg_file[12][2] ), .B(\reg_file[13][2] ), .C(
        \reg_file[14][2] ), .D(\reg_file[15][2] ), .S0(n339), .S1(n337), .Y(
        n147) );
  MX4X1M U241 ( .A(\reg_file[12][3] ), .B(\reg_file[13][3] ), .C(
        \reg_file[14][3] ), .D(\reg_file[15][3] ), .S0(n339), .S1(n337), .Y(
        n316) );
  MX4X1M U242 ( .A(\reg_file[12][4] ), .B(\reg_file[13][4] ), .C(
        \reg_file[14][4] ), .D(\reg_file[15][4] ), .S0(n339), .S1(N12), .Y(
        n320) );
  MX4X1M U243 ( .A(\reg_file[12][5] ), .B(\reg_file[13][5] ), .C(
        \reg_file[14][5] ), .D(\reg_file[15][5] ), .S0(n340), .S1(n337), .Y(
        n324) );
  MX4X1M U244 ( .A(\reg_file[12][6] ), .B(\reg_file[13][6] ), .C(
        \reg_file[14][6] ), .D(\reg_file[15][6] ), .S0(n340), .S1(n337), .Y(
        n328) );
  MX4X1M U245 ( .A(\reg_file[12][7] ), .B(\reg_file[13][7] ), .C(
        \reg_file[14][7] ), .D(\reg_file[15][7] ), .S0(n340), .S1(n337), .Y(
        n332) );
  INVX2M U246 ( .A(WrData[6]), .Y(n360) );
  INVX2M U247 ( .A(WrData[7]), .Y(n359) );
  OAI2BB2X1M U248 ( .B0(n151), .B1(n366), .A0N(REG0[0]), .A1N(n151), .Y(n186)
         );
  OAI2BB2X1M U249 ( .B0(n151), .B1(n365), .A0N(REG0[1]), .A1N(n151), .Y(n187)
         );
  OAI2BB2X1M U250 ( .B0(n151), .B1(n364), .A0N(REG0[2]), .A1N(n151), .Y(n188)
         );
  OAI2BB2X1M U251 ( .B0(n151), .B1(n363), .A0N(REG0[3]), .A1N(n151), .Y(n189)
         );
  OAI2BB2X1M U252 ( .B0(n151), .B1(n362), .A0N(REG0[4]), .A1N(n151), .Y(n190)
         );
  OAI2BB2X1M U253 ( .B0(n151), .B1(n361), .A0N(REG0[5]), .A1N(n151), .Y(n191)
         );
  OAI2BB2X1M U254 ( .B0(n151), .B1(n360), .A0N(REG0[6]), .A1N(n151), .Y(n192)
         );
  OAI2BB2X1M U255 ( .B0(n151), .B1(n359), .A0N(REG0[7]), .A1N(n151), .Y(n193)
         );
  OAI2BB2X1M U256 ( .B0(n366), .B1(n154), .A0N(REG1[0]), .A1N(n154), .Y(n194)
         );
  OAI2BB2X1M U257 ( .B0(n365), .B1(n154), .A0N(REG1[1]), .A1N(n154), .Y(n195)
         );
  OAI2BB2X1M U258 ( .B0(n364), .B1(n154), .A0N(REG1[2]), .A1N(n154), .Y(n196)
         );
  OAI2BB2X1M U259 ( .B0(n363), .B1(n154), .A0N(REG1[3]), .A1N(n154), .Y(n197)
         );
  OAI2BB2X1M U260 ( .B0(n362), .B1(n154), .A0N(REG1[4]), .A1N(n154), .Y(n198)
         );
  OAI2BB2X1M U261 ( .B0(n361), .B1(n154), .A0N(REG1[5]), .A1N(n154), .Y(n199)
         );
  OAI2BB2X1M U262 ( .B0(n360), .B1(n154), .A0N(REG1[6]), .A1N(n154), .Y(n200)
         );
  OAI2BB2X1M U263 ( .B0(n359), .B1(n154), .A0N(REG1[7]), .A1N(n154), .Y(n201)
         );
  OAI2BB2X1M U264 ( .B0(n366), .B1(n159), .A0N(\reg_file[4][0] ), .A1N(n159), 
        .Y(n218) );
  OAI2BB2X1M U265 ( .B0(n365), .B1(n159), .A0N(\reg_file[4][1] ), .A1N(n159), 
        .Y(n219) );
  OAI2BB2X1M U266 ( .B0(n364), .B1(n159), .A0N(\reg_file[4][2] ), .A1N(n159), 
        .Y(n220) );
  OAI2BB2X1M U267 ( .B0(n363), .B1(n159), .A0N(\reg_file[4][3] ), .A1N(n159), 
        .Y(n221) );
  OAI2BB2X1M U268 ( .B0(n362), .B1(n159), .A0N(\reg_file[4][4] ), .A1N(n159), 
        .Y(n222) );
  OAI2BB2X1M U269 ( .B0(n361), .B1(n159), .A0N(\reg_file[4][5] ), .A1N(n159), 
        .Y(n223) );
  OAI2BB2X1M U270 ( .B0(n360), .B1(n159), .A0N(\reg_file[4][6] ), .A1N(n159), 
        .Y(n224) );
  OAI2BB2X1M U271 ( .B0(n359), .B1(n159), .A0N(\reg_file[4][7] ), .A1N(n159), 
        .Y(n225) );
  OAI2BB2X1M U272 ( .B0(n366), .B1(n161), .A0N(\reg_file[5][0] ), .A1N(n161), 
        .Y(n226) );
  OAI2BB2X1M U273 ( .B0(n365), .B1(n161), .A0N(\reg_file[5][1] ), .A1N(n161), 
        .Y(n227) );
  OAI2BB2X1M U274 ( .B0(n364), .B1(n161), .A0N(\reg_file[5][2] ), .A1N(n161), 
        .Y(n228) );
  OAI2BB2X1M U275 ( .B0(n363), .B1(n161), .A0N(\reg_file[5][3] ), .A1N(n161), 
        .Y(n229) );
  OAI2BB2X1M U276 ( .B0(n362), .B1(n161), .A0N(\reg_file[5][4] ), .A1N(n161), 
        .Y(n230) );
  OAI2BB2X1M U277 ( .B0(n361), .B1(n161), .A0N(\reg_file[5][5] ), .A1N(n161), 
        .Y(n231) );
  OAI2BB2X1M U278 ( .B0(n360), .B1(n161), .A0N(\reg_file[5][6] ), .A1N(n161), 
        .Y(n232) );
  OAI2BB2X1M U279 ( .B0(n359), .B1(n161), .A0N(\reg_file[5][7] ), .A1N(n161), 
        .Y(n233) );
  OAI2BB2X1M U280 ( .B0(n366), .B1(n162), .A0N(\reg_file[6][0] ), .A1N(n162), 
        .Y(n234) );
  OAI2BB2X1M U281 ( .B0(n365), .B1(n162), .A0N(n375), .A1N(n162), .Y(n235) );
  OAI2BB2X1M U282 ( .B0(n364), .B1(n162), .A0N(\reg_file[6][2] ), .A1N(n162), 
        .Y(n236) );
  OAI2BB2X1M U283 ( .B0(n363), .B1(n162), .A0N(\reg_file[6][3] ), .A1N(n162), 
        .Y(n237) );
  OAI2BB2X1M U284 ( .B0(n362), .B1(n162), .A0N(\reg_file[6][4] ), .A1N(n162), 
        .Y(n238) );
  OAI2BB2X1M U285 ( .B0(n361), .B1(n162), .A0N(\reg_file[6][5] ), .A1N(n162), 
        .Y(n239) );
  OAI2BB2X1M U286 ( .B0(n360), .B1(n162), .A0N(\reg_file[6][6] ), .A1N(n162), 
        .Y(n240) );
  OAI2BB2X1M U287 ( .B0(n359), .B1(n162), .A0N(\reg_file[6][7] ), .A1N(n162), 
        .Y(n241) );
  OAI2BB2X1M U288 ( .B0(n366), .B1(n165), .A0N(\reg_file[7][0] ), .A1N(n165), 
        .Y(n242) );
  OAI2BB2X1M U289 ( .B0(n365), .B1(n165), .A0N(\reg_file[7][1] ), .A1N(n165), 
        .Y(n243) );
  OAI2BB2X1M U290 ( .B0(n364), .B1(n165), .A0N(\reg_file[7][2] ), .A1N(n165), 
        .Y(n244) );
  OAI2BB2X1M U291 ( .B0(n363), .B1(n165), .A0N(\reg_file[7][3] ), .A1N(n165), 
        .Y(n245) );
  OAI2BB2X1M U292 ( .B0(n362), .B1(n165), .A0N(\reg_file[7][4] ), .A1N(n165), 
        .Y(n246) );
  OAI2BB2X1M U293 ( .B0(n361), .B1(n165), .A0N(\reg_file[7][5] ), .A1N(n165), 
        .Y(n247) );
  OAI2BB2X1M U294 ( .B0(n360), .B1(n165), .A0N(\reg_file[7][6] ), .A1N(n165), 
        .Y(n248) );
  OAI2BB2X1M U295 ( .B0(n359), .B1(n165), .A0N(\reg_file[7][7] ), .A1N(n165), 
        .Y(n249) );
  OAI2BB2X1M U296 ( .B0(n366), .B1(n166), .A0N(\reg_file[8][0] ), .A1N(n166), 
        .Y(n250) );
  OAI2BB2X1M U297 ( .B0(n365), .B1(n166), .A0N(\reg_file[8][1] ), .A1N(n166), 
        .Y(n251) );
  OAI2BB2X1M U298 ( .B0(n364), .B1(n166), .A0N(\reg_file[8][2] ), .A1N(n166), 
        .Y(n252) );
  OAI2BB2X1M U299 ( .B0(n363), .B1(n166), .A0N(\reg_file[8][3] ), .A1N(n166), 
        .Y(n253) );
  OAI2BB2X1M U300 ( .B0(n362), .B1(n166), .A0N(\reg_file[8][4] ), .A1N(n166), 
        .Y(n254) );
  OAI2BB2X1M U301 ( .B0(n361), .B1(n166), .A0N(\reg_file[8][5] ), .A1N(n166), 
        .Y(n255) );
  OAI2BB2X1M U302 ( .B0(n360), .B1(n166), .A0N(\reg_file[8][6] ), .A1N(n166), 
        .Y(n256) );
  OAI2BB2X1M U303 ( .B0(n359), .B1(n166), .A0N(\reg_file[8][7] ), .A1N(n166), 
        .Y(n257) );
  OAI2BB2X1M U304 ( .B0(n366), .B1(n168), .A0N(\reg_file[9][0] ), .A1N(n168), 
        .Y(n258) );
  OAI2BB2X1M U305 ( .B0(n365), .B1(n168), .A0N(\reg_file[9][1] ), .A1N(n168), 
        .Y(n259) );
  OAI2BB2X1M U306 ( .B0(n364), .B1(n168), .A0N(\reg_file[9][2] ), .A1N(n168), 
        .Y(n260) );
  OAI2BB2X1M U307 ( .B0(n363), .B1(n168), .A0N(\reg_file[9][3] ), .A1N(n168), 
        .Y(n261) );
  OAI2BB2X1M U308 ( .B0(n362), .B1(n168), .A0N(\reg_file[9][4] ), .A1N(n168), 
        .Y(n262) );
  OAI2BB2X1M U309 ( .B0(n361), .B1(n168), .A0N(\reg_file[9][5] ), .A1N(n168), 
        .Y(n263) );
  OAI2BB2X1M U310 ( .B0(n360), .B1(n168), .A0N(\reg_file[9][6] ), .A1N(n168), 
        .Y(n264) );
  OAI2BB2X1M U311 ( .B0(n359), .B1(n168), .A0N(\reg_file[9][7] ), .A1N(n168), 
        .Y(n265) );
  OAI2BB2X1M U312 ( .B0(n366), .B1(n170), .A0N(\reg_file[10][0] ), .A1N(n170), 
        .Y(n266) );
  OAI2BB2X1M U313 ( .B0(n365), .B1(n170), .A0N(\reg_file[10][1] ), .A1N(n170), 
        .Y(n267) );
  OAI2BB2X1M U314 ( .B0(n364), .B1(n170), .A0N(\reg_file[10][2] ), .A1N(n170), 
        .Y(n268) );
  OAI2BB2X1M U315 ( .B0(n363), .B1(n170), .A0N(\reg_file[10][3] ), .A1N(n170), 
        .Y(n269) );
  OAI2BB2X1M U316 ( .B0(n362), .B1(n170), .A0N(\reg_file[10][4] ), .A1N(n170), 
        .Y(n270) );
  OAI2BB2X1M U317 ( .B0(n361), .B1(n170), .A0N(\reg_file[10][5] ), .A1N(n170), 
        .Y(n271) );
  OAI2BB2X1M U318 ( .B0(n360), .B1(n170), .A0N(\reg_file[10][6] ), .A1N(n170), 
        .Y(n272) );
  OAI2BB2X1M U319 ( .B0(n359), .B1(n170), .A0N(\reg_file[10][7] ), .A1N(n170), 
        .Y(n273) );
  OAI2BB2X1M U320 ( .B0(n366), .B1(n171), .A0N(\reg_file[11][0] ), .A1N(n171), 
        .Y(n274) );
  OAI2BB2X1M U321 ( .B0(n365), .B1(n171), .A0N(\reg_file[11][1] ), .A1N(n171), 
        .Y(n275) );
  OAI2BB2X1M U322 ( .B0(n364), .B1(n171), .A0N(\reg_file[11][2] ), .A1N(n171), 
        .Y(n276) );
  OAI2BB2X1M U323 ( .B0(n363), .B1(n171), .A0N(\reg_file[11][3] ), .A1N(n171), 
        .Y(n277) );
  OAI2BB2X1M U324 ( .B0(n362), .B1(n171), .A0N(\reg_file[11][4] ), .A1N(n171), 
        .Y(n278) );
  OAI2BB2X1M U325 ( .B0(n361), .B1(n171), .A0N(\reg_file[11][5] ), .A1N(n171), 
        .Y(n279) );
  OAI2BB2X1M U326 ( .B0(n360), .B1(n171), .A0N(\reg_file[11][6] ), .A1N(n171), 
        .Y(n280) );
  OAI2BB2X1M U327 ( .B0(n359), .B1(n171), .A0N(\reg_file[11][7] ), .A1N(n171), 
        .Y(n281) );
  OAI2BB2X1M U328 ( .B0(n366), .B1(n172), .A0N(\reg_file[12][0] ), .A1N(n172), 
        .Y(n282) );
  OAI2BB2X1M U329 ( .B0(n365), .B1(n172), .A0N(\reg_file[12][1] ), .A1N(n172), 
        .Y(n283) );
  OAI2BB2X1M U330 ( .B0(n364), .B1(n172), .A0N(\reg_file[12][2] ), .A1N(n172), 
        .Y(n284) );
  OAI2BB2X1M U331 ( .B0(n363), .B1(n172), .A0N(\reg_file[12][3] ), .A1N(n172), 
        .Y(n285) );
  OAI2BB2X1M U332 ( .B0(n362), .B1(n172), .A0N(\reg_file[12][4] ), .A1N(n172), 
        .Y(n286) );
  OAI2BB2X1M U333 ( .B0(n361), .B1(n172), .A0N(\reg_file[12][5] ), .A1N(n172), 
        .Y(n287) );
  OAI2BB2X1M U334 ( .B0(n360), .B1(n172), .A0N(\reg_file[12][6] ), .A1N(n172), 
        .Y(n288) );
  OAI2BB2X1M U335 ( .B0(n359), .B1(n172), .A0N(\reg_file[12][7] ), .A1N(n172), 
        .Y(n289) );
  OAI2BB2X1M U336 ( .B0(n366), .B1(n173), .A0N(\reg_file[13][0] ), .A1N(n173), 
        .Y(n290) );
  OAI2BB2X1M U337 ( .B0(n365), .B1(n173), .A0N(\reg_file[13][1] ), .A1N(n173), 
        .Y(n291) );
  OAI2BB2X1M U338 ( .B0(n364), .B1(n173), .A0N(\reg_file[13][2] ), .A1N(n173), 
        .Y(n292) );
  OAI2BB2X1M U339 ( .B0(n363), .B1(n173), .A0N(\reg_file[13][3] ), .A1N(n173), 
        .Y(n293) );
  OAI2BB2X1M U340 ( .B0(n362), .B1(n173), .A0N(\reg_file[13][4] ), .A1N(n173), 
        .Y(n294) );
  OAI2BB2X1M U341 ( .B0(n361), .B1(n173), .A0N(\reg_file[13][5] ), .A1N(n173), 
        .Y(n295) );
  OAI2BB2X1M U342 ( .B0(n360), .B1(n173), .A0N(\reg_file[13][6] ), .A1N(n173), 
        .Y(n296) );
  OAI2BB2X1M U343 ( .B0(n359), .B1(n173), .A0N(\reg_file[13][7] ), .A1N(n173), 
        .Y(n297) );
  OAI2BB2X1M U344 ( .B0(n366), .B1(n174), .A0N(\reg_file[14][0] ), .A1N(n174), 
        .Y(n298) );
  OAI2BB2X1M U345 ( .B0(n365), .B1(n174), .A0N(\reg_file[14][1] ), .A1N(n174), 
        .Y(n299) );
  OAI2BB2X1M U346 ( .B0(n364), .B1(n174), .A0N(\reg_file[14][2] ), .A1N(n174), 
        .Y(n300) );
  OAI2BB2X1M U347 ( .B0(n363), .B1(n174), .A0N(\reg_file[14][3] ), .A1N(n174), 
        .Y(n301) );
  OAI2BB2X1M U348 ( .B0(n362), .B1(n174), .A0N(\reg_file[14][4] ), .A1N(n174), 
        .Y(n302) );
  OAI2BB2X1M U349 ( .B0(n361), .B1(n174), .A0N(\reg_file[14][5] ), .A1N(n174), 
        .Y(n303) );
  OAI2BB2X1M U350 ( .B0(n360), .B1(n174), .A0N(\reg_file[14][6] ), .A1N(n174), 
        .Y(n304) );
  OAI2BB2X1M U351 ( .B0(n359), .B1(n174), .A0N(\reg_file[14][7] ), .A1N(n174), 
        .Y(n305) );
  OAI2BB2X1M U352 ( .B0(n366), .B1(n176), .A0N(\reg_file[15][0] ), .A1N(n176), 
        .Y(n306) );
  OAI2BB2X1M U353 ( .B0(n365), .B1(n176), .A0N(\reg_file[15][1] ), .A1N(n176), 
        .Y(n307) );
  OAI2BB2X1M U354 ( .B0(n364), .B1(n176), .A0N(\reg_file[15][2] ), .A1N(n176), 
        .Y(n308) );
  OAI2BB2X1M U355 ( .B0(n363), .B1(n176), .A0N(\reg_file[15][3] ), .A1N(n176), 
        .Y(n309) );
  OAI2BB2X1M U356 ( .B0(n362), .B1(n176), .A0N(\reg_file[15][4] ), .A1N(n176), 
        .Y(n310) );
  OAI2BB2X1M U357 ( .B0(n361), .B1(n176), .A0N(\reg_file[15][5] ), .A1N(n176), 
        .Y(n311) );
  OAI2BB2X1M U358 ( .B0(n360), .B1(n176), .A0N(\reg_file[15][6] ), .A1N(n176), 
        .Y(n312) );
  OAI2BB2X1M U359 ( .B0(n359), .B1(n176), .A0N(\reg_file[15][7] ), .A1N(n176), 
        .Y(n313) );
  OAI2BB2X1M U360 ( .B0(n365), .B1(n156), .A0N(REG2[1]), .A1N(n156), .Y(n203)
         );
  OAI2BB2X1M U361 ( .B0(n364), .B1(n156), .A0N(REG2[2]), .A1N(n156), .Y(n204)
         );
  OAI2BB2X1M U362 ( .B0(n363), .B1(n156), .A0N(REG2[3]), .A1N(n156), .Y(n205)
         );
  OAI2BB2X1M U363 ( .B0(n362), .B1(n156), .A0N(REG2[4]), .A1N(n156), .Y(n206)
         );
  OAI2BB2X1M U364 ( .B0(n361), .B1(n156), .A0N(REG2[5]), .A1N(n156), .Y(n207)
         );
  OAI2BB2X1M U365 ( .B0(n360), .B1(n156), .A0N(REG2[6]), .A1N(n156), .Y(n208)
         );
  OAI2BB2X1M U366 ( .B0(n366), .B1(n158), .A0N(REG3[0]), .A1N(n158), .Y(n210)
         );
  OAI2BB2X1M U367 ( .B0(n365), .B1(n158), .A0N(REG3[1]), .A1N(n158), .Y(n211)
         );
  OAI2BB2X1M U368 ( .B0(n364), .B1(n158), .A0N(REG3[2]), .A1N(n158), .Y(n212)
         );
  OAI2BB2X1M U369 ( .B0(n363), .B1(n158), .A0N(REG3[3]), .A1N(n158), .Y(n213)
         );
  OAI2BB2X1M U370 ( .B0(n362), .B1(n158), .A0N(REG3[4]), .A1N(n158), .Y(n214)
         );
  OAI2BB2X1M U371 ( .B0(n360), .B1(n158), .A0N(REG3[6]), .A1N(n158), .Y(n216)
         );
  OAI2BB2X1M U372 ( .B0(n359), .B1(n158), .A0N(REG3[7]), .A1N(n158), .Y(n217)
         );
  OAI2BB2X1M U373 ( .B0(n366), .B1(n156), .A0N(REG2[0]), .A1N(n156), .Y(n202)
         );
  OAI2BB2X1M U374 ( .B0(n359), .B1(n156), .A0N(REG2[7]), .A1N(n156), .Y(n209)
         );
  OAI2BB2X1M U375 ( .B0(n361), .B1(n158), .A0N(REG3[5]), .A1N(n158), .Y(n215)
         );
  OAI2BB1X2M U376 ( .A0N(RdData_Valid), .A1N(n150), .B0(n149), .Y(n185) );
  DLY1X1M U377 ( .A(test_se), .Y(n370) );
  DLY1X1M U378 ( .A(test_se), .Y(n371) );
  DLY1X1M U379 ( .A(test_se), .Y(n372) );
  DLY1X1M U380 ( .A(test_se), .Y(n373) );
  INVXLM U381 ( .A(\reg_file[6][1] ), .Y(n374) );
  INVXLM U382 ( .A(n374), .Y(n375) );
  SDFFRHQX8M \reg_file_reg[6][1]  ( .D(n235), .SI(\reg_file[6][0] ), .SE(n370), 
        .CK(CLK), .RN(n347), .Q(\reg_file[6][1] ) );
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
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n16), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n15), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n14), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n15), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n18), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n17), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n16), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n14), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
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
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n13), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
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
  NAND2X2M U10 ( .A(n10), .B(n11), .Y(\u_div/CryTmp[0][1] ) );
  NAND2X2M U11 ( .A(n2), .B(n3), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U12 ( .A(a[5]), .Y(n3) );
  INVX2M U13 ( .A(n19), .Y(n2) );
  NAND2X2M U14 ( .A(n4), .B(n5), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U15 ( .A(a[4]), .Y(n5) );
  INVX2M U16 ( .A(n19), .Y(n4) );
  NAND2X2M U17 ( .A(n6), .B(n7), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U18 ( .A(a[3]), .Y(n7) );
  INVX2M U19 ( .A(n19), .Y(n6) );
  NAND2X2M U20 ( .A(n6), .B(n8), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U21 ( .A(a[2]), .Y(n8) );
  NAND2X2M U22 ( .A(n4), .B(n9), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U23 ( .A(a[1]), .Y(n9) );
  INVX2M U24 ( .A(n19), .Y(n10) );
  NAND2X2M U25 ( .A(n2), .B(n1), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U26 ( .A(a[6]), .Y(n1) );
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
  XNOR2X2M U1 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U2 ( .A(B[6]), .Y(n3) );
  INVX2M U3 ( .A(B[0]), .Y(n9) );
  INVX2M U4 ( .A(B[2]), .Y(n7) );
  INVX2M U5 ( .A(B[3]), .Y(n6) );
  INVX2M U6 ( .A(B[4]), .Y(n5) );
  INVX2M U7 ( .A(B[5]), .Y(n4) );
  NAND2X2M U8 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U9 ( .A(B[1]), .Y(n8) );
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
  XNOR2X2M U6 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U7 ( .A(B[7]), .Y(n8) );
  XNOR2X2M U8 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
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

  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n8), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n9), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n7), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n6), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n5), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n4), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n3), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  AND2X2M U2 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][6] ), .Y(n22) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U12 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  CLKXOR2X2M U13 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  CLKXOR2X2M U14 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  CLKXOR2X2M U15 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U16 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  CLKXOR2X2M U17 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U18 ( .A(\ab[0][7] ), .Y(n23) );
  INVX2M U19 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U20 ( .A(\ab[0][5] ), .Y(n21) );
  INVX2M U21 ( .A(\ab[0][3] ), .Y(n19) );
  INVX2M U22 ( .A(\ab[0][2] ), .Y(n18) );
  AND2X2M U23 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n11) );
  AND2X2M U24 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n12) );
  AND2X2M U25 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n13) );
  AND2X2M U26 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n14) );
  XNOR2X2M U27 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U28 ( .A(\SUMB[7][1] ), .Y(n17) );
  AND2X2M U29 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n15) );
  AND2X2M U30 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n16) );
  XNOR2X2M U31 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U32 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  XNOR2X2M U33 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  XNOR2X2M U34 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U35 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U36 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U37 ( .A(A[7]), .Y(n32) );
  INVX2M U38 ( .A(A[6]), .Y(n33) );
  INVX2M U39 ( .A(A[1]), .Y(n38) );
  INVX2M U40 ( .A(A[0]), .Y(n39) );
  INVX2M U41 ( .A(A[2]), .Y(n37) );
  INVX2M U42 ( .A(A[3]), .Y(n36) );
  INVX2M U43 ( .A(A[4]), .Y(n35) );
  INVX2M U44 ( .A(A[5]), .Y(n34) );
  INVX2M U45 ( .A(B[6]), .Y(n25) );
  INVX2M U46 ( .A(B[0]), .Y(n31) );
  INVX2M U47 ( .A(B[2]), .Y(n29) );
  INVX2M U48 ( .A(B[3]), .Y(n28) );
  INVX2M U49 ( .A(B[7]), .Y(n24) );
  INVX2M U50 ( .A(B[1]), .Y(n30) );
  INVX2M U51 ( .A(B[5]), .Y(n26) );
  INVX2M U52 ( .A(B[4]), .Y(n27) );
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
  ALU_OPERAND_WIDTH8_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , 
        \A1[9] , \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , 
        \A1[2] , \A1[1] , \A1[0] }), .B({n10, n14, n16, n13, n15, n12, n11, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(
        PRODUCT[15:2]) );
endmodule


module ALU_OPERAND_WIDTH8_test_1 ( CLK, RST, EN, A, B, ALU_FUN, ALU_OUT, 
        OUT_VALID, test_si, test_se );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input CLK, RST, EN, test_si, test_se;
  output OUT_VALID;
  wire   N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103, N104,
         N105, N106, N107, N108, N109, N110, N111, N112, N113, N114, N115,
         N116, N117, N118, N119, N120, N121, N122, N123, N124, N125, N126,
         N127, N128, N129, N130, N131, N132, N133, N158, N160, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n3, n5, n6, n7, n8, n9, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195;

  SDFFRQX2M OUT_VALID_reg ( .D(n3), .SI(ALU_OUT[15]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(OUT_VALID) );
  SDFFRQX2M \ALU_OUT_reg[7]  ( .D(n161), .SI(ALU_OUT[6]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[7]) );
  SDFFRQX2M \ALU_OUT_reg[6]  ( .D(n160), .SI(ALU_OUT[5]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[6]) );
  SDFFRQX2M \ALU_OUT_reg[5]  ( .D(n159), .SI(ALU_OUT[4]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[5]) );
  SDFFRQX2M \ALU_OUT_reg[4]  ( .D(n158), .SI(ALU_OUT[3]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[4]) );
  SDFFRQX2M \ALU_OUT_reg[3]  ( .D(n157), .SI(ALU_OUT[2]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[3]) );
  SDFFRQX2M \ALU_OUT_reg[2]  ( .D(n156), .SI(ALU_OUT[1]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[2]) );
  SDFFRQX2M \ALU_OUT_reg[1]  ( .D(n155), .SI(ALU_OUT[0]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[1]) );
  SDFFRQX2M \ALU_OUT_reg[0]  ( .D(n154), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(ALU_OUT[0]) );
  SDFFRQX2M \ALU_OUT_reg[15]  ( .D(n171), .SI(ALU_OUT[14]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[15]) );
  SDFFRQX2M \ALU_OUT_reg[14]  ( .D(n172), .SI(ALU_OUT[13]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[14]) );
  SDFFRQX2M \ALU_OUT_reg[13]  ( .D(n173), .SI(ALU_OUT[12]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[13]) );
  SDFFRQX2M \ALU_OUT_reg[12]  ( .D(n174), .SI(ALU_OUT[11]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[12]) );
  SDFFRQX2M \ALU_OUT_reg[11]  ( .D(n175), .SI(ALU_OUT[10]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[11]) );
  SDFFRQX2M \ALU_OUT_reg[10]  ( .D(n176), .SI(ALU_OUT[9]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[10]) );
  SDFFRQX2M \ALU_OUT_reg[9]  ( .D(n177), .SI(ALU_OUT[8]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[9]) );
  SDFFRQX1M \ALU_OUT_reg[8]  ( .D(n162), .SI(ALU_OUT[7]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[8]) );
  AND2X2M U7 ( .A(EN), .B(n147), .Y(n3) );
  BUFX2M U24 ( .A(A[6]), .Y(n29) );
  NOR2X2M U25 ( .A(n31), .B(n67), .Y(n144) );
  INVX2M U26 ( .A(n131), .Y(n192) );
  INVX2M U27 ( .A(n93), .Y(n193) );
  NOR3X2M U28 ( .A(n68), .B(n76), .C(n69), .Y(n148) );
  NOR4X1M U29 ( .A(n150), .B(n65), .C(n66), .D(n72), .Y(n149) );
  NAND2X2M U30 ( .A(n131), .B(n129), .Y(n150) );
  NAND2X2M U31 ( .A(n153), .B(n73), .Y(n93) );
  AND2X2M U32 ( .A(n153), .B(n146), .Y(n67) );
  AND2X2M U33 ( .A(n73), .B(n151), .Y(n76) );
  NOR2X2M U34 ( .A(n195), .B(n194), .Y(n153) );
  NAND2X2M U35 ( .A(n152), .B(n132), .Y(n131) );
  AND2X2M U36 ( .A(n132), .B(n151), .Y(n65) );
  AND2X2M U37 ( .A(n146), .B(n151), .Y(n66) );
  NAND2X2M U38 ( .A(n152), .B(n146), .Y(n129) );
  NAND2X2M U39 ( .A(n129), .B(n130), .Y(n77) );
  AND2X2M U40 ( .A(n72), .B(n146), .Y(n63) );
  AND2X2M U41 ( .A(n72), .B(n132), .Y(n64) );
  AND2X2M U42 ( .A(n73), .B(n152), .Y(n69) );
  BUFX2M U43 ( .A(n75), .Y(n31) );
  OAI2BB1X2M U44 ( .A0N(n132), .A1N(n153), .B0(n130), .Y(n75) );
  NOR2X2M U45 ( .A(n194), .B(ALU_FUN[2]), .Y(n72) );
  NOR2X2M U46 ( .A(n195), .B(ALU_FUN[1]), .Y(n152) );
  AND3X2M U47 ( .A(n152), .B(ALU_FUN[0]), .C(ALU_FUN[3]), .Y(n68) );
  NOR2X2M U48 ( .A(ALU_FUN[3]), .B(ALU_FUN[0]), .Y(n146) );
  NOR2BX2M U49 ( .AN(ALU_FUN[3]), .B(ALU_FUN[0]), .Y(n73) );
  NOR2X2M U50 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n151) );
  NOR2BX2M U51 ( .AN(ALU_FUN[0]), .B(ALU_FUN[3]), .Y(n132) );
  NAND3X2M U52 ( .A(ALU_FUN[0]), .B(n151), .C(ALU_FUN[3]), .Y(n130) );
  NAND4BX1M U53 ( .AN(n163), .B(n72), .C(ALU_FUN[3]), .D(ALU_FUN[0]), .Y(n85)
         );
  INVX2M U54 ( .A(ALU_FUN[2]), .Y(n195) );
  INVX2M U55 ( .A(ALU_FUN[1]), .Y(n194) );
  INVX2M U56 ( .A(n3), .Y(n32) );
  INVX2M U57 ( .A(n163), .Y(n170) );
  AND2X2M U58 ( .A(n63), .B(n3), .Y(n137) );
  INVX2M U59 ( .A(n5), .Y(n169) );
  AOI222X1M U60 ( .A0(N112), .A1(n63), .B0(n8), .B1(n192), .C0(N128), .C1(n64), 
        .Y(n88) );
  AOI222X1M U61 ( .A0(N113), .A1(n63), .B0(n9), .B1(n192), .C0(N129), .C1(n64), 
        .Y(n96) );
  AOI222X1M U62 ( .A0(N114), .A1(n63), .B0(n27), .B1(n192), .C0(N130), .C1(n64), .Y(n103) );
  AOI222X1M U63 ( .A0(N115), .A1(n63), .B0(n28), .B1(n192), .C0(N131), .C1(n64), .Y(n110) );
  AOI222X1M U64 ( .A0(N116), .A1(n63), .B0(n29), .B1(n192), .C0(N132), .C1(n64), .Y(n117) );
  AOI222X1M U65 ( .A0(N160), .A1(n69), .B0(n193), .B1(n6), .C0(n8), .C1(n68), 
        .Y(n80) );
  AOI222X1M U66 ( .A0(n67), .A1(n191), .B0(n7), .B1(n68), .C0(N160), .C1(n69), 
        .Y(n60) );
  AOI222X1M U67 ( .A0(N127), .A1(n64), .B0(n67), .B1(n189), .C0(n192), .C1(n7), 
        .Y(n82) );
  AOI222X1M U68 ( .A0(N110), .A1(n63), .B0(n192), .B1(n6), .C0(N126), .C1(n64), 
        .Y(n62) );
  AOI21X2M U69 ( .A0(n144), .A1(n145), .B0(n32), .Y(n135) );
  NAND2X2M U70 ( .A(N109), .B(n65), .Y(n145) );
  AOI221XLM U71 ( .A0(n76), .A1(n191), .B0(n6), .B1(n77), .C0(n192), .Y(n70)
         );
  OAI222X1M U72 ( .A0(n120), .A1(n169), .B0(n5), .B1(n121), .C0(n93), .C1(n185), .Y(n119) );
  AOI221XLM U73 ( .A0(n29), .A1(n76), .B0(n31), .B1(n184), .C0(n67), .Y(n121)
         );
  AOI221XLM U74 ( .A0(n76), .A1(n184), .B0(n29), .B1(n77), .C0(n192), .Y(n120)
         );
  AOI221XLM U75 ( .A0(n76), .A1(n189), .B0(n7), .B1(n77), .C0(n192), .Y(n84)
         );
  AOI221XLM U76 ( .A0(n76), .A1(n164), .B0(n30), .B1(n77), .C0(n192), .Y(n127)
         );
  AOI32X1M U77 ( .A0(n72), .A1(n73), .A2(N158), .B0(n190), .B1(n183), .Y(n71)
         );
  INVX2M U78 ( .A(n74), .Y(n190) );
  AOI221XLM U79 ( .A0(n191), .A1(n31), .B0(n76), .B1(n6), .C0(n67), .Y(n74) );
  AOI221XLM U80 ( .A0(n7), .A1(n76), .B0(n31), .B1(n189), .C0(n67), .Y(n83) );
  NAND4X2M U81 ( .A(n144), .B(n93), .C(n148), .D(n149), .Y(n147) );
  INVX2M U82 ( .A(n7), .Y(n189) );
  INVX2M U83 ( .A(n29), .Y(n184) );
  INVX2M U84 ( .A(n8), .Y(n188) );
  INVX2M U85 ( .A(n9), .Y(n187) );
  INVX2M U86 ( .A(n27), .Y(n186) );
  INVX2M U87 ( .A(n28), .Y(n185) );
  INVX2M U88 ( .A(n6), .Y(n191) );
  INVX2M U89 ( .A(n30), .Y(n164) );
  INVX2M U90 ( .A(n136), .Y(n177) );
  AOI221XLM U91 ( .A0(ALU_OUT[9]), .A1(n32), .B0(N119), .B1(n137), .C0(n135), 
        .Y(n136) );
  INVX2M U92 ( .A(n138), .Y(n176) );
  AOI221XLM U93 ( .A0(ALU_OUT[10]), .A1(n32), .B0(N120), .B1(n137), .C0(n135), 
        .Y(n138) );
  INVX2M U94 ( .A(n139), .Y(n175) );
  AOI221XLM U95 ( .A0(ALU_OUT[11]), .A1(n32), .B0(N121), .B1(n137), .C0(n135), 
        .Y(n139) );
  INVX2M U96 ( .A(n140), .Y(n174) );
  AOI221XLM U97 ( .A0(ALU_OUT[12]), .A1(n32), .B0(N122), .B1(n137), .C0(n135), 
        .Y(n140) );
  INVX2M U98 ( .A(n141), .Y(n173) );
  AOI221XLM U99 ( .A0(ALU_OUT[13]), .A1(n32), .B0(N123), .B1(n137), .C0(n135), 
        .Y(n141) );
  INVX2M U100 ( .A(n142), .Y(n172) );
  AOI221XLM U101 ( .A0(ALU_OUT[14]), .A1(n32), .B0(N124), .B1(n137), .C0(n135), 
        .Y(n142) );
  INVX2M U102 ( .A(n143), .Y(n171) );
  AOI221XLM U103 ( .A0(ALU_OUT[15]), .A1(n32), .B0(N125), .B1(n137), .C0(n135), 
        .Y(n143) );
  OAI211X2M U104 ( .A0(n133), .A1(n32), .B0(n178), .C0(n134), .Y(n162) );
  INVX2M U105 ( .A(n135), .Y(n178) );
  AOI222X1M U106 ( .A0(N100), .A1(n66), .B0(n30), .B1(n193), .C0(N118), .C1(
        n63), .Y(n133) );
  NAND2X2M U107 ( .A(ALU_OUT[8]), .B(n32), .Y(n134) );
  AO22X1M U108 ( .A0(ALU_OUT[0]), .A1(n32), .B0(n3), .B1(n58), .Y(n154) );
  NAND4BX1M U109 ( .AN(n59), .B(n60), .C(n61), .D(n62), .Y(n58) );
  OAI21X2M U110 ( .A0(n70), .A1(n183), .B0(n71), .Y(n59) );
  AOI22X1M U111 ( .A0(N101), .A1(n65), .B0(N92), .B1(n66), .Y(n61) );
  AO22X1M U112 ( .A0(ALU_OUT[1]), .A1(n32), .B0(n3), .B1(n78), .Y(n155) );
  NAND4BX1M U113 ( .AN(n79), .B(n80), .C(n81), .D(n82), .Y(n78) );
  OAI221X1M U114 ( .A0(B[1]), .A1(n83), .B0(n84), .B1(n182), .C0(n85), .Y(n79)
         );
  AOI222X1M U115 ( .A0(N93), .A1(n66), .B0(N111), .B1(n63), .C0(N102), .C1(n65), .Y(n81) );
  AO21XLM U116 ( .A0(ALU_OUT[2]), .A1(n32), .B0(n86), .Y(n156) );
  AOI31X2M U117 ( .A0(n87), .A1(n88), .A2(n89), .B0(n32), .Y(n86) );
  AOI22X1M U118 ( .A0(N103), .A1(n65), .B0(N94), .B1(n66), .Y(n87) );
  AOI221XLM U119 ( .A0(n9), .A1(n68), .B0(n67), .B1(n188), .C0(n90), .Y(n89)
         );
  AO21XLM U120 ( .A0(ALU_OUT[3]), .A1(n32), .B0(n94), .Y(n157) );
  AOI31X2M U121 ( .A0(n95), .A1(n96), .A2(n97), .B0(n32), .Y(n94) );
  AOI22X1M U122 ( .A0(N104), .A1(n65), .B0(N95), .B1(n66), .Y(n95) );
  AOI221XLM U123 ( .A0(n27), .A1(n68), .B0(n67), .B1(n187), .C0(n98), .Y(n97)
         );
  AO21XLM U124 ( .A0(ALU_OUT[4]), .A1(n32), .B0(n101), .Y(n158) );
  AOI31X2M U125 ( .A0(n102), .A1(n103), .A2(n104), .B0(n32), .Y(n101) );
  AOI22X1M U126 ( .A0(N105), .A1(n65), .B0(N96), .B1(n66), .Y(n102) );
  AOI221XLM U127 ( .A0(n28), .A1(n68), .B0(n67), .B1(n186), .C0(n105), .Y(n104) );
  AO21XLM U128 ( .A0(ALU_OUT[5]), .A1(n32), .B0(n108), .Y(n159) );
  AOI31X2M U129 ( .A0(n109), .A1(n110), .A2(n111), .B0(n32), .Y(n108) );
  AOI22X1M U130 ( .A0(N106), .A1(n65), .B0(N97), .B1(n66), .Y(n109) );
  AOI221XLM U131 ( .A0(n29), .A1(n68), .B0(n67), .B1(n185), .C0(n112), .Y(n111) );
  AO21XLM U132 ( .A0(ALU_OUT[6]), .A1(n32), .B0(n115), .Y(n160) );
  AOI31X2M U133 ( .A0(n116), .A1(n117), .A2(n118), .B0(n32), .Y(n115) );
  AOI22X1M U134 ( .A0(N107), .A1(n65), .B0(N98), .B1(n66), .Y(n116) );
  AOI221XLM U135 ( .A0(n30), .A1(n68), .B0(n67), .B1(n184), .C0(n119), .Y(n118) );
  AO21XLM U136 ( .A0(ALU_OUT[7]), .A1(n32), .B0(n122), .Y(n161) );
  AOI31X2M U137 ( .A0(n123), .A1(n124), .A2(n125), .B0(n32), .Y(n122) );
  AOI22X1M U138 ( .A0(N133), .A1(n64), .B0(N117), .B1(n63), .Y(n124) );
  AOI22X1M U139 ( .A0(N108), .A1(n65), .B0(N99), .B1(n66), .Y(n123) );
  OAI222X1M U140 ( .A0(n91), .A1(n166), .B0(B[2]), .B1(n92), .C0(n189), .C1(
        n93), .Y(n90) );
  AOI221XLM U141 ( .A0(n8), .A1(n76), .B0(n31), .B1(n188), .C0(n67), .Y(n92)
         );
  AOI221XLM U142 ( .A0(n76), .A1(n188), .B0(n8), .B1(n77), .C0(n192), .Y(n91)
         );
  OAI222X1M U143 ( .A0(n99), .A1(n168), .B0(B[3]), .B1(n100), .C0(n93), .C1(
        n188), .Y(n98) );
  AOI221XLM U144 ( .A0(n9), .A1(n76), .B0(n31), .B1(n187), .C0(n67), .Y(n100)
         );
  AOI221XLM U145 ( .A0(n76), .A1(n187), .B0(n9), .B1(n77), .C0(n192), .Y(n99)
         );
  OAI222X1M U146 ( .A0(n106), .A1(n181), .B0(B[4]), .B1(n107), .C0(n93), .C1(
        n187), .Y(n105) );
  INVX2M U147 ( .A(B[4]), .Y(n181) );
  AOI221XLM U148 ( .A0(n27), .A1(n76), .B0(n31), .B1(n186), .C0(n67), .Y(n107)
         );
  AOI221XLM U149 ( .A0(n76), .A1(n186), .B0(n27), .B1(n77), .C0(n192), .Y(n106) );
  OAI222X1M U150 ( .A0(n113), .A1(n180), .B0(B[5]), .B1(n114), .C0(n93), .C1(
        n186), .Y(n112) );
  INVX2M U151 ( .A(B[5]), .Y(n180) );
  AOI221XLM U152 ( .A0(n28), .A1(n76), .B0(n31), .B1(n185), .C0(n67), .Y(n114)
         );
  AOI221XLM U153 ( .A0(n76), .A1(n185), .B0(n28), .B1(n77), .C0(n192), .Y(n113) );
  AOI221XLM U154 ( .A0(n67), .A1(n164), .B0(n30), .B1(n192), .C0(n126), .Y(
        n125) );
  OAI222X1M U155 ( .A0(n127), .A1(n179), .B0(B[7]), .B1(n128), .C0(n93), .C1(
        n184), .Y(n126) );
  INVX2M U156 ( .A(B[7]), .Y(n179) );
  AOI221XLM U157 ( .A0(n30), .A1(n76), .B0(n31), .B1(n164), .C0(n67), .Y(n128)
         );
  INVX2M U158 ( .A(n33), .Y(n165) );
  INVX2M U159 ( .A(n44), .Y(n167) );
  BUFX2M U160 ( .A(A[7]), .Y(n30) );
  BUFX2M U161 ( .A(A[1]), .Y(n7) );
  BUFX2M U162 ( .A(A[0]), .Y(n6) );
  BUFX2M U163 ( .A(A[2]), .Y(n8) );
  BUFX2M U164 ( .A(A[3]), .Y(n9) );
  BUFX2M U165 ( .A(A[4]), .Y(n27) );
  BUFX2M U166 ( .A(A[5]), .Y(n28) );
  BUFX2M U167 ( .A(B[6]), .Y(n5) );
  INVX2M U168 ( .A(B[0]), .Y(n183) );
  INVX2M U169 ( .A(B[2]), .Y(n166) );
  INVX2M U170 ( .A(B[3]), .Y(n168) );
  INVX2M U171 ( .A(B[1]), .Y(n182) );
  NOR2X1M U172 ( .A(n164), .B(B[7]), .Y(n55) );
  NAND2BX1M U173 ( .AN(B[4]), .B(n27), .Y(n48) );
  NAND2BX1M U174 ( .AN(n27), .B(B[4]), .Y(n37) );
  CLKNAND2X2M U175 ( .A(n48), .B(n37), .Y(n50) );
  NOR2X1M U176 ( .A(n168), .B(n9), .Y(n45) );
  NOR2X1M U177 ( .A(n166), .B(n8), .Y(n36) );
  NOR2X1M U178 ( .A(n183), .B(n6), .Y(n33) );
  CLKNAND2X2M U179 ( .A(n8), .B(n166), .Y(n47) );
  NAND2BX1M U180 ( .AN(n36), .B(n47), .Y(n42) );
  AOI21X1M U181 ( .A0(n33), .A1(n189), .B0(B[1]), .Y(n34) );
  AOI211X1M U182 ( .A0(n7), .A1(n165), .B0(n42), .C0(n34), .Y(n35) );
  CLKNAND2X2M U183 ( .A(n9), .B(n168), .Y(n46) );
  OAI31X1M U184 ( .A0(n45), .A1(n36), .A2(n35), .B0(n46), .Y(n38) );
  NAND2BX1M U185 ( .AN(n28), .B(B[5]), .Y(n53) );
  OAI211X1M U186 ( .A0(n50), .A1(n38), .B0(n37), .C0(n53), .Y(n39) );
  NAND2BX1M U187 ( .AN(B[5]), .B(n28), .Y(n49) );
  XNOR2X1M U188 ( .A(n29), .B(n5), .Y(n52) );
  AOI32X1M U189 ( .A0(n39), .A1(n49), .A2(n52), .B0(n5), .B1(n184), .Y(n40) );
  CLKNAND2X2M U190 ( .A(B[7]), .B(n164), .Y(n56) );
  OAI21X1M U191 ( .A0(n55), .A1(n40), .B0(n56), .Y(N160) );
  CLKNAND2X2M U192 ( .A(n6), .B(n183), .Y(n43) );
  OA21X1M U193 ( .A0(n43), .A1(n189), .B0(B[1]), .Y(n41) );
  AOI211X1M U194 ( .A0(n43), .A1(n189), .B0(n42), .C0(n41), .Y(n44) );
  AOI31X1M U195 ( .A0(n167), .A1(n47), .A2(n46), .B0(n45), .Y(n51) );
  OAI2B11X1M U196 ( .A1N(n51), .A0(n50), .B0(n49), .C0(n48), .Y(n54) );
  AOI32X1M U197 ( .A0(n54), .A1(n53), .A2(n52), .B0(n29), .B1(n169), .Y(n57)
         );
  AOI2B1X1M U198 ( .A1N(n57), .A0(n56), .B0(n55), .Y(n163) );
  NOR2X1M U199 ( .A(N160), .B(n170), .Y(N158) );
  ALU_OPERAND_WIDTH8_DW_div_uns_0 div_33 ( .a({n30, n29, n28, n27, n9, n8, n7, 
        n6}), .b({B[7], n5, B[5:0]}), .quotient({N133, N132, N131, N130, N129, 
        N128, N127, N126}) );
  ALU_OPERAND_WIDTH8_DW01_sub_0 sub_31 ( .A({1'b0, n30, n29, n28, n27, n9, n8, 
        n7, n6}), .B({1'b0, B[7], n5, B[5:0]}), .CI(1'b0), .DIFF({N109, N108, 
        N107, N106, N105, N104, N103, N102, N101}) );
  ALU_OPERAND_WIDTH8_DW01_add_0 add_30 ( .A({1'b0, n30, n29, n28, n27, n9, n8, 
        n7, n6}), .B({1'b0, B[7], n5, B[5:0]}), .CI(1'b0), .SUM({N100, N99, 
        N98, N97, N96, N95, N94, N93, N92}) );
  ALU_OPERAND_WIDTH8_DW02_mult_0 mult_32 ( .A({n30, n29, n28, n27, n9, n8, n7, 
        n6}), .B({B[7], n5, B[5:0]}), .TC(1'b0), .PRODUCT({N125, N124, N123, 
        N122, N121, N120, N119, N118, N117, N116, N115, N114, N113, N112, N111, 
        N110}) );
endmodule


module CLK_GATE ( CLK_EN, CLK, test_en, GATED_CLK );
  input CLK_EN, CLK, test_en;
  output GATED_CLK;
  wire   _0_net_;

  TLATNCAX12M U0_TLATNCAX12M ( .E(_0_net_), .CK(CLK), .ECK(GATED_CLK) );
  OR2X2M U1 ( .A(CLK_EN), .B(test_en), .Y(_0_net_) );
endmodule


module SYS_TOP ( RST_N, UART_CLK, REF_CLK, UART_RX_IN, UART_TX_O, parity_error, 
        framing_error, SI, SE, test_mode, scan_clk, scan_rst, SO );
  input [3:0] SI;
  output [3:0] SO;
  input RST_N, UART_CLK, REF_CLK, UART_RX_IN, SE, test_mode, scan_clk,
         scan_rst;
  output UART_TX_O, parity_error, framing_error;
  wire   N8, CLK_M, CLK_M_UART, CLK_M_TX, UART_TX_CLK, CLK_M_RX, UART_RX_CLK,
         RST_M_sync, RST_M_UART_unsync, SYNC_UART_RST, RST_M_REF_unsync,
         SYNC_REF_RST, UART_RX_V_OUT, UART_RX_V_SYNC, UART_TX_VLD,
         UART_TX_Busy_PULSE, FIFO_FULL, UART_TX_V_SYNC, UART_TX_Busy,
         RF_RdData_VLD, RF_WrEn, RF_RdEn, ALU_EN, ALU_OUT_VLD, CLKG_EN,
         ALU_CLK, n1, n2, n3, n4, n5, n6, n7, n8, n10, n11, n12, n14, n15, n16,
         n19, n22, n23, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39;
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
  assign N8 = test_mode;

  BUFX2M U9 ( .A(RF_Address[0]), .Y(n3) );
  BUFX2M U10 ( .A(RF_Address[1]), .Y(n4) );
  INVX2M U11 ( .A(UART_TX_V_SYNC), .Y(n1) );
  MX2X2M U12 ( .A(UART_TX_CLK), .B(scan_clk), .S0(n2), .Y(CLK_M_TX) );
  MX2X2M U13 ( .A(UART_RX_CLK), .B(scan_clk), .S0(n2), .Y(CLK_M_RX) );
  INVX4M U14 ( .A(n6), .Y(n5) );
  INVX2M U15 ( .A(RST_M_REF_unsync), .Y(n6) );
  MX2X2M U16 ( .A(n29), .B(scan_rst), .S0(n2), .Y(RST_M_REF_unsync) );
  MX2X2M U17 ( .A(RST_N), .B(scan_rst), .S0(n2), .Y(RST_M_sync) );
  INVX4M U18 ( .A(n8), .Y(n7) );
  INVX2M U19 ( .A(RST_M_UART_unsync), .Y(n8) );
  MX2X2M U20 ( .A(SYNC_UART_RST), .B(scan_rst), .S0(n2), .Y(RST_M_UART_unsync)
         );
  BUFX2M U21 ( .A(N8), .Y(n2) );
  MX2X6M U22 ( .A(REF_CLK), .B(scan_clk), .S0(n2), .Y(CLK_M) );
  MX2X2M U23 ( .A(UART_CLK), .B(scan_clk), .S0(n2), .Y(CLK_M_UART) );
  DLY1X1M U32 ( .A(SYNC_REF_RST), .Y(n27) );
  INVXLM U33 ( .A(n27), .Y(n28) );
  INVXLM U34 ( .A(n28), .Y(n29) );
  INVXLM U35 ( .A(n36), .Y(n30) );
  DLY1X1M U36 ( .A(n33), .Y(n31) );
  INVXLM U37 ( .A(n37), .Y(n32) );
  INVXLM U38 ( .A(n32), .Y(n33) );
  INVXLM U39 ( .A(n32), .Y(n34) );
  INVXLM U40 ( .A(n32), .Y(n35) );
  INVXLM U41 ( .A(SE), .Y(n36) );
  INVXLM U42 ( .A(n36), .Y(n37) );
  INVXLM U43 ( .A(n36), .Y(n38) );
  INVXLM U44 ( .A(n36), .Y(n39) );
  RST_SYNC_NUM_STAGES2_test_0 U0_RST_SYNC ( .CLK(CLK_M_UART), .RST(RST_M_sync), 
        .SYNC_RST(SYNC_UART_RST), .test_si(n22), .test_se(n35) );
  RST_SYNC_NUM_STAGES2_test_1 U1_RST_SYNC ( .CLK(CLK_M), .RST(RST_M_sync), 
        .SYNC_RST(SYNC_REF_RST), .test_si(n10), .test_se(n34) );
  DATA_SYNC_BUS_WIDTH8_NUM_STAGES2_test_1 U0_ref_sync ( .CLK(CLK_M), .RST(n5), 
        .Bus_Enable(UART_RX_V_OUT), .Unsync_Bus(UART_RX_OUT), .Sync_Bus(
        UART_RX_SYNC), .Enable_Pulse(UART_RX_V_SYNC), .test_si(n12), .test_so(
        n11), .test_se(n38) );
  ASYNC_FIFO_DATA_WIDTH8_ADDRESS_WIDTH3_MEMORY_DEPTH8_BUS_WIDTH4_test_1 U0_UART_FIFO ( 
        .W_CLK(CLK_M), .W_RST(n5), .W_INC(UART_TX_VLD), .R_CLK(CLK_M_TX), 
        .R_RST(n7), .R_INC(UART_TX_Busy_PULSE), .WR_DATA(UART_TX_IN), 
        .RD_DATA(UART_TX_SYNC), .FULL(FIFO_FULL), .EMPTY(UART_TX_V_SYNC), 
        .test_si2(SI[0]), .test_si1(n15), .test_so2(n12), .test_so1(n14), 
        .test_se(SE) );
  PULSE_GEN_test_1 U0_PULSE_GEN ( .clk(CLK_M_TX), .rst_n(n7), .level_in(
        UART_TX_Busy), .pulse_out(UART_TX_Busy_PULSE), .test_si(n23), 
        .test_so(n22), .test_se(n35) );
  CLK_DIV_test_0 U0_ClkDiv ( .i_ref_clk(CLK_M_UART), .i_rst_n(n7), .i_clk_en(
        1'b1), .i_div_ratio(DIV_RATIO), .o_div_clk(UART_TX_CLK), .test_si(
        ALU_OUT_VLD), .test_so(n23), .test_se(n35) );
  CLK_DIV_RX_MUX U0_CLKDIV_MUX ( .PreScale(UART_Config[7:2]), .Div_Ratio({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, DIV_RATIO_RX[2:0]}) );
  CLK_DIV_test_1 U1_ClkDiv ( .i_ref_clk(CLK_M_UART), .i_rst_n(n7), .i_clk_en(
        1'b1), .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, DIV_RATIO_RX[2:0]}), 
        .o_div_clk(UART_RX_CLK), .test_si(n11), .test_so(n10), .test_se(n34)
         );
  UART_TOP_test_1 U0_UART ( .RST(n7), .TX_CLK(CLK_M_TX), .RX_CLK(CLK_M_RX), 
        .RX_IN_S(UART_RX_IN), .RX_OUT_P(UART_RX_OUT), .RX_OUT_V(UART_RX_V_OUT), 
        .TX_IN_P(UART_TX_SYNC), .TX_IN_V(n1), .TX_OUT_S(UART_TX_O), .TX_OUT_V(
        UART_TX_Busy), .Prescale(UART_Config[7:2]), .parity_enable(
        UART_Config[0]), .parity_type(UART_Config[1]), .parity_error(
        parity_error), .framing_error(framing_error), .test_si2(n14), 
        .test_si1(n16), .test_so1(n15), .test_se(n31) );
  SYS_CTRL_test_1 U0_SYS_CTRL ( .CLK(CLK_M), .RST(n5), .FIFO_FULL(FIFO_FULL), 
        .ALU_OUT(ALU_OUT), .ALU_OUT_Valid(ALU_OUT_VLD), .ALU_FUN(ALU_FUN), 
        .ALU_EN(ALU_EN), .CLK_Gate_EN(CLKG_EN), .Address(RF_Address), .WrEn(
        RF_WrEn), .RdEn(RF_RdEn), .WrData(RF_WrData), .RdData(RF_RdData), 
        .RdData_Valid(RF_RdData_VLD), .RX_P_DATA(UART_RX_SYNC), .RX_D_VLD(
        UART_RX_V_SYNC), .TX_P_DATA(UART_TX_IN), .TX_D_VLD(UART_TX_VLD), 
        .test_si2(SI[1]), .test_si1(n19), .test_so2(n16), .test_so1(SO[2]), 
        .test_se(n39) );
  REG_FILE_test_1 U0_RegFile ( .CLK(CLK_M), .RST(n5), .WrData(RF_WrData), 
        .Address({RF_Address[3:2], n4, n3}), .WrEn(RF_WrEn), .RdEn(RF_RdEn), 
        .RdData_Valid(RF_RdData_VLD), .RdData(RF_RdData), .REG0(Operand_A), 
        .REG1(Operand_B), .REG2(UART_Config), .REG3(DIV_RATIO), .test_si2(
        SI[2]), .test_si1(SYNC_UART_RST), .test_so2(n19), .test_so1(SO[3]), 
        .test_se(SE) );
  ALU_OPERAND_WIDTH8_test_1 U0_ALU ( .CLK(ALU_CLK), .RST(n5), .EN(ALU_EN), .A(
        Operand_A), .B(Operand_B), .ALU_FUN(ALU_FUN), .ALU_OUT(ALU_OUT), 
        .OUT_VALID(ALU_OUT_VLD), .test_si(SI[3]), .test_se(n30) );
  CLK_GATE U0_CLK_GATE ( .CLK_EN(CLKG_EN), .CLK(CLK_M), .test_en(n2), 
        .GATED_CLK(ALU_CLK) );
  CLKBUFX8M U30 ( .A(SYNC_REF_RST), .Y(SO[0]) );
  CLKBUFX8M U31 ( .A(framing_error), .Y(SO[1]) );
endmodule

