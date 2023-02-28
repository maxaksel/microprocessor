module regfile (
    clka,
    clkb,
    pc_latch_clk,
    reset_in,
    sr1_in,
    sr2_in,
    rd_in,
    we_reg_in,
    data_in,
    sr1_out,
    sr2_out,
    reg0_out,
);

// inputs
input  wire       clka, clkb, pc_latch_clk, we_reg_in, reset_in;
input  wire [2:0] sr1_in, sr2_in, rd_in;
input  wire [7:0] data_in;

// outputs
output wire [7:0] sr1_out, sr2_out, reg0_out;

// internal registers declaration
reg [7:0] regfile [7:0];
reg reset_latch, we_reg_latch, pc_latch;
reg [2:0] rd_latch;
reg [7:0] data_latch;

// combinational outputs
assign sr1_out  = regfile[sr1_in];
assign sr2_out  = regfile[sr2_in];
assign reg0_out = regfile[0];

always @(negedge clka) begin
    reset_latch <= reset_in;
    we_reg_latch <= we_reg_in;
    rd_latch <= rd_in;
    data_latch <= data_in;
    pc_latch <= pc_latch_clk;
end

integer i;
always @(negedge clkb) begin
    if (reset_latch == 1) begin
        for (i = 0; i < 8; i = i + 1) begin
            regfile[i] <= 0;
        end
    end else if (pc_latch == 0 && we_reg_latch == 1) begin
        regfile[rd_latch] <= data_latch;
    end else begin
    end
end
    
endmodule