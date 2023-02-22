; Count Assembly file

addi $1 #10

:loop addi $0 #10
addi $1 #-1

BRp $1 :loop
