; Displays the first ten elements of the Fibonnaci sequence.
; Register 3 stores how many elements to generate.

addi $4 $4 #-1
addi $3 $3 #10

addi $0 $0 #1
addi $1 $1 #1

:loop add $2 $0 $1
andi $0 $0 #0
add $0 $0 $1

andi $1 $1 #0
add $1 $1 $2

add $3 $3 $4
brp :loop
