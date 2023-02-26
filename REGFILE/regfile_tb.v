module regfile_tb();

reg     in_clka,
        in_clkb,
        pc_latch_clk,
        we_reg_in,
        reset_in;

reg [2:0] sr1_in,
          sr2_in,
          rd_in;
          
reg [7:0] data_in;

wire [7:0] sr1_out, sr2_out, reg0_out;

//create an FSM instance.
REGFILE regfile (
        .clka (in_clka),
        .clkb (in_clkb),
        .reset_in (reset_in),
        .pc_latch_clk (pc_latch_clk),
        .we_reg_in (we_reg_in),
        .sr1_in (sr1_in),
        .sr2_in (sr2_in),
        .rd_in (rd_in),
        .data_in (data_in),
        .sr1_out (sr1_out),
        .sr2_out (sr2_out),
        .reg0_out (reg0_out)
);

initial
begin

// cycle 0
reset_in = 1;
pc_latch_clk = 0;
we_reg_in = 0;
data_in = 0;
sr1_in = 0;
sr2_in = 0;
rd_in = 0;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 1
reset_in = 0;
pc_latch_clk = 0;
we_reg_in = 1;
data_in = 1;
sr1_in = 1;
sr2_in = 0;
rd_in = 1;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 2
reset_in = 0;
pc_latch_clk = 0;
we_reg_in = 1;
data_in = 2;
sr1_in = 1;
sr2_in = 2;
rd_in = 2;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 3
reset_in = 0;
pc_latch_clk = 0;
we_reg_in = 1;
data_in = 8;
sr1_in = 1;
sr2_in = 2;
rd_in = 0;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 3
reset_in = 0;
pc_latch_clk = 1;
we_reg_in = 1;
data_in = 3;
sr1_in = 3;
sr2_in = 2;
rd_in = 3;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 3
reset_in = 0;
pc_latch_clk = 0;
we_reg_in = 0;
data_in = 3;
sr1_in = 3;
sr2_in = 2;
rd_in = 3;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 3
reset_in = 0;
pc_latch_clk = 0;
we_reg_in = 1;
data_in = 10;
sr1_in = 1;
sr2_in = 2;
rd_in = 1;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 3
reset_in = 1;
pc_latch_clk = 1;
we_reg_in = 1;
data_in = 3;
sr1_in = 1;
sr2_in = 2;
rd_in = 3;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 3
reset_in = 0;
pc_latch_clk = 1;
we_reg_in = 1;
data_in = 3;
sr1_in = 1;
sr2_in = 2;
rd_in = 3;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;


$dumpfile ("regfile_tb.vcd"); 
$dumpvars; 
// $display ("in_clka, \t in_clkb, \t reset_in, \t in_load, \t in_not, \t in_data, \t out_data, \t out_state");

    
$stop;
end 

endmodule
