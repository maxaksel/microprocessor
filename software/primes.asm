; PRIMALITY TEST ASSEMBLY PROGRAM

addi $4 $4 #10 ; this is the value we test
add $0 $0 $4 ; put imm in R4
addi $1 $1 #1 ; put 1 in R1
lea $5 :loop ;R5 has addr of loop
addi $3 $3 #1
lea $7 #6 ; store return address
lea $6 :subtract ; load address of subtract into R6
jmp $6 ; subtract 1 from R0
:loop addi $1 $0 #0 ; move R0 to R1 (loop counter) 16
addi $0 $4 #0 ; R1 is loop counter R4 is value, move value into R0 18
lea $7 #4 ; load return address 20
jmp $6 ; subtract R0 = R0 - R1 (R0 = val - loop counter) 22
brz :done ; done 24
brp :subtract ; sub again return to R7 plus 4
brn :else
:subtract addi $0 $0 #1 ; subtract R1 from R0. Uses R0 R1 and R2 Return Address in R7 30 
not $2 $1 ; 32
add $0 $0 $2 ; 34
jmp $7 ; return address
:else addi $0 $1 #0
addi $1 $3 #0 ; 1 into r1
lea $7 #4
jmp $6 ; new loop counter in R0 - return from subtract
addi $1 $0 #0 ; move loop counter into R1 (if not 0)
brz :done ; if R0 == 0 done
jmp $5 ; loop again
:done addi $0 $1 #0
lea $7 #0 ; loop forever
jmp $7
