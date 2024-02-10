.data
n: .word 30
vin: .float 1, 1.00001
vout: .space 120
sum: .space 4

.text
.globl main

main:
  la $s4, n
  la $s5, vin
  la $s1, sum
  lw $t0, 0($s4)
loop:
  lwc1 $f0, 0($s5)
  lwc1 $f1, 4($s5)
  mul.s $f2, $f0, $f1
  addi $t0, $t0, -2
  mul.s $f3, $f1, $f2
  swc1 $f2, 8($s5)
  swc1 $f3, 12($s5)
  bne $t0, $0, loop
  addi $s5, $s5, 8

  swc1 $f3, 0($s1)

  addi $v0, $0, 2   # Syscall 2: imprime float en $f12
  syscall
  addi $v0, $0, 10
  syscall