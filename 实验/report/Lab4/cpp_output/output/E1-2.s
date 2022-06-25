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

_cal_bmi:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -40
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t1, -4($fp)
  addi $t0, $t1, 16
  sw $t0, -8($fp)
  lw $t1, -4($fp)
  addi $t0, $t1, 12
  sw $t0, -12($fp)
  lw $t1, -12($fp)
  lw $t0, 0($t1)
  sw $t0, -16($fp)
  lw $t1, -4($fp)
  addi $t0, $t1, 8
  sw $t0, -20($fp)
  lw $t1, -20($fp)
  lw $t0, 0($t1)
  sw $t0, -24($fp)
  lw $t1, -4($fp)
  addi $t0, $t1, 8
  sw $t0, -28($fp)
  lw $t1, -28($fp)
  lw $t0, 0($t1)
  sw $t0, -32($fp)
  lw $t1, -24($fp)
  lw $t2, -32($fp)
  mul $t0, $t1, $t2
  sw $t0, -36($fp)
  lw $t1, -16($fp)
  lw $t2, -36($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -40($fp)
  lw $t0, -8($fp)
  lw $t1, -40($fp)
  sw $t1, 0($t0)
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

main:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -392
  li $t0, 0
  sw $t0, -4($fp)
label1:
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -208($fp)
  lw $t1, -208($fp)
  li $t2, 10
  blt $t1, $t2, label2
  j label3
label2:
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -212($fp)
  lw $t1, -212($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -216($fp)
  addi $t0, $fp, -204
  lw $t2, -216($fp)
  add $t0, $t0, $t2
  sw $t0, -220($fp)
  lw $t1, -220($fp)
  addi $t0, $t1, 0
  sw $t0, -224($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -228($fp)
  lw $t0, -224($fp)
  lw $t1, -228($fp)
  sw $t1, 0($t0)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -232($fp)
  lw $t1, -232($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -236($fp)
  addi $t0, $fp, -204
  lw $t2, -236($fp)
  add $t0, $t0, $t2
  sw $t0, -240($fp)
  lw $t1, -240($fp)
  addi $t0, $t1, 4
  sw $t0, -244($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -248($fp)
  lw $t2, -248($fp)
  addi $t0, $t2, 20
  sw $t0, -252($fp)
  lw $t0, -244($fp)
  lw $t1, -252($fp)
  sw $t1, 0($t0)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -256($fp)
  lw $t1, -256($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -260($fp)
  addi $t0, $fp, -204
  lw $t2, -260($fp)
  add $t0, $t0, $t2
  sw $t0, -264($fp)
  lw $t1, -264($fp)
  addi $t0, $t1, 8
  sw $t0, -268($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -272($fp)
  lw $t2, -272($fp)
  addi $t0, $t2, 2
  sw $t0, -276($fp)
  lw $t0, -268($fp)
  lw $t1, -276($fp)
  sw $t1, 0($t0)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -280($fp)
  lw $t1, -280($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -284($fp)
  addi $t0, $fp, -204
  lw $t2, -284($fp)
  add $t0, $t0, $t2
  sw $t0, -288($fp)
  lw $t1, -288($fp)
  addi $t0, $t1, 12
  sw $t0, -292($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -296($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -300($fp)
  lw $t1, -296($fp)
  lw $t2, -300($fp)
  mul $t0, $t1, $t2
  sw $t0, -304($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -308($fp)
  lw $t1, -304($fp)
  lw $t2, -308($fp)
  mul $t0, $t1, $t2
  sw $t0, -312($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -316($fp)
  lw $t1, -312($fp)
  lw $t2, -316($fp)
  mul $t0, $t1, $t2
  sw $t0, -320($fp)
  lw $t2, -320($fp)
  addi $t0, $t2, 90
  sw $t0, -324($fp)
  lw $t0, -292($fp)
  lw $t1, -324($fp)
  sw $t1, 0($t0)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -328($fp)
  lw $t1, -328($fp)
  addi $t0, $t1, 1
  sw $t0, -332($fp)
  lw $t1, -332($fp)
  move $t0, $t1
  sw $t0, -4($fp)
  j label1
label3:
  li $t0, 0
  sw $t0, -4($fp)
label4:
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -336($fp)
  lw $t1, -336($fp)
  li $t2, 10
  blt $t1, $t2, label5
  j label6
label5:
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -340($fp)
  lw $t1, -340($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -344($fp)
  addi $t0, $fp, -204
  lw $t2, -344($fp)
  add $t0, $t0, $t2
  sw $t0, -348($fp)
  addi $sp, $sp, -4
  lw $t0, -348($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _cal_bmi
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -352($fp)
  addi $sp, $sp, 4
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -356($fp)
  lw $t1, -356($fp)
  addi $t0, $t1, 1
  sw $t0, -360($fp)
  lw $t1, -360($fp)
  move $t0, $t1
  sw $t0, -4($fp)
  j label4
label6:
  li $t0, 0
  sw $t0, -4($fp)
label7:
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -364($fp)
  lw $t1, -364($fp)
  li $t2, 10
  blt $t1, $t2, label8
  j label9
label8:
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -368($fp)
  lw $t1, -368($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -372($fp)
  addi $t0, $fp, -204
  lw $t2, -372($fp)
  add $t0, $t0, $t2
  sw $t0, -376($fp)
  lw $t1, -376($fp)
  addi $t0, $t1, 16
  sw $t0, -380($fp)
  lw $t1, -380($fp)
  lw $t0, 0($t1)
  sw $t0, -384($fp)
  lw $a0, -384($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -388($fp)
  lw $t1, -388($fp)
  addi $t0, $t1, 1
  sw $t0, -392($fp)
  lw $t1, -392($fp)
  move $t0, $t1
  sw $t0, -4($fp)
  j label7
label9:
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
