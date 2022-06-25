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

func_fact:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -16
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t1, -4($fp)
  li $t2, 0
  ble $t1, $t2, label1
  j label2
label1:
  li $v0, 1
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
  j label3
label2:
  lw $t1, -4($fp)
  addi $t0, $t1, -1
  sw $t0, -8($fp)
  addi $sp, $sp, -4
  lw $t0, -8($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_fact
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -12($fp)
  addi $sp, $sp, 4
  lw $t1, -4($fp)
  lw $t2, -12($fp)
  mul $t0, $t1, $t2
  sw $t0, -16($fp)
  lw $v0, -16($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
label3:

func_isqrt:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -28
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  li $t0, 0
  sw $t0, -8($fp)
label4:
  lw $t1, -8($fp)
  lw $t2, -4($fp)
  blt $t1, $t2, label5
  j label6
label5:
  lw $t1, -8($fp)
  lw $t2, -8($fp)
  mul $t0, $t1, $t2
  sw $t0, -12($fp)
  lw $t1, -12($fp)
  lw $t2, -4($fp)
  ble $t1, $t2, label9
  j label8
label9:
  lw $t1, -8($fp)
  addi $t0, $t1, 1
  sw $t0, -16($fp)
  lw $t1, -8($fp)
  addi $t0, $t1, 1
  sw $t0, -20($fp)
  lw $t1, -16($fp)
  lw $t2, -20($fp)
  mul $t0, $t1, $t2
  sw $t0, -24($fp)
  lw $t1, -24($fp)
  lw $t2, -4($fp)
  bgt $t1, $t2, label7
  j label8
label7:
  lw $v0, -8($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
label8:
  lw $t1, -8($fp)
  addi $t0, $t1, 1
  sw $t0, -28($fp)
  lw $t1, -28($fp)
  move $t0, $t1
  sw $t0, -8($fp)
  j label4
label6:
  li $v0, -1
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

func_mod:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -20
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t0, 12($fp)
  sw $t0, -8($fp)
  lw $t1, -4($fp)
  lw $t2, -8($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -12($fp)
  lw $t1, -12($fp)
  lw $t2, -8($fp)
  mul $t0, $t1, $t2
  sw $t0, -16($fp)
  lw $t1, -4($fp)
  lw $t2, -16($fp)
  sub $t0, $t1, $t2
  sw $t0, -20($fp)
  lw $v0, -20($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

main:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -4288
  li $t0, 1331
  sw $t0, -4($fp)
  li $t0, 1217
  sw $t0, -8($fp)
  li $t0, -22121
  sw $t0, -12($fp)
  li $t0, 5
  sw $t0, -16($fp)
  lw $t1, -8($fp)
  li $t2, 7
  mul $t0, $t1, $t2
  sw $t0, -20($fp)
  lw $t1, -20($fp)
  lw $t2, -4($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -24($fp)
  lw $t1, -8($fp)
  addi $t0, $t1, 23
  sw $t0, -28($fp)
  li $t1, 2080
  lw $t2, -28($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -32($fp)
  lw $t1, -24($fp)
  lw $t2, -32($fp)
  add $t0, $t1, $t2
  sw $t0, -36($fp)
  lw $t1, -36($fp)
  move $t0, $t1
  sw $t0, -40($fp)
  lw $t1, -8($fp)
  addi $t0, $t1, 20
  sw $t0, -44($fp)
  lw $t1, -44($fp)
  addi $t0, $t1, 3
  sw $t0, -48($fp)
  li $t1, 19990
  lw $t2, -48($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -52($fp)
  lw $t1, -52($fp)
  move $t0, $t1
  sw $t0, -56($fp)
  li $t0, 0
  sw $t0, -60($fp)
  li $t0, 0
  sw $t0, -64($fp)
  li $t0, 0
  sw $t0, -68($fp)
label10:
  addi $sp, $sp, -4
  lw $t0, -8($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_isqrt
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4072($fp)
  addi $sp, $sp, 4
  addi $sp, $sp, -4
  lw $t0, -4072($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_isqrt
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4076($fp)
  addi $sp, $sp, 4
  addi $sp, $sp, -4
  lw $t0, -4076($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_fact
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4080($fp)
  addi $sp, $sp, 4
  lw $t1, -60($fp)
  lw $t2, -4080($fp)
  blt $t1, $t2, label11
  j label12
label11:
  lw $t1, -60($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -4084($fp)
  addi $t1, $fp, -4068
  lw $t2, -4084($fp)
  add $t0, $t1, $t2
  sw $t0, -4088($fp)
  addi $sp, $sp, -4
  li $t0, 4
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -60($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4092($fp)
  addi $sp, $sp, 8
  addi $sp, $sp, -4
  lw $t0, -4092($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_fact
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4096($fp)
  addi $sp, $sp, 4
  lw $t1, -4096($fp)
  lw $t0, -4088($fp)
  sw $t1, 0($t0)
  lw $t1, -60($fp)
  li $t2, 4
  div $t1, $t2
  mflo $t0
  sw $t0, -4100($fp)
  lw $t1, -4100($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -4104($fp)
  lw $t1, -60($fp)
  lw $t2, -4104($fp)
  add $t0, $t1, $t2
  sw $t0, -4108($fp)
  lw $t1, -4108($fp)
  move $t0, $t1
  sw $t0, -4($fp)
  lw $t1, -60($fp)
  li $t2, 4
  div $t1, $t2
  mflo $t0
  sw $t0, -4112($fp)
  lw $t1, -4112($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -4116($fp)
  lw $t1, -4($fp)
  lw $t2, -4116($fp)
  add $t0, $t1, $t2
  sw $t0, -4120($fp)
  lw $t1, -4120($fp)
  move $t0, $t1
  sw $t0, -4($fp)
  lw $t1, -60($fp)
  li $t2, 4
  div $t1, $t2
  mflo $t0
  sw $t0, -4124($fp)
  lw $t1, -4124($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -4128($fp)
  lw $t1, -4($fp)
  lw $t2, -4128($fp)
  add $t0, $t1, $t2
  sw $t0, -4132($fp)
  lw $t1, -4132($fp)
  move $t0, $t1
  sw $t0, -4($fp)
  lw $t1, -60($fp)
  li $t2, 4
  div $t1, $t2
  mflo $t0
  sw $t0, -4136($fp)
  lw $t1, -4136($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -4140($fp)
  lw $t1, -4($fp)
  lw $t2, -4140($fp)
  add $t0, $t1, $t2
  sw $t0, -4144($fp)
  lw $t1, -4144($fp)
  move $t0, $t1
  sw $t0, -4($fp)
label13:
  lw $t1, -16($fp)
  lw $t2, -16($fp)
  mul $t0, $t1, $t2
  sw $t0, -4148($fp)
  lw $t1, -4148($fp)
  lw $t2, -16($fp)
  mul $t0, $t1, $t2
  sw $t0, -4152($fp)
  lw $t1, -12($fp)
  lw $t2, -4152($fp)
  blt $t1, $t2, label14
  j label15
label14:
  addi $sp, $sp, -4
  li $t0, 10
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -4($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4156($fp)
  addi $sp, $sp, 8
  lw $t1, -4156($fp)
  addi $t0, $t1, 10
  sw $t0, -4160($fp)
  lw $t1, -4160($fp)
  lw $t2, -12($fp)
  add $t0, $t1, $t2
  sw $t0, -4164($fp)
  lw $t1, -4164($fp)
  addi $t0, $t1, 1
  sw $t0, -4168($fp)
  lw $t1, -4168($fp)
  lw $t2, -40($fp)
  add $t0, $t1, $t2
  sw $t0, -4172($fp)
  lw $t1, -4172($fp)
  lw $t2, -56($fp)
  sub $t0, $t1, $t2
  sw $t0, -4176($fp)
  lw $t1, -4176($fp)
  move $t0, $t1
  sw $t0, -12($fp)
  j label13
label15:
  addi $sp, $sp, -4
  lw $t0, -12($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_isqrt
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4180($fp)
  addi $sp, $sp, 4
  addi $sp, $sp, -4
  li $t0, 10
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -4180($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4184($fp)
  addi $sp, $sp, 8
  addi $sp, $sp, -4
  lw $t0, -4184($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_fact
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4188($fp)
  addi $sp, $sp, 4
  lw $t1, -12($fp)
  lw $t2, -4188($fp)
  add $t0, $t1, $t2
  sw $t0, -4192($fp)
  lw $t1, -4192($fp)
  move $t0, $t1
  sw $t0, -12($fp)
  lw $t1, -60($fp)
  addi $t0, $t1, 1
  sw $t0, -4196($fp)
  lw $t1, -4196($fp)
  move $t0, $t1
  sw $t0, -60($fp)
  j label10
label12:
  li $t0, 0
  sw $t0, -60($fp)
label16:
  lw $t1, -60($fp)
  li $t2, 10
  blt $t1, $t2, label17
  j label18
label17:
  li $t0, 0
  sw $t0, -64($fp)
label19:
  lw $t1, -64($fp)
  li $t2, 10
  blt $t1, $t2, label20
  j label21
label20:
  lw $t1, -60($fp)
  li $t2, 0
  beq $t1, $t2, label25
  j label23
label25:
  lw $t1, -64($fp)
  li $t2, 0
  beq $t1, $t2, label22
  j label23
label22:
  li $t0, 1
  sw $t0, -68($fp)
  j label24
label23:
  li $t0, 0
  sw $t0, -68($fp)
label24:
label26:
  lw $t1, -68($fp)
  li $t2, 10
  blt $t1, $t2, label27
  j label28
label27:
  lw $t1, -60($fp)
  li $t2, 10
  mul $t0, $t1, $t2
  sw $t0, -4200($fp)
  lw $t1, -4200($fp)
  li $t2, 10
  mul $t0, $t1, $t2
  sw $t0, -4204($fp)
  lw $t1, -64($fp)
  li $t2, 10
  mul $t0, $t1, $t2
  sw $t0, -4208($fp)
  lw $t1, -4204($fp)
  lw $t2, -4208($fp)
  add $t0, $t1, $t2
  sw $t0, -4212($fp)
  lw $t1, -4212($fp)
  lw $t2, -68($fp)
  add $t0, $t1, $t2
  sw $t0, -4216($fp)
  lw $t1, -4216($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -4220($fp)
  addi $t1, $fp, -4068
  lw $t2, -4220($fp)
  add $t0, $t1, $t2
  sw $t0, -4224($fp)
  lw $t1, -4224($fp)
  lw $t0, 0($t1)
  sw $t0, -4228($fp)
  lw $t1, -16($fp)
  lw $t2, -4228($fp)
  add $t0, $t1, $t2
  sw $t0, -4232($fp)
  lw $t1, -60($fp)
  li $t2, 10
  mul $t0, $t1, $t2
  sw $t0, -4236($fp)
  lw $t1, -4236($fp)
  li $t2, 10
  mul $t0, $t1, $t2
  sw $t0, -4240($fp)
  lw $t1, -64($fp)
  li $t2, 10
  mul $t0, $t1, $t2
  sw $t0, -4244($fp)
  lw $t1, -4240($fp)
  lw $t2, -4244($fp)
  add $t0, $t1, $t2
  sw $t0, -4248($fp)
  lw $t1, -4248($fp)
  lw $t2, -68($fp)
  add $t0, $t1, $t2
  sw $t0, -4252($fp)
  lw $t1, -4252($fp)
  addi $t0, $t1, -1
  sw $t0, -4256($fp)
  lw $t1, -4256($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -4260($fp)
  addi $t1, $fp, -4068
  lw $t2, -4260($fp)
  add $t0, $t1, $t2
  sw $t0, -4264($fp)
  lw $t1, -4264($fp)
  lw $t0, 0($t1)
  sw $t0, -4268($fp)
  lw $t1, -4232($fp)
  lw $t2, -4268($fp)
  sub $t0, $t1, $t2
  sw $t0, -4272($fp)
  lw $t1, -4272($fp)
  move $t0, $t1
  sw $t0, -16($fp)
  lw $t1, -68($fp)
  addi $t0, $t1, 1
  sw $t0, -4276($fp)
  lw $t1, -4276($fp)
  move $t0, $t1
  sw $t0, -68($fp)
  j label26
label28:
  lw $t1, -64($fp)
  addi $t0, $t1, 1
  sw $t0, -4280($fp)
  lw $t1, -4280($fp)
  move $t0, $t1
  sw $t0, -64($fp)
  j label19
label21:
  lw $t1, -60($fp)
  addi $t0, $t1, 1
  sw $t0, -4284($fp)
  lw $t1, -4284($fp)
  move $t0, $t1
  sw $t0, -60($fp)
  j label16
label18:
  lw $t1, -16($fp)
  lw $t2, -12($fp)
  add $t0, $t1, $t2
  sw $t0, -4288($fp)
  lw $t1, -4288($fp)
  move $t0, $t1
  sw $t0, -60($fp)
  lw $a0, -60($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
