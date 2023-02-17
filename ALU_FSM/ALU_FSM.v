module ALU_FSM (
        clka,
        clkb,
        reset_in,
        n_dec_in,
        z_dec_in,
        p_dec_in,
        n_alu_in,
        z_alu_in,
        p_alu_in,
        we_reg_in,
        pc_ctl_0_out
);

input wire clka, clkb, reset_in, n_dec_in, z_dec_in, p_dec_in
            n_alu_in, z_alu_in, p_alu_in, we_reg_in;
output wire pc_ctl_0_out;

// States
parameter IDLE = 3'b000, P = 3'b001, Z = 3'b010, N = 3'b100;

wire alpha, beta, gamma;

// internal combo logic
assign alpha = ~reset_in & n_alu_in & ~z_alu_in & ~p_alu_in & we_reg_in;
assign beta  = ~reset_in & ~n_alu_in & z_alu_in & ~p_alu_in & we_reg_in;
assign gamma = ~reset_in & ~n_alu_in & ~z_alu_in & p_alu_in & we_reg_in;


    
endmodule