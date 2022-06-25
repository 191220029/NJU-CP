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
  addi $sp, $sp, -88
  li $t0, 1
  sw $t0, -4($fp)
  li $t0, 11
  sw $t0, -8($fp)
  li $t0, 39
  sw $t0, -12($fp)
  li $t0, 0
  sw $t0, -16($fp)
  li $t1, 0
  lw $t2, -4($fp)
  sub $t0, $t1, $t2
  sw $t0, -20($fp)
  lw $t1, -20($fp)
  lw $t2, -12($fp)
  add $t0, $t1, $t2
  sw $t0, -24($fp)
  li $t1, 17
  lw $t2, -4($fp)
  mul $t0, $t1, $t2
  sw $t0, -28($fp)
  li $t1, 0
  lw $t2, -28($fp)
  sub $t0, $t1, $t2
  sw $t0, -32($fp)
  lw $t1, -24($fp)
  lw $t2, -32($fp)
  add $t0, $t1, $t2
  sw $t0, -36($fp)
  lw $t1, -36($fp)
  move $t0, $t1
  sw $t0, -4($fp)
  lw $a0, -4($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $t1, 11
  lw $t2, -8($fp)
  mul $t0, $t1, $t2
  sw $t0, -40($fp)
  lw $t1, -4($fp)
  lw $t2, -4($fp)
  mul $t0, $t1, $t2
  sw $t0, -44($fp)
  lw $t1, -12($fp)
  lw $t2, -44($fp)
  add $t0, $t1, $t2
  sw $t0, -48($fp)
  lw $t1, -48($fp)
  lw $t2, -4($fp)
  mul $t0, $t1, $t2
  sw $t0, -52($fp)
  lw $t1, -40($fp)
  lw $t2, -52($fp)
  sub $t0, $t1, $t2
  sw $t0, -56($fp)
  lw $t1, -56($fp)
  move $t0, $t1
  sw $t0, -8($fp)
  lw $a0, -8($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  lw $t1, -4($fp)
  lw $t2, -8($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -60($fp)
  lw $t1, -4($fp)
  lw $t2, -60($fp)
  mul $t0, $t1, $t2
  sw $t0, -64($fp)
  lw $t1, -64($fp)
  lw $t2, -12($fp)
  add $t0, $t1, $t2
  sw $t0, -68($fp)
  lw $t1, -68($fp)
  move $t0, $t1
  sw $t0, -12($fp)
  lw $a0, -12($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $t1, 4
  lw $t2, -4($fp)
  mul $t0, $t1, $t2
  sw $t0, -72($fp)
  lw $t1, -8($fp)
  li $t2, 17
  div $t1, $t2
  mflo $t0
  sw $t0, -76($fp)
  lw $t1, -72($fp)
  lw $t2, -76($fp)
  add $t0, $t1, $t2
  sw $t0, -80($fp)
  lw $t1, -4($fp)
  lw $t2, -12($fp)
  mul $t0, $t1, $t2
  sw $t0, -84($fp)
  lw $t1, -80($fp)
  lw $t2, -84($fp)
  add $t0, $t1, $t2
  sw $t0, -88($fp)
  lw $t1, -88($fp)
  move $t0, $t1
  sw $t0, -16($fp)
  lw $a0, -16($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
