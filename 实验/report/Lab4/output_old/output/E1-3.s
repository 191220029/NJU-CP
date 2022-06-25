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
  addi $sp, $sp, -92
  lw $t0, 8($fp)
  sw $t0, -48($fp)
  lw $t1, -48($fp)
  addi $t0, $t1, 16
  sw $t0, -88($fp)
  lw $t1, -48($fp)
  addi $t0, $t1, 12
  sw $t0, -28($fp)
  lw $t1, -28($fp)
  lw $t0, 0($t1)
  sw $t0, -76($fp)
  lw $t1, -48($fp)
  addi $t0, $t1, 8
  sw $t0, -44($fp)
  lw $t1, -44($fp)
  lw $t0, 0($t1)
  sw $t0, -64($fp)
  lw $t1, -48($fp)
  addi $t0, $t1, 8
  sw $t0, -60($fp)
  lw $t1, -60($fp)
  lw $t0, 0($t1)
  sw $t0, -68($fp)
  lw $t1, -64($fp)
  lw $t2, -68($fp)
  mul $t0, $t1, $t2
  sw $t0, -80($fp)
  lw $t1, -76($fp)
  lw $t2, -80($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -92($fp)
  lw $t1, -92($fp)
  lw $t0, -88($fp)
  sw $t1, 0($t0)
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

func_cal_avg_bmi:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -156
  lw $t0, 8($fp)
  sw $t0, -136($fp)
  li $t0, 0
  sw $t0, -128($fp)
  li $t0, 0
  sw $t0, -144($fp)
label1:
  lw $t1, -128($fp)
  li $t2, 5
  blt $t1, $t2, label2
  j label3
label2:
  lw $t1, -136($fp)
  addi $t0, $t1, 0
  sw $t0, -36($fp)
  lw $t1, -128($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -40($fp)
  lw $t1, -36($fp)
  lw $t2, -40($fp)
  add $t0, $t1, $t2
  sw $t0, -48($fp)
  addi $sp, $sp, -4
  lw $t0, -48($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_cal_bmi
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -52($fp)
  addi $sp, $sp, 4
  lw $t1, -136($fp)
  addi $t0, $t1, 0
  sw $t0, -72($fp)
  lw $t1, -128($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -76($fp)
  lw $t1, -72($fp)
  lw $t2, -76($fp)
  add $t0, $t1, $t2
  sw $t0, -84($fp)
  lw $t1, -84($fp)
  addi $t0, $t1, 16
  sw $t0, -96($fp)
  lw $t1, -96($fp)
  lw $t0, 0($t1)
  sw $t0, -104($fp)
  lw $t1, -144($fp)
  lw $t2, -104($fp)
  add $t0, $t1, $t2
  sw $t0, -116($fp)
  lw $t1, -116($fp)
  move $t0, $t1
  sw $t0, -144($fp)
  lw $t1, -128($fp)
  addi $t0, $t1, 1
  sw $t0, -132($fp)
  lw $t1, -132($fp)
  move $t0, $t1
  sw $t0, -128($fp)
  j label1
label3:
  lw $t1, -136($fp)
  addi $t0, $t1, 400
  sw $t0, -152($fp)
  lw $t1, -144($fp)
  li $t2, 5
  div $t1, $t2
  mflo $t0
  sw $t0, -156($fp)
  lw $t1, -156($fp)
  lw $t0, -152($fp)
  sw $t1, 0($t0)
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

main:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -4576
  li $t0, 0
  sw $t0, -4572($fp)
label4:
  lw $t1, -4572($fp)
  li $t2, 10
  blt $t1, $t2, label5
  j label6
label5:
  li $t0, 0
  sw $t0, -4464($fp)
label7:
  lw $t1, -4464($fp)
  li $t2, 5
  blt $t1, $t2, label8
  j label9
label8:
  lw $t1, -4572($fp)
  li $t2, 404
  mul $t0, $t1, $t2
  sw $t0, -4072($fp)
  addi $t1, $fp, -4532
  lw $t2, -4072($fp)
  add $t0, $t0, $t2
  sw $t0, -4080($fp)
  lw $t1, -4080($fp)
  addi $t0, $t1, 0
  sw $t0, -4096($fp)
  lw $t1, -4464($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -4100($fp)
  lw $t1, -4096($fp)
  lw $t2, -4100($fp)
  add $t0, $t1, $t2
  sw $t0, -4108($fp)
  lw $t1, -4108($fp)
  addi $t0, $t1, 0
  sw $t0, -4136($fp)
  lw $t1, -4572($fp)
  li $t2, 2
  div $t1, $t2
  mflo $t0
  sw $t0, -4124($fp)
  lw $t1, -4124($fp)
  lw $t2, -4464($fp)
  add $t0, $t1, $t2
  sw $t0, -4140($fp)
  lw $t1, -4140($fp)
  lw $t0, -4136($fp)
  sw $t1, 0($t0)
  lw $t1, -4572($fp)
  li $t2, 404
  mul $t0, $t1, $t2
  sw $t0, -4156($fp)
  addi $t1, $fp, -4532
  lw $t2, -4156($fp)
  add $t0, $t0, $t2
  sw $t0, -4164($fp)
  lw $t1, -4164($fp)
  addi $t0, $t1, 0
  sw $t0, -4180($fp)
  lw $t1, -4464($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -4184($fp)
  lw $t1, -4180($fp)
  lw $t2, -4184($fp)
  add $t0, $t1, $t2
  sw $t0, -4192($fp)
  lw $t1, -4192($fp)
  addi $t0, $t1, 4
  sw $t0, -4228($fp)
  lw $t1, -4572($fp)
  li $t2, 2
  div $t1, $t2
  mflo $t0
  sw $t0, -4208($fp)
  lw $t1, -4208($fp)
  addi $t0, $t1, 20
  sw $t0, -4216($fp)
  lw $t1, -4216($fp)
  lw $t2, -4464($fp)
  add $t0, $t1, $t2
  sw $t0, -4232($fp)
  lw $t1, -4232($fp)
  lw $t0, -4228($fp)
  sw $t1, 0($t0)
  lw $t1, -4572($fp)
  li $t2, 404
  mul $t0, $t1, $t2
  sw $t0, -4248($fp)
  addi $t1, $fp, -4532
  lw $t2, -4248($fp)
  add $t0, $t0, $t2
  sw $t0, -4256($fp)
  lw $t1, -4256($fp)
  addi $t0, $t1, 0
  sw $t0, -4272($fp)
  lw $t1, -4464($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -4276($fp)
  lw $t1, -4272($fp)
  lw $t2, -4276($fp)
  add $t0, $t1, $t2
  sw $t0, -4284($fp)
  lw $t1, -4284($fp)
  addi $t0, $t1, 8
  sw $t0, -4320($fp)
  lw $t1, -4572($fp)
  li $t2, 2
  div $t1, $t2
  mflo $t0
  sw $t0, -4300($fp)
  lw $t1, -4300($fp)
  addi $t0, $t1, 2
  sw $t0, -4308($fp)
  lw $t1, -4308($fp)
  lw $t2, -4464($fp)
  add $t0, $t1, $t2
  sw $t0, -4324($fp)
  lw $t1, -4324($fp)
  lw $t0, -4320($fp)
  sw $t1, 0($t0)
  lw $t1, -4572($fp)
  li $t2, 404
  mul $t0, $t1, $t2
  sw $t0, -4340($fp)
  addi $t1, $fp, -4532
  lw $t2, -4340($fp)
  add $t0, $t0, $t2
  sw $t0, -4348($fp)
  lw $t1, -4348($fp)
  addi $t0, $t1, 0
  sw $t0, -4364($fp)
  lw $t1, -4464($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -4368($fp)
  lw $t1, -4364($fp)
  lw $t2, -4368($fp)
  add $t0, $t1, $t2
  sw $t0, -4376($fp)
  lw $t1, -4376($fp)
  addi $t0, $t1, 12
  sw $t0, -4448($fp)
  lw $t1, -4572($fp)
  li $t2, 2
  div $t1, $t2
  mflo $t0
  sw $t0, -4392($fp)
  lw $t1, -4392($fp)
  addi $t0, $t1, 90
  sw $t0, -4436($fp)
  lw $t1, -4464($fp)
  lw $t2, -4464($fp)
  mul $t0, $t1, $t2
  sw $t0, -4412($fp)
  lw $t1, -4412($fp)
  lw $t2, -4464($fp)
  mul $t0, $t1, $t2
  sw $t0, -4424($fp)
  lw $t1, -4424($fp)
  lw $t2, -4464($fp)
  mul $t0, $t1, $t2
  sw $t0, -4440($fp)
  lw $t1, -4436($fp)
  lw $t2, -4440($fp)
  add $t0, $t1, $t2
  sw $t0, -4452($fp)
  lw $t1, -4452($fp)
  lw $t0, -4448($fp)
  sw $t1, 0($t0)
  lw $t1, -4464($fp)
  addi $t0, $t1, 1
  sw $t0, -4468($fp)
  lw $t1, -4468($fp)
  move $t0, $t1
  sw $t0, -4464($fp)
  j label7
label9:
  lw $t1, -4572($fp)
  li $t2, 404
  mul $t0, $t1, $t2
  sw $t0, -4484($fp)
  addi $t1, $fp, -4532
  lw $t2, -4484($fp)
  add $t0, $t0, $t2
  sw $t0, -4492($fp)
  addi $sp, $sp, -4
  lw $t0, -4492($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_cal_avg_bmi
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4496($fp)
  addi $sp, $sp, 4
  lw $t1, -4572($fp)
  addi $t0, $t1, 1
  sw $t0, -4512($fp)
  lw $t1, -4512($fp)
  move $t0, $t1
  sw $t0, -4572($fp)
  j label4
label6:
  li $t0, 0
  sw $t0, -4572($fp)
label10:
  lw $t1, -4572($fp)
  li $t2, 10
  blt $t1, $t2, label11
  j label12
label11:
  lw $t1, -4572($fp)
  li $t2, 404
  mul $t0, $t1, $t2
  sw $t0, -4536($fp)
  addi $t1, $fp, -4532
  lw $t2, -4536($fp)
  add $t0, $t0, $t2
  sw $t0, -4544($fp)
  lw $t1, -4544($fp)
  addi $t0, $t1, 400
  sw $t0, -4556($fp)
  lw $t1, -4556($fp)
  lw $t0, 0($t1)
  sw $t0, -4560($fp)
  lw $a0, -4560($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  lw $t1, -4572($fp)
  addi $t0, $t1, 1
  sw $t0, -4576($fp)
  lw $t1, -4576($fp)
  move $t0, $t1
  sw $t0, -4572($fp)
  j label10
label12:
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
