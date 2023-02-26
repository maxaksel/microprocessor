/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : N-2017.09-SP2
// Date      : Sun Feb 26 12:45:17 2023
/////////////////////////////////////////////////////////////


module ALU ( alu_op, source_sel, ins_immediate, pc, reg_sr1_out, reg_sr2_out, 
        negative, zero, positive, result );
  input [1:0] alu_op;
  input [1:0] source_sel;
  input [5:0] ins_immediate;
  input [5:0] pc;
  input [7:0] reg_sr1_out;
  input [7:0] reg_sr2_out;
  output [7:0] result;
  output negative, zero, positive;
  wire   N38, N39, N40, N41, N42, N43, N44, N45, N46, N47, N48, N49, N50, N51,
         N52, N53, N83, N84, N85, N86, N87, N88, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155;
  wire   [5:1] \add_54/carry ;
  wire   [7:1] \add_39/carry ;
  wire   [7:1] \add_36/carry ;
  assign negative = 1'b0;

  AND2X2 U11 ( .A(n122), .B(n129), .Y(n79) );
  NOR2X1 U40 ( .A(n45), .B(n46), .Y(zero) );
  NAND3X1 U41 ( .A(n125), .B(n126), .C(n47), .Y(n46) );
  NOR2X1 U42 ( .A(result[3]), .B(result[2]), .Y(n47) );
  NAND3X1 U43 ( .A(n48), .B(n49), .C(n50), .Y(result[2]) );
  AOI21X1 U44 ( .A(n134), .B(n148), .C(n51), .Y(n50) );
  OAI21X1 U45 ( .A(n52), .B(n148), .C(n53), .Y(n51) );
  NAND2X1 U46 ( .A(N85), .B(n132), .Y(n53) );
  AOI22X1 U47 ( .A(reg_sr2_out[2]), .B(n128), .C(n119), .D(n129), .Y(n52) );
  NAND2X1 U48 ( .A(N40), .B(n133), .Y(n49) );
  AOI22X1 U49 ( .A(n131), .B(n140), .C(N48), .D(n127), .Y(n48) );
  NAND3X1 U50 ( .A(n54), .B(n55), .C(n56), .Y(result[3]) );
  AOI21X1 U51 ( .A(n134), .B(n147), .C(n57), .Y(n56) );
  OAI21X1 U52 ( .A(n58), .B(n147), .C(n59), .Y(n57) );
  NAND2X1 U53 ( .A(N86), .B(n132), .Y(n59) );
  AOI22X1 U54 ( .A(reg_sr2_out[3]), .B(n128), .C(n120), .D(n129), .Y(n58) );
  NAND2X1 U55 ( .A(N41), .B(n133), .Y(n55) );
  AOI22X1 U56 ( .A(n131), .B(n139), .C(N49), .D(n127), .Y(n54) );
  NAND3X1 U57 ( .A(n60), .B(n61), .C(n62), .Y(result[1]) );
  AOI21X1 U58 ( .A(n134), .B(n149), .C(n63), .Y(n62) );
  OAI21X1 U59 ( .A(n64), .B(n149), .C(n65), .Y(n63) );
  NAND2X1 U60 ( .A(N84), .B(n132), .Y(n65) );
  AOI22X1 U61 ( .A(reg_sr2_out[1]), .B(n128), .C(n118), .D(n129), .Y(n64) );
  NAND2X1 U62 ( .A(N39), .B(n133), .Y(n61) );
  AOI22X1 U63 ( .A(n131), .B(n141), .C(N47), .D(n127), .Y(n60) );
  NAND3X1 U64 ( .A(n66), .B(n67), .C(n68), .Y(result[0]) );
  AOI21X1 U65 ( .A(n134), .B(n150), .C(n69), .Y(n68) );
  OAI21X1 U66 ( .A(n70), .B(n150), .C(n71), .Y(n69) );
  NAND2X1 U67 ( .A(N83), .B(n132), .Y(n71) );
  AOI22X1 U68 ( .A(reg_sr2_out[0]), .B(n128), .C(n117), .D(n129), .Y(n70) );
  NAND2X1 U69 ( .A(N38), .B(n133), .Y(n67) );
  AOI22X1 U70 ( .A(n131), .B(n142), .C(N46), .D(n127), .Y(n66) );
  NAND3X1 U71 ( .A(n123), .B(n124), .C(n73), .Y(n45) );
  NOR2X1 U72 ( .A(result[7]), .B(result[6]), .Y(n73) );
  NAND2X1 U73 ( .A(n74), .B(n75), .Y(result[6]) );
  AOI21X1 U74 ( .A(N52), .B(n127), .C(n76), .Y(n75) );
  OAI22X1 U75 ( .A(n115), .B(n77), .C(n78), .D(n144), .Y(n76) );
  AOI21X1 U76 ( .A(reg_sr2_out[6]), .B(n128), .C(n79), .Y(n78) );
  AOI21X1 U77 ( .A(N44), .B(n133), .C(n80), .Y(n74) );
  NAND2X1 U78 ( .A(n81), .B(n82), .Y(result[7]) );
  AOI21X1 U79 ( .A(N53), .B(n127), .C(n83), .Y(n82) );
  OAI22X1 U80 ( .A(n116), .B(n77), .C(n84), .D(n143), .Y(n83) );
  AOI21X1 U81 ( .A(reg_sr2_out[7]), .B(n128), .C(n79), .Y(n84) );
  AOI21X1 U82 ( .A(N45), .B(n133), .C(n80), .Y(n81) );
  OAI21X1 U83 ( .A(n85), .B(n138), .C(n86), .Y(n80) );
  NAND3X1 U84 ( .A(n87), .B(n88), .C(n89), .Y(result[5]) );
  AOI21X1 U85 ( .A(N88), .B(n132), .C(n90), .Y(n89) );
  OAI21X1 U86 ( .A(n91), .B(n145), .C(n86), .Y(n90) );
  AOI21X1 U87 ( .A(reg_sr2_out[5]), .B(n128), .C(n79), .Y(n91) );
  NAND2X1 U88 ( .A(N43), .B(n133), .Y(n88) );
  AOI22X1 U89 ( .A(n134), .B(n145), .C(N51), .D(n127), .Y(n87) );
  NAND3X1 U90 ( .A(n92), .B(n93), .C(n94), .Y(result[4]) );
  AOI21X1 U91 ( .A(N87), .B(n132), .C(n95), .Y(n94) );
  OAI21X1 U92 ( .A(n96), .B(n146), .C(n86), .Y(n95) );
  OR2X1 U93 ( .A(n72), .B(n122), .Y(n86) );
  NAND3X1 U94 ( .A(alu_op[1]), .B(n135), .C(n97), .Y(n72) );
  AOI21X1 U95 ( .A(reg_sr2_out[4]), .B(n128), .C(n79), .Y(n96) );
  NAND3X1 U96 ( .A(alu_op[0]), .B(n130), .C(n97), .Y(n98) );
  NOR2X1 U97 ( .A(source_sel[1]), .B(source_sel[0]), .Y(n97) );
  NAND3X1 U98 ( .A(n100), .B(n130), .C(alu_op[0]), .Y(n99) );
  NAND3X1 U99 ( .A(source_sel[0]), .B(n135), .C(n101), .Y(n85) );
  NOR2X1 U100 ( .A(source_sel[1]), .B(alu_op[1]), .Y(n101) );
  NAND2X1 U101 ( .A(N42), .B(n133), .Y(n93) );
  NAND3X1 U102 ( .A(n137), .B(n136), .C(n103), .Y(n102) );
  NOR2X1 U103 ( .A(alu_op[1]), .B(alu_op[0]), .Y(n103) );
  AOI22X1 U104 ( .A(n134), .B(n146), .C(N50), .D(n127), .Y(n92) );
  NAND3X1 U105 ( .A(n135), .B(n130), .C(n100), .Y(n104) );
  NAND3X1 U106 ( .A(alu_op[1]), .B(n135), .C(n100), .Y(n77) );
  NOR2X1 U107 ( .A(n136), .B(source_sel[0]), .Y(n100) );
  FAX1 \add_54/U1_1  ( .A(pc[1]), .B(n118), .C(n108), .YC(\add_54/carry [2]), 
        .YS(N84) );
  FAX1 \add_54/U1_2  ( .A(pc[2]), .B(n119), .C(\add_54/carry [2]), .YC(
        \add_54/carry [3]), .YS(N85) );
  FAX1 \add_54/U1_3  ( .A(pc[3]), .B(n120), .C(\add_54/carry [3]), .YC(
        \add_54/carry [4]), .YS(N86) );
  FAX1 \add_54/U1_4  ( .A(pc[4]), .B(n122), .C(\add_54/carry [4]), .YC(
        \add_54/carry [5]), .YS(N87) );
  FAX1 \add_54/U1_5  ( .A(pc[5]), .B(ins_immediate[5]), .C(\add_54/carry [5]), 
        .YC(), .YS(N88) );
  FAX1 \add_39/U1_1  ( .A(n110), .B(reg_sr2_out[1]), .C(n106), .YC(
        \add_39/carry [2]), .YS(N47) );
  FAX1 \add_39/U1_2  ( .A(n111), .B(reg_sr2_out[2]), .C(\add_39/carry [2]), 
        .YC(\add_39/carry [3]), .YS(N48) );
  FAX1 \add_39/U1_3  ( .A(n112), .B(reg_sr2_out[3]), .C(\add_39/carry [3]), 
        .YC(\add_39/carry [4]), .YS(N49) );
  FAX1 \add_39/U1_4  ( .A(n113), .B(reg_sr2_out[4]), .C(\add_39/carry [4]), 
        .YC(\add_39/carry [5]), .YS(N50) );
  FAX1 \add_39/U1_5  ( .A(n114), .B(reg_sr2_out[5]), .C(\add_39/carry [5]), 
        .YC(\add_39/carry [6]), .YS(N51) );
  FAX1 \add_39/U1_6  ( .A(n115), .B(reg_sr2_out[6]), .C(\add_39/carry [6]), 
        .YC(\add_39/carry [7]), .YS(N52) );
  FAX1 \add_39/U1_7  ( .A(n116), .B(reg_sr2_out[7]), .C(\add_39/carry [7]), 
        .YC(), .YS(N53) );
  FAX1 \add_36/U1_1  ( .A(n110), .B(n118), .C(n107), .YC(\add_36/carry [2]), 
        .YS(N39) );
  FAX1 \add_36/U1_2  ( .A(n111), .B(n119), .C(\add_36/carry [2]), .YC(
        \add_36/carry [3]), .YS(N40) );
  FAX1 \add_36/U1_3  ( .A(n112), .B(n120), .C(\add_36/carry [3]), .YC(
        \add_36/carry [4]), .YS(N41) );
  FAX1 \add_36/U1_4  ( .A(n113), .B(n122), .C(\add_36/carry [4]), .YC(
        \add_36/carry [5]), .YS(N42) );
  FAX1 \add_36/U1_5  ( .A(n114), .B(n122), .C(\add_36/carry [5]), .YC(
        \add_36/carry [6]), .YS(N43) );
  FAX1 \add_36/U1_6  ( .A(n115), .B(n122), .C(\add_36/carry [6]), .YC(
        \add_36/carry [7]), .YS(N44) );
  FAX1 \add_36/U1_7  ( .A(n116), .B(ins_immediate[4]), .C(\add_36/carry [7]), 
        .YC(), .YS(N45) );
  AND2X2 U108 ( .A(reg_sr2_out[0]), .B(n109), .Y(n106) );
  AND2X2 U109 ( .A(n117), .B(n109), .Y(n107) );
  AND2X2 U110 ( .A(n117), .B(pc[0]), .Y(n108) );
  INVX2 U111 ( .A(n121), .Y(n122) );
  BUFX2 U112 ( .A(ins_immediate[1]), .Y(n118) );
  BUFX2 U113 ( .A(reg_sr1_out[1]), .Y(n110) );
  BUFX2 U114 ( .A(ins_immediate[0]), .Y(n117) );
  BUFX2 U115 ( .A(reg_sr1_out[0]), .Y(n109) );
  BUFX2 U116 ( .A(ins_immediate[2]), .Y(n119) );
  BUFX2 U117 ( .A(ins_immediate[3]), .Y(n120) );
  BUFX2 U118 ( .A(reg_sr1_out[2]), .Y(n111) );
  BUFX2 U119 ( .A(reg_sr1_out[3]), .Y(n112) );
  BUFX2 U120 ( .A(reg_sr1_out[4]), .Y(n113) );
  INVX2 U121 ( .A(ins_immediate[4]), .Y(n121) );
  BUFX2 U122 ( .A(reg_sr1_out[6]), .Y(n115) );
  BUFX2 U123 ( .A(reg_sr1_out[5]), .Y(n114) );
  BUFX2 U124 ( .A(reg_sr1_out[7]), .Y(n116) );
  XOR2X1 U125 ( .A(n117), .B(pc[0]), .Y(N83) );
  XOR2X1 U126 ( .A(reg_sr2_out[0]), .B(n109), .Y(N46) );
  XOR2X1 U127 ( .A(n117), .B(n109), .Y(N38) );
  AND2X2 U128 ( .A(n152), .B(n151), .Y(n153) );
  INVX2 U129 ( .A(result[4]), .Y(n123) );
  INVX2 U130 ( .A(result[5]), .Y(n124) );
  INVX2 U131 ( .A(result[0]), .Y(n125) );
  INVX2 U132 ( .A(result[1]), .Y(n126) );
  INVX2 U133 ( .A(n104), .Y(n127) );
  INVX2 U134 ( .A(n99), .Y(n128) );
  INVX2 U135 ( .A(n98), .Y(n129) );
  INVX2 U136 ( .A(alu_op[1]), .Y(n130) );
  INVX2 U137 ( .A(n72), .Y(n131) );
  INVX2 U138 ( .A(n85), .Y(n132) );
  INVX2 U139 ( .A(n102), .Y(n133) );
  INVX2 U140 ( .A(n77), .Y(n134) );
  INVX2 U141 ( .A(alu_op[0]), .Y(n135) );
  INVX2 U142 ( .A(source_sel[1]), .Y(n136) );
  INVX2 U143 ( .A(source_sel[0]), .Y(n137) );
  INVX2 U144 ( .A(ins_immediate[5]), .Y(n138) );
  INVX2 U145 ( .A(n120), .Y(n139) );
  INVX2 U146 ( .A(n119), .Y(n140) );
  INVX2 U147 ( .A(n118), .Y(n141) );
  INVX2 U148 ( .A(n117), .Y(n142) );
  INVX2 U149 ( .A(n116), .Y(n143) );
  INVX2 U150 ( .A(n115), .Y(n144) );
  INVX2 U151 ( .A(n114), .Y(n145) );
  INVX2 U152 ( .A(n113), .Y(n146) );
  INVX2 U153 ( .A(n112), .Y(n147) );
  INVX2 U154 ( .A(n111), .Y(n148) );
  INVX2 U155 ( .A(n110), .Y(n149) );
  INVX2 U156 ( .A(n109), .Y(n150) );
  NOR2X1 U157 ( .A(result[1]), .B(result[0]), .Y(n155) );
  NOR2X1 U158 ( .A(result[3]), .B(result[2]), .Y(n154) );
  NOR2X1 U159 ( .A(result[5]), .B(result[4]), .Y(n152) );
  NOR2X1 U160 ( .A(result[7]), .B(result[6]), .Y(n151) );
  NAND3X1 U161 ( .A(n155), .B(n154), .C(n153), .Y(positive) );
endmodule

