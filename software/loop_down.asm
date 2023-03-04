addi $0 $0 #8
addi $1 $1 #1
not $1 $1
addi $1 $1 #1
:loop add $0 $0 $1
brp :loop
