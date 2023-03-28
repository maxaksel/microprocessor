; PRIMALITY TEST ASSEMBLY PROGRAM

addi $4 $4 #20 ; this is the value we test
add $0 $0 $4 ; put imm in R4
addi $1 $1 #1 ; put 1 in R1
addi $5 $5 #1 ; R5 contains 1
lea $7 #6 ; store return address
lea $6 :subtract ; load address of subtract into R6
jmp $6 ; subtract 1 from R0
addi $1 $0 #0 ; move loop counter into R1
:loop addi $0 $4 #0 ; R1 is loop counter R4 is value move value into R0
lea $7 #4 ; load return address
jmp $6 ; subtract
brz :done ; done
brp :subtract ; sub again return to R7 plus 4
addi $0 $1 #0 ; Old Loop counter in R0
addi $1 $5 #0 ; 1 in R1
lea $7 #4
jmp $6 ; new loop counter in R0 - return from subtract
addi $1 $0 #0 ; move loop counter into R1
brz :done ; if R0 == 0 done
:subtract addi $0 $0 #1 ; subtract R1 from R0. Uses R0 R1 and R2 Return Address in R7
not $2 $1
add $0 $0 $2
jmp $7 ; return address
:done addi $0 $1 #0
lea $7 #0 ; loop forever
jmp $7
