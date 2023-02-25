module INSMEM(clka, clkb, we_insmem, pc, instruction_in, instruction_out);
        input clka;
        input clkb;
        input we_insmem;
        input [PC_BITS - 1:0] pc;
        input [15:0] instruction_in;
        output [15:0] instruction_out;

        parameter PC_BITS = 6; // number of bits in PC, decides size of memory array

        reg [15:0] instruction_out;
        reg [15:0] instruction_in_latch;
        reg we_insmem_latch;
        reg [PC_BITS - 1:0] pc_latch;
        reg [15:0] insmem_regs [(2 ** PC_BITS) - 2 : 0]; // 2**PC_BITS array of memory

        always @(*) begin
                if (we_insmem) begin
                        instruction_out = 16'b0;
                end else begin
                        instruction_out = insmem_regs[pc[PC_BITS - 1:1]]; // discard lsb of PC
                end
        end


        always @(negedge clka) begin
                we_insmem_latch <= we_insmem;
                instruction_in_latch <= instruction_in;
                pc_latch <= pc;
        end


        always @(negedge clkb) begin
                for (i = 0; i < (2** (PC_BITS - 1)); i  = i + 1) begin
                        if (we_insmem_latch == 1'b1 && pc_latch[PC_BITS - 1:1] == i) begin // discard lsb of PC
                                insmem_regs[i] <= instruction_in_latch;
                        end
                        else begin
                                insmem_regs[i] <= insmem_regs[i];
                        end
                end
        end


endmodule