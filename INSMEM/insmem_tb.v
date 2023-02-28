`timescale 1ns/100ps

module insmem_tb();
        parameter PC_BITS = 6;

        reg clka;
        reg clkb;
        reg we_insmem;
        reg [PC_BITS - 1:0] pc;
        reg [15:0] instruction_in;
        wire [15:0] instruction_out;
        integer i;

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
                        instruction_in = 0;

                        clka = 0; clkb = 0; #10;
                        clka = 1; clkb = 0; #10;
                        clka = 0; clkb = 0; #10;
                        clka = 0; clkb = 1; #10;

                        we_insmem = 1;


                        for (i = 0; i < 2** PC_BITS; i = i + 2) begin
                                pc = i;
                                instruction_in = i;

                                clka = 0; clkb = 0; #10;
                                clka = 1; clkb = 0; #10;
                                clka = 0; clkb = 0; #10;
                                clka = 0; clkb = 1; #10;

                                clka = 0; clkb = 0; #10;
                                clka = 1; clkb = 0; #10;
                                clka = 0; clkb = 0; #10;
                                clka = 0; clkb = 1; #10;

                        end

                        we_insmem = 0;

                        for (i = 0; i < 2** PC_BITS; i = i + 2) begin
                                pc = i;
                                instruction_in = 2**PC_BITS + 1;

                                clka = 0; clkb = 0; #10;
                                clka = 1; clkb = 0; #10;
                                clka = 0; clkb = 0; #10;
                                clka = 0; clkb = 1; #10;

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