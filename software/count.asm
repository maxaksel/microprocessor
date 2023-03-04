; Count Assembly file

addi $1 $1 #10

:loop addi $0 $0 #10
addi $1 $1 #-1

brp :loop
