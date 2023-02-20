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
        state_out,);

    input wire clka, clkb, reset_in, n_dec_in, z_dec_in, p_dec_in,
                n_alu_in, z_alu_in, p_alu_in, we_reg_in, br_in;
    output reg pc_ctl_0_out;
    output wire [2:0] state_out;

    // States
    parameter IDLE = 3'b000, P = 3'b001, Z = 3'b010, N = 3'b100;


    wire        alpha, beta, gamma;
    reg  [2:0]  current_state, next_state;
    reg         we_latch, reset_latch, br_latch;
    reg [2:0]   dec_in_latch;
    wire [2:0]  br_curr_state, br_next_state;

    // internal combo logic
    assign state_out = current_state;
    assign alpha     = n_alu_in & ~z_alu_in & ~p_alu_in & we_reg_in;
    assign beta      = ~n_alu_in & z_alu_in & ~p_alu_in & we_reg_in;
    assign gamma     = ~n_alu_in & ~z_alu_in & p_alu_in & we_reg_in;
    assign br_curr_state = current_state & dec_in_latch;
    assign br_next_state = next_state & dec_in_latch;

    // State update logic
    always @(negedge clka) begin
        we_latch <= we_reg_in;
        reset_latch <= reset_in;
        br_latch <= br_in;
        dec_in_latch <= {n_dec_in, z_dec_in, p_dec_in};
        case ({alpha, beta, gamma})
            N : next_state <= N;
            Z : next_state <= Z;
            P : next_state <= P;
            default: next_state <= IDLE;
        endcase
    end

    // State output logic
    always @(negedge clkb) begin
        if (reset_latch == 1'b1) begin
            current_state <= IDLE;
            pc_ctl_0_out <= 1'b0;
        end else if (we_latch == 1'b1) begin
            current_state <= next_state;
            pc_ctl_0_out <= (|br_next_state) && br_latch;
        end else begin
            current_state <= current_state;
            pc_ctl_0_out <= (|br_curr_state) && br_latch;
        end
    end
    
endmodule