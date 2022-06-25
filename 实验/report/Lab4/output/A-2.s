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
  addi $sp, $sp, -96
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
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -36($fp)
  lw $t1, -36($fp)
  move $t0, $t1
  sw $t0, -40($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -44($fp)
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -48($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -52($fp)
  lw $t1, -52($fp)
  move $t0, $t1
  sw $t0, -56($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -60($fp)
  lw $t1, -60($fp)
  move $t0, $t1
  sw $t0, -64($fp)
  lw $t1, -8($fp)
  lw $t2, -24($fp)
  beq $t1, $t2, label1
  j label6
label6:
  lw $t1, -16($fp)
  lw $t2, -32($fp)
  beq $t1, $t2, label1
  j label5
label5:
  lw $t1, -40($fp)
  lw $t2, -56($fp)
  beq $t1, $t2, label1
  j label4
label4:
  lw $t1, -48($fp)
  lw $t2, -64($fp)
  beq $t1, $t2, label1
  j label2
label1:
  li $a0, -1
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  j label3
label2:
  lw $t1, -8($fp)
  lw $t2, -24($fp)
  blt $t1, $t2, label7
  j label8
label7:
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -68($fp)
  lw $t1, -24($fp)
  move $t0, $t1
  sw $t0, -72($fp)
  j label9
label8:
  lw $t1, -24($fp)
  move $t0, $t1
  sw $t0, -68($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -72($fp)
label9:
  lw $t1, -16($fp)
  lw $t2, -32($fp)
  blt $t1, $t2, label10
  j label11
label10:
  lw $t1, -32($fp)
  move $t0, $t1
  sw $t0, -76($fp)
  lw $t1, -16($fp)
  move $t0, $t1
  sw $t0, -80($fp)
  j label12
label11:
  lw $t1, -16($fp)
  move $t0, $t1
  sw $t0, -76($fp)
  lw $t1, -32($fp)
  move $t0, $t1
  sw $t0, -80($fp)
label12:
  lw $t1, -40($fp)
  lw $t2, -56($fp)
  blt $t1, $t2, label13
  j label14
label13:
  lw $t1, -40($fp)
  move $t0, $t1
  sw $t0, -84($fp)
  lw $t1, -56($fp)
  move $t0, $t1
  sw $t0, -88($fp)
  j label15
label14:
  lw $t1, -56($fp)
  move $t0, $t1
  sw $t0, -84($fp)
  lw $t1, -40($fp)
  move $t0, $t1
  sw $t0, -88($fp)
label15:
  lw $t1, -48($fp)
  lw $t2, -64($fp)
  blt $t1, $t2, label16
  j label17
label16:
  lw $t1, -64($fp)
  move $t0, $t1
  sw $t0, -92($fp)
  lw $t1, -48($fp)
  move $t0, $t1
  sw $t0, -96($fp)
  j label18
label17:
  lw $t1, -48($fp)
  move $t0, $t1
  sw $t0, -92($fp)
  lw $t1, -64($fp)
  move $t0, $t1
  sw $t0, -96($fp)
label18:
  lw $t1, -84($fp)
  lw $t2, -72($fp)
  bge $t1, $t2, label19
  j label24
label24:
  lw $t1, -88($fp)
  lw $t2, -68($fp)
  ble $t1, $t2, label19
  j label23
label23:
  lw $t1, -96($fp)
  lw $t2, -76($fp)
  bge $t1, $t2, label19
  j label22
label22:
  lw $t1, -92($fp)
  lw $t2, -80($fp)
  ble $t1, $t2, label19
  j label20
label19:
  li $a0, 0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  j label21
label20:
  li $a0, 1
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
label21:
label3:
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
