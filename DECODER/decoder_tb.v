`timescale 1ns/100ps

module decoder_tb();

reg         [15:0] instruction;
wire [1:0]  alu_op;
wire [1:0]  ssel;
wire [2:0]  sr1;
wire [2:0]  sr2;
wire [2:0]  dr;
wire        we_reg;
wire        branch;
wire        negative, zero, positive;

decoder decode (
  .instruction(instruction),
  .negative(negative),
  .zero(zero),
  .positive(positive),
  .we_reg(we_reg),
  .branch(branch),
  .alu_op(alu_op),
  .ssel(ssel),
  .sr1(sr1),
  .sr2(sr2),
  .dr(dr),
  .pc_ctrl_1(pc_ctrl_1)
); // create decoder instance

initial
    begin
    // Test #1: brn #(-1)
    instruction = 16'b0000100000111111;
    #10;

    // Test #2: brp #(-1)
    instruction = 16'b0000001000111111;
    #10;

    // Test #3: brz #(-1)
    instruction = 16'b0000010000111111;
    #10;

    // Test #4: brnzp #(-1)
    instruction = 16'b0000111000111111;
    #10;

    // Test #5: jmp $4
    instruction = 16'b1100000100000000;
    #10;

    // Test #6: add $2 $2 $4
    instruction = 16'b0001010010000100;
    #10;

    // Test #7: addi $3 $2 #7
    instruction = 16'b0001011010100111;
    #10;

    // Test #8: not $1, $2
    instruction = 16'b1001001010000000;
    #10;

    // Test #9: noti $1 #(3)
    instruction = 16'b1001010000100011;
    #10;

    // Test #10: and $2 $3 $4
    instruction = 16'b0101010011000100;
    #10;

    // Test #11: andi $2 $3 #(4)
    instruction = 16'b0101010011100100;
    #10;

    // Test #12: lea $2 #(2)
    instruction = 16'b1110010000000010;
    #10;

    $dumpfile ("decoder_tb.vcd");
    $dumpvars;
    $stop;
  end
endmodule
