`timescale 1ns/100ps

module insmem_tb();
        reg clka;
        reg clkb;
        reg we_insmem;
        reg [PC_BITS - 1:0] pc;
        reg [15:0] instruction_in;
        wire [15:0] instruction_out;

        INSMEM my_insmem( // declare module
                .clka(clka),
                .clkb(clkb),
                .we_insmem(we_insmem),
                .pc(pc),
                .instruction_in(instruction_in),
                .instruction_out(instruction_out));




                initial begin

                        we_insmem = 0;
                        pc = 0;
                        instruction_in = 0;

                        clka = 0; clkb = 0; #10;
                        clka = 1; clkb = 0; #10;
                        clka = 0; clkb = 0; #10;
                        clka = 0; clkb = 1; #10;

                        we_insmem = 1;
                        pc = 0;
                        instruction_in = 1;

                        clka = 0; clkb = 0; #10;
                        clka = 1; clkb = 0; #10;
                        clka = 0; clkb = 0; #10;
                        clka = 0; clkb = 1; #10;

                        we_insmem = 0;
                        pc = 0;
                        instruction_in = 1;

                        clka = 0; clkb = 0; #10;
                        clka = 1; clkb = 0; #10;
                        clka = 0; clkb = 0; #10;
                        clka = 0; clkb = 1; #10;

                        


                        $dumpfile ("insmem_tb.vcd");
                        $dumpvars;
                        $stop;



                end





        parameter PC_BITS 6;







endmodule