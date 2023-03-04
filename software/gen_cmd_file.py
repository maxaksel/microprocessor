"""
This program generates an IRSIM command file from a binary executable.
In progress.

@date 03/04/2023
"""
import sys
import numpy as np


def main():
    input_file = sys.argv[1]
    output_file = sys.argv[2]

    input_file = open(input_file, 'r')
    output_file = open(output_file, 'w')

    for instruction in input_file:
        print(instruction)

    input_file.close()
    output_file.close()


if __name__ == '__main__':
    main()
