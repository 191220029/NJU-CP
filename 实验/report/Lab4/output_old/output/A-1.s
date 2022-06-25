.data
_prompt: .asciiz "Enter an integer:"
_ret: .asciiz "\n"
.globl main
.text
read:
  li $v0, 4
  la $a0, _prompt
  syscall
  li $v0, 5
  syscall
  jr $ra

write:
  li $v0, 1
  syscall
  li $v0, 4
  la $a0, _ret
  syscall
  move $v0, $0
  jr $ra

main:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -256
  li $t0, 1
  sw $t0, -224($fp)
  li $t0, 11
  sw $t0, -204($fp)
  li $t0, 39
  sw $t0, -228($fp)
  li $t0, 0
  sw $t0, -256($fp)
  li $t1, 0
  lw $t2, -224($fp)
  sub $t0, $t1, $t2
  sw $t0, -28($fp)
  lw $t1, -28($fp)
  lw $t2, -228($fp)
  add $t0, $t1, $t2
  sw $t0, -56($fp)
  li $t1, 17
  lw $t2, -224($fp)
  mul $t0, $t1, $t2
  sw $t0, -48($fp)
  li $t1, 0
  lw $t2, -48($fp)
  sub $t0, $t1, $t2
  sw $t0, -60($fp)
  lw $t1, -56($fp)
  lw $t2, -60($fp)
  add $t0, $t1, $t2
  sw $t0, -72($fp)
  lw $t1, -72($fp)
  move $t0, $t1
  sw $t0, -224($fp)
  lw $a0, -224($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $t1, 11
  lw $t2, -204($fp)
  mul $t0, $t1, $t2
  sw $t0, -124($fp)
  lw $t1, -224($fp)
  lw $t2, -224($fp)
  mul $t0, $t1, $t2
  sw $t0, -104($fp)
  lw $t1, -228($fp)
  lw $t2, -104($fp)
  add $t0, $t1, $t2
  sw $t0, -112($fp)
  lw $t1, -112($fp)
  lw $t2, -224($fp)
  mul $t0, $t1, $t2
  sw $t0, -128($fp)
  lw $t1, -124($fp)
  lw $t2, -128($fp)
  sub $t0, $t1, $t2
  sw $t0, -140($fp)
  lw $t1, -140($fp)
  move $t0, $t1
  sw $t0, -204($fp)
  lw $a0, -204($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  lw $t1, -224($fp)
  lw $t2, -204($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -164($fp)
  lw $t1, -224($fp)
  lw $t2, -164($fp)
  mul $t0, $t1, $t2
  sw $t0, -172($fp)
  lw $t1, -172($fp)
  lw $t2, -228($fp)
  add $t0, $t1, $t2
  sw $t0, -188($fp)
  lw $t1, -188($fp)
  move $t0, $t1
  sw $t0, -228($fp)
  lw $a0, -228($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $t1, 4
  lw $t2, -224($fp)
  mul $t0, $t1, $t2
  sw $t0, -212($fp)
  lw $t1, -204($fp)
  li $t2, 17
  div $t1, $t2
  mflo $t0
  sw $t0, -216($fp)
  lw $t1, -212($fp)
  lw $t2, -216($fp)
  add $t0, $t1, $t2
  sw $t0, -236($fp)
  lw $t1, -224($fp)
  lw $t2, -228($fp)
  mul $t0, $t1, $t2
  sw $t0, -240($fp)
  lw $t1, -236($fp)
  lw $t2, -240($fp)
  add $t0, $t1, $t2
  sw $t0, -252($fp)
  lw $t1, -252($fp)
  move $t0, $t1
  sw $t0, -256($fp)
  lw $a0, -256($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
