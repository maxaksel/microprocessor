/* ALU Module
 *
 * Supports AND, NOT, and ADD instructions. First argument always comes from
 * general purpose register file while second argument can be either an
 * immediate operand, the PC, or another register.
 *
 * @date 2/26/2023
 */

module ALU (alu_op, source_sel, ins_immediate, pc, reg_sr1_out, reg_sr2_out, negative, zero, positive, result);
    input wire [1:0] alu_op;
    input wire [1:0] source_sel;
    input wire [5:0] ins_immediate;
    input wire [5:0] pc; // PC is six bits
    input wire [7:0] reg_sr1_out;
    input wire [7:0] reg_sr2_out;

    output reg [7:0] result;
    output wire negative, zero, positive;

    parameter ADDI = 4'b0000;
    parameter ADD  = 4'b0010;
    parameter LEA  = 4'b0001;
    parameter ANDI = 4'b0100;
    parameter AND  = 4'b0110;
    parameter NOTI = 4'b1000;
    parameter NOT  = 4'b1010;

    assign negative = (result <  0);
    assign zero = (result == 0);
    assign positive = (result > 0);

    always @(*) begin
      case ({alu_op, source_sel})
        ADDI: begin
            result <= reg_sr1_out + {ins_immediate[4], ins_immediate[4], ins_immediate[4], ins_immediate[4:0]};
          end
        ADD: begin
            result <= reg_sr1_out + reg_sr2_out;
          end
        ANDI: begin
            result <= reg_sr1_out & {ins_immediate[4], ins_immediate[4], ins_immediate[4], ins_immediate[4:0]};
          end
        AND: begin
            result <= reg_sr1_out & reg_sr2_out;
          end
        NOTI: begin
            result <= ~{ins_immediate[4], ins_immediate[4], ins_immediate[4], ins_immediate[4:0]};
          end
        NOT: begin
            result <= ~reg_sr1_out;
          end
        LEA: begin
            result <= {ins_immediate[5], ins_immediate[5], pc + ins_immediate}; // immediate for LEA is 6 bits
          end
        default: begin
            result <= 8'b00000000; // output does not matter here
          end
      endcase
    end

endmodule
