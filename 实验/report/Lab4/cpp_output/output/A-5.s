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

_add:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -20
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t0, 12($fp)
  sw $t0, -8($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -12($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -16($fp)
  lw $t1, -12($fp)
  lw $t2, -16($fp)
  add $t0, $t1, $t2
  sw $t0, -20($fp)
  lw $v0, -20($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

_sub:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -20
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t0, 12($fp)
  sw $t0, -8($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -12($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -16($fp)
  lw $t1, -12($fp)
  lw $t2, -16($fp)
  sub $t0, $t1, $t2
  sw $t0, -20($fp)
  lw $v0, -20($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

_mul:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -20
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t0, 12($fp)
  sw $t0, -8($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -12($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -16($fp)
  lw $t1, -12($fp)
  lw $t2, -16($fp)
  mul $t0, $t1, $t2
  sw $t0, -20($fp)
  lw $v0, -20($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

main:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -84
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -8($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -12($fp)
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -16($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -20($fp)
  lw $t1, -20($fp)
  move $t0, $t1
  sw $t0, -24($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -28($fp)
  lw $t1, -28($fp)
  move $t0, $t1
  sw $t0, -32($fp)
  lw $t1, -32($fp)
  move $t0, $t1
  sw $t0, -36($fp)
  lw $t1, -24($fp)
  move $t0, $t1
  sw $t0, -40($fp)
  addi $sp, $sp, -4
  lw $t0, -36($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -40($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _add
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -44($fp)
  addi $sp, $sp, 8
  lw $t1, -16($fp)
  move $t0, $t1
  sw $t0, -48($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -52($fp)
  addi $sp, $sp, -4
  lw $t0, -48($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -52($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _sub
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -56($fp)
  addi $sp, $sp, 8
  lw $t1, -16($fp)
  move $t0, $t1
  sw $t0, -60($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -64($fp)
  addi $sp, $sp, -4
  lw $t0, -60($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -64($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _sub
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -68($fp)
  addi $sp, $sp, 8
  addi $sp, $sp, -4
  lw $t0, -56($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -68($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _mul
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -72($fp)
  addi $sp, $sp, 8
  addi $sp, $sp, -4
  lw $t0, -44($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -72($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _add
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -76($fp)
  addi $sp, $sp, 8
  lw $t1, -76($fp)
  move $t0, $t1
  sw $t0, -80($fp)
  lw $t1, -80($fp)
  move $t0, $t1
  sw $t0, -84($fp)
  lw $a0, -84($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
