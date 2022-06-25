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

func_cal_bmi:
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
  lw $t1, -40($fp)
  lw $t0, -8($fp)
  sw $t1, 0($t0)
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

main:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -320
  li $t0, 0
  sw $t0, -4($fp)
  li $t0, 10
  sw $t0, -8($fp)
label1:
  lw $t1, -4($fp)
  lw $t2, -8($fp)
  blt $t1, $t2, label2
  j label3
label2:
  lw $t1, -4($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -212($fp)
  addi $t1, $fp, -208
  lw $t2, -212($fp)
  add $t0, $t1, $t2
  sw $t0, -216($fp)
  lw $t1, -216($fp)
  addi $t0, $t1, 0
  sw $t0, -220($fp)
  lw $t1, -4($fp)
  lw $t0, -220($fp)
  sw $t1, 0($t0)
  lw $t1, -4($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -224($fp)
  addi $t1, $fp, -208
  lw $t2, -224($fp)
  add $t0, $t1, $t2
  sw $t0, -228($fp)
  lw $t1, -228($fp)
  addi $t0, $t1, 4
  sw $t0, -232($fp)
  li $t1, 20
  lw $t2, -4($fp)
  add $t0, $t1, $t2
  sw $t0, -236($fp)
  lw $t1, -236($fp)
  lw $t0, -232($fp)
  sw $t1, 0($t0)
  lw $t1, -4($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -240($fp)
  addi $t1, $fp, -208
  lw $t2, -240($fp)
  add $t0, $t1, $t2
  sw $t0, -244($fp)
  lw $t1, -244($fp)
  addi $t0, $t1, 8
  sw $t0, -248($fp)
  li $t1, 2
  lw $t2, -4($fp)
  add $t0, $t1, $t2
  sw $t0, -252($fp)
  lw $t1, -252($fp)
  lw $t0, -248($fp)
  sw $t1, 0($t0)
  lw $t1, -4($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -256($fp)
  addi $t1, $fp, -208
  lw $t2, -256($fp)
  add $t0, $t1, $t2
  sw $t0, -260($fp)
  lw $t1, -260($fp)
  addi $t0, $t1, 12
  sw $t0, -264($fp)
  lw $t1, -4($fp)
  lw $t2, -4($fp)
  mul $t0, $t1, $t2
  sw $t0, -268($fp)
  lw $t1, -268($fp)
  lw $t2, -4($fp)
  mul $t0, $t1, $t2
  sw $t0, -272($fp)
  lw $t1, -272($fp)
  lw $t2, -4($fp)
  mul $t0, $t1, $t2
  sw $t0, -276($fp)
  li $t1, 90
  lw $t2, -276($fp)
  add $t0, $t1, $t2
  sw $t0, -280($fp)
  lw $t1, -280($fp)
  lw $t0, -264($fp)
  sw $t1, 0($t0)
  lw $t1, -4($fp)
  addi $t0, $t1, 1
  sw $t0, -284($fp)
  lw $t1, -284($fp)
  move $t0, $t1
  sw $t0, -4($fp)
  j label1
label3:
  li $t0, 0
  sw $t0, -4($fp)
label4:
  lw $t1, -4($fp)
  lw $t2, -8($fp)
  blt $t1, $t2, label5
  j label6
label5:
  lw $t1, -4($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -288($fp)
  addi $t1, $fp, -208
  lw $t2, -288($fp)
  add $t0, $t1, $t2
  sw $t0, -292($fp)
  addi $sp, $sp, -4
  lw $t0, -292($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_cal_bmi
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -296($fp)
  addi $sp, $sp, 4
  lw $t1, -4($fp)
  addi $t0, $t1, 1
  sw $t0, -300($fp)
  lw $t1, -300($fp)
  move $t0, $t1
  sw $t0, -4($fp)
  j label4
label6:
  li $t0, 0
  sw $t0, -4($fp)
label7:
  lw $t1, -4($fp)
  lw $t2, -8($fp)
  blt $t1, $t2, label8
  j label9
label8:
  lw $t1, -4($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -304($fp)
  addi $t1, $fp, -208
  lw $t2, -304($fp)
  add $t0, $t1, $t2
  sw $t0, -308($fp)
  lw $t1, -308($fp)
  addi $t0, $t1, 16
  sw $t0, -312($fp)
  lw $t1, -312($fp)
  lw $t0, 0($t1)
  sw $t0, -316($fp)
  lw $a0, -316($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  lw $t1, -4($fp)
  addi $t0, $t1, 1
  sw $t0, -320($fp)
  lw $t1, -320($fp)
  move $t0, $t1
  sw $t0, -4($fp)
  j label7
label9:
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
