import sys


instruction_map = {
    "add":  "0001------000---",
    "addi": "0001------1-----",
    "not":  "1001------000000",
    "noti": "1001---0001-----",
    "and":  "0101------000---",
    "andi": "0001------1-----",
    "br":   "0000---000------",
    "jmp":  "1100000---------",
    "lea":  "1110---000------"
}


def main():
    filename = sys.argv[1]
    print(f"Assembling {filename}.")

    PC = 0
    file_handle = open(filename, 'r')
    for line in file_handle:
        if line == '':
            continue
        instruction = line.replace(" ", "")
        parts = instruction.split(",")

        # TODO: implement code to check for labels here

        opcode = parts[0]
        binary_line = instruction_map[opcode]

        if opcode in ["add", "and"]:
            dr = parts[1]
            sr1 = parts[2]
            sr2 = parts[3]

            binary_line[5:8] = dr
            binary_line[8:11] = sr1
            binary_line[13:16] = sr2

        elif opcode in ["addi", "andi"]:
            dr = parts[1]
            pass
        elif opcode == "not":
            pass
        elif opcode == "noti":
            pass
        elif opcode[0:1] == "br":
            pass
        elif opcode == "jmp":
            pass
        elif opcode == "lea":
            pass
        else:
            print("Error -- invalid opcode!")
            break

        PC += 2


if __name__ == '__main__':
    main()
