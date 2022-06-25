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
  addi $sp, $sp, -252
  li $t0, 0
  sw $t0, -124($fp)
  li $t0, 0
  sw $t0, -192($fp)
  li $t0, 0
  sw $t0, -232($fp)
  li $t0, 0
  sw $t0, -176($fp)
  li $t0, 1
  sw $t0, -240($fp)
  li $t0, 1
  sw $t0, -244($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -36($fp)
  lw $t1, -36($fp)
  move $t0, $t1
  sw $t0, -100($fp)
  lw $t1, -100($fp)
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
  lw $t1, -192($fp)
  lw $t2, -100($fp)
  blt $t1, $t2, label4
  j label5
label4:
  lw $t1, -124($fp)
  addi $t0, $t1, 1
  sw $t0, -64($fp)
  lw $t1, -64($fp)
  move $t0, $t1
  sw $t0, -124($fp)
  lw $t1, -192($fp)
  lw $t2, -124($fp)
  add $t0, $t1, $t2
  sw $t0, -84($fp)
  lw $t1, -84($fp)
  move $t0, $t1
  sw $t0, -192($fp)
  j label3
label5:
  lw $t1, -192($fp)
  lw $t2, -124($fp)
  sub $t0, $t1, $t2
  sw $t0, -104($fp)
  lw $t1, -100($fp)
  lw $t2, -104($fp)
  sub $t0, $t1, $t2
  sw $t0, -116($fp)
  lw $t1, -116($fp)
  move $t0, $t1
  sw $t0, -232($fp)
  lw $t1, -124($fp)
  move $t0, $t1
  sw $t0, -176($fp)
  lw $a0, -176($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  lw $a0, -232($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $t0, 0
  sw $t0, -192($fp)
label6:
  lw $t1, -192($fp)
  lw $t2, -232($fp)
  blt $t1, $t2, label7
  j label8
label7:
  lw $t1, -240($fp)
  lw $t2, -176($fp)
  mul $t0, $t1, $t2
  sw $t0, -164($fp)
  lw $t1, -164($fp)
  move $t0, $t1
  sw $t0, -240($fp)
  lw $t1, -176($fp)
  addi $t0, $t1, -1
  sw $t0, -180($fp)
  lw $t1, -180($fp)
  move $t0, $t1
  sw $t0, -176($fp)
  lw $t1, -192($fp)
  addi $t0, $t1, 1
  sw $t0, -196($fp)
  lw $t1, -196($fp)
  move $t0, $t1
  sw $t0, -192($fp)
  j label6
label8:
label9:
  lw $t1, -232($fp)
  li $t2, 0
  bgt $t1, $t2, label10
  j label11
label10:
  lw $t1, -244($fp)
  lw $t2, -232($fp)
  mul $t0, $t1, $t2
  sw $t0, -220($fp)
  lw $t1, -220($fp)
  move $t0, $t1
  sw $t0, -244($fp)
  lw $t1, -232($fp)
  addi $t0, $t1, -1
  sw $t0, -236($fp)
  lw $t1, -236($fp)
  move $t0, $t1
  sw $t0, -232($fp)
  j label9
label11:
  lw $t1, -240($fp)
  lw $t2, -244($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -252($fp)
  lw $a0, -252($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
