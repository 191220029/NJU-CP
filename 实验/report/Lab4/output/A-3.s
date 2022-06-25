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
  addi $sp, $sp, -72
  li $t0, 0
  sw $t0, -4($fp)
  li $t0, 0
  sw $t0, -8($fp)
  li $t0, 0
  sw $t0, -12($fp)
  li $t0, 0
  sw $t0, -16($fp)
  li $t0, 1
  sw $t0, -20($fp)
  li $t0, 1
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
  li $t2, 0
  ble $t1, $t2, label1
  j label2
label1:
  li $a0, -1
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
label2:
label3:
  lw $t1, -8($fp)
  lw $t2, -32($fp)
  blt $t1, $t2, label4
  j label5
label4:
  lw $t1, -4($fp)
  addi $t0, $t1, 1
  sw $t0, -36($fp)
  lw $t1, -36($fp)
  move $t0, $t1
  sw $t0, -4($fp)
  lw $t1, -8($fp)
  lw $t2, -4($fp)
  add $t0, $t1, $t2
  sw $t0, -40($fp)
  lw $t1, -40($fp)
  move $t0, $t1
  sw $t0, -8($fp)
  j label3
label5:
  lw $t1, -8($fp)
  lw $t2, -4($fp)
  sub $t0, $t1, $t2
  sw $t0, -44($fp)
  lw $t1, -32($fp)
  lw $t2, -44($fp)
  sub $t0, $t1, $t2
  sw $t0, -48($fp)
  lw $t1, -48($fp)
  move $t0, $t1
  sw $t0, -12($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -16($fp)
  lw $a0, -16($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  lw $a0, -12($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $t0, 0
  sw $t0, -8($fp)
label6:
  lw $t1, -8($fp)
  lw $t2, -12($fp)
  blt $t1, $t2, label7
  j label8
label7:
  lw $t1, -20($fp)
  lw $t2, -16($fp)
  mul $t0, $t1, $t2
  sw $t0, -52($fp)
  lw $t1, -52($fp)
  move $t0, $t1
  sw $t0, -20($fp)
  lw $t1, -16($fp)
  addi $t0, $t1, -1
  sw $t0, -56($fp)
  lw $t1, -56($fp)
  move $t0, $t1
  sw $t0, -16($fp)
  lw $t1, -8($fp)
  addi $t0, $t1, 1
  sw $t0, -60($fp)
  lw $t1, -60($fp)
  move $t0, $t1
  sw $t0, -8($fp)
  j label6
label8:
label9:
  lw $t1, -12($fp)
  li $t2, 0
  bgt $t1, $t2, label10
  j label11
label10:
  lw $t1, -24($fp)
  lw $t2, -12($fp)
  mul $t0, $t1, $t2
  sw $t0, -64($fp)
  lw $t1, -64($fp)
  move $t0, $t1
  sw $t0, -24($fp)
  lw $t1, -12($fp)
  addi $t0, $t1, -1
  sw $t0, -68($fp)
  lw $t1, -68($fp)
  move $t0, $t1
  sw $t0, -12($fp)
  j label9
label11:
  lw $t1, -20($fp)
  lw $t2, -24($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -72($fp)
  lw $a0, -72($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
