/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : N-2017.09-SP2
// Date      : Fri Feb 24 16:32:48 2023
/////////////////////////////////////////////////////////////


module REGFILE ( clka, clkb, pc_latch_clk, reset_in, sr1_in, sr2_in, rd_in, 
        we_reg_in, data_in, sr1_out, sr2_out, reg0_out, Port13 );
  input [2:0] sr1_in;
  input [2:0] sr2_in;
  input [2:0] rd_in;
  input [7:0] data_in;
  output [7:0] sr1_out;
  output [7:0] sr2_out;
  output [7:0] reg0_out;
  input clka, clkb, pc_latch_clk, reset_in, we_reg_in, Port13;
  wire   \regfile[7][7] , \regfile[7][6] , \regfile[7][5] , \regfile[7][4] ,
         \regfile[7][3] , \regfile[7][2] , \regfile[7][1] , \regfile[7][0] ,
         \regfile[6][7] , \regfile[6][6] , \regfile[6][5] , \regfile[6][4] ,
         \regfile[6][3] , \regfile[6][2] , \regfile[6][1] , \regfile[6][0] ,
         \regfile[5][7] , \regfile[5][6] , \regfile[5][5] , \regfile[5][4] ,
         \regfile[5][3] , \regfile[5][2] , \regfile[5][1] , \regfile[5][0] ,
         \regfile[4][7] , \regfile[4][6] , \regfile[4][5] , \regfile[4][4] ,
         \regfile[4][3] , \regfile[4][2] , \regfile[4][1] , \regfile[4][0] ,
         \regfile[3][7] , \regfile[3][6] , \regfile[3][5] , \regfile[3][4] ,
         \regfile[3][3] , \regfile[3][2] , \regfile[3][1] , \regfile[3][0] ,
         \regfile[2][7] , \regfile[2][6] , \regfile[2][5] , \regfile[2][4] ,
         \regfile[2][3] , \regfile[2][2] , \regfile[2][1] , \regfile[2][0] ,
         \regfile[1][7] , \regfile[1][6] , \regfile[1][5] , \regfile[1][4] ,
         \regfile[1][3] , \regfile[1][2] , \regfile[1][1] , \regfile[1][0] ,
         reset_latch, we_reg_latch, pc_latch, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n119, n120, n121, n122, n123, n124, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n315, n316, n317, n318, n319, n320, n321,
         n322, n323;
  wire   [2:0] rd_latch;
  wire   [7:0] data_latch;

  DFFNEGX1 reset_latch_reg ( .D(reset_in), .CLK(clka), .Q(reset_latch) );
  DFFNEGX1 we_reg_latch_reg ( .D(we_reg_in), .CLK(clka), .Q(we_reg_latch) );
  DFFNEGX1 \rd_latch_reg[2]  ( .D(rd_in[2]), .CLK(clka), .Q(rd_latch[2]) );
  DFFNEGX1 \rd_latch_reg[1]  ( .D(rd_in[1]), .CLK(clka), .Q(rd_latch[1]) );
  DFFNEGX1 \rd_latch_reg[0]  ( .D(rd_in[0]), .CLK(clka), .Q(rd_latch[0]) );
  DFFNEGX1 \data_latch_reg[7]  ( .D(data_in[7]), .CLK(clka), .Q(data_latch[7])
         );
  DFFNEGX1 \data_latch_reg[6]  ( .D(data_in[6]), .CLK(clka), .Q(data_latch[6])
         );
  DFFNEGX1 \data_latch_reg[5]  ( .D(data_in[5]), .CLK(clka), .Q(data_latch[5])
         );
  DFFNEGX1 \data_latch_reg[4]  ( .D(data_in[4]), .CLK(clka), .Q(data_latch[4])
         );
  DFFNEGX1 \data_latch_reg[3]  ( .D(data_in[3]), .CLK(clka), .Q(data_latch[3])
         );
  DFFNEGX1 \data_latch_reg[2]  ( .D(data_in[2]), .CLK(clka), .Q(data_latch[2])
         );
  DFFNEGX1 \data_latch_reg[1]  ( .D(data_in[1]), .CLK(clka), .Q(data_latch[1])
         );
  DFFNEGX1 \data_latch_reg[0]  ( .D(data_in[0]), .CLK(clka), .Q(data_latch[0])
         );
  DFFNEGX1 pc_latch_reg ( .D(pc_latch_clk), .CLK(clka), .Q(pc_latch) );
  DFFNEGX1 \regfile_reg[7][7]  ( .D(n278), .CLK(n323), .Q(\regfile[7][7] ) );
  DFFNEGX1 \regfile_reg[7][6]  ( .D(n277), .CLK(n323), .Q(\regfile[7][6] ) );
  DFFNEGX1 \regfile_reg[7][5]  ( .D(n276), .CLK(n323), .Q(\regfile[7][5] ) );
  DFFNEGX1 \regfile_reg[7][4]  ( .D(n275), .CLK(n323), .Q(\regfile[7][4] ) );
  DFFNEGX1 \regfile_reg[7][3]  ( .D(n274), .CLK(n323), .Q(\regfile[7][3] ) );
  DFFNEGX1 \regfile_reg[7][2]  ( .D(n273), .CLK(n323), .Q(\regfile[7][2] ) );
  DFFNEGX1 \regfile_reg[7][1]  ( .D(n272), .CLK(n323), .Q(\regfile[7][1] ) );
  DFFNEGX1 \regfile_reg[7][0]  ( .D(n271), .CLK(n323), .Q(\regfile[7][0] ) );
  DFFNEGX1 \regfile_reg[6][7]  ( .D(n270), .CLK(n323), .Q(\regfile[6][7] ) );
  DFFNEGX1 \regfile_reg[6][6]  ( .D(n269), .CLK(n323), .Q(\regfile[6][6] ) );
  DFFNEGX1 \regfile_reg[6][5]  ( .D(n268), .CLK(n323), .Q(\regfile[6][5] ) );
  DFFNEGX1 \regfile_reg[6][4]  ( .D(n267), .CLK(n323), .Q(\regfile[6][4] ) );
  DFFNEGX1 \regfile_reg[6][3]  ( .D(n266), .CLK(n322), .Q(\regfile[6][3] ) );
  DFFNEGX1 \regfile_reg[6][2]  ( .D(n265), .CLK(n322), .Q(\regfile[6][2] ) );
  DFFNEGX1 \regfile_reg[6][1]  ( .D(n264), .CLK(n322), .Q(\regfile[6][1] ) );
  DFFNEGX1 \regfile_reg[6][0]  ( .D(n263), .CLK(n322), .Q(\regfile[6][0] ) );
  DFFNEGX1 \regfile_reg[5][7]  ( .D(n262), .CLK(n322), .Q(\regfile[5][7] ) );
  DFFNEGX1 \regfile_reg[5][6]  ( .D(n261), .CLK(n322), .Q(\regfile[5][6] ) );
  DFFNEGX1 \regfile_reg[5][5]  ( .D(n260), .CLK(n322), .Q(\regfile[5][5] ) );
  DFFNEGX1 \regfile_reg[5][4]  ( .D(n259), .CLK(n322), .Q(\regfile[5][4] ) );
  DFFNEGX1 \regfile_reg[5][3]  ( .D(n258), .CLK(n322), .Q(\regfile[5][3] ) );
  DFFNEGX1 \regfile_reg[5][2]  ( .D(n257), .CLK(n322), .Q(\regfile[5][2] ) );
  DFFNEGX1 \regfile_reg[5][1]  ( .D(n256), .CLK(n322), .Q(\regfile[5][1] ) );
  DFFNEGX1 \regfile_reg[5][0]  ( .D(n255), .CLK(n322), .Q(\regfile[5][0] ) );
  DFFNEGX1 \regfile_reg[4][7]  ( .D(n254), .CLK(n322), .Q(\regfile[4][7] ) );
  DFFNEGX1 \regfile_reg[4][6]  ( .D(n253), .CLK(n321), .Q(\regfile[4][6] ) );
  DFFNEGX1 \regfile_reg[4][5]  ( .D(n252), .CLK(n321), .Q(\regfile[4][5] ) );
  DFFNEGX1 \regfile_reg[4][4]  ( .D(n251), .CLK(n321), .Q(\regfile[4][4] ) );
  DFFNEGX1 \regfile_reg[4][3]  ( .D(n250), .CLK(n321), .Q(\regfile[4][3] ) );
  DFFNEGX1 \regfile_reg[4][2]  ( .D(n249), .CLK(n321), .Q(\regfile[4][2] ) );
  DFFNEGX1 \regfile_reg[4][1]  ( .D(n248), .CLK(n321), .Q(\regfile[4][1] ) );
  DFFNEGX1 \regfile_reg[4][0]  ( .D(n247), .CLK(n321), .Q(\regfile[4][0] ) );
  DFFNEGX1 \regfile_reg[3][7]  ( .D(n246), .CLK(n321), .Q(\regfile[3][7] ) );
  DFFNEGX1 \regfile_reg[3][6]  ( .D(n245), .CLK(n321), .Q(\regfile[3][6] ) );
  DFFNEGX1 \regfile_reg[3][5]  ( .D(n244), .CLK(n321), .Q(\regfile[3][5] ) );
  DFFNEGX1 \regfile_reg[3][4]  ( .D(n243), .CLK(n321), .Q(\regfile[3][4] ) );
  DFFNEGX1 \regfile_reg[3][3]  ( .D(n242), .CLK(n321), .Q(\regfile[3][3] ) );
  DFFNEGX1 \regfile_reg[3][2]  ( .D(n241), .CLK(n321), .Q(\regfile[3][2] ) );
  DFFNEGX1 \regfile_reg[3][1]  ( .D(n240), .CLK(n320), .Q(\regfile[3][1] ) );
  DFFNEGX1 \regfile_reg[3][0]  ( .D(n239), .CLK(n320), .Q(\regfile[3][0] ) );
  DFFNEGX1 \regfile_reg[2][7]  ( .D(n238), .CLK(n320), .Q(\regfile[2][7] ) );
  DFFNEGX1 \regfile_reg[2][6]  ( .D(n237), .CLK(n320), .Q(\regfile[2][6] ) );
  DFFNEGX1 \regfile_reg[2][5]  ( .D(n236), .CLK(n320), .Q(\regfile[2][5] ) );
  DFFNEGX1 \regfile_reg[2][4]  ( .D(n235), .CLK(n320), .Q(\regfile[2][4] ) );
  DFFNEGX1 \regfile_reg[2][3]  ( .D(n234), .CLK(n320), .Q(\regfile[2][3] ) );
  DFFNEGX1 \regfile_reg[2][2]  ( .D(n233), .CLK(n320), .Q(\regfile[2][2] ) );
  DFFNEGX1 \regfile_reg[2][1]  ( .D(n232), .CLK(n320), .Q(\regfile[2][1] ) );
  DFFNEGX1 \regfile_reg[2][0]  ( .D(n231), .CLK(n320), .Q(\regfile[2][0] ) );
  DFFNEGX1 \regfile_reg[1][7]  ( .D(n230), .CLK(n320), .Q(\regfile[1][7] ) );
  DFFNEGX1 \regfile_reg[1][6]  ( .D(n229), .CLK(n320), .Q(\regfile[1][6] ) );
  DFFNEGX1 \regfile_reg[1][5]  ( .D(n228), .CLK(n320), .Q(\regfile[1][5] ) );
  DFFNEGX1 \regfile_reg[1][4]  ( .D(n227), .CLK(n319), .Q(\regfile[1][4] ) );
  DFFNEGX1 \regfile_reg[1][3]  ( .D(n226), .CLK(n319), .Q(\regfile[1][3] ) );
  DFFNEGX1 \regfile_reg[1][2]  ( .D(n225), .CLK(n319), .Q(\regfile[1][2] ) );
  DFFNEGX1 \regfile_reg[1][1]  ( .D(n224), .CLK(n319), .Q(\regfile[1][1] ) );
  DFFNEGX1 \regfile_reg[1][0]  ( .D(n223), .CLK(n319), .Q(\regfile[1][0] ) );
  DFFNEGX1 \regfile_reg[0][7]  ( .D(n222), .CLK(n319), .Q(reg0_out[7]) );
  DFFNEGX1 \regfile_reg[0][6]  ( .D(n221), .CLK(n319), .Q(reg0_out[6]) );
  DFFNEGX1 \regfile_reg[0][5]  ( .D(n220), .CLK(n319), .Q(reg0_out[5]) );
  DFFNEGX1 \regfile_reg[0][4]  ( .D(n219), .CLK(n319), .Q(reg0_out[4]) );
  DFFNEGX1 \regfile_reg[0][3]  ( .D(n218), .CLK(n319), .Q(reg0_out[3]) );
  DFFNEGX1 \regfile_reg[0][2]  ( .D(n217), .CLK(n319), .Q(reg0_out[2]) );
  DFFNEGX1 \regfile_reg[0][1]  ( .D(n216), .CLK(n319), .Q(reg0_out[1]) );
  DFFNEGX1 \regfile_reg[0][0]  ( .D(n215), .CLK(n319), .Q(reg0_out[0]) );
  INVX2 U11 ( .A(reset_latch), .Y(n9) );
  INVX2 U13 ( .A(n94), .Y(n11) );
  INVX2 U14 ( .A(rd_latch[1]), .Y(n12) );
  INVX2 U15 ( .A(rd_latch[0]), .Y(n13) );
  INVX2 U16 ( .A(\regfile[7][7] ), .Y(n14) );
  INVX2 U17 ( .A(\regfile[7][6] ), .Y(n15) );
  INVX2 U18 ( .A(\regfile[7][5] ), .Y(n16) );
  INVX2 U19 ( .A(\regfile[7][4] ), .Y(n17) );
  INVX2 U20 ( .A(\regfile[7][3] ), .Y(n18) );
  INVX2 U21 ( .A(\regfile[7][2] ), .Y(n19) );
  INVX2 U22 ( .A(\regfile[7][1] ), .Y(n20) );
  INVX2 U23 ( .A(\regfile[7][0] ), .Y(n21) );
  INVX2 U24 ( .A(\regfile[6][7] ), .Y(n22) );
  INVX2 U25 ( .A(\regfile[6][6] ), .Y(n23) );
  INVX2 U26 ( .A(\regfile[6][5] ), .Y(n24) );
  INVX2 U27 ( .A(\regfile[6][4] ), .Y(n25) );
  INVX2 U28 ( .A(\regfile[6][3] ), .Y(n26) );
  INVX2 U29 ( .A(\regfile[6][2] ), .Y(n27) );
  INVX2 U30 ( .A(\regfile[6][1] ), .Y(n28) );
  INVX2 U31 ( .A(\regfile[6][0] ), .Y(n29) );
  INVX2 U32 ( .A(\regfile[5][7] ), .Y(n30) );
  INVX2 U33 ( .A(\regfile[5][6] ), .Y(n31) );
  INVX2 U34 ( .A(\regfile[5][5] ), .Y(n32) );
  INVX2 U35 ( .A(\regfile[5][4] ), .Y(n33) );
  INVX2 U36 ( .A(\regfile[5][3] ), .Y(n34) );
  INVX2 U37 ( .A(\regfile[5][2] ), .Y(n35) );
  INVX2 U38 ( .A(\regfile[5][1] ), .Y(n36) );
  INVX2 U39 ( .A(\regfile[5][0] ), .Y(n37) );
  INVX2 U40 ( .A(\regfile[4][7] ), .Y(n38) );
  INVX2 U41 ( .A(\regfile[4][6] ), .Y(n39) );
  INVX2 U42 ( .A(\regfile[4][5] ), .Y(n40) );
  INVX2 U43 ( .A(\regfile[4][4] ), .Y(n41) );
  INVX2 U44 ( .A(\regfile[4][3] ), .Y(n42) );
  INVX2 U45 ( .A(\regfile[4][2] ), .Y(n43) );
  INVX2 U46 ( .A(\regfile[4][1] ), .Y(n44) );
  INVX2 U47 ( .A(\regfile[4][0] ), .Y(n45) );
  INVX2 U48 ( .A(\regfile[3][7] ), .Y(n46) );
  INVX2 U49 ( .A(\regfile[3][6] ), .Y(n47) );
  INVX2 U50 ( .A(\regfile[3][5] ), .Y(n48) );
  INVX2 U51 ( .A(\regfile[3][4] ), .Y(n49) );
  INVX2 U52 ( .A(\regfile[3][3] ), .Y(n50) );
  INVX2 U53 ( .A(\regfile[3][2] ), .Y(n51) );
  INVX2 U54 ( .A(\regfile[3][1] ), .Y(n52) );
  INVX2 U55 ( .A(\regfile[3][0] ), .Y(n53) );
  INVX2 U56 ( .A(\regfile[2][7] ), .Y(n54) );
  INVX2 U57 ( .A(\regfile[2][6] ), .Y(n55) );
  INVX2 U58 ( .A(\regfile[2][5] ), .Y(n56) );
  INVX2 U59 ( .A(\regfile[2][4] ), .Y(n57) );
  INVX2 U60 ( .A(\regfile[2][3] ), .Y(n58) );
  INVX2 U61 ( .A(\regfile[2][2] ), .Y(n59) );
  INVX2 U62 ( .A(\regfile[2][1] ), .Y(n60) );
  INVX2 U63 ( .A(\regfile[2][0] ), .Y(n61) );
  INVX2 U64 ( .A(\regfile[1][7] ), .Y(n62) );
  INVX2 U65 ( .A(\regfile[1][6] ), .Y(n63) );
  INVX2 U66 ( .A(\regfile[1][5] ), .Y(n64) );
  INVX2 U67 ( .A(\regfile[1][4] ), .Y(n65) );
  INVX2 U68 ( .A(\regfile[1][3] ), .Y(n66) );
  INVX2 U69 ( .A(\regfile[1][2] ), .Y(n67) );
  INVX2 U70 ( .A(\regfile[1][1] ), .Y(n68) );
  INVX2 U71 ( .A(\regfile[1][0] ), .Y(n69) );
  INVX2 U72 ( .A(reg0_out[7]), .Y(n70) );
  INVX2 U73 ( .A(reg0_out[6]), .Y(n71) );
  INVX2 U74 ( .A(reg0_out[5]), .Y(n72) );
  INVX2 U75 ( .A(reg0_out[4]), .Y(n73) );
  INVX2 U76 ( .A(reg0_out[3]), .Y(n74) );
  INVX2 U77 ( .A(reg0_out[2]), .Y(n75) );
  INVX2 U78 ( .A(reg0_out[1]), .Y(n76) );
  INVX2 U79 ( .A(reg0_out[0]), .Y(n77) );
  INVX2 U80 ( .A(sr1_in[2]), .Y(n78) );
  INVX2 U81 ( .A(sr1_in[1]), .Y(n79) );
  INVX2 U82 ( .A(sr1_in[0]), .Y(n80) );
  INVX2 U83 ( .A(sr2_in[2]), .Y(n81) );
  INVX2 U84 ( .A(sr2_in[1]), .Y(n82) );
  INVX2 U85 ( .A(sr2_in[0]), .Y(n83) );
  OAI22X1 U86 ( .A(n84), .B(n77), .C(n318), .D(n85), .Y(n215) );
  OAI22X1 U87 ( .A(n84), .B(n76), .C(n318), .D(n86), .Y(n216) );
  OAI22X1 U88 ( .A(n84), .B(n75), .C(n318), .D(n87), .Y(n217) );
  OAI22X1 U89 ( .A(n84), .B(n74), .C(n318), .D(n88), .Y(n218) );
  OAI22X1 U90 ( .A(n84), .B(n73), .C(n318), .D(n89), .Y(n219) );
  OAI22X1 U91 ( .A(n84), .B(n72), .C(n318), .D(n90), .Y(n220) );
  OAI22X1 U92 ( .A(n84), .B(n71), .C(n318), .D(n91), .Y(n221) );
  OAI22X1 U93 ( .A(n84), .B(n70), .C(n318), .D(n92), .Y(n222) );
  OAI21X1 U94 ( .A(n11), .B(n93), .C(n9), .Y(n84) );
  OAI22X1 U95 ( .A(n95), .B(n69), .C(n317), .D(n85), .Y(n223) );
  OAI22X1 U96 ( .A(n95), .B(n68), .C(n317), .D(n86), .Y(n224) );
  OAI22X1 U97 ( .A(n95), .B(n67), .C(n317), .D(n87), .Y(n225) );
  OAI22X1 U98 ( .A(n95), .B(n66), .C(n317), .D(n88), .Y(n226) );
  OAI22X1 U99 ( .A(n95), .B(n65), .C(n317), .D(n89), .Y(n227) );
  OAI22X1 U100 ( .A(n95), .B(n64), .C(n317), .D(n90), .Y(n228) );
  OAI22X1 U101 ( .A(n95), .B(n63), .C(n317), .D(n91), .Y(n229) );
  OAI22X1 U102 ( .A(n95), .B(n62), .C(n317), .D(n92), .Y(n230) );
  OAI21X1 U103 ( .A(n13), .B(n96), .C(n9), .Y(n95) );
  NAND2X1 U104 ( .A(n94), .B(n12), .Y(n96) );
  OAI22X1 U105 ( .A(n97), .B(n61), .C(n316), .D(n85), .Y(n231) );
  OAI22X1 U106 ( .A(n97), .B(n60), .C(n316), .D(n86), .Y(n232) );
  OAI22X1 U107 ( .A(n97), .B(n59), .C(n316), .D(n87), .Y(n233) );
  OAI22X1 U108 ( .A(n97), .B(n58), .C(n316), .D(n88), .Y(n234) );
  OAI22X1 U109 ( .A(n97), .B(n57), .C(n316), .D(n89), .Y(n235) );
  OAI22X1 U110 ( .A(n97), .B(n56), .C(n316), .D(n90), .Y(n236) );
  OAI22X1 U111 ( .A(n97), .B(n55), .C(n316), .D(n91), .Y(n237) );
  OAI22X1 U112 ( .A(n97), .B(n54), .C(n316), .D(n92), .Y(n238) );
  OAI21X1 U113 ( .A(n12), .B(n98), .C(n9), .Y(n97) );
  NAND2X1 U114 ( .A(n94), .B(n13), .Y(n98) );
  OAI22X1 U115 ( .A(n99), .B(n53), .C(n315), .D(n85), .Y(n239) );
  OAI22X1 U116 ( .A(n99), .B(n52), .C(n315), .D(n86), .Y(n240) );
  OAI22X1 U117 ( .A(n99), .B(n51), .C(n315), .D(n87), .Y(n241) );
  OAI22X1 U118 ( .A(n99), .B(n50), .C(n315), .D(n88), .Y(n242) );
  OAI22X1 U119 ( .A(n99), .B(n49), .C(n315), .D(n89), .Y(n243) );
  OAI22X1 U120 ( .A(n99), .B(n48), .C(n315), .D(n90), .Y(n244) );
  OAI22X1 U121 ( .A(n99), .B(n47), .C(n315), .D(n91), .Y(n245) );
  OAI22X1 U122 ( .A(n99), .B(n46), .C(n315), .D(n92), .Y(n246) );
  OAI21X1 U123 ( .A(n12), .B(n100), .C(n9), .Y(n99) );
  NAND2X1 U124 ( .A(rd_latch[0]), .B(n94), .Y(n100) );
  NOR2X1 U125 ( .A(n101), .B(rd_latch[2]), .Y(n94) );
  OAI22X1 U126 ( .A(n102), .B(n45), .C(n314), .D(n85), .Y(n247) );
  OAI22X1 U127 ( .A(n102), .B(n44), .C(n314), .D(n86), .Y(n248) );
  OAI22X1 U128 ( .A(n102), .B(n43), .C(n314), .D(n87), .Y(n249) );
  OAI22X1 U129 ( .A(n102), .B(n42), .C(n314), .D(n88), .Y(n250) );
  OAI22X1 U130 ( .A(n102), .B(n41), .C(n314), .D(n89), .Y(n251) );
  OAI22X1 U131 ( .A(n102), .B(n40), .C(n314), .D(n90), .Y(n252) );
  OAI22X1 U132 ( .A(n102), .B(n39), .C(n314), .D(n91), .Y(n253) );
  OAI22X1 U133 ( .A(n102), .B(n38), .C(n314), .D(n92), .Y(n254) );
  OAI21X1 U134 ( .A(n103), .B(n93), .C(n9), .Y(n102) );
  NAND2X1 U135 ( .A(n13), .B(n12), .Y(n93) );
  OAI22X1 U136 ( .A(n104), .B(n37), .C(n313), .D(n85), .Y(n255) );
  OAI22X1 U137 ( .A(n104), .B(n36), .C(n313), .D(n86), .Y(n256) );
  OAI22X1 U138 ( .A(n104), .B(n35), .C(n313), .D(n87), .Y(n257) );
  OAI22X1 U139 ( .A(n104), .B(n34), .C(n313), .D(n88), .Y(n258) );
  OAI22X1 U140 ( .A(n104), .B(n33), .C(n313), .D(n89), .Y(n259) );
  OAI22X1 U141 ( .A(n104), .B(n32), .C(n313), .D(n90), .Y(n260) );
  OAI22X1 U142 ( .A(n104), .B(n31), .C(n313), .D(n91), .Y(n261) );
  OAI22X1 U143 ( .A(n104), .B(n30), .C(n313), .D(n92), .Y(n262) );
  OAI21X1 U144 ( .A(n103), .B(n105), .C(n9), .Y(n104) );
  NAND2X1 U145 ( .A(rd_latch[0]), .B(n12), .Y(n105) );
  OAI22X1 U146 ( .A(n106), .B(n29), .C(n312), .D(n85), .Y(n263) );
  OAI22X1 U147 ( .A(n106), .B(n28), .C(n312), .D(n86), .Y(n264) );
  OAI22X1 U148 ( .A(n106), .B(n27), .C(n312), .D(n87), .Y(n265) );
  OAI22X1 U149 ( .A(n106), .B(n26), .C(n312), .D(n88), .Y(n266) );
  OAI22X1 U150 ( .A(n106), .B(n25), .C(n312), .D(n89), .Y(n267) );
  OAI22X1 U151 ( .A(n106), .B(n24), .C(n312), .D(n90), .Y(n268) );
  OAI22X1 U152 ( .A(n106), .B(n23), .C(n312), .D(n91), .Y(n269) );
  OAI22X1 U153 ( .A(n106), .B(n22), .C(n312), .D(n92), .Y(n270) );
  OAI21X1 U154 ( .A(n103), .B(n107), .C(n9), .Y(n106) );
  NAND2X1 U155 ( .A(rd_latch[1]), .B(n13), .Y(n107) );
  OAI22X1 U156 ( .A(n108), .B(n21), .C(n311), .D(n85), .Y(n271) );
  NAND2X1 U157 ( .A(data_latch[0]), .B(n10), .Y(n85) );
  OAI22X1 U158 ( .A(n108), .B(n20), .C(n311), .D(n86), .Y(n272) );
  NAND2X1 U159 ( .A(data_latch[1]), .B(n10), .Y(n86) );
  OAI22X1 U160 ( .A(n108), .B(n19), .C(n311), .D(n87), .Y(n273) );
  NAND2X1 U161 ( .A(data_latch[2]), .B(n10), .Y(n87) );
  OAI22X1 U162 ( .A(n108), .B(n18), .C(n311), .D(n88), .Y(n274) );
  NAND2X1 U163 ( .A(data_latch[3]), .B(n10), .Y(n88) );
  OAI22X1 U164 ( .A(n108), .B(n17), .C(n311), .D(n89), .Y(n275) );
  NAND2X1 U165 ( .A(data_latch[4]), .B(n10), .Y(n89) );
  OAI22X1 U166 ( .A(n108), .B(n16), .C(n311), .D(n90), .Y(n276) );
  NAND2X1 U167 ( .A(data_latch[5]), .B(n10), .Y(n90) );
  OAI22X1 U168 ( .A(n108), .B(n15), .C(n311), .D(n91), .Y(n277) );
  NAND2X1 U169 ( .A(data_latch[6]), .B(n10), .Y(n91) );
  OAI22X1 U170 ( .A(n108), .B(n14), .C(n311), .D(n92), .Y(n278) );
  NAND2X1 U171 ( .A(data_latch[7]), .B(n10), .Y(n92) );
  OAI21X1 U172 ( .A(n103), .B(n109), .C(n9), .Y(n108) );
  NAND2X1 U173 ( .A(rd_latch[1]), .B(rd_latch[0]), .Y(n109) );
  NAND2X1 U174 ( .A(rd_latch[2]), .B(n10), .Y(n103) );
  NAND2X1 U175 ( .A(n110), .B(we_reg_latch), .Y(n101) );
  NOR2X1 U176 ( .A(reset_latch), .B(pc_latch), .Y(n110) );
  NAND2X1 U177 ( .A(n111), .B(n112), .Y(sr1_out[7]) );
  OAI21X1 U178 ( .A(n113), .B(n114), .C(n80), .Y(n112) );
  OAI22X1 U179 ( .A(n22), .B(n309), .C(n38), .D(n310), .Y(n114) );
  OAI22X1 U180 ( .A(n54), .B(n307), .C(n70), .D(n308), .Y(n113) );
  OAI21X1 U181 ( .A(n119), .B(n120), .C(sr1_in[0]), .Y(n111) );
  OAI22X1 U182 ( .A(n14), .B(n309), .C(n30), .D(n310), .Y(n120) );
  OAI22X1 U183 ( .A(n46), .B(n307), .C(n62), .D(n308), .Y(n119) );
  NAND2X1 U184 ( .A(n121), .B(n122), .Y(sr2_out[7]) );
  OAI21X1 U185 ( .A(n123), .B(n124), .C(n83), .Y(n122) );
  OAI22X1 U186 ( .A(n22), .B(n305), .C(n38), .D(n306), .Y(n124) );
  OAI22X1 U187 ( .A(n54), .B(n303), .C(n70), .D(n304), .Y(n123) );
  OAI21X1 U188 ( .A(n129), .B(n130), .C(sr2_in[0]), .Y(n121) );
  OAI22X1 U189 ( .A(n14), .B(n305), .C(n30), .D(n306), .Y(n130) );
  OAI22X1 U190 ( .A(n46), .B(n303), .C(n62), .D(n304), .Y(n129) );
  NAND2X1 U191 ( .A(n131), .B(n132), .Y(sr1_out[6]) );
  OAI21X1 U192 ( .A(n133), .B(n134), .C(n80), .Y(n132) );
  OAI22X1 U193 ( .A(n23), .B(n309), .C(n39), .D(n310), .Y(n134) );
  OAI22X1 U194 ( .A(n55), .B(n307), .C(n71), .D(n308), .Y(n133) );
  OAI21X1 U195 ( .A(n135), .B(n136), .C(sr1_in[0]), .Y(n131) );
  OAI22X1 U196 ( .A(n15), .B(n309), .C(n31), .D(n310), .Y(n136) );
  OAI22X1 U197 ( .A(n47), .B(n307), .C(n63), .D(n308), .Y(n135) );
  NAND2X1 U198 ( .A(n137), .B(n138), .Y(sr2_out[6]) );
  OAI21X1 U199 ( .A(n139), .B(n140), .C(n83), .Y(n138) );
  OAI22X1 U200 ( .A(n23), .B(n305), .C(n39), .D(n306), .Y(n140) );
  OAI22X1 U201 ( .A(n55), .B(n303), .C(n71), .D(n304), .Y(n139) );
  OAI21X1 U202 ( .A(n141), .B(n142), .C(sr2_in[0]), .Y(n137) );
  OAI22X1 U203 ( .A(n15), .B(n305), .C(n31), .D(n306), .Y(n142) );
  OAI22X1 U204 ( .A(n47), .B(n303), .C(n63), .D(n304), .Y(n141) );
  NAND2X1 U205 ( .A(n143), .B(n144), .Y(sr1_out[5]) );
  OAI21X1 U206 ( .A(n145), .B(n146), .C(n80), .Y(n144) );
  OAI22X1 U207 ( .A(n24), .B(n309), .C(n40), .D(n310), .Y(n146) );
  OAI22X1 U208 ( .A(n56), .B(n307), .C(n72), .D(n308), .Y(n145) );
  OAI21X1 U209 ( .A(n147), .B(n148), .C(sr1_in[0]), .Y(n143) );
  OAI22X1 U210 ( .A(n16), .B(n309), .C(n32), .D(n310), .Y(n148) );
  OAI22X1 U211 ( .A(n48), .B(n307), .C(n64), .D(n308), .Y(n147) );
  NAND2X1 U212 ( .A(n149), .B(n150), .Y(sr2_out[5]) );
  OAI21X1 U213 ( .A(n151), .B(n152), .C(n83), .Y(n150) );
  OAI22X1 U214 ( .A(n24), .B(n305), .C(n40), .D(n306), .Y(n152) );
  OAI22X1 U215 ( .A(n56), .B(n303), .C(n72), .D(n304), .Y(n151) );
  OAI21X1 U216 ( .A(n153), .B(n154), .C(sr2_in[0]), .Y(n149) );
  OAI22X1 U217 ( .A(n16), .B(n305), .C(n32), .D(n306), .Y(n154) );
  OAI22X1 U218 ( .A(n48), .B(n303), .C(n64), .D(n304), .Y(n153) );
  NAND2X1 U219 ( .A(n155), .B(n156), .Y(sr1_out[4]) );
  OAI21X1 U220 ( .A(n157), .B(n158), .C(n80), .Y(n156) );
  OAI22X1 U221 ( .A(n25), .B(n309), .C(n41), .D(n310), .Y(n158) );
  OAI22X1 U222 ( .A(n57), .B(n307), .C(n73), .D(n308), .Y(n157) );
  OAI21X1 U223 ( .A(n159), .B(n160), .C(sr1_in[0]), .Y(n155) );
  OAI22X1 U224 ( .A(n17), .B(n309), .C(n33), .D(n310), .Y(n160) );
  OAI22X1 U225 ( .A(n49), .B(n307), .C(n65), .D(n308), .Y(n159) );
  NAND2X1 U226 ( .A(n161), .B(n162), .Y(sr2_out[4]) );
  OAI21X1 U227 ( .A(n163), .B(n164), .C(n83), .Y(n162) );
  OAI22X1 U228 ( .A(n25), .B(n305), .C(n41), .D(n306), .Y(n164) );
  OAI22X1 U229 ( .A(n57), .B(n303), .C(n73), .D(n304), .Y(n163) );
  OAI21X1 U230 ( .A(n165), .B(n166), .C(sr2_in[0]), .Y(n161) );
  OAI22X1 U231 ( .A(n17), .B(n305), .C(n33), .D(n306), .Y(n166) );
  OAI22X1 U232 ( .A(n49), .B(n303), .C(n65), .D(n304), .Y(n165) );
  NAND2X1 U233 ( .A(n167), .B(n168), .Y(sr1_out[3]) );
  OAI21X1 U234 ( .A(n169), .B(n170), .C(n80), .Y(n168) );
  OAI22X1 U235 ( .A(n26), .B(n309), .C(n42), .D(n310), .Y(n170) );
  OAI22X1 U236 ( .A(n58), .B(n307), .C(n74), .D(n308), .Y(n169) );
  OAI21X1 U237 ( .A(n171), .B(n172), .C(sr1_in[0]), .Y(n167) );
  OAI22X1 U238 ( .A(n18), .B(n309), .C(n34), .D(n310), .Y(n172) );
  OAI22X1 U239 ( .A(n50), .B(n307), .C(n66), .D(n308), .Y(n171) );
  NAND2X1 U240 ( .A(n173), .B(n174), .Y(sr2_out[3]) );
  OAI21X1 U241 ( .A(n175), .B(n176), .C(n83), .Y(n174) );
  OAI22X1 U242 ( .A(n26), .B(n305), .C(n42), .D(n306), .Y(n176) );
  OAI22X1 U243 ( .A(n58), .B(n303), .C(n74), .D(n304), .Y(n175) );
  OAI21X1 U244 ( .A(n177), .B(n178), .C(sr2_in[0]), .Y(n173) );
  OAI22X1 U245 ( .A(n18), .B(n305), .C(n34), .D(n306), .Y(n178) );
  OAI22X1 U246 ( .A(n50), .B(n303), .C(n66), .D(n304), .Y(n177) );
  NAND2X1 U247 ( .A(n179), .B(n180), .Y(sr1_out[2]) );
  OAI21X1 U248 ( .A(n181), .B(n182), .C(n80), .Y(n180) );
  OAI22X1 U249 ( .A(n27), .B(n309), .C(n43), .D(n310), .Y(n182) );
  OAI22X1 U250 ( .A(n59), .B(n307), .C(n75), .D(n308), .Y(n181) );
  OAI21X1 U251 ( .A(n183), .B(n184), .C(sr1_in[0]), .Y(n179) );
  OAI22X1 U252 ( .A(n19), .B(n309), .C(n35), .D(n310), .Y(n184) );
  OAI22X1 U253 ( .A(n51), .B(n307), .C(n67), .D(n308), .Y(n183) );
  NAND2X1 U254 ( .A(n185), .B(n186), .Y(sr2_out[2]) );
  OAI21X1 U255 ( .A(n187), .B(n188), .C(n83), .Y(n186) );
  OAI22X1 U256 ( .A(n27), .B(n305), .C(n43), .D(n306), .Y(n188) );
  OAI22X1 U257 ( .A(n59), .B(n303), .C(n75), .D(n304), .Y(n187) );
  OAI21X1 U258 ( .A(n189), .B(n190), .C(sr2_in[0]), .Y(n185) );
  OAI22X1 U259 ( .A(n19), .B(n305), .C(n35), .D(n306), .Y(n190) );
  OAI22X1 U260 ( .A(n51), .B(n303), .C(n67), .D(n304), .Y(n189) );
  NAND2X1 U261 ( .A(n191), .B(n192), .Y(sr1_out[1]) );
  OAI21X1 U262 ( .A(n193), .B(n194), .C(n80), .Y(n192) );
  OAI22X1 U263 ( .A(n28), .B(n309), .C(n44), .D(n310), .Y(n194) );
  OAI22X1 U264 ( .A(n60), .B(n307), .C(n76), .D(n308), .Y(n193) );
  OAI21X1 U265 ( .A(n195), .B(n196), .C(sr1_in[0]), .Y(n191) );
  OAI22X1 U266 ( .A(n20), .B(n309), .C(n36), .D(n310), .Y(n196) );
  OAI22X1 U267 ( .A(n52), .B(n307), .C(n68), .D(n308), .Y(n195) );
  NAND2X1 U268 ( .A(n197), .B(n198), .Y(sr2_out[1]) );
  OAI21X1 U269 ( .A(n199), .B(n200), .C(n83), .Y(n198) );
  OAI22X1 U270 ( .A(n28), .B(n305), .C(n44), .D(n306), .Y(n200) );
  OAI22X1 U271 ( .A(n60), .B(n303), .C(n76), .D(n304), .Y(n199) );
  OAI21X1 U272 ( .A(n201), .B(n202), .C(sr2_in[0]), .Y(n197) );
  OAI22X1 U273 ( .A(n20), .B(n305), .C(n36), .D(n306), .Y(n202) );
  OAI22X1 U274 ( .A(n52), .B(n303), .C(n68), .D(n304), .Y(n201) );
  NAND2X1 U275 ( .A(n203), .B(n204), .Y(sr1_out[0]) );
  OAI21X1 U276 ( .A(n205), .B(n206), .C(n80), .Y(n204) );
  OAI22X1 U277 ( .A(n29), .B(n309), .C(n45), .D(n310), .Y(n206) );
  OAI22X1 U278 ( .A(n61), .B(n307), .C(n77), .D(n308), .Y(n205) );
  OAI21X1 U279 ( .A(n207), .B(n208), .C(sr1_in[0]), .Y(n203) );
  OAI22X1 U280 ( .A(n21), .B(n309), .C(n37), .D(n310), .Y(n208) );
  OAI22X1 U283 ( .A(n53), .B(n307), .C(n69), .D(n308), .Y(n207) );
  NAND2X1 U286 ( .A(n209), .B(n210), .Y(sr2_out[0]) );
  OAI21X1 U287 ( .A(n211), .B(n212), .C(n83), .Y(n210) );
  OAI22X1 U288 ( .A(n29), .B(n305), .C(n45), .D(n306), .Y(n212) );
  OAI22X1 U289 ( .A(n61), .B(n303), .C(n77), .D(n304), .Y(n211) );
  OAI21X1 U290 ( .A(n213), .B(n214), .C(sr2_in[0]), .Y(n209) );
  OAI22X1 U291 ( .A(n21), .B(n305), .C(n37), .D(n306), .Y(n214) );
  OAI22X1 U294 ( .A(n53), .B(n303), .C(n69), .D(n304), .Y(n213) );
  INVX2 U297 ( .A(n295), .Y(n304) );
  INVX2 U298 ( .A(n296), .Y(n308) );
  AND2X2 U299 ( .A(n82), .B(n81), .Y(n295) );
  AND2X2 U300 ( .A(n79), .B(n78), .Y(n296) );
  INVX2 U301 ( .A(n299), .Y(n306) );
  INVX2 U302 ( .A(n301), .Y(n310) );
  INVX2 U303 ( .A(n297), .Y(n303) );
  INVX2 U304 ( .A(n298), .Y(n307) );
  INVX2 U305 ( .A(n300), .Y(n305) );
  INVX2 U306 ( .A(n302), .Y(n309) );
  INVX2 U307 ( .A(n101), .Y(n10) );
  INVX2 U308 ( .A(n84), .Y(n318) );
  INVX2 U309 ( .A(n95), .Y(n317) );
  INVX2 U310 ( .A(n97), .Y(n316) );
  INVX2 U311 ( .A(n102), .Y(n314) );
  AND2X2 U312 ( .A(sr2_in[1]), .B(n81), .Y(n297) );
  AND2X2 U313 ( .A(sr1_in[1]), .B(n78), .Y(n298) );
  AND2X2 U314 ( .A(sr2_in[2]), .B(n82), .Y(n299) );
  AND2X2 U315 ( .A(sr2_in[2]), .B(sr2_in[1]), .Y(n300) );
  AND2X2 U316 ( .A(sr1_in[2]), .B(n79), .Y(n301) );
  AND2X2 U317 ( .A(sr1_in[2]), .B(sr1_in[1]), .Y(n302) );
  BUFX2 U318 ( .A(clkb), .Y(n319) );
  BUFX2 U319 ( .A(clkb), .Y(n320) );
  BUFX2 U320 ( .A(clkb), .Y(n321) );
  BUFX2 U321 ( .A(clkb), .Y(n322) );
  BUFX2 U322 ( .A(clkb), .Y(n323) );
  INVX2 U323 ( .A(n99), .Y(n315) );
  INVX2 U324 ( .A(n104), .Y(n313) );
  INVX2 U325 ( .A(n106), .Y(n312) );
  INVX2 U326 ( .A(n108), .Y(n311) );
endmodule

