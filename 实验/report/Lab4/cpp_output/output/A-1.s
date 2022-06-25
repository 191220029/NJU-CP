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
  addi $sp, $sp, -64
  li $a0, 21
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $a0, -9959
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $t0, 21
  sw $t0, -4($fp)
  li $t0, -9959
  sw $t0, -8($fp)
  lw $t1, -4($fp)
  lw $t2, -8($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -12($fp)
  li $t1, 21
  lw $t2, -12($fp)
  mul $t0, $t1, $t2
  sw $t0, -16($fp)
  lw $t1, -16($fp)
  addi $t0, $t1, 39
  sw $t0, -20($fp)
  lw $t1, -20($fp)
  move $t0, $t1
  sw $t0, -24($fp)
  lw $t1, -24($fp)
  move $t0, $t1
  sw $t0, -28($fp)
  lw $a0, -28($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $t0, -9959
  sw $t0, -32($fp)
  li $t0, 17
  sw $t0, -36($fp)
  lw $t1, -32($fp)
  lw $t2, -36($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -40($fp)
  lw $t2, -40($fp)
  addi $t0, $t2, 84
  sw $t0, -44($fp)
  lw $t1, -24($fp)
  move $t0, $t1
  sw $t0, -48($fp)
  li $t1, 21
  lw $t2, -48($fp)
  mul $t0, $t1, $t2
  sw $t0, -52($fp)
  lw $t1, -44($fp)
  lw $t2, -52($fp)
  add $t0, $t1, $t2
  sw $t0, -56($fp)
  lw $t1, -56($fp)
  move $t0, $t1
  sw $t0, -60($fp)
  lw $t1, -60($fp)
  move $t0, $t1
  sw $t0, -64($fp)
  lw $a0, -64($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
