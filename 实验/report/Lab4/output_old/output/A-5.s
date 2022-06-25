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

func_add:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -24
  lw $t0, 8($fp)
  sw $t0, -12($fp)
  lw $t0, 12($fp)
  sw $t0, -16($fp)
  lw $t1, -12($fp)
  lw $t2, -16($fp)
  add $t0, $t1, $t2
  sw $t0, -24($fp)
  lw $v0, -24($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

func_sub:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -24
  lw $t0, 8($fp)
  sw $t0, -12($fp)
  lw $t0, 12($fp)
  sw $t0, -16($fp)
  lw $t1, -12($fp)
  lw $t2, -16($fp)
  sub $t0, $t1, $t2
  sw $t0, -24($fp)
  lw $v0, -24($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

func_mul:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -24
  lw $t0, 8($fp)
  sw $t0, -12($fp)
  lw $t0, 12($fp)
  sw $t0, -16($fp)
  lw $t1, -12($fp)
  lw $t2, -16($fp)
  mul $t0, $t1, $t2
  sw $t0, -24($fp)
  lw $v0, -24($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

main:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -120
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -12($fp)
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -80($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -24($fp)
  lw $t1, -24($fp)
  move $t0, $t1
  sw $t0, -76($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -36($fp)
  lw $t1, -36($fp)
  move $t0, $t1
  sw $t0, -56($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -48($fp)
  lw $t1, -48($fp)
  move $t0, $t1
  sw $t0, -52($fp)
  addi $sp, $sp, -4
  lw $t0, -52($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -56($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_add
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -100($fp)
  addi $sp, $sp, 8
  addi $sp, $sp, -4
  lw $t0, -76($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -80($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_sub
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -88($fp)
  addi $sp, $sp, 8
  addi $sp, $sp, -4
  lw $t0, -76($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -80($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_sub
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -92($fp)
  addi $sp, $sp, 8
  addi $sp, $sp, -4
  lw $t0, -88($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -92($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_mul
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -104($fp)
  addi $sp, $sp, 8
  addi $sp, $sp, -4
  lw $t0, -100($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -104($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_add
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -116($fp)
  addi $sp, $sp, 8
  lw $t1, -116($fp)
  move $t0, $t1
  sw $t0, -120($fp)
  lw $a0, -120($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
