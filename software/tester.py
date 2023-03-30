"""
python tester.py <binary file> -v
use -v option for verbose where register is printed every step
"""

import sys

REG_SIZE = 8
max_iterations = 512
iteration = 0

def sext(bstr, size=REG_SIZE):
    ret = bstr
    for i in range(size - len(bstr)):
        ret = ret[0] + ret
    
    return ret

def to_int(num):
    integer = int(num[1:], 2)
    integer -= int(num[0]) * 2**(len(num) - 1)
    return integer

def ADD(a, b):
    ret = ""
    c = "0"
    ones = 0
    for i in range(len(a) - 1, -1, -1):
        if (a[i] == '1'):
            ones += 1
        if (b[i] == '1'):
            ones += 1
        if (c == '1'):
            ones += 1
        if (ones == 1 or ones == 3):
            ret = "1" + ret
        if (ones == 0 or ones == 2):
            ret = "0" + ret
        if (ones >= 2):
            c = "1"
        else:
            c = "0"
        ones = 0
    if (c == '1'):
        print("[Warning] Add overflow")
    
    return ret

def AND(a, b):
    ret = ""
    for i in range(len(a)):
        ret += str(int(a[i]) & int(b[i]))
    
    return ret

def NOT(a):
    ret = ""
    for i in range(len(a)):
        if (a[i] == '1'):
            ret += '0'
        else:
            ret += '1'
    
    return ret

def print_reg(reg_file):
    for i in range(len(reg_file)):
        print(str(i) + ": " + reg_file[i] + " (" + str(to_int(reg_file[i])) + ")")


if __name__ == "__main__":
    filename = sys.argv[1]
    verbose = False
    if (len(sys.argv) > 2 and sys.argv[2] == "-v"):
        verbose = True
        if (len(sys.argv) > 3):
            max_iterations = int(sys.argv[3])
    elif (len(sys.argv) > 2):
        max_iterations = int(sys.argv[2])

    f = open(filename, "r")
    program = []
    reg_file = []
    for i in range(REG_SIZE):
        reg_file.append('00000000')


    for line in f:
        if (line[0] != "#"):
            program.append(line.strip())
            program.append("")

    end = False
    br  = False
    pc = 0
    n  = 0
    z  = 0
    p  = 0

    while (pc < len(program) and pc >= 0):
        iteration = iteration + 1
        # DECODE
        br = False
        if (pc % 2 != 0):
            print("[ERROR] PC is not even")
            break
        print("PC: " + str(pc))
        print("NZP: " + str(n) + str(z) + str(p))
        cur_instr = program[pc]         
        opcode = cur_instr[0:4]
        dr = int(cur_instr[4:7], 2)
        sr1 = int(cur_instr[7:10], 2)
        sr2 = int(cur_instr[13:16], 2)
        imm = sext(cur_instr[11:16])
        pc_offset = int(cur_instr[10:16], 2)
        if (dr >= REG_SIZE or sr1 >= REG_SIZE or sr2 >= REG_SIZE):
            print("[ERROR] REG out of range")
            break

        # OPERATIONS
        if (opcode == "0001"):  # ADD op-code
            if cur_instr[10:13] == '000':  # ADD
                reg_file[dr] = ADD(reg_file[sr1], reg_file[sr2])
                print("[INSTR] $" + str(dr) + " = $" + str(sr1) + " + $" + str(sr2))
            elif cur_instr[10] == '1':  # ADDi
                reg_file[dr] = ADD(reg_file[sr1], imm)
                print("[INSTR] $" + str(dr) + " = $" + str(sr1) + " + " + 'imm' + imm)
            else :
                print("[ERROR] ADD instruction invalid")
            if (reg_file[dr] == "00000000"):
                n = 0
                z = 1
                p = 0
            elif (reg_file[dr][0] == '0'):
                n = 0
                z = 0
                p = 1
            elif (reg_file[dr][0] == '1'):
                n = 1
                z = 0
                p = 0

        elif (opcode == "0101"):  # AND op-code
            if cur_instr[10:13] == '000':  # AND
                reg_file[dr] = AND(reg_file[sr1], reg_file[sr2])
                print("[INSTR] $" + str(dr) + " = $" + str(sr1) + " & $" + str(sr2))
            elif cur_instr[10] == '1':  # ANDi
                reg_file[dr] = AND(reg_file[sr1], imm)
                print("[INSTR] $" + str(dr) + " = $" + str(sr1) + " & " + "imm" + imm)
            else :
                print("[ERROR] AND instruction invalid")
            if (reg_file[dr] == "00000000"):
                n = 0
                z = 1
                p = 0
            elif (reg_file[dr][0] == '0'):
                n = 0
                z = 0
                p = 1
            elif (reg_file[dr][0] == '1'):
                n = 1
                z = 0
                p = 0
        
        elif (opcode == "1001"):  # NOT op-code
            if cur_instr[10:16] == '000000':  # NOT
                reg_file[dr] = NOT(reg_file[sr1])
                print("[INSTR] $" + str(dr) + " = ~$" + str(sr1))
            elif cur_instr[7:11] == '0001':  # NOTi
                reg_file[dr] = NOT(imm)
                print("[INSTR] $" + str(dr) + " = ~" + 'imm' + imm)
            else :
                print("[ERROR] NOT instruction invalid")
        
            if (reg_file[dr] == "00000000"):
                n = 0
                z = 1
                p = 0
            elif (reg_file[dr][0] == '0'):
                n = 0
                z = 0
                p = 1
            elif (reg_file[dr][0] == '1'):
                n = 1
                z = 0
                p = 0

        elif (opcode == "0000"):  # BR
            if (cur_instr[4] == '1' and n == 1):
                br = True
            elif (cur_instr[5] == '1' and z == 1):
                br = True
            elif (cur_instr[6] == '1' and p == 1):
                br = True

            if br:
                offset = int(cur_instr[11:16], 2) - int(cur_instr[10]) * 2**5
                pc = pc + offset
            print("[INSTR] Branch offset: " + str(offset))


        elif (opcode == "1100"):  # JMP
            if (cur_instr[4:7] == "000" and cur_instr[10:16] == "000000"):
                br = True
                pc = int(reg_file[sr1], 2)
                print("[INSTR] Jump to: " + str(pc))
            else:
                print("[ERROR] JMP instruction invalid")
                break



        elif (opcode == "1110"):  # LEA
            if (cur_instr[7:10] == "000"):
                offset = int(cur_instr[11:16], 2) - int(cur_instr[10]) * 2**5
                result = bin(pc + offset)[2:]
                if (len(result) < 8):
                    if (pc + offset >= 0):
                        result = '0' + result
                    else:
                        result = '1' + result
                    reg_file[dr] = sext(result)
                print("[INSTR] $" + str(dr) + " = EA(" + str(int(reg_file[dr],2)) + ")")
            if (reg_file[dr] == "00000000"):
                n = 0
                z = 1
                p = 0
            elif (reg_file[dr][0] == '0'):
                n = 0
                z = 0
                p = 1
            elif (reg_file[dr][0] == '1'):
                n = 1
                z = 0
                p = 0
        
        if (verbose):
            print_reg(reg_file)
        if not br:
            pc += 2
        if (iteration > max_iterations):
            break 

        
        print("********************************")
    
    if (pc >= 0):
        print("END OF PROGRAM")
        if not verbose:
            print_reg(reg_file)
    else:
        print("[ERROR] PC smaller than zero")
