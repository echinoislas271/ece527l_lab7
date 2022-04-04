/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Sun Apr  3 16:46:40 2022
/////////////////////////////////////////////////////////////
`timescale 1ns/1ps

module state_machine ( clk, rst_n, b, outp );
  input [3:1] b;
  input clk, rst_n;
  output outp;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;
  wire   [7:0] pr_state;
  wire   [7:0] nx_state;

  DFFASX1_RVT \pr_state_reg[0]  ( .D(nx_state[0]), .CLK(clk), .SETB(rst_n), 
        .Q(pr_state[0]), .QN(n15) );
  DFFARX1_RVT \pr_state_reg[2]  ( .D(n4), .CLK(clk), .RSTB(rst_n), .Q(
        pr_state[2]), .QN(n13) );
  DFFARX1_RVT \pr_state_reg[6]  ( .D(n3), .CLK(clk), .RSTB(rst_n), .Q(
        pr_state[6]), .QN(n9) );
  DFFARX1_RVT \pr_state_reg[3]  ( .D(n2), .CLK(clk), .RSTB(rst_n), .Q(
        pr_state[3]), .QN(n12) );
  DFFARX1_RVT \pr_state_reg[4]  ( .D(nx_state[4]), .CLK(clk), .RSTB(rst_n), 
        .Q(pr_state[4]), .QN(n11) );
  DFFARX1_RVT \pr_state_reg[1]  ( .D(nx_state[1]), .CLK(clk), .RSTB(rst_n), 
        .Q(pr_state[1]), .QN(n14) );
  DFFARX1_RVT \pr_state_reg[5]  ( .D(n5), .CLK(clk), .RSTB(rst_n), .Q(
        pr_state[5]), .QN(n10) );
  DFFARX1_RVT \pr_state_reg[7]  ( .D(n7), .CLK(clk), .RSTB(rst_n), .QN(n8) );
  INVX1_RVT U4 ( .A(n17), .Y(n1) );
  INVX1_RVT U5 ( .A(n23), .Y(n2) );
  INVX1_RVT U6 ( .A(n21), .Y(n3) );
  INVX1_RVT U7 ( .A(n24), .Y(n4) );
  INVX1_RVT U8 ( .A(n22), .Y(n5) );
  INVX1_RVT U9 ( .A(n25), .Y(n6) );
  INVX1_RVT U10 ( .A(n20), .Y(n7) );
  INVX1_RVT U11 ( .A(b[1]), .Y(n16) );
  NAND2X0_RVT U12 ( .A1(n17), .A2(n18), .Y(outp) );
  NAND3X0_RVT U13 ( .A1(n2), .A2(n19), .A3(b[3]), .Y(n18) );
  AND3X1_RVT U14 ( .A1(b[2]), .A2(n16), .A3(n1), .Y(nx_state[4]) );
  AND2X1_RVT U15 ( .A1(n6), .A2(n19), .Y(nx_state[1]) );
  OAI222X1_RVT U16 ( .A1(n26), .A2(n17), .A3(n27), .A4(n28), .A5(n25), .A6(n19), .Y(nx_state[0]) );
  NAND3X0_RVT U17 ( .A1(n24), .A2(n22), .A3(n25), .Y(n28) );
  NAND4X0_RVT U18 ( .A1(pr_state[0]), .A2(n29), .A3(n30), .A4(n14), .Y(n25) );
  NAND4X0_RVT U19 ( .A1(pr_state[4]), .A2(n29), .A3(n31), .A4(n10), .Y(n22) );
  NAND4X0_RVT U20 ( .A1(pr_state[1]), .A2(n29), .A3(n30), .A4(n15), .Y(n24) );
  NAND4X0_RVT U21 ( .A1(n21), .A2(n20), .A3(n17), .A4(n23), .Y(n27) );
  NAND3X0_RVT U22 ( .A1(n32), .A2(n12), .A3(pr_state[2]), .Y(n23) );
  NAND4X0_RVT U23 ( .A1(pr_state[6]), .A2(n33), .A3(n30), .A4(n31), .Y(n20) );
  NAND4X0_RVT U24 ( .A1(pr_state[5]), .A2(n29), .A3(n31), .A4(n11), .Y(n21) );
  AND2X1_RVT U25 ( .A1(n33), .A2(n9), .Y(n29) );
  AND3X1_RVT U26 ( .A1(n12), .A2(n8), .A3(n13), .Y(n33) );
  NAND3X0_RVT U27 ( .A1(n32), .A2(n13), .A3(pr_state[3]), .Y(n17) );
  AND4X1_RVT U28 ( .A1(n30), .A2(n31), .A3(n9), .A4(n8), .Y(n32) );
  AND2X1_RVT U29 ( .A1(n14), .A2(n15), .Y(n31) );
  AND2X1_RVT U30 ( .A1(n10), .A2(n11), .Y(n30) );
  AND2X1_RVT U31 ( .A1(b[2]), .A2(n16), .Y(n26) );
  XNOR2X1_RVT U32 ( .A1(n16), .A2(b[2]), .Y(n19) );
endmodule

