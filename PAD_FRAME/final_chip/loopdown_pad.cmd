|
| top_level.cmd
|
| Comments
| ELEC 422 Final Project

| vector reg0 reg_0_out\[7\] reg_0_out\[6\] reg_0_out\[5\] reg_0_out\[4\] reg_0_out\[3\] reg_0_out\[2\] reg_0_out\[1\] reg_0_out\[0\]
vector p_reg0 p_reg_0_out\[7\] p_reg_0_out\[6\] p_reg_0_out\[5\] p_reg_0_out\[4\] p_reg_0_out\[3\] p_reg_0_out\[2\] p_reg_0_out\[1\] p_reg_0_out\[0\]
| vector ins load\[15\] load\[14\] load\[13\] load\[12\] load\[11\] load\[10\] load\[9\] load\[8\] load\[7\] load\[6\] load\[5\] load\[4\] load\[3\] load\[2\] load\[1\] load\[0\]
vector p_ins p_load\[15\] p_load\[14\] p_load\[13\] p_load\[12\] p_load\[11\] p_load\[10\] p_load\[9\] p_load\[8\] p_load\[7\] p_load\[6\] p_load\[5\] p_load\[4\] p_load\[3\] p_load\[2\] p_load\[1\] p_load\[0\]

logfile microprocessor.log
ana p_clka p_clkb p_reset p_we_ins
ana p_ins
ana p_reg0

V  p_reset         0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V  p_we_ins        0 0 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   p_load\[15\]   0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   p_load\[14\]   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   p_load\[13\]   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   p_load\[12\]   0 0 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   p_load\[11\]   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   p_load\[10\]   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   p_load\[9\]   0 0 0 1 1 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   p_load\[8\]   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   p_load\[7\]   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   p_load\[6\]   0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   p_load\[5\]   0 0 1 1 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   p_load\[4\]   0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   p_load\[3\]   0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   p_load\[2\]   0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   p_load\[1\]   0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   p_load\[0\]   0 0 0 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0



| Two phase clock with non-overlap period - same as Modelsim testbench
clock p_clka 0 1 0 0 0 1 0 0
clock p_clkb 0 0 0 1 0 0 0 1
R