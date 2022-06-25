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
  move $t0, $t1
  sw $t0, -68($fp)
  lw $t1, -24($fp)
  move $t0, $t1
  sw $t0, -72($fp)
  lw $t1, -68($fp)
  lw $t2, -72($fp)
  beq $t1, $t2, label1
  j label6
label6:
  lw $t1, -16($fp)
  move $t0, $t1
  sw $t0, -76($fp)
  lw $t1, -32($fp)
  move $t0, $t1
  sw $t0, -80($fp)
  lw $t1, -76($fp)
  lw $t2, -80($fp)
  beq $t1, $t2, label1
  j label5
label5:
  lw $t1, -40($fp)
  move $t0, $t1
  sw $t0, -84($fp)
  lw $t1, -56($fp)
  move $t0, $t1
  sw $t0, -88($fp)
  lw $t1, -84($fp)
  lw $t2, -88($fp)
  beq $t1, $t2, label1
  j label4
label4:
  lw $t1, -48($fp)
  move $t0, $t1
  sw $t0, -92($fp)
  lw $t1, -64($fp)
  move $t0, $t1
  sw $t0, -96($fp)
  lw $t1, -92($fp)
  lw $t2, -96($fp)
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
  move $t0, $t1
  sw $t0, -100($fp)
  lw $t1, -24($fp)
  move $t0, $t1
  sw $t0, -104($fp)
  lw $t1, -100($fp)
  lw $t2, -104($fp)
  blt $t1, $t2, label7
  j label8
label7:
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -108($fp)
  lw $t1, -108($fp)
  move $t0, $t1
  sw $t0, -112($fp)
  lw $t1, -24($fp)
  move $t0, $t1
  sw $t0, -116($fp)
  lw $t1, -116($fp)
  move $t0, $t1
  sw $t0, -120($fp)
  j label9
label8:
  lw $t1, -24($fp)
  move $t0, $t1
  sw $t0, -124($fp)
  lw $t1, -124($fp)
  move $t0, $t1
  sw $t0, -112($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -128($fp)
  lw $t1, -128($fp)
  move $t0, $t1
  sw $t0, -120($fp)
label9:
  lw $t1, -16($fp)
  move $t0, $t1
  sw $t0, -132($fp)
  lw $t1, -32($fp)
  move $t0, $t1
  sw $t0, -136($fp)
  lw $t1, -132($fp)
  lw $t2, -136($fp)
  blt $t1, $t2, label10
  j label11
label10:
  lw $t1, -32($fp)
  move $t0, $t1
  sw $t0, -140($fp)
  lw $t1, -140($fp)
  move $t0, $t1
  sw $t0, -144($fp)
  lw $t1, -16($fp)
  move $t0, $t1
  sw $t0, -148($fp)
  lw $t1, -148($fp)
  move $t0, $t1
  sw $t0, -152($fp)
  j label12
label11:
  lw $t1, -16($fp)
  move $t0, $t1
  sw $t0, -156($fp)
  lw $t1, -156($fp)
  move $t0, $t1
  sw $t0, -144($fp)
  lw $t1, -32($fp)
  move $t0, $t1
  sw $t0, -160($fp)
  lw $t1, -160($fp)
  move $t0, $t1
  sw $t0, -152($fp)
label12:
  lw $t1, -40($fp)
  move $t0, $t1
  sw $t0, -164($fp)
  lw $t1, -56($fp)
  move $t0, $t1
  sw $t0, -168($fp)
  lw $t1, -164($fp)
  lw $t2, -168($fp)
  blt $t1, $t2, label13
  j label14
label13:
  lw $t1, -40($fp)
  move $t0, $t1
  sw $t0, -172($fp)
  lw $t1, -172($fp)
  move $t0, $t1
  sw $t0, -176($fp)
  lw $t1, -56($fp)
  move $t0, $t1
  sw $t0, -180($fp)
  lw $t1, -180($fp)
  move $t0, $t1
  sw $t0, -184($fp)
  j label15
label14:
  lw $t1, -56($fp)
  move $t0, $t1
  sw $t0, -188($fp)
  lw $t1, -188($fp)
  move $t0, $t1
  sw $t0, -176($fp)
  lw $t1, -40($fp)
  move $t0, $t1
  sw $t0, -192($fp)
  lw $t1, -192($fp)
  move $t0, $t1
  sw $t0, -184($fp)
label15:
  lw $t1, -48($fp)
  move $t0, $t1
  sw $t0, -196($fp)
  lw $t1, -64($fp)
  move $t0, $t1
  sw $t0, -200($fp)
  lw $t1, -196($fp)
  lw $t2, -200($fp)
  blt $t1, $t2, label16
  j label17
label16:
  lw $t1, -64($fp)
  move $t0, $t1
  sw $t0, -204($fp)
  lw $t1, -204($fp)
  move $t0, $t1
  sw $t0, -208($fp)
  lw $t1, -48($fp)
  move $t0, $t1
  sw $t0, -212($fp)
  lw $t1, -212($fp)
  move $t0, $t1
  sw $t0, -216($fp)
  j label18
label17:
  lw $t1, -48($fp)
  move $t0, $t1
  sw $t0, -220($fp)
  lw $t1, -220($fp)
  move $t0, $t1
  sw $t0, -208($fp)
  lw $t1, -64($fp)
  move $t0, $t1
  sw $t0, -224($fp)
  lw $t1, -224($fp)
  move $t0, $t1
  sw $t0, -216($fp)
label18:
  lw $t1, -176($fp)
  move $t0, $t1
  sw $t0, -228($fp)
  lw $t1, -120($fp)
  move $t0, $t1
  sw $t0, -232($fp)
  lw $t1, -228($fp)
  lw $t2, -232($fp)
  bge $t1, $t2, label19
  j label24
label24:
  lw $t1, -184($fp)
  move $t0, $t1
  sw $t0, -236($fp)
  lw $t1, -112($fp)
  move $t0, $t1
  sw $t0, -240($fp)
  lw $t1, -236($fp)
  lw $t2, -240($fp)
  ble $t1, $t2, label19
  j label23
label23:
  lw $t1, -216($fp)
  move $t0, $t1
  sw $t0, -244($fp)
  lw $t1, -144($fp)
  move $t0, $t1
  sw $t0, -248($fp)
  lw $t1, -244($fp)
  lw $t2, -248($fp)
  bge $t1, $t2, label19
  j label22
label22:
  lw $t1, -208($fp)
  move $t0, $t1
  sw $t0, -252($fp)
  lw $t1, -152($fp)
  move $t0, $t1
  sw $t0, -256($fp)
  lw $t1, -252($fp)
  lw $t2, -256($fp)
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
