"""
This program generates an IRSIM command file from a binary executable.
In progress.

Usage: python gen_cmd_file.py source.bin output_file.cmd

@date 03/26/2023
"""
import sys
import numpy as np


header = """|
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

"""

footer = """


| Two phase clock with non-overlap period - same as Modelsim testbench
clock clka 0 1 0 0 0 1 0 0
clock clkb 0 0 0 1 0 0 0 1
R
"""


def main():
    input_file = sys.argv[1]
    output_file = sys.argv[2]

    input_file = open(input_file, 'r')
    output_file = open(output_file, 'w')

    output_file.write(header)

    signal_matrix = np.zeros((18, 64), dtype=np.int8)
    signal_matrix[0, 1] = 1  # initial reset

    j = 2
    for instruction in input_file:
        if j > 31:
            raise Exception("Too many binary instructions!")
        if len(instruction) != 17 or instruction.replace("0", "").replace("1", "").replace("\n", "") != "":
            raise Exception("Ill-formatted instruction!")

        signal_matrix[1, j] = 1
        for i in range(2, 18):
            signal_matrix[i, j] = int(instruction[i - 2])
        j += 1

    if j > 31:
        raise Exception("Too many binary instructions!")
    signal_matrix[0, j] = 1

    output_file.write("V  reset         " + " ".join([str(bit) for bit in signal_matrix[0 , :]]) + "\n")
    output_file.write("V  we_ins        " + " ".join([str(bit) for bit in signal_matrix[1 , :]]) + "\n")

    for bit_ind in range(16):
        output_file.write(f"V   load\[{15 - bit_ind}\]   " + " ".join([str(bit) for bit in signal_matrix[2 + bit_ind , :]]) + "\n")

    output_file.write(footer)

    input_file.close()
    output_file.close()


if __name__ == '__main__':
    main()
