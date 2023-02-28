`timescale 1ns/100ps

module toplevel_testbench();
        reg clka;
        reg clkb;
        reg reset;
        reg we_ins;
        reg [15:0] instruction_load;
        wire [7:0] reg_0_out;


        top_level my_toplevel(  .clka(clka),
                                .clkb(clkb),
                                .reset(reset),
                                .we_ins(we_ins),
                                .load(instruction_load),
                                .reg_0_out(reg_0_out));

        initial begin'

                reset = 0;
                we_ins = 0;
                instruction_load = 0;

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                reset = 1; //assert reset

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                reset = 0; //deassert reset
                we_ins = 1;
                instruction_load = 16'b0001000000101000; // PC = 0

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                instruction_load = 16'b0001001001100001; // PC = 2

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                instruction_load = 16'b1001001001000000; // PC = 4

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                instruction_load = 16'b0001001001100001; // PC = 6

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                instruction_load = 16'b0001000000000001; // PC = 8

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                instruction_load = 16'b0000001000111110; // PC = 10

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                instruction_load = 16'b0; // PC = 12, NOP

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                reset = 1;
                we_ins = 0; // deassert we_ins

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                reset = 0; //reset done, start of PC = 0

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                // PC = 2

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                // PC = 4

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                // PC = 6

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                // PC = 8

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                // PC = 10

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                // PC = 8

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                // PC = 10

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                // PC = 8

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                // PC = 10

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                clka = 0; clkb = 0; #10;
                clka = 1; clkb = 0; #10;
                clka = 0; clkb = 0; #10;
                clka = 0; clkb = 1; #10;

                // STOP, loop should still be in progress here
                

                $dumpfile ("toplelevel_testbench.vcd");
                $dumpvars;
                $stop;


        end

        













endmodule