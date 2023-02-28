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

                $dumpfile ("toplelevel_testbench.vcd");
                $dumpvars;
                $stop;


        end

        













endmodule