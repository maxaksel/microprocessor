module alu_fsm_tb();

reg     in_clka,
        in_clkb,
        reset_in,
        n_dec_in,
        z_dec_in,
        p_dec_in,
        n_alu_in,
        z_alu_in,
        p_alu_in,
        we_reg_in,
        br_in;

wire [2:0] state_out;
wire pc_ctl_0_out;

//create an FSM instance.
ALU_FSM fsm (
        .clka (in_clka),
        .clkb (in_clkb),
        .reset_in (reset_in),
        .n_dec_in (n_dec_in),
        .z_dec_in (z_dec_in),
        .p_dec_in (p_dec_in),
        .n_alu_in (n_alu_in),
        .z_alu_in (z_alu_in),
        .p_alu_in (p_alu_in),
        .we_reg_in (we_reg_in),
        .br_in (br_in),
        .pc_ctl_0_out (pc_ctl_0_out),
        .state_out (state_out)
);

initial
begin

// cycle 0
reset_in = 1;
n_dec_in = 0;
z_dec_in = 0;
p_dec_in = 0;
n_alu_in = 0;
z_alu_in = 0;
p_alu_in = 0;
we_reg_in = 0;
br_in = 0;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 1
reset_in = 0;
n_dec_in = 1;
z_dec_in = 0;
p_dec_in = 0;
n_alu_in = 1;
z_alu_in = 0;
p_alu_in = 0;
we_reg_in = 1;
br_in = 1;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 2
reset_in = 0;
n_dec_in = 1;
z_dec_in = 0;
p_dec_in = 0;
n_alu_in = 1;
z_alu_in = 0;
p_alu_in = 0;
we_reg_in = 1;
br_in = 1;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 3
reset_in = 0;
n_dec_in = 1;
z_dec_in = 0;
p_dec_in = 0;
n_alu_in = 0;
z_alu_in = 1;
p_alu_in = 0;
we_reg_in = 1;
br_in = 1;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 3
reset_in = 0;
n_dec_in = 0;
z_dec_in = 1;
p_dec_in = 0;
n_alu_in = 0;
z_alu_in = 0;
p_alu_in = 1;
we_reg_in = 1;
br_in = 1;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 3
reset_in = 0;
n_dec_in = 0;
z_dec_in = 0;
p_dec_in = 1;
n_alu_in = 0;
z_alu_in = 0;
p_alu_in = 0;
we_reg_in = 1;
br_in = 1;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 3
reset_in = 0;
n_dec_in = 0;
z_dec_in = 1;
p_dec_in = 0;
n_alu_in = 0;
z_alu_in = 1;
p_alu_in = 0;
we_reg_in = 1;
br_in = 0;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 3
reset_in = 0;
n_dec_in = 0;
z_dec_in = 0;
p_dec_in = 0;
n_alu_in = 0;
z_alu_in = 0;
p_alu_in = 0;
we_reg_in = 0;
br_in = 0;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 3
reset_in = 1;
n_dec_in = 0;
z_dec_in = 0;
p_dec_in = 0;
n_alu_in = 0;
z_alu_in = 0;
p_alu_in = 0;
we_reg_in = 0;
br_in = 0;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 3
reset_in = 0;
n_dec_in = 0;
z_dec_in = 0;
p_dec_in = 0;
n_alu_in = 1;
z_alu_in = 1;
p_alu_in = 0;
we_reg_in = 1;
br_in = 0;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 3
reset_in = 0;
n_dec_in = 0;
z_dec_in = 0;
p_dec_in = 0;
n_alu_in = 0;
z_alu_in = 1;
p_alu_in = 1;
we_reg_in = 1;
br_in = 1;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 3
reset_in = 0;
n_dec_in = 1;
z_dec_in = 0;
p_dec_in = 0;
n_alu_in = 1;
z_alu_in = 1;
p_alu_in = 1;
we_reg_in = 1;
br_in = 1;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;


$dumpfile ("alu_fsm_tb.vcd"); 
$dumpvars; 
// $display ("in_clka, \t in_clkb, \t reset_in, \t in_load, \t in_not, \t in_data, \t out_data, \t out_state");

    
$stop;
end 

endmodule
