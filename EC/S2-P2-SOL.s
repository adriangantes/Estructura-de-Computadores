.data
Num: .word 4
vector: .float 5, 4, 3, 4, 6
datos: .float 1, 2
.text
.globl main
main:

la $s4, Num
la $s5, vector
la $t0, datos


lw $s0, 0($s4)
addi $s1, $0, 0
slt $t1, $s1, $s0
lwc1 $f4, 4($t0)
lwc1 $f2, 0($t0)

Loop:

beq $t1, $zero, fin
lwc1 $f0, 0($s5)
mul.s $f6, $f2, $f4
add.s $f2, $f0, $f2
addi $s1, $s1, 1
swc1 $f2, 0($s5)

slt $t1, $s1, $s0
addi $s5, $s5, 4
j Loop



fin:

swc1 $f6, 0($t0)
addi $v0, $0, 10
syscall