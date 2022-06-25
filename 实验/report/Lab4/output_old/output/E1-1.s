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
  addi $sp, $sp, -152
  li $t0, 0
  sw $t0, -152($fp)
  addi $t0, $fp, -104
  sw $t0, -32($fp)
  li $t1, 0
  lw $t0, -32($fp)
  sw $t1, 0($t0)
  addi $t0, $fp, -100
  sw $t0, -44($fp)
  li $t1, 20
  lw $t0, -44($fp)
  sw $t1, 0($t0)
  addi $t0, $fp, -96
  sw $t0, -56($fp)
  li $t1, 2
  lw $t0, -56($fp)
  sw $t1, 0($t0)
  addi $t0, $fp, -92
  sw $t0, -68($fp)
  li $t1, 90
  lw $t0, -68($fp)
  sw $t1, 0($t0)
  addi $t0, $fp, -92
  sw $t0, -84($fp)
  lw $t1, -84($fp)
  lw $t0, 0($t1)
  sw $t0, -132($fp)
  addi $t0, $fp, -96
  sw $t0, -100($fp)
  lw $t1, -100($fp)
  lw $t0, 0($t1)
  sw $t0, -120($fp)
  addi $t0, $fp, -96
  sw $t0, -116($fp)
  lw $t1, -116($fp)
  lw $t0, 0($t1)
  sw $t0, -124($fp)
  lw $t1, -120($fp)
  lw $t2, -124($fp)
  mul $t0, $t1, $t2
  sw $t0, -136($fp)
  lw $t1, -132($fp)
  lw $t2, -136($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -148($fp)
  lw $t1, -148($fp)
  move $t0, $t1
  sw $t0, -152($fp)
  lw $a0, -152($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
