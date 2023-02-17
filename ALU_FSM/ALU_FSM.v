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
        pc_ctl_0_out,
        state_out
);

input wire clka, clkb, reset_in, n_dec_in, z_dec_in, p_dec_in
            n_alu_in, z_alu_in, p_alu_in, we_reg_in;
output wire pc_ctl_0_out;
output wire [2:0] state_out;

// States
parameter IDLE = 3'b000, P = 3'b001, Z = 3'b010, N = 3'b100;

wire       alpha, beta, gamma;
reg  [2:0] current_state, next_state;

// internal combo logic
assign state_out = current_state;
assign alpha     = n_alu_in & ~z_alu_in & ~p_alu_in & we_reg_in;
assign beta      = ~n_alu_in & z_alu_in & ~p_alu_in & we_reg_in;
assign gamma     = ~n_alu_in & ~z_alu_in & p_alu_in & we_reg_in;

always @(negedge clka) begin
    if (reset_in) begin
        next_state <= IDLE;
    end else begin
        case ({alpha, beta, gamma})
            N : next_state <= N;
            Z : next_state <= Z;
            P : next_state <= P;
            default: next_state <= IDLE;
        endcase
    end
end

always @(negedge clkb) begin
    current_state <= next_state;
    
end
    
endmodule