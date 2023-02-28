/* Decoder Module
 *
 * This module takes in a 16-bit instruction and determines whether the
 * register file should be written to (we_reg), a branch is taken (branch),
 * which ALU operation is to be performed (alu_op), and the branch condition
 * (negative result, zero result, positive result, combination result).
 *
 * @date 2/26/2023
 */

module decoder (instruction, negative, zero, positive, we_reg, branch, alu_op, ssel, sr1, sr2, dr, pc_ctrl_1);
    input wire [15:0] instruction;

    output wire [1:0] alu_op;
    output reg  [1:0] ssel;
    output wire       we_reg;
    output wire       branch;
    output wire       negative, zero, positive;
    output wire [2:0] sr1;
    output wire [2:0] sr2;
    output wire [2:0] dr;
    output wire       pc_ctrl_1;

    parameter ADD = 4'b0001;
    parameter NOT = 4'b1001;
    parameter AND = 4'b0101;
    parameter JMP = 4'b1100;
    parameter LEA = 4'b1110;
    parameter BR  = 4'b0000;

    assign negative = instruction[11];
    assign zero     = instruction[10];
    assign positive = instruction[9];

    assign branch      = (instruction[15:12] == BR);
    assign we_reg      = (instruction[15:12] == LEA || instruction[13:12] == 2'b01); // AND, NOT, ADD opcodes are xx01
    assign alu_op      = instruction[15:14]; // only matters if we_reg is 1
    assign pc_ctrl_1   = (instruction[15:12] == JMP);

    assign sr1      = instruction[8:6];
    assign sr2      = instruction[2:0];
    assign dr       = instruction[11:9];

    always @(*) begin
        if (instruction[5] == 1'b1 && instruction[13:12] == 2'b01) ssel <= 2'b00; // select sign-extended immediate
        else if (instruction[15:12] == LEA) ssel <= 2'b01; // select current PC value
        else ssel <= 2'b10; // select output from sr2 in general purpose register file
    end

endmodule
