/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : N-2017.09-SP2
// Date      : Wed Feb 22 10:09:59 2023
/////////////////////////////////////////////////////////////


module ALU_FSM ( clka, clkb, reset_in, n_dec_in, z_dec_in, p_dec_in, n_alu_in, 
        z_alu_in, p_alu_in, we_reg_in, br_in, pc_ctl_0_out, pc_latch_clkedge, 
        state_out );
  output [3:0] state_out;
  input clka, clkb, reset_in, n_dec_in, z_dec_in, p_dec_in, n_alu_in, z_alu_in,
         p_alu_in, we_reg_in, br_in;
  output pc_ctl_0_out, pc_latch_clkedge;
  wire   we_latch, reset_latch, br_latch, N21, N22, N23, N35, n1, n2, n3, n4,
         n5, n6, n7, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35;
  wire   [2:0] dec_in_latch;
  wire   [3:0] next_state;

  DFFNEGX1 \next_state_reg[2]  ( .D(N23), .CLK(clka), .Q(next_state[2]) );
  DFFNEGX1 \next_state_reg[1]  ( .D(N22), .CLK(clka), .Q(next_state[1]) );
  DFFNEGX1 \next_state_reg[0]  ( .D(N21), .CLK(clka), .Q(next_state[0]) );
  DFFNEGX1 we_latch_reg ( .D(we_reg_in), .CLK(clka), .Q(we_latch) );
  DFFNEGX1 reset_latch_reg ( .D(reset_in), .CLK(clka), .Q(reset_latch) );
  DFFNEGX1 br_latch_reg ( .D(br_in), .CLK(clka), .Q(br_latch) );
  DFFNEGX1 \dec_in_latch_reg[2]  ( .D(n_dec_in), .CLK(clka), .Q(
        dec_in_latch[2]) );
  DFFNEGX1 \dec_in_latch_reg[1]  ( .D(z_dec_in), .CLK(clka), .Q(
        dec_in_latch[1]) );
  DFFNEGX1 \dec_in_latch_reg[0]  ( .D(p_dec_in), .CLK(clka), .Q(
        dec_in_latch[0]) );
  DFFNEGX1 \current_state_reg[3]  ( .D(N35), .CLK(clkb), .Q(state_out[3]) );
  DFFNEGX1 \current_state_reg[2]  ( .D(n35), .CLK(clkb), .Q(state_out[2]) );
  DFFNEGX1 \current_state_reg[1]  ( .D(n34), .CLK(clkb), .Q(state_out[1]) );
  DFFNEGX1 \current_state_reg[0]  ( .D(n33), .CLK(clkb), .Q(state_out[0]) );
  DFFNEGX1 pc_ctl_0_out_reg ( .D(n32), .CLK(clkb), .Q(pc_ctl_0_out) );
  INVX2 U4 ( .A(next_state[2]), .Y(n1) );
  INVX2 U5 ( .A(next_state[1]), .Y(n2) );
  INVX2 U6 ( .A(next_state[0]), .Y(n3) );
  INVX2 U7 ( .A(we_latch), .Y(n4) );
  INVX2 U8 ( .A(reset_latch), .Y(n5) );
  INVX2 U9 ( .A(dec_in_latch[2]), .Y(n6) );
  INVX2 U10 ( .A(pc_ctl_0_out), .Y(n7) );
  INVX2 U11 ( .A(state_out[3]), .Y(pc_latch_clkedge) );
  INVX2 U12 ( .A(state_out[2]), .Y(n9) );
  INVX2 U13 ( .A(state_out[1]), .Y(n10) );
  INVX2 U14 ( .A(state_out[0]), .Y(n11) );
  INVX2 U15 ( .A(n_alu_in), .Y(n12) );
  INVX2 U16 ( .A(z_alu_in), .Y(n13) );
  INVX2 U17 ( .A(p_alu_in), .Y(n14) );
  OAI21X1 U18 ( .A(n15), .B(n7), .C(n16), .Y(n32) );
  NAND3X1 U19 ( .A(br_latch), .B(n15), .C(n17), .Y(n16) );
  NOR2X1 U20 ( .A(reset_latch), .B(n18), .Y(n17) );
  AOI22X1 U21 ( .A(n19), .B(n4), .C(we_latch), .D(n20), .Y(n18) );
  OAI21X1 U22 ( .A(n6), .B(n1), .C(n21), .Y(n20) );
  AOI22X1 U23 ( .A(next_state[0]), .B(dec_in_latch[0]), .C(next_state[1]), .D(
        dec_in_latch[1]), .Y(n21) );
  OAI21X1 U24 ( .A(n6), .B(n9), .C(n22), .Y(n19) );
  AOI22X1 U25 ( .A(state_out[0]), .B(dec_in_latch[0]), .C(state_out[1]), .D(
        dec_in_latch[1]), .Y(n22) );
  NAND2X1 U26 ( .A(pc_latch_clkedge), .B(n5), .Y(n15) );
  OAI22X1 U27 ( .A(n11), .B(n23), .C(n3), .D(n24), .Y(n33) );
  OAI22X1 U28 ( .A(n10), .B(n23), .C(n2), .D(n24), .Y(n34) );
  OAI22X1 U29 ( .A(n9), .B(n23), .C(n1), .D(n24), .Y(n35) );
  NAND2X1 U30 ( .A(n23), .B(n5), .Y(n24) );
  OAI21X1 U31 ( .A(pc_latch_clkedge), .B(n4), .C(n5), .Y(n23) );
  AOI21X1 U32 ( .A(1'b1), .B(state_out[3]), .C(reset_latch), .Y(N35) );
  NOR2X1 U33 ( .A(n26), .B(n27), .Y(N23) );
  NAND2X1 U34 ( .A(we_reg_in), .B(n_alu_in), .Y(n27) );
  NAND2X1 U35 ( .A(n14), .B(n13), .Y(n26) );
  NOR2X1 U36 ( .A(n28), .B(n29), .Y(N22) );
  NAND2X1 U37 ( .A(z_alu_in), .B(we_reg_in), .Y(n29) );
  NAND2X1 U38 ( .A(n12), .B(n14), .Y(n28) );
  NOR2X1 U39 ( .A(n30), .B(n31), .Y(N21) );
  NAND2X1 U40 ( .A(p_alu_in), .B(we_reg_in), .Y(n31) );
  NAND2X1 U41 ( .A(n12), .B(n13), .Y(n30) );
endmodule

