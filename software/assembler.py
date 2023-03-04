import sys
import re
import math


opcode_map = {
    "nop":  "0000",
    "add":  "0001",
    "addi": "0001",
    "not":  "1001",
    "noti": "1001",
    "and":  "0101",
    "andi": "0001",
    "br":   "0000",
    "jmp":  "1100",
    "lea":  "1110"
}

reg_map = {
    "$0": "000",
    "$1": "001",
    "$2": "010",
    "$3": "011",
    "$4": "100",
    "$5": "101",
    "$6": "110",
    "$7": "111",
}

symbol_table = {}


def get_negative(binary_string: str, length: int) -> str:
    new_string = ""
    for char in binary_string:
        if char == "0":
            new_string += "1"
        else:
            new_string += "0"
    plus_one = int(new_string, 2) + 1
    bin_plus_one = bin(plus_one)[2:]
    return "1" * (length - len(bin_plus_one)) + bin_plus_one


def parse_imm(imm: str, imm_length: int, line_no: int) -> str:
    if imm[0] == '#':
        if imm[1] == "-":
            if int(imm[2:], 2) > 32:
                raise Exception(f"Immediate too large on line {line_no}!")
            return get_negative(bin(int(imm[2:]))[2:], 5)
        else:
            if int(imm[1:], 2) > 31:
                raise Exception(f"Immediate too large on line {line_no}!")
            return bin(int(imm[1:]))[2:].zfill(imm_length)
    elif imm[0] == 'b':
        if len(imm[1:]) > 6:
            raise Exception(f"Immediate too long on line {line_no}!")
        return imm[1:]
    else:
        raise Exception(f"Poorly formatted immediate on line {line_no}!")
        return None


def main():
    filename = sys.argv[1]
    outfile = sys.argv[2]
    print(f"Assembling {filename} to {outfile}.")

    PC = 0
    file_handle = open(filename, 'r')
    outfile_handle = open(outfile, 'w')

    assembly_lines = file_handle.readlines()
    binary_lines = []

    # Build symbol table
    print("Building symbol table.")
    PC = 0
    for line in assembly_lines:
        if line == "\n" or line[0] == ";":
            continue
        parts = line.split(" ")
        if parts[0][0] == ":":
            symbol_table[parts[0]] = PC
        PC += 2

    print("Assembling program.")
    # Translate to machine code
    line_no = 1
    for line in assembly_lines:
        if PC > 2**7-1:
            raise Exception ("Program too long!")

        if line == "\n" or line[0] == ";":
            continue
        line = line.replace("\n", "")
        parts = line.split(" ")

        if parts[0][0] == ":":
            parts.pop(0)

        opcode = parts[0]
        binary_line = ""

        if opcode in ["add", "and"]:
            if len(parts) != 4:
                raise Exception(f"Wrong number of arguments on line {line_no}!")

            dr = parts[1]
            sr1 = parts[2]
            sr2 = parts[3]
            binary_line = opcode_map[opcode] + reg_map[dr] + reg_map[sr1] + "000" + reg_map[sr2]

        elif opcode in ["addi", "andi"]:
            if len(parts) != 4:
                raise Exception(f"Wrong number of arguments on line {line_no}!")

            dr = parts[1]
            sr = parts[2]
            imm = parts[3]
            imm_val = parse_imm(imm, 5, line_no)

            if imm_val == None:
                raise Exception(f"Problem with immediate on line {line_no}!")

            binary_line = opcode_map[opcode] + reg_map[dr] + reg_map[sr] + "1" + imm_val

        elif opcode == "not":
            if len(parts) != 3:
                raise Exception(f"Wrong number of arguments on line {line_no}!")

            dr = parts[1]
            sr = parts[2]
            binary_line = opcode_map[opcode] + reg_map[dr] + reg_map[sr] + "000000"

        elif opcode == "noti":
            if len(parts) != 3:
                raise Exception(f"Wrong number of arguments on line {line_no}!")

            dr = parts[1]
            imm = parts[2]
            imm_val = parse_imm(imm, 5, line_no)

            binary_line = opcode_map[opcode] + reg_map[dr] + "0001" + imm_val

        elif opcode[0:2] == "br":
            if len(parts) != 2:
                raise Exception(f"Wrong number of arguments on line {line_no}!")

            branch_condition = ""
            if opcode[2] == 'n':
                branch_condition = "100"
            elif opcode[2] == 'z':
                branch_condition = "010"
            elif opcode[2] == 'p':
                branch_condition = "001"
            else:
                raise Exception(f"Issue with branch condition on line {line_no}!")

            to_branch = parts[1]
            pcoffset = ""
            if to_branch[0] == ":":
                offset = symbol_table[to_branch] - PC
                pcoffset = bin(offset)
                if pcoffset[0] == '-':
                    pcoffset = "1"*(6-len(pcoffset[3:])) + pcoffset[3:]
                else:
                    pcoffset = pcoffset[2:].zfill(6)
            else:
                pcoffset = parse_imm(to_branch, 6, line_no)

            binary_line = opcode_map["br"] + branch_condition + "000" + pcoffset

        # TODO: jmp should detect jumping to far in instruction memory
        elif opcode == "jmp":
            if len(parts) != 2:
                raise Exception(f"Wrong number of arguments on line {line_no}!")

            to_jmp = parts[1]

            if to_jmp[0] == ':':
                offset = symbol_table[to_jmp] - PC
                num_adds = int(abs(offset) / 15)
                binary_lines += ["0101111111100000"] # clear $7
                PC += 2
                if offset > 0:
                    binary_lines += ["0001111111101111"] * num_adds
                    PC += 2 * num_adds
                    binary_lines += ["00011111111" + bin(abs(offset) % 15)[2:]]
                    PC += 2
                else:
                    binary_lines += ["0001111111110001"] * num_adds
                    PC += 2 * num_adds
                    binary_lines += ["00011111111" + get_negative(bin(abs(offset) % 15)[2:], 6)]
                    PC += 2
                binary_line = opcode_map[opcode] + "000111000000"

            else:
                binary_line = opcode_map[opcode] + "000" + reg_map[sr] + "000000"

        elif opcode == "lea":
            if len(parts) != 3:
                raise Exception(f"Wrong number of arguments on line {line_no}!")

            dr = parts[1]
            imm = parts[2]
            pcoffset = parse_imm(imm, 6, line_no)
            binary_line = opcode_map[opcode] + reg_map[dr] + "000" + pcoffset

        else:
            raise Exception(f"Invalid instruction type on line {line_no}!")

        binary_lines.append(binary_line)

        line_no += 1
        PC += 2

    for line in binary_lines:
        outfile_handle.write(line + "\n")
    print("Writing to binary file.")
    outfile_handle.close()
    file_handle.close()


if __name__ == '__main__':
    main()
