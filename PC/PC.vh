/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : N-2017.09-SP2
// Date      : Sun Feb 26 13:08:06 2023
/////////////////////////////////////////////////////////////


module PC ( clka, clkb, reset, pc_latch_data, pc_ctl, imm, sr1_val, pc_out );
  input [1:0] pc_ctl;
  input [5:0] imm;
  input [5:0] sr1_val;
  output [5:0] pc_out;
  input clka, clkb, reset, pc_latch_data;
  wire   reset_latch, pc_latch_data_latch, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52;
  wire   [1:0] pc_ctl_latch;
  wire   [5:0] imm_latch;
  wire   [5:0] sr1_val_latch;
  wire   [5:0] pc_plus_imm;
  wire   [5:0] pc_plus_2;
  wire   [5:1] \add_48/carry ;
  assign pc_out[0] = pc_plus_2[0];

  DFFNEGX1 reset_latch_reg ( .D(reset), .CLK(clka), .Q(reset_latch) );
  DFFNEGX1 pc_latch_data_latch_reg ( .D(pc_latch_data), .CLK(clka), .Q(
        pc_latch_data_latch) );
  DFFNEGX1 \pc_ctl_latch_reg[1]  ( .D(pc_ctl[1]), .CLK(clka), .Q(
        pc_ctl_latch[1]) );
  DFFNEGX1 \pc_ctl_latch_reg[0]  ( .D(pc_ctl[0]), .CLK(clka), .Q(
        pc_ctl_latch[0]) );
  DFFNEGX1 \imm_latch_reg[5]  ( .D(imm[5]), .CLK(clka), .Q(imm_latch[5]) );
  DFFNEGX1 \imm_latch_reg[4]  ( .D(imm[4]), .CLK(clka), .Q(imm_latch[4]) );
  DFFNEGX1 \imm_latch_reg[3]  ( .D(imm[3]), .CLK(clka), .Q(imm_latch[3]) );
  DFFNEGX1 \imm_latch_reg[2]  ( .D(imm[2]), .CLK(clka), .Q(imm_latch[2]) );
  DFFNEGX1 \imm_latch_reg[1]  ( .D(imm[1]), .CLK(clka), .Q(imm_latch[1]) );
  DFFNEGX1 \imm_latch_reg[0]  ( .D(imm[0]), .CLK(clka), .Q(imm_latch[0]) );
  DFFNEGX1 \sr1_val_latch_reg[5]  ( .D(sr1_val[5]), .CLK(clka), .Q(
        sr1_val_latch[5]) );
  DFFNEGX1 \sr1_val_latch_reg[4]  ( .D(sr1_val[4]), .CLK(clka), .Q(
        sr1_val_latch[4]) );
  DFFNEGX1 \sr1_val_latch_reg[3]  ( .D(sr1_val[3]), .CLK(clka), .Q(
        sr1_val_latch[3]) );
  DFFNEGX1 \sr1_val_latch_reg[2]  ( .D(sr1_val[2]), .CLK(clka), .Q(
        sr1_val_latch[2]) );
  DFFNEGX1 \sr1_val_latch_reg[1]  ( .D(sr1_val[1]), .CLK(clka), .Q(
        sr1_val_latch[1]) );
  DFFNEGX1 \sr1_val_latch_reg[0]  ( .D(sr1_val[0]), .CLK(clka), .Q(
        sr1_val_latch[0]) );
  DFFNEGX1 \pc_reg_reg[0]  ( .D(n40), .CLK(clkb), .Q(pc_plus_2[0]) );
  DFFNEGX1 \pc_reg_reg[5]  ( .D(n35), .CLK(clkb), .Q(pc_out[5]) );
  DFFNEGX1 \pc_reg_reg[1]  ( .D(n39), .CLK(clkb), .Q(pc_out[1]) );
  DFFNEGX1 \pc_reg_reg[2]  ( .D(n38), .CLK(clkb), .Q(pc_out[2]) );
  DFFNEGX1 \pc_reg_reg[3]  ( .D(n37), .CLK(clkb), .Q(pc_out[3]) );
  DFFNEGX1 \pc_reg_reg[4]  ( .D(n36), .CLK(clkb), .Q(pc_out[4]) );
  AND2X2 U3 ( .A(pc_ctl_latch[1]), .B(n51), .Y(n19) );
  OAI21X1 U13 ( .A(n12), .B(n13), .C(n14), .Y(n35) );
  NAND2X1 U14 ( .A(pc_out[5]), .B(n15), .Y(n14) );
  AOI21X1 U15 ( .A(pc_plus_imm[5]), .B(n16), .C(n50), .Y(n12) );
  AOI22X1 U16 ( .A(pc_plus_2[5]), .B(n18), .C(sr1_val_latch[5]), .D(n19), .Y(
        n17) );
  OAI21X1 U17 ( .A(n20), .B(n13), .C(n21), .Y(n36) );
  NAND2X1 U18 ( .A(pc_out[4]), .B(n15), .Y(n21) );
  AOI21X1 U19 ( .A(pc_plus_imm[4]), .B(n16), .C(n49), .Y(n20) );
  AOI22X1 U20 ( .A(pc_plus_2[4]), .B(n18), .C(sr1_val_latch[4]), .D(n19), .Y(
        n22) );
  OAI21X1 U21 ( .A(n23), .B(n13), .C(n24), .Y(n37) );
  NAND2X1 U22 ( .A(pc_out[3]), .B(n15), .Y(n24) );
  AOI21X1 U23 ( .A(pc_plus_imm[3]), .B(n16), .C(n48), .Y(n23) );
  AOI22X1 U24 ( .A(pc_plus_2[3]), .B(n18), .C(sr1_val_latch[3]), .D(n19), .Y(
        n25) );
  OAI21X1 U25 ( .A(n26), .B(n13), .C(n27), .Y(n38) );
  NAND2X1 U26 ( .A(pc_out[2]), .B(n15), .Y(n27) );
  AOI21X1 U27 ( .A(pc_plus_imm[2]), .B(n16), .C(n47), .Y(n26) );
  AOI22X1 U28 ( .A(pc_plus_2[2]), .B(n18), .C(sr1_val_latch[2]), .D(n19), .Y(
        n28) );
  OAI21X1 U29 ( .A(n29), .B(n13), .C(n30), .Y(n39) );
  NAND2X1 U30 ( .A(pc_out[1]), .B(n15), .Y(n30) );
  AOI21X1 U31 ( .A(pc_plus_imm[1]), .B(n16), .C(n46), .Y(n29) );
  AOI22X1 U32 ( .A(n52), .B(n18), .C(sr1_val_latch[1]), .D(n19), .Y(n31) );
  OAI21X1 U33 ( .A(n32), .B(n13), .C(n33), .Y(n40) );
  NAND2X1 U34 ( .A(pc_plus_2[0]), .B(n15), .Y(n33) );
  OR2X1 U35 ( .A(n15), .B(reset_latch), .Y(n13) );
  NOR2X1 U36 ( .A(pc_latch_data_latch), .B(reset_latch), .Y(n15) );
  AOI21X1 U37 ( .A(pc_plus_imm[0]), .B(n16), .C(n45), .Y(n32) );
  AOI22X1 U38 ( .A(pc_plus_2[0]), .B(n18), .C(sr1_val_latch[0]), .D(n19), .Y(
        n34) );
  XNOR2X1 U39 ( .A(pc_ctl_latch[0]), .B(pc_ctl_latch[1]), .Y(n18) );
  NOR2X1 U40 ( .A(n51), .B(pc_ctl_latch[1]), .Y(n16) );
  FAX1 \add_48/U1_1  ( .A(pc_out[1]), .B(imm_latch[1]), .C(n43), .YC(
        \add_48/carry [2]), .YS(pc_plus_imm[1]) );
  FAX1 \add_48/U1_2  ( .A(pc_out[2]), .B(imm_latch[2]), .C(\add_48/carry [2]), 
        .YC(\add_48/carry [3]), .YS(pc_plus_imm[2]) );
  FAX1 \add_48/U1_3  ( .A(pc_out[3]), .B(imm_latch[3]), .C(\add_48/carry [3]), 
        .YC(\add_48/carry [4]), .YS(pc_plus_imm[3]) );
  FAX1 \add_48/U1_4  ( .A(pc_out[4]), .B(imm_latch[4]), .C(\add_48/carry [4]), 
        .YC(\add_48/carry [5]), .YS(pc_plus_imm[4]) );
  FAX1 \add_48/U1_5  ( .A(pc_out[5]), .B(imm_latch[5]), .C(\add_48/carry [5]), 
        .YC(), .YS(pc_plus_imm[5]) );
  AND2X2 U41 ( .A(pc_out[2]), .B(pc_out[1]), .Y(n41) );
  AND2X2 U42 ( .A(pc_out[3]), .B(n41), .Y(n42) );
  AND2X2 U43 ( .A(pc_plus_2[0]), .B(imm_latch[0]), .Y(n43) );
  AND2X2 U44 ( .A(pc_out[4]), .B(n42), .Y(n44) );
  XOR2X1 U45 ( .A(pc_out[1]), .B(pc_out[2]), .Y(pc_plus_2[2]) );
  XOR2X1 U46 ( .A(n41), .B(pc_out[3]), .Y(pc_plus_2[3]) );
  XOR2X1 U47 ( .A(n42), .B(pc_out[4]), .Y(pc_plus_2[4]) );
  XOR2X1 U48 ( .A(pc_out[5]), .B(n44), .Y(pc_plus_2[5]) );
  XOR2X1 U49 ( .A(imm_latch[0]), .B(pc_plus_2[0]), .Y(pc_plus_imm[0]) );
  INVX2 U50 ( .A(n34), .Y(n45) );
  INVX2 U51 ( .A(n31), .Y(n46) );
  INVX2 U52 ( .A(n28), .Y(n47) );
  INVX2 U53 ( .A(n25), .Y(n48) );
  INVX2 U54 ( .A(n22), .Y(n49) );
  INVX2 U55 ( .A(n17), .Y(n50) );
  INVX2 U56 ( .A(pc_ctl_latch[0]), .Y(n51) );
  INVX2 U57 ( .A(pc_out[1]), .Y(n52) );
endmodule

