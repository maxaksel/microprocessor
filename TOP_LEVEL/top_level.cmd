|
| top_level.cmd
|
| Comments
| ELEC 422 Final Project

vector reg0 reg_0_out\[7\] reg_0_out\[6\] reg_0_out\[5\] reg_0_out\[4\] reg_0_out\[3\] reg_0_out\[2\] reg_0_out\[1\] reg_0_out\[0\]
vector ins load\[15\] load\[14\] load\[13\] load\[12\] load\[11\] load\[10\] load\[9\] load\[8\] load\[7\] load\[6\] load\[5\] load\[4\] load\[3\] load\[2\] load\[1\] load\[0\]

logfile microprocessor.log
ana clka clkb reset we_ins
ana ins
ana reg0

V   reset          0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0
V   we_ins         0 0 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0
V   load\[15\]     0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   load\[14\]     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   load\[13\]     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   load\[12\]     0 0 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   load\[11\]     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   load\[10\]     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   load\[9\]      0 0 0 1 1 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   load\[8\]      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   load\[7\]      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   load\[6\]      0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   load\[5\]      0 0 1 1 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   load\[4\]      0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   load\[3\]      0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   load\[2\]      0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   load\[1\]      0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   load\[0\]      0 0 0 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0


| Two phase clock with non-overlap period - same as Modelsim testbench
clock clka 0 1 0 0
clock clkb 0 0 0 1
R
