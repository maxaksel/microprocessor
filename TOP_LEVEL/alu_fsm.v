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
        pc_latch_clkedge,
        state_out);

    input wire clka, clkb, reset_in, n_dec_in, z_dec_in, p_dec_in,
                n_alu_in, z_alu_in, p_alu_in, we_reg_in, br_in;
    output reg pc_ctl_0_out;
    output wire pc_latch_clkedge;
    output wire [3:0] state_out;



/**
This FSM has a total of 8 states. It has two states for each ALU State
The ALU state can be IDLE, P, N, or Z. Each of these states has a corresponding
bit (the MSB of state) that reresents whether the PC should latch output values
on this clock cycle or whether it should hold.

The PC updates itself on the NPC Cycles, which causes the Insmem to output new data,
the decode to output new reg addresses, the ALU to output new data. 

All of this should then be latched by the FSM on the next clkedge (when curr_state)
is an NPC value. Then the FSM should update the state (including switching to a PC state)
and output that on the edge of clkb

Then the next clka will cause the PC to latch the values from the FSM, perform its internal computations
and update its output value on the next clkb. This means each instruction takes 2 cycles. 

Also note, since all combinational modules latch their value on the edge of clka,
this means the regfile should latch the ALU output on the same edge that the PC latches
FSM outputs.

Overall, this means that the ALU only has a single cycle to compute its result 
since both the regfile and the fsm need its output by the first negedge of clka
after the pc switches values (which is on the negedge of clkb)


CHANGES TO THE STATE MACHINE AND BLOCK DIAGRAM:
As of now (8:46 AM, Wednesday Feb 22), the block diagram does not exactly 
reflect this architecture. The block diagram should reflect the extra signal
out from the FSM. This signal should be routed both to the PC Module as well as
to the Regfile, since both of them are sequential modules with latches. 
**/


    // States
    parameter IDLE_PC = 4'b0000, P_PC = 4'b0001, Z_PC = 4'b0010, N_PC = 4'b0100;
    parameter IDLE_NPC = 4'b1000, P_NPC = 4'b1001, Z_NPC = 4'b1010, N_NPC = 4'b1100;


    wire        alpha, beta, gamma;
    reg  [3:0]  current_state, next_state;
    reg         we_latch, reset_latch, br_latch;
    reg [2:0]   dec_in_latch;
    wire [2:0]  br_curr_state, br_next_state;

    // internal combo logic
    assign pc_latch_clkedge = ~current_state[3]; // this should update on negedge of a PC state
    assign state_out = current_state;
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
            3'b100 : next_state <= N_PC;
            3'b010 : next_state <= Z_PC;
            3'b001 : next_state <= P_PC;
            default: next_state <= IDLE_PC;
        endcase
    end

    // State output logic
    always @(negedge clkb) begin
        if (reset_latch == 1'b1) begin
            current_state <= IDLE_NPC; //  reset to cycle that doesn't update PC so instruction 0 has time to propagate
            pc_ctl_0_out <= 1'b0;
        end else if (we_latch == 1'b1) begin
            if (current_state[3] == 1'b1) begin // if on a NPC Cycle, go to a PC Cycle
                current_state <= next_state;
                pc_ctl_0_out <= (|br_next_state) && br_latch;
            end else begin
                current_state <= {1'b1, current_state[2:0]};
            end
        end else begin
            if (current_state[3] == 1'b1) begin // if an NPC Cycle, go to a PC Cycle
                current_state <= {1'b0, current_state[2:0]};
                pc_ctl_0_out <= (|br_curr_state) && br_latch;
            end else begin
                current_state <= {1'b1, current_state[2:0]}; // go to NPC
            end
        end
    end
    
endmodule
