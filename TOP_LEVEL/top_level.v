module top_level (
    clka,
    clkb,
    reset,
    we_ins,
    load,
    reg_0_out,
);

//-----------------Inputs to processor-----------------//
input wire        clka, clkb, reset, we_ins;
input wire [15:0] load;

//---------------Outputs from processor----------------//
output wire [7:0] reg_0_out;

//-------------------Internal wires--------------------//
wire [15:0] instr;
wire [7:0]  sr1_out, sr2_out, reg_data_in;
wire [5:0]  immed, pc;
wire [2:0]  sr1_slt, sr2_slt, rd_slt;
wire        n_dec, z_dec, p_dec, n_alu, z_alu, p_alu, we_reg, br, pc_lat_clk;
wire [1:0]  alu_op, sslt, pc_ctl;

//---------------Module Instantiations-----------------//
DECODER decoder_m(  // TODO: need instruction mem
    .instruction(instr),
    .negative(n_dec),
    .zero(z_dec),
    .positive(p_dec),
    .we_reg(we_reg),
    .branch(br),
    .alu_op(alu_op),
    .ssel(sslt)
);

ALU_FSM alu_fsm_m(  // TODO: what about pc_ctl[1]??
    .clka(clka),
    .clkb(clkb),
    .reset_in(reset),
    .n_dec_in(n_dec),
    .z_dec_in(z_dec),
    .p_dec_in(p_dec),
    .n_alu_in(n_alu),
    .z_alu_in(z_alu),
    .p_alu_in(p_alu),
    .we_reg_in(we_reg),
    .br_in(br),
    .pc_ctl_0_out(pc_ctl[0]),
    .pc_latch_clkedge(pc_lat_clk)
);

ALU alu_m(  // TODO: Need PC
    .alu_op(alu_op),
    .source_sel(sslt),
    .ins_immediate(immed),  // TODO: How many bits is instruction immediate??
    .pc(pc),
    .reg_sr1_out(sr1_out),
    .reg_sr2_out(sr2_out),
    .negative(n_alu),
    .zero(z_alu),
    .positive(p_alu),
    .result(reg_data_in)
);

REGFILE regfile_m(  // TODO: Need to get signals for sr1in, sr2in, and rdin from decode
    .clka(clka),
    .clkb(clkb),
    .pc_latch_clk(pc_lat_clk),
    .reset_in(reset),
    .sr1_in(sr1_slt),
    .sr2_in(sr2_slt),
    .rd_in(rd_slt),
    .we_reg_in(we_reg),
    .data_in(reg_data_in),
    .sr1_out(sr1_out),
    .sr2_out(sr2_out),
    .reg0_out(reg_0_out)
);

PC pc_m(
    .clka(clka),
    .clkb(clkb),
    .pc_latch_data(pc_lat_clk),  // TODO: need to confirm connection
    .reset(reset),
    .imm(immed),
    .sr1_val(sr1_out),    // TODO: need to figure out the bits
    .pc_out(pc)
);

INSMEM insmem_m(
    .clka(clka),
    .clkb(clkb),
    .we_insmem(we_ins),
    .pc(pc),
    .instruction_in(load),
    .instruction_out(instr)
);

endmodule