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
  addi $sp, $sp, -320
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -12($fp)
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -168($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -24($fp)
  lw $t1, -24($fp)
  move $t0, $t1
  sw $t0, -200($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -36($fp)
  lw $t1, -36($fp)
  move $t0, $t1
  sw $t0, -160($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -48($fp)
  lw $t1, -48($fp)
  move $t0, $t1
  sw $t0, -208($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -60($fp)
  lw $t1, -60($fp)
  move $t0, $t1
  sw $t0, -248($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -72($fp)
  lw $t1, -72($fp)
  move $t0, $t1
  sw $t0, -280($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -84($fp)
  lw $t1, -84($fp)
  move $t0, $t1
  sw $t0, -240($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -96($fp)
  lw $t1, -96($fp)
  move $t0, $t1
  sw $t0, -288($fp)
  lw $t1, -168($fp)
  lw $t2, -160($fp)
  beq $t1, $t2, label1
  j label6
label6:
  lw $t1, -200($fp)
  lw $t2, -208($fp)
  beq $t1, $t2, label1
  j label5
label5:
  lw $t1, -248($fp)
  lw $t2, -240($fp)
  beq $t1, $t2, label1
  j label4
label4:
  lw $t1, -280($fp)
  lw $t2, -288($fp)
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
  lw $t1, -168($fp)
  lw $t2, -160($fp)
  blt $t1, $t2, label7
  j label8
label7:
  lw $t1, -168($fp)
  move $t0, $t1
  sw $t0, -304($fp)
  lw $t1, -160($fp)
  move $t0, $t1
  sw $t0, -296($fp)
  j label9
label8:
  lw $t1, -160($fp)
  move $t0, $t1
  sw $t0, -304($fp)
  lw $t1, -168($fp)
  move $t0, $t1
  sw $t0, -296($fp)
label9:
  lw $t1, -200($fp)
  lw $t2, -208($fp)
  blt $t1, $t2, label10
  j label11
label10:
  lw $t1, -208($fp)
  move $t0, $t1
  sw $t0, -312($fp)
  lw $t1, -200($fp)
  move $t0, $t1
  sw $t0, -320($fp)
  j label12
label11:
  lw $t1, -200($fp)
  move $t0, $t1
  sw $t0, -312($fp)
  lw $t1, -208($fp)
  move $t0, $t1
  sw $t0, -320($fp)
label12:
  lw $t1, -248($fp)
  lw $t2, -240($fp)
  blt $t1, $t2, label13
  j label14
label13:
  lw $t1, -248($fp)
  move $t0, $t1
  sw $t0, -292($fp)
  lw $t1, -240($fp)
  move $t0, $t1
  sw $t0, -300($fp)
  j label15
label14:
  lw $t1, -240($fp)
  move $t0, $t1
  sw $t0, -292($fp)
  lw $t1, -248($fp)
  move $t0, $t1
  sw $t0, -300($fp)
label15:
  lw $t1, -280($fp)
  lw $t2, -288($fp)
  blt $t1, $t2, label16
  j label17
label16:
  lw $t1, -288($fp)
  move $t0, $t1
  sw $t0, -316($fp)
  lw $t1, -280($fp)
  move $t0, $t1
  sw $t0, -308($fp)
  j label18
label17:
  lw $t1, -280($fp)
  move $t0, $t1
  sw $t0, -316($fp)
  lw $t1, -288($fp)
  move $t0, $t1
  sw $t0, -308($fp)
label18:
  lw $t1, -292($fp)
  lw $t2, -296($fp)
  bge $t1, $t2, label19
  j label24
label24:
  lw $t1, -300($fp)
  lw $t2, -304($fp)
  ble $t1, $t2, label19
  j label23
label23:
  lw $t1, -308($fp)
  lw $t2, -312($fp)
  bge $t1, $t2, label19
  j label22
label22:
  lw $t1, -316($fp)
  lw $t2, -320($fp)
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
