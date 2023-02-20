/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : N-2017.09-SP2
// Date      : Mon Feb 20 09:58:19 2023
/////////////////////////////////////////////////////////////


module ALU_FSM ( clka, clkb, reset_in, n_dec_in, z_dec_in, p_dec_in, n_alu_in, 
        z_alu_in, p_alu_in, we_reg_in, br_in, pc_ctl_0_out, state_out, Port14
 );
  output [2:0] state_out;
  input clka, clkb, reset_in, n_dec_in, z_dec_in, p_dec_in, n_alu_in, z_alu_in,
         p_alu_in, we_reg_in, br_in, Port14;
  output pc_ctl_0_out;
  wire   we_latch, reset_latch, br_latch, N20, N21, N22, N31, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29;
  wire   [2:0] dec_in_latch;
  wire   [2:0] next_state;

  DFFNEGX1 \next_state_reg[2]  ( .D(N22), .CLK(clka), .Q(next_state[2]) );
  DFFNEGX1 \next_state_reg[1]  ( .D(N21), .CLK(clka), .Q(next_state[1]) );
  DFFNEGX1 \next_state_reg[0]  ( .D(N20), .CLK(clka), .Q(next_state[0]) );
  DFFNEGX1 we_latch_reg ( .D(we_reg_in), .CLK(clka), .Q(we_latch) );
  DFFNEGX1 reset_latch_reg ( .D(reset_in), .CLK(clka), .Q(reset_latch) );
  DFFNEGX1 br_latch_reg ( .D(br_in), .CLK(clka), .Q(br_latch) );
  DFFNEGX1 \dec_in_latch_reg[2]  ( .D(n_dec_in), .CLK(clka), .Q(
        dec_in_latch[2]) );
  DFFNEGX1 \dec_in_latch_reg[1]  ( .D(z_dec_in), .CLK(clka), .Q(
        dec_in_latch[1]) );
  DFFNEGX1 \dec_in_latch_reg[0]  ( .D(p_dec_in), .CLK(clka), .Q(
        dec_in_latch[0]) );
  DFFNEGX1 \current_state_reg[2]  ( .D(n29), .CLK(clkb), .Q(state_out[2]) );
  DFFNEGX1 \current_state_reg[1]  ( .D(n28), .CLK(clkb), .Q(state_out[1]) );
  DFFNEGX1 \current_state_reg[0]  ( .D(n27), .CLK(clkb), .Q(state_out[0]) );
  DFFNEGX1 pc_ctl_0_out_reg ( .D(N31), .CLK(clkb), .Q(pc_ctl_0_out) );
  AND2X2 U3 ( .A(br_latch), .B(n15), .Y(N31) );
  INVX2 U4 ( .A(next_state[2]), .Y(n1) );
  INVX2 U5 ( .A(next_state[1]), .Y(n2) );
  INVX2 U6 ( .A(next_state[0]), .Y(n3) );
  INVX2 U7 ( .A(reset_latch), .Y(n4) );
  INVX2 U8 ( .A(n19), .Y(n5) );
  INVX2 U9 ( .A(dec_in_latch[2]), .Y(n6) );
  INVX2 U10 ( .A(state_out[2]), .Y(n7) );
  INVX2 U11 ( .A(state_out[1]), .Y(n8) );
  INVX2 U12 ( .A(state_out[0]), .Y(n9) );
  INVX2 U13 ( .A(n_alu_in), .Y(n10) );
  INVX2 U14 ( .A(z_alu_in), .Y(n11) );
  INVX2 U15 ( .A(p_alu_in), .Y(n12) );
  OAI22X1 U16 ( .A(n13), .B(n8), .C(n14), .D(n2), .Y(n28) );
  OAI22X1 U17 ( .A(n13), .B(n7), .C(n14), .D(n1), .Y(n29) );
  OAI22X1 U18 ( .A(n13), .B(n9), .C(n14), .D(n3), .Y(n27) );
  NAND2X1 U19 ( .A(n13), .B(n4), .Y(n14) );
  OAI21X1 U20 ( .A(n5), .B(n13), .C(n16), .Y(n15) );
  NAND3X1 U21 ( .A(n17), .B(n4), .C(we_latch), .Y(n16) );
  OAI21X1 U22 ( .A(n1), .B(n6), .C(n18), .Y(n17) );
  AOI22X1 U23 ( .A(dec_in_latch[0]), .B(next_state[0]), .C(dec_in_latch[1]), 
        .D(next_state[1]), .Y(n18) );
  OR2X1 U24 ( .A(we_latch), .B(reset_latch), .Y(n13) );
  OAI21X1 U25 ( .A(n6), .B(n7), .C(n20), .Y(n19) );
  AOI22X1 U26 ( .A(state_out[1]), .B(dec_in_latch[1]), .C(state_out[0]), .D(
        dec_in_latch[0]), .Y(n20) );
  NOR2X1 U27 ( .A(n21), .B(n22), .Y(N22) );
  NAND2X1 U28 ( .A(we_reg_in), .B(n_alu_in), .Y(n22) );
  NAND2X1 U29 ( .A(n12), .B(n11), .Y(n21) );
  NOR2X1 U30 ( .A(n23), .B(n24), .Y(N21) );
  NAND2X1 U31 ( .A(z_alu_in), .B(we_reg_in), .Y(n24) );
  NAND2X1 U32 ( .A(n10), .B(n12), .Y(n23) );
  NOR2X1 U33 ( .A(n25), .B(n26), .Y(N20) );
  NAND2X1 U34 ( .A(p_alu_in), .B(we_reg_in), .Y(n26) );
  NAND2X1 U35 ( .A(n10), .B(n11), .Y(n25) );
endmodule

