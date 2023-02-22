module alu_tb();

wire [2:0] alu_op;
wire [2:0] source_sel;
wire [5:0] ins_immediate;
wire [5:0] pc;
wire [7:0] reg_sr1_out;
wire [7:0] reg_sr2_out;
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
    // Test Case 1 -- addi
    alu_op = 2'b00;
    source_sel = 2'b00;
    ins_immediate = 6'b010100;
    pc = 6'b011100;
    reg_sr1_out = 8'b00110100; // decimal:
    reg_sr2_out = 8'b01001010; // decimal: 
    #10;


    $dumpfile ("alu_tb.vcd");
    $dumpvars;
    $stop;
  end
endmodule
