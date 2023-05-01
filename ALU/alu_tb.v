`timescale 1ns/100ps

module alu_tb();

reg [1:0] alu_op;
reg [2:0] source_sel;
reg [5:0] ins_immediate;
reg [5:0] pc;
reg [7:0] reg_sr1_out;
reg [7:0] reg_sr2_out;
wire negative, zero, positive;
wire [7:0] result;

ALU alu (
  .alu_op(alu_op),
  .source_sel(source_sel),
  .ins_immediate(ins_immediate),
  .pc(pc),
  .reg_sr1_out(reg_sr1_out),
  .reg_sr2_out(reg_sr2_out),
  .negative(negative),
  .zero(zero),
  .positive(positive),
  .result(result)
); // create ALU instance

initial
    begin
    // Test Case 1 -- addi (result=74-12=40=0x28)
    alu_op = 2'b00;
    source_sel = 2'b00;
    ins_immediate = 6'b010100; // 5-bit immediate is -12
    pc = 6'b011100;
    reg_sr1_out = 8'b00110100; // decimal: 52
    reg_sr2_out = 8'b01001010; // decimal: 74
    #10;



    // Test Case 2 -- add (result=52+74=126=0x7E)
    alu_op = 2'b00;
    source_sel = 2'b10;
    ins_immediate = 6'b010100;
    pc = 6'b011100;
    reg_sr1_out = 8'b00110100; // decimal: 52
    reg_sr2_out = 8'b01001010; // decimal: 74
    #10;

    // Test Case 3 -- addi (result=1-1=-1=0xfFF) test N flag
    alu_op = 2'b00;
    source_sel = 2'b10;
    ins_immediate = 6'b010100;
    pc = 6'b011100;
    reg_sr1_out = 8'b00000000; // decimal: 0
    reg_sr2_out = 8'b11111111; // decimal: -1
    #10;

    // Test Case 4 -- addi (result=1-1=0=0x00) test 0 flag
    alu_op = 2'b00;
    source_sel = 2'b10;
    ins_immediate = 6'b010100;
    pc = 6'b011100;
    reg_sr1_out = 8'b00000001; // decimal: 1
    reg_sr2_out = 8'b11111111; // decimal: -1
    #10;





    // Test Case 5 -- not (result=11001011=0xCB)
    alu_op = 2'b10;
    source_sel = 2'b10;
    ins_immediate = 6'b010100;
    pc = 6'b011100;
    reg_sr1_out = 8'b00110100;
    reg_sr2_out = 8'b01001010;
    #10;

    // Test Case 6 -- noti (result=00001011=0x0B)
    alu_op = 2'b10;
    source_sel = 2'b00;
    ins_immediate = 6'b010100; // not of 11110100
    pc = 6'b011100;
    reg_sr1_out = 8'b00110100;
    reg_sr2_out = 8'b01001010;
    #10;

    // Test Case 7 -- and (result=00000000=0x00)
    alu_op = 2'b01;
    source_sel = 2'b10;
    ins_immediate = 6'b010100;
    pc = 6'b011100;
    reg_sr1_out = 8'b00110100;
    reg_sr2_out = 8'b01001010;
    #10;

    // Test Case 8 -- andi (result=00110100=0x34)
    alu_op = 2'b01;
    source_sel = 2'b00;
    ins_immediate = 6'b010100; // 11110100
    pc = 6'b011100;
    reg_sr1_out = 8'b00110100;
    reg_sr2_out = 8'b01001010;
    #10;

    // Test Case 9 -- lea (result=00110000=0x30)
    alu_op = 2'b00;
    source_sel = 2'b01;
    ins_immediate = 6'b010100; // decimal: 20
    pc = 6'b011100; // decimal: 28
    reg_sr1_out = 8'b00110100;
    reg_sr2_out = 8'b01001010;
    #10;

    $dumpfile ("alu_tb.vcd");
    $dumpvars;
    $stop;
  end
endmodule
