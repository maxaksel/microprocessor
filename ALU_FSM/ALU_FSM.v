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
        br_in,
        pc_ctl_0_out,
        pc_update_clkedge,
        state_out);

    input wire clka, clkb, reset_in, n_dec_in, z_dec_in, p_dec_in,
                n_alu_in, z_alu_in, p_alu_in, we_reg_in, br_in;
    output reg pc_ctl_0_out;
    output wire pc_update_clkedge;
    output wire [3:0] state_out;

    // States
    parameter IDLE_PC = 4'b0000, P_PC = 4'b0001, Z_PC = 4'b0010, N_PC = 4'b0100;
    parameter IDLE_NPC = 4'b1000, P_NPC = 4'b1001, Z_NPC = 4'b1010, N_NPC = 4'b1100;


    wire        alpha, beta, gamma;
    reg  [3:0]  current_state, next_state;
    reg         we_latch, reset_latch, br_latch;
    reg pc_update;
    reg [2:0]   dec_in_latch;
    wire [2:0]  br_curr_state, br_next_state;

    // internal combo logic
    assign pc_update_clkedge = pc_update;
    assign state_out = {pc_update_clkedge, current_state};
    assign alpha     = n_alu_in & ~z_alu_in & ~p_alu_in & we_reg_in;
    assign beta      = ~n_alu_in & z_alu_in & ~p_alu_in & we_reg_in;
    assign gamma     = ~n_alu_in & ~z_alu_in & p_alu_in & we_reg_in;
    assign br_curr_state = current_state[2:0] & dec_in_latch;
    assign br_next_state = next_state[2:0] & dec_in_latch;

    // State update logic
    always @(negedge clka) begin

        we_latch <= we_reg_in;
        reset_latch <= reset_in;
        br_latch <= br_in;
        dec_in_latch <= {n_dec_in, z_dec_in, p_dec_in};
        case ({alpha, beta, gamma})
            N : next_state <= N_PC;
            Z : next_state <= Z_PC;
            P : next_state <= P_PC;
            default: next_state <= IDLE_PC;
        endcase
    end

    // State output logic
    always @(negedge clkb) begin
        if (reset_latch == 1'b1) begin
            current_state <= IDLE_NPC;
            pc_ctl_0_out <= 1'b0;
        end else if (we_latch == 1'b1) begin
            if (current_state[3] == 1'b1) begin
                current_state <= next_state;
                pc_ctl_0_out <= (|br_next_state) && br_latch;
            end else begin
                current_state <= {1'b0, current_state[2:0]};
            end
        end else begin
            if (current_state[3] == 1'b1) begin
                current_state <= {1'b1, current_state[2:0]};
                pc_ctl_0_out <= (|br_curr_state) && br_latch;
            end else begin
                current_state <= {1'b0, current_state[2:0]};
            end
            
        end
    end
    
endmodule