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

func_cal_avg_bmi:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -64
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  li $t0, 0
  sw $t0, -8($fp)
  li $t0, 0
  sw $t0, -12($fp)
label1:
  lw $t1, -8($fp)
  li $t2, 5
  blt $t1, $t2, label2
  j label3
label2:
  lw $t1, -4($fp)
  addi $t0, $t1, 0
  sw $t0, -16($fp)
  lw $t1, -8($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -20($fp)
  lw $t1, -16($fp)
  lw $t2, -20($fp)
  add $t0, $t1, $t2
  sw $t0, -24($fp)
  addi $sp, $sp, -4
  lw $t0, -24($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_cal_bmi
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -28($fp)
  addi $sp, $sp, 4
  lw $t1, -4($fp)
  addi $t0, $t1, 0
  sw $t0, -32($fp)
  lw $t1, -8($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -36($fp)
  lw $t1, -32($fp)
  lw $t2, -36($fp)
  add $t0, $t1, $t2
  sw $t0, -40($fp)
  lw $t1, -40($fp)
  addi $t0, $t1, 16
  sw $t0, -44($fp)
  lw $t1, -44($fp)
  lw $t0, 0($t1)
  sw $t0, -48($fp)
  lw $t1, -12($fp)
  lw $t2, -48($fp)
  add $t0, $t1, $t2
  sw $t0, -52($fp)
  lw $t1, -52($fp)
  move $t0, $t1
  sw $t0, -12($fp)
  lw $t1, -8($fp)
  addi $t0, $t1, 1
  sw $t0, -56($fp)
  lw $t1, -56($fp)
  move $t0, $t1
  sw $t0, -8($fp)
  j label1
label3:
  lw $t1, -4($fp)
  addi $t0, $t1, 400
  sw $t0, -60($fp)
  lw $t1, -12($fp)
  li $t2, 5
  div $t1, $t2
  mflo $t0
  sw $t0, -64($fp)
  lw $t1, -64($fp)
  lw $t0, -60($fp)
  sw $t1, 0($t0)
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

main:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -4240
  li $t0, 0
  sw $t0, -4044($fp)
label4:
  lw $t1, -4044($fp)
  li $t2, 10
  blt $t1, $t2, label5
  j label6
label5:
  li $t0, 0
  sw $t0, -4048($fp)
label7:
  lw $t1, -4048($fp)
  li $t2, 5
  blt $t1, $t2, label8
  j label9
label8:
  lw $t1, -4044($fp)
  li $t2, 404
  mul $t0, $t1, $t2
  sw $t0, -4052($fp)
  addi $t1, $fp, -4040
  lw $t2, -4052($fp)
  add $t0, $t1, $t2
  sw $t0, -4056($fp)
  lw $t1, -4056($fp)
  addi $t0, $t1, 0
  sw $t0, -4060($fp)
  lw $t1, -4048($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -4064($fp)
  lw $t1, -4060($fp)
  lw $t2, -4064($fp)
  add $t0, $t1, $t2
  sw $t0, -4068($fp)
  lw $t1, -4068($fp)
  addi $t0, $t1, 0
  sw $t0, -4072($fp)
  lw $t1, -4044($fp)
  li $t2, 2
  div $t1, $t2
  mflo $t0
  sw $t0, -4076($fp)
  lw $t1, -4076($fp)
  lw $t2, -4048($fp)
  add $t0, $t1, $t2
  sw $t0, -4080($fp)
  lw $t1, -4080($fp)
  lw $t0, -4072($fp)
  sw $t1, 0($t0)
  lw $t1, -4044($fp)
  li $t2, 404
  mul $t0, $t1, $t2
  sw $t0, -4084($fp)
  addi $t1, $fp, -4040
  lw $t2, -4084($fp)
  add $t0, $t1, $t2
  sw $t0, -4088($fp)
  lw $t1, -4088($fp)
  addi $t0, $t1, 0
  sw $t0, -4092($fp)
  lw $t1, -4048($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -4096($fp)
  lw $t1, -4092($fp)
  lw $t2, -4096($fp)
  add $t0, $t1, $t2
  sw $t0, -4100($fp)
  lw $t1, -4100($fp)
  addi $t0, $t1, 4
  sw $t0, -4104($fp)
  lw $t1, -4044($fp)
  li $t2, 2
  div $t1, $t2
  mflo $t0
  sw $t0, -4108($fp)
  lw $t1, -4108($fp)
  addi $t0, $t1, 20
  sw $t0, -4112($fp)
  lw $t1, -4112($fp)
  lw $t2, -4048($fp)
  add $t0, $t1, $t2
  sw $t0, -4116($fp)
  lw $t1, -4116($fp)
  lw $t0, -4104($fp)
  sw $t1, 0($t0)
  lw $t1, -4044($fp)
  li $t2, 404
  mul $t0, $t1, $t2
  sw $t0, -4120($fp)
  addi $t1, $fp, -4040
  lw $t2, -4120($fp)
  add $t0, $t1, $t2
  sw $t0, -4124($fp)
  lw $t1, -4124($fp)
  addi $t0, $t1, 0
  sw $t0, -4128($fp)
  lw $t1, -4048($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -4132($fp)
  lw $t1, -4128($fp)
  lw $t2, -4132($fp)
  add $t0, $t1, $t2
  sw $t0, -4136($fp)
  lw $t1, -4136($fp)
  addi $t0, $t1, 8
  sw $t0, -4140($fp)
  lw $t1, -4044($fp)
  li $t2, 2
  div $t1, $t2
  mflo $t0
  sw $t0, -4144($fp)
  lw $t1, -4144($fp)
  addi $t0, $t1, 2
  sw $t0, -4148($fp)
  lw $t1, -4148($fp)
  lw $t2, -4048($fp)
  add $t0, $t1, $t2
  sw $t0, -4152($fp)
  lw $t1, -4152($fp)
  lw $t0, -4140($fp)
  sw $t1, 0($t0)
  lw $t1, -4044($fp)
  li $t2, 404
  mul $t0, $t1, $t2
  sw $t0, -4156($fp)
  addi $t1, $fp, -4040
  lw $t2, -4156($fp)
  add $t0, $t1, $t2
  sw $t0, -4160($fp)
  lw $t1, -4160($fp)
  addi $t0, $t1, 0
  sw $t0, -4164($fp)
  lw $t1, -4048($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -4168($fp)
  lw $t1, -4164($fp)
  lw $t2, -4168($fp)
  add $t0, $t1, $t2
  sw $t0, -4172($fp)
  lw $t1, -4172($fp)
  addi $t0, $t1, 12
  sw $t0, -4176($fp)
  lw $t1, -4044($fp)
  li $t2, 2
  div $t1, $t2
  mflo $t0
  sw $t0, -4180($fp)
  lw $t1, -4180($fp)
  addi $t0, $t1, 90
  sw $t0, -4184($fp)
  lw $t1, -4048($fp)
  lw $t2, -4048($fp)
  mul $t0, $t1, $t2
  sw $t0, -4188($fp)
  lw $t1, -4188($fp)
  lw $t2, -4048($fp)
  mul $t0, $t1, $t2
  sw $t0, -4192($fp)
  lw $t1, -4192($fp)
  lw $t2, -4048($fp)
  mul $t0, $t1, $t2
  sw $t0, -4196($fp)
  lw $t1, -4184($fp)
  lw $t2, -4196($fp)
  add $t0, $t1, $t2
  sw $t0, -4200($fp)
  lw $t1, -4200($fp)
  lw $t0, -4176($fp)
  sw $t1, 0($t0)
  lw $t1, -4048($fp)
  addi $t0, $t1, 1
  sw $t0, -4204($fp)
  lw $t1, -4204($fp)
  move $t0, $t1
  sw $t0, -4048($fp)
  j label7
label9:
  lw $t1, -4044($fp)
  li $t2, 404
  mul $t0, $t1, $t2
  sw $t0, -4208($fp)
  addi $t1, $fp, -4040
  lw $t2, -4208($fp)
  add $t0, $t1, $t2
  sw $t0, -4212($fp)
  addi $sp, $sp, -4
  lw $t0, -4212($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_cal_avg_bmi
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4216($fp)
  addi $sp, $sp, 4
  lw $t1, -4044($fp)
  addi $t0, $t1, 1
  sw $t0, -4220($fp)
  lw $t1, -4220($fp)
  move $t0, $t1
  sw $t0, -4044($fp)
  j label4
label6:
  li $t0, 0
  sw $t0, -4044($fp)
label10:
  lw $t1, -4044($fp)
  li $t2, 10
  blt $t1, $t2, label11
  j label12
label11:
  lw $t1, -4044($fp)
  li $t2, 404
  mul $t0, $t1, $t2
  sw $t0, -4224($fp)
  addi $t1, $fp, -4040
  lw $t2, -4224($fp)
  add $t0, $t1, $t2
  sw $t0, -4228($fp)
  lw $t1, -4228($fp)
  addi $t0, $t1, 400
  sw $t0, -4232($fp)
  lw $t1, -4232($fp)
  lw $t0, 0($t1)
  sw $t0, -4236($fp)
  lw $a0, -4236($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  lw $t1, -4044($fp)
  addi $t0, $t1, 1
  sw $t0, -4240($fp)
  lw $t1, -4240($fp)
  move $t0, $t1
  sw $t0, -4044($fp)
  j label10
label12:
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
