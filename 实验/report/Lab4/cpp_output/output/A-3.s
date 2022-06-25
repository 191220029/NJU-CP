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
  addi $sp, $sp, -168
  li $t0, 0
  sw $t0, -4($fp)
  li $t0, 0
  sw $t0, -8($fp)
  li $t0, 1
  sw $t0, -12($fp)
  li $t0, 1
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
  lw $t1, -24($fp)
  move $t0, $t1
  sw $t0, -28($fp)
  lw $t1, -28($fp)
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
  move $t0, $t1
  sw $t0, -32($fp)
  lw $t1, -24($fp)
  move $t0, $t1
  sw $t0, -36($fp)
  lw $t1, -32($fp)
  lw $t2, -36($fp)
  blt $t1, $t2, label4
  j label5
label4:
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -40($fp)
  lw $t1, -40($fp)
  addi $t0, $t1, 1
  sw $t0, -44($fp)
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -4($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -48($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -52($fp)
  lw $t1, -48($fp)
  lw $t2, -52($fp)
  add $t0, $t1, $t2
  sw $t0, -56($fp)
  lw $t1, -56($fp)
  move $t0, $t1
  sw $t0, -8($fp)
  j label3
label5:
  lw $t1, -24($fp)
  move $t0, $t1
  sw $t0, -60($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -64($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -68($fp)
  lw $t1, -64($fp)
  lw $t2, -68($fp)
  sub $t0, $t1, $t2
  sw $t0, -72($fp)
  lw $t1, -60($fp)
  lw $t2, -72($fp)
  sub $t0, $t1, $t2
  sw $t0, -76($fp)
  lw $t1, -76($fp)
  move $t0, $t1
  sw $t0, -80($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -84($fp)
  lw $t1, -84($fp)
  move $t0, $t1
  sw $t0, -88($fp)
  lw $t1, -88($fp)
  move $t0, $t1
  sw $t0, -92($fp)
  lw $a0, -92($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  lw $t1, -80($fp)
  move $t0, $t1
  sw $t0, -96($fp)
  lw $a0, -96($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $t0, 0
  sw $t0, -8($fp)
label6:
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -100($fp)
  lw $t1, -80($fp)
  move $t0, $t1
  sw $t0, -104($fp)
  lw $t1, -100($fp)
  lw $t2, -104($fp)
  blt $t1, $t2, label7
  j label8
label7:
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -108($fp)
  lw $t1, -88($fp)
  move $t0, $t1
  sw $t0, -112($fp)
  lw $t1, -108($fp)
  lw $t2, -112($fp)
  mul $t0, $t1, $t2
  sw $t0, -116($fp)
  lw $t1, -116($fp)
  move $t0, $t1
  sw $t0, -12($fp)
  lw $t1, -88($fp)
  move $t0, $t1
  sw $t0, -120($fp)
  lw $t1, -120($fp)
  addi $t0, $t1, -1
  sw $t0, -124($fp)
  lw $t1, -124($fp)
  move $t0, $t1
  sw $t0, -88($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -128($fp)
  lw $t1, -128($fp)
  addi $t0, $t1, 1
  sw $t0, -132($fp)
  lw $t1, -132($fp)
  move $t0, $t1
  sw $t0, -8($fp)
  j label6
label8:
label9:
  lw $t1, -80($fp)
  move $t0, $t1
  sw $t0, -136($fp)
  lw $t1, -136($fp)
  li $t2, 0
  bgt $t1, $t2, label10
  j label11
label10:
  lw $t1, -16($fp)
  move $t0, $t1
  sw $t0, -140($fp)
  lw $t1, -80($fp)
  move $t0, $t1
  sw $t0, -144($fp)
  lw $t1, -140($fp)
  lw $t2, -144($fp)
  mul $t0, $t1, $t2
  sw $t0, -148($fp)
  lw $t1, -148($fp)
  move $t0, $t1
  sw $t0, -16($fp)
  lw $t1, -80($fp)
  move $t0, $t1
  sw $t0, -152($fp)
  lw $t1, -152($fp)
  addi $t0, $t1, -1
  sw $t0, -156($fp)
  lw $t1, -156($fp)
  move $t0, $t1
  sw $t0, -80($fp)
  j label9
label11:
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -160($fp)
  lw $t1, -16($fp)
  move $t0, $t1
  sw $t0, -164($fp)
  lw $t1, -160($fp)
  lw $t2, -164($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -168($fp)
  lw $a0, -168($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
