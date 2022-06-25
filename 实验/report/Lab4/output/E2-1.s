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
  li $t0, 5
  sw $t0, -4($fp)
  li $t0, 0
  sw $t0, -208($fp)
label1:
  lw $t1, -208($fp)
  lw $t2, -4($fp)
  blt $t1, $t2, label2
  j label3
label2:
  li $t0, 0
  sw $t0, -212($fp)
label4:
  lw $t1, -212($fp)
  lw $t2, -4($fp)
  blt $t1, $t2, label5
  j label6
label5:
  li $t0, 0
  sw $t0, -216($fp)
  lw $t1, -212($fp)
  move $t0, $t1
  sw $t0, -220($fp)
  lw $t1, -208($fp)
  move $t0, $t1
  sw $t0, -224($fp)
  lw $t1, -224($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -224($fp)
  lw $t1, -216($fp)
  lw $t2, -224($fp)
  add $t0, $t1, $t2
  sw $t0, -216($fp)
  lw $t1, -220($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -220($fp)
  lw $t1, -216($fp)
  lw $t2, -220($fp)
  add $t0, $t1, $t2
  sw $t0, -216($fp)
  addi $t1, $fp, -104
  lw $t2, -216($fp)
  add $t0, $t1, $t2
  sw $t0, -228($fp)
  lw $t1, -208($fp)
  lw $t2, -208($fp)
  mul $t0, $t1, $t2
  sw $t0, -232($fp)
  lw $t1, -232($fp)
  lw $t2, -212($fp)
  add $t0, $t1, $t2
  sw $t0, -236($fp)
  lw $t1, -236($fp)
  lw $t0, -228($fp)
  sw $t1, 0($t0)
  lw $t1, -212($fp)
  addi $t0, $t1, 1
  sw $t0, -240($fp)
  lw $t1, -240($fp)
  move $t0, $t1
  sw $t0, -212($fp)
  j label4
label6:
  lw $t1, -208($fp)
  addi $t0, $t1, 1
  sw $t0, -244($fp)
  lw $t1, -244($fp)
  move $t0, $t1
  sw $t0, -208($fp)
  j label1
label3:
  li $t0, 0
  sw $t0, -208($fp)
label7:
  lw $t1, -208($fp)
  lw $t2, -4($fp)
  blt $t1, $t2, label8
  j label9
label8:
  li $t0, 0
  sw $t0, -212($fp)
label10:
  lw $t1, -212($fp)
  lw $t2, -4($fp)
  blt $t1, $t2, label11
  j label12
label11:
  li $t0, 0
  sw $t0, -248($fp)
  lw $t1, -208($fp)
  move $t0, $t1
  sw $t0, -252($fp)
  lw $t1, -212($fp)
  move $t0, $t1
  sw $t0, -256($fp)
  lw $t1, -256($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -256($fp)
  lw $t1, -248($fp)
  lw $t2, -256($fp)
  add $t0, $t1, $t2
  sw $t0, -248($fp)
  lw $t1, -252($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -252($fp)
  lw $t1, -248($fp)
  lw $t2, -252($fp)
  add $t0, $t1, $t2
  sw $t0, -248($fp)
  addi $t1, $fp, -104
  lw $t2, -248($fp)
  add $t0, $t1, $t2
  sw $t0, -260($fp)
  li $t0, 0
  sw $t0, -264($fp)
  lw $t1, -212($fp)
  move $t0, $t1
  sw $t0, -268($fp)
  lw $t1, -208($fp)
  move $t0, $t1
  sw $t0, -272($fp)
  lw $t1, -272($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -272($fp)
  lw $t1, -264($fp)
  lw $t2, -272($fp)
  add $t0, $t1, $t2
  sw $t0, -264($fp)
  lw $t1, -268($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -268($fp)
  lw $t1, -264($fp)
  lw $t2, -268($fp)
  add $t0, $t1, $t2
  sw $t0, -264($fp)
  addi $t1, $fp, -104
  lw $t2, -264($fp)
  add $t0, $t1, $t2
  sw $t0, -276($fp)
  lw $t1, -276($fp)
  lw $t0, 0($t1)
  sw $t0, -280($fp)
  lw $t1, -280($fp)
  lw $t0, -260($fp)
  sw $t1, 0($t0)
  lw $t1, -212($fp)
  addi $t0, $t1, 1
  sw $t0, -284($fp)
  lw $t1, -284($fp)
  move $t0, $t1
  sw $t0, -212($fp)
  j label10
label12:
  lw $t1, -208($fp)
  addi $t0, $t1, 1
  sw $t0, -288($fp)
  lw $t1, -288($fp)
  move $t0, $t1
  sw $t0, -208($fp)
  j label7
label9:
  li $t0, 0
  sw $t0, -292($fp)
  li $t0, 0
  sw $t0, -208($fp)
label13:
  lw $t1, -208($fp)
  lw $t2, -4($fp)
  blt $t1, $t2, label14
  j label15
label14:
  li $t0, 0
  sw $t0, -296($fp)
  lw $t1, -208($fp)
  move $t0, $t1
  sw $t0, -300($fp)
  li $t0, 0
  sw $t0, -304($fp)
  lw $t1, -304($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -304($fp)
  lw $t1, -296($fp)
  lw $t2, -304($fp)
  add $t0, $t1, $t2
  sw $t0, -296($fp)
  lw $t1, -300($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -300($fp)
  lw $t1, -296($fp)
  lw $t2, -300($fp)
  add $t0, $t1, $t2
  sw $t0, -296($fp)
  addi $t1, $fp, -104
  lw $t2, -296($fp)
  add $t0, $t1, $t2
  sw $t0, -308($fp)
  lw $t1, -308($fp)
  lw $t0, 0($t1)
  sw $t0, -312($fp)
  lw $t1, -292($fp)
  lw $t2, -312($fp)
  add $t0, $t1, $t2
  sw $t0, -316($fp)
  lw $t1, -316($fp)
  move $t0, $t1
  sw $t0, -292($fp)
  lw $t1, -208($fp)
  addi $t0, $t1, 1
  sw $t0, -320($fp)
  lw $t1, -320($fp)
  move $t0, $t1
  sw $t0, -208($fp)
  j label13
label15:
  lw $a0, -292($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
