/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : N-2017.09-SP2
// Date      : Sun Feb 26 12:44:23 2023
/////////////////////////////////////////////////////////////


module decoder ( instruction, negative, zero, positive, we_reg, branch, alu_op, 
        ssel );
  input [15:0] instruction;
  output [1:0] alu_op;
  output [1:0] ssel;
  output negative, zero, positive, we_reg, branch;
  wire   instruction_5, n3, n4, n5, n6, n7, n8, n9, n10;
  assign negative = instruction[11];
  assign zero = instruction[10];
  assign positive = instruction[9];
  assign instruction_5 = instruction[5];
  assign alu_op[1] = instruction[15];
  assign alu_op[0] = instruction[14];

  AND2X2 U3 ( .A(alu_op[1]), .B(alu_op[0]), .Y(n8) );
  INVX2 U4 ( .A(n5), .Y(ssel[0]) );
  INVX2 U5 ( .A(n9), .Y(branch) );
  INVX2 U6 ( .A(instruction[13]), .Y(n3) );
  INVX2 U7 ( .A(instruction[12]), .Y(n4) );
  OAI21X1 U8 ( .A(instruction[13]), .B(n4), .C(n5), .Y(we_reg) );
  OR2X1 U9 ( .A(n6), .B(n7), .Y(ssel[1]) );
  OAI22X1 U10 ( .A(instruction[12]), .B(n8), .C(instruction_5), .D(
        instruction[13]), .Y(n7) );
  OAI21X1 U11 ( .A(n4), .B(n3), .C(n9), .Y(n6) );
  NAND3X1 U12 ( .A(n8), .B(n4), .C(instruction[13]), .Y(n5) );
  NAND3X1 U13 ( .A(n4), .B(n3), .C(n10), .Y(n9) );
  XNOR2X1 U14 ( .A(alu_op[0]), .B(alu_op[1]), .Y(n10) );
endmodule

