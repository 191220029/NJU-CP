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
  addi $sp, $sp, -68
  li $t0, 0
  sw $t0, -20($fp)
  addi $t0, $fp, -16
  sw $t0, -24($fp)
  li $t1, 0
  lw $t0, -24($fp)
  sw $t1, 0($t0)
  addi $t0, $fp, -12
  sw $t0, -28($fp)
  li $t1, 20
  lw $t0, -28($fp)
  sw $t1, 0($t0)
  addi $t0, $fp, -8
  sw $t0, -32($fp)
  li $t1, 2
  lw $t0, -32($fp)
  sw $t1, 0($t0)
  addi $t0, $fp, -4
  sw $t0, -36($fp)
  li $t1, 90
  lw $t0, -36($fp)
  sw $t1, 0($t0)
  addi $t0, $fp, -4
  sw $t0, -40($fp)
  lw $t1, -40($fp)
  lw $t0, 0($t1)
  sw $t0, -44($fp)
  addi $t0, $fp, -8
  sw $t0, -48($fp)
  lw $t1, -48($fp)
  lw $t0, 0($t1)
  sw $t0, -52($fp)
  addi $t0, $fp, -8
  sw $t0, -56($fp)
  lw $t1, -56($fp)
  lw $t0, 0($t1)
  sw $t0, -60($fp)
  lw $t1, -52($fp)
  lw $t2, -60($fp)
  mul $t0, $t1, $t2
  sw $t0, -64($fp)
  lw $t1, -44($fp)
  lw $t2, -64($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -68($fp)
  lw $t1, -68($fp)
  move $t0, $t1
  sw $t0, -20($fp)
  lw $a0, -20($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
