/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : N-2017.09-SP2
// Date      : Tue Feb 28 13:31:29 2023
/////////////////////////////////////////////////////////////


module decoder ( instruction, negative, zero, positive, we_reg, branch, alu_op, 
        ssel, sr1, sr2, dr, pc_ctrl_1 );
  input [15:0] instruction;
  output [1:0] alu_op;
  output [1:0] ssel;
  output [2:0] sr1;
  output [2:0] sr2;
  output [2:0] dr;
  output negative, zero, positive, we_reg, branch, pc_ctrl_1;
  wire   instruction_5, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  assign instruction_5 = instruction[5];
  assign alu_op[1] = instruction[15];
  assign alu_op[0] = instruction[14];
  assign sr1[2] = instruction[8];
  assign sr1[1] = instruction[7];
  assign sr1[0] = instruction[6];
  assign sr2[2] = instruction[2];
  assign sr2[1] = instruction[1];
  assign sr2[0] = instruction[0];
  assign negative = dr[2];
  assign dr[2] = instruction[11];
  assign zero = dr[1];
  assign dr[1] = instruction[10];
  assign positive = dr[0];
  assign dr[0] = instruction[9];

  AND2X2 U3 ( .A(instruction_5), .B(instruction[12]), .Y(n6) );
  INVX2 U4 ( .A(n5), .Y(ssel[0]) );
  INVX2 U5 ( .A(n8), .Y(n2) );
  INVX2 U6 ( .A(instruction[13]), .Y(n3) );
  INVX2 U7 ( .A(instruction[12]), .Y(n4) );
  OAI21X1 U8 ( .A(instruction[13]), .B(n4), .C(n5), .Y(we_reg) );
  OAI21X1 U9 ( .A(instruction[13]), .B(n6), .C(n7), .Y(ssel[1]) );
  OAI21X1 U10 ( .A(instruction[12]), .B(n8), .C(instruction[13]), .Y(n7) );
  NAND3X1 U11 ( .A(n2), .B(n4), .C(instruction[13]), .Y(n5) );
  NOR2X1 U12 ( .A(n8), .B(n9), .Y(pc_ctrl_1) );
  NOR2X1 U13 ( .A(n2), .B(n9), .Y(branch) );
  NAND3X1 U14 ( .A(n4), .B(n3), .C(n10), .Y(n9) );
  XNOR2X1 U15 ( .A(alu_op[0]), .B(alu_op[1]), .Y(n10) );
  NAND2X1 U16 ( .A(alu_op[1]), .B(alu_op[0]), .Y(n8) );
endmodule

