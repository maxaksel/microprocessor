/*
* PC Module
*/

module PC(clka, clkb, reset, pc_latch_data, pc_ctl, imm, sr1_val, pc_out);
        //module param
        parameter PC_BITS = 6; // 64 bytes of memory (32 words)
        
        input clka; // clock a in
        input clkb; // clock b in
        input reset; // reset signal in
        input pc_latch_data; // signal from FSM in
        input [1:0] pc_ctl; // decides next pc source
        input [PC_BITS - 1:0] imm; // immediate input 
        input [PC_BITS - 1:0] sr1_val; // input value from source reg 1

        // output wire
        output wire [PC_BITS - 1:0] pc_out;
        //wire [PC_BITS - 1:0] pc_out;

        

        //internal signals
        reg [PC_BITS - 1:0] pc_reg;
        reg reset_latch;
        reg pc_latch_data_latch;
        reg [1:0] pc_ctl_latch;
        reg [PC_BITS - 1:0] imm_latch; 
        reg [PC_BITS - 1:0] sr1_val_latch; 
        reg [PC_BITS - 1:0] pc_plus_imm; // comb
        reg [PC_BITS - 1:0] pc_plus_2; // comb
        reg [PC_BITS - 1:0] next_pc; // comb
        
        // output assignment
        assign pc_out = pc_reg;
        
        // latch on clka
        always @(negedge clka) begin // latch on clka
                reset_latch <= reset;
                pc_latch_data_latch <= pc_latch_data;
                pc_ctl_latch <= pc_ctl;
                imm_latch <= imm;
                sr1_val_latch <= sr1_val;
        end

        // adders - allow to propagate between a and b
        always @(*) begin
                pc_plus_imm = pc_reg + imm_latch;
                pc_plus_2 = pc_reg + 2;
        end

        // mux - allow to propagate between a and b
        always @(*) begin
                if (reset_latch == 1'b1)begin
                        next_pc = 0;
                end else if (pc_latch_data_latch == 1'b1) begin
                        case (pc_ctl_latch)
                                2'b01 : next_pc = pc_plus_imm;
                                2'b10 : next_pc = sr1_val_latch[PC_BITS - 1:0];
                                default : next_pc = pc_plus_2;
                        endcase
                end else begin
                        next_pc = pc_reg;
                end
        end

        // update pc reg on clk b
        always @(negedge clkb) begin // update PC reg
                pc_reg <= next_pc;
        end 



endmodule