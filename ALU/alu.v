/* ALU Module
 * @date 2/21/2023
 */

module ALU (alu_op, source_sel, ins_immediate, pc, reg_sr1_out, reg_sr2_out, negative, zero, positive, result);
    input wire [1:0] alu_op;
    input wire [1:0] source_sel;
    input wire [5:0] ins_immediate;
    input wire [5:0] pc; // PC is six bits
    input wire [7:0] reg_sr1_out;
    input wire [7:0] reg_sr2_out;

    output reg result[7:0];
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
            result <= reg_sr1_out + {3'b000, ins_immediate[4:0]};
          end
        ADD: begin
            result <= reg_sr1_out + reg_sr2_out;
          end
        ANDI: begin
            result <= reg_sr1_out & {3'b000, ins_immediate[4:0]};
          end
        AND: begin
            result <= reg_sr1_out & reg_sr2_out;
          end
        NOTI: begin
            result <= ~{3'b000, ins_immediate[4:0]};
          end
        NOT: begin
            result <= ~reg_sr1_out;
          end
        LEA: begin
            result <= {2'b00, pc + ins_immediate};
          end
        default: begin
            result <= 8'b00000000; // should never happen
          end
      endcase
    end

endmodule
