`timescale 1ns/100ps

module pc_tb()

        parameter PC_BITS = 6;

        reg clka;
        reg clkb;
        reg reset;
        reg pc_latch_data;
        reg [1:0] pc_ctl;
        reg [PC_BITS - 1: 0] imm;
        reg [7:0] sr1_val;
        integer i; // counter

        wire pc_out;

        PC my_pc(
                .clka(clka), 
                .clkb(clkb), 
                .reset(reset), 
                .pc_latch_data(pc_latch_data), 
                .pc_ctl(pc_ctl), 
                .imm(imm), 
                .sr1_val(sr1_val), 
                .pc_out(pc_out));



        initial begin

                reset = 0;
                pc_latch_data = 0;
                pc_ctl = 0;
                imm = 0;
                sr1_val = 0;

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;
                
                reset = 1;

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                for (i = 2; i < PC_BITS ** 2; i = i + 2) begin
                        
                        clka = 0; clkb = 0; #10;
                        clka = 1; clkb = 0; #10;
                        clka = 0; clkb = 0; #10;
                        clka = 0; clkb = 1; #10;

                end


                $dumpfile ("insmem_tb.vcd");
                $dumpvars;
                $stop;


        end




endmodule