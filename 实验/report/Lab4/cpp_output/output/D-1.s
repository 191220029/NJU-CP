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

_fact:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -28
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -8($fp)
  lw $t1, -8($fp)
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
  move $t0, $t1
  sw $t0, -12($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -16($fp)
  lw $t1, -16($fp)
  addi $t0, $t1, -1
  sw $t0, -20($fp)
  addi $sp, $sp, -4
  lw $t0, -20($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _fact
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -24($fp)
  addi $sp, $sp, 4
  lw $t1, -12($fp)
  lw $t2, -24($fp)
  mul $t0, $t1, $t2
  sw $t0, -28($fp)
  lw $v0, -28($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
label3:

_isqrt:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -68
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  li $t0, 0
  sw $t0, -8($fp)
label4:
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -12($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -16($fp)
  lw $t1, -12($fp)
  lw $t2, -16($fp)
  blt $t1, $t2, label5
  j label6
label5:
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -20($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -24($fp)
  lw $t1, -20($fp)
  lw $t2, -24($fp)
  mul $t0, $t1, $t2
  sw $t0, -28($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -32($fp)
  lw $t1, -28($fp)
  lw $t2, -32($fp)
  ble $t1, $t2, label9
  j label8
label9:
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -36($fp)
  lw $t1, -36($fp)
  addi $t0, $t1, 1
  sw $t0, -40($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -44($fp)
  lw $t1, -44($fp)
  addi $t0, $t1, 1
  sw $t0, -48($fp)
  lw $t1, -40($fp)
  lw $t2, -48($fp)
  mul $t0, $t1, $t2
  sw $t0, -52($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -56($fp)
  lw $t1, -52($fp)
  lw $t2, -56($fp)
  bgt $t1, $t2, label7
  j label8
label7:
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -60($fp)
  lw $v0, -60($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
label8:
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -64($fp)
  lw $t1, -64($fp)
  addi $t0, $t1, 1
  sw $t0, -68($fp)
  lw $t1, -68($fp)
  move $t0, $t1
  sw $t0, -8($fp)
  j label4
label6:
  li $v0, -1
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

_mod:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -36
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t0, 12($fp)
  sw $t0, -8($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -12($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -16($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -20($fp)
  lw $t1, -16($fp)
  lw $t2, -20($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -24($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -28($fp)
  lw $t1, -24($fp)
  lw $t2, -28($fp)
  mul $t0, $t1, $t2
  sw $t0, -32($fp)
  lw $t1, -12($fp)
  lw $t2, -32($fp)
  sub $t0, $t1, $t2
  sw $t0, -36($fp)
  lw $v0, -36($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

main:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -4376
  li $t0, -22121
  sw $t0, -4($fp)
  li $t0, 5
  sw $t0, -8($fp)
  li $t0, 0
  sw $t0, -12($fp)
label10:
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -4016($fp)
  addi $sp, $sp, -4
  li $t0, 1217
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _isqrt
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4020($fp)
  addi $sp, $sp, 4
  addi $sp, $sp, -4
  lw $t0, -4020($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _isqrt
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4024($fp)
  addi $sp, $sp, 4
  addi $sp, $sp, -4
  lw $t0, -4024($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _fact
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4028($fp)
  addi $sp, $sp, 4
  lw $t1, -4016($fp)
  lw $t2, -4028($fp)
  blt $t1, $t2, label11
  j label12
label11:
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -4032($fp)
  lw $t1, -4032($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -4036($fp)
  addi $t0, $fp, -4012
  lw $t2, -4036($fp)
  add $t0, $t0, $t2
  sw $t0, -4040($fp)
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -4044($fp)
  addi $sp, $sp, -4
  li $t0, 4
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -4044($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4048($fp)
  addi $sp, $sp, 8
  addi $sp, $sp, -4
  lw $t0, -4048($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _fact
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4052($fp)
  addi $sp, $sp, 4
  lw $t0, -4040($fp)
  lw $t1, -4052($fp)
  sw $t1, 0($t0)
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -4056($fp)
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -4060($fp)
  lw $t1, -4060($fp)
  li $t2, 4
  div $t1, $t2
  mflo $t0
  sw $t0, -4064($fp)
  lw $t1, -4064($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -4068($fp)
  lw $t1, -4056($fp)
  lw $t2, -4068($fp)
  add $t0, $t1, $t2
  sw $t0, -4072($fp)
  lw $t1, -4072($fp)
  move $t0, $t1
  sw $t0, -4076($fp)
  lw $t1, -4076($fp)
  move $t0, $t1
  sw $t0, -4080($fp)
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -4084($fp)
  lw $t1, -4084($fp)
  li $t2, 4
  div $t1, $t2
  mflo $t0
  sw $t0, -4088($fp)
  lw $t1, -4088($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -4092($fp)
  lw $t1, -4080($fp)
  lw $t2, -4092($fp)
  add $t0, $t1, $t2
  sw $t0, -4096($fp)
  lw $t1, -4096($fp)
  move $t0, $t1
  sw $t0, -4076($fp)
  lw $t1, -4076($fp)
  move $t0, $t1
  sw $t0, -4100($fp)
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -4104($fp)
  lw $t1, -4104($fp)
  li $t2, 4
  div $t1, $t2
  mflo $t0
  sw $t0, -4108($fp)
  lw $t1, -4108($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -4112($fp)
  lw $t1, -4100($fp)
  lw $t2, -4112($fp)
  add $t0, $t1, $t2
  sw $t0, -4116($fp)
  lw $t1, -4116($fp)
  move $t0, $t1
  sw $t0, -4076($fp)
  lw $t1, -4076($fp)
  move $t0, $t1
  sw $t0, -4120($fp)
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -4124($fp)
  lw $t1, -4124($fp)
  li $t2, 4
  div $t1, $t2
  mflo $t0
  sw $t0, -4128($fp)
  lw $t1, -4128($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -4132($fp)
  lw $t1, -4120($fp)
  lw $t2, -4132($fp)
  add $t0, $t1, $t2
  sw $t0, -4136($fp)
  lw $t1, -4136($fp)
  move $t0, $t1
  sw $t0, -4076($fp)
label13:
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -4140($fp)
  lw $t1, -4140($fp)
  li $t2, 125
  blt $t1, $t2, label14
  j label15
label14:
  lw $t1, -4076($fp)
  move $t0, $t1
  sw $t0, -4144($fp)
  addi $sp, $sp, -4
  li $t0, 10
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -4144($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4148($fp)
  addi $sp, $sp, 8
  lw $t1, -4148($fp)
  addi $t0, $t1, 10
  sw $t0, -4152($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -4156($fp)
  lw $t1, -4152($fp)
  lw $t2, -4156($fp)
  add $t0, $t1, $t2
  sw $t0, -4160($fp)
  lw $t1, -4160($fp)
  addi $t0, $t1, 1
  sw $t0, -4164($fp)
  lw $t1, -4164($fp)
  addi $t0, $t1, 7
  sw $t0, -4168($fp)
  lw $t1, -4168($fp)
  addi $t0, $t1, -16
  sw $t0, -4172($fp)
  lw $t1, -4172($fp)
  move $t0, $t1
  sw $t0, -4($fp)
  j label13
label15:
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -4176($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -4180($fp)
  addi $sp, $sp, -4
  lw $t0, -4180($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _isqrt
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4184($fp)
  addi $sp, $sp, 4
  addi $sp, $sp, -4
  li $t0, 10
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -4184($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4188($fp)
  addi $sp, $sp, 8
  addi $sp, $sp, -4
  lw $t0, -4188($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _fact
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4192($fp)
  addi $sp, $sp, 4
  lw $t1, -4176($fp)
  lw $t2, -4192($fp)
  add $t0, $t1, $t2
  sw $t0, -4196($fp)
  lw $t1, -4196($fp)
  move $t0, $t1
  sw $t0, -4($fp)
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -4200($fp)
  lw $t1, -4200($fp)
  addi $t0, $t1, 1
  sw $t0, -4204($fp)
  lw $t1, -4204($fp)
  move $t0, $t1
  sw $t0, -12($fp)
  j label10
label12:
  li $t0, 0
  sw $t0, -12($fp)
label16:
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -4208($fp)
  lw $t1, -4208($fp)
  li $t2, 10
  blt $t1, $t2, label17
  j label18
label17:
  li $t0, 0
  sw $t0, -4212($fp)
label19:
  lw $t1, -4212($fp)
  move $t0, $t1
  sw $t0, -4216($fp)
  lw $t1, -4216($fp)
  li $t2, 10
  blt $t1, $t2, label20
  j label21
label20:
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -4220($fp)
  lw $t1, -4220($fp)
  li $t2, 0
  beq $t1, $t2, label25
  j label23
label25:
  lw $t1, -4212($fp)
  move $t0, $t1
  sw $t0, -4224($fp)
  lw $t1, -4224($fp)
  li $t2, 0
  beq $t1, $t2, label22
  j label23
label22:
  li $t0, 1
  sw $t0, -4228($fp)
  j label24
label23:
  li $t0, 0
  sw $t0, -4228($fp)
label24:
label26:
  lw $t1, -4228($fp)
  move $t0, $t1
  sw $t0, -4232($fp)
  lw $t1, -4232($fp)
  li $t2, 10
  blt $t1, $t2, label27
  j label28
label27:
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -4236($fp)
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -4240($fp)
  lw $t1, -4240($fp)
  li $t2, 10
  mul $t0, $t1, $t2
  sw $t0, -4244($fp)
  lw $t1, -4244($fp)
  li $t2, 10
  mul $t0, $t1, $t2
  sw $t0, -4248($fp)
  lw $t1, -4212($fp)
  move $t0, $t1
  sw $t0, -4252($fp)
  lw $t1, -4252($fp)
  li $t2, 10
  mul $t0, $t1, $t2
  sw $t0, -4256($fp)
  lw $t1, -4248($fp)
  lw $t2, -4256($fp)
  add $t0, $t1, $t2
  sw $t0, -4260($fp)
  lw $t1, -4228($fp)
  move $t0, $t1
  sw $t0, -4264($fp)
  lw $t1, -4260($fp)
  lw $t2, -4264($fp)
  add $t0, $t1, $t2
  sw $t0, -4268($fp)
  lw $t1, -4268($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -4272($fp)
  addi $t0, $fp, -4012
  lw $t2, -4272($fp)
  add $t0, $t0, $t2
  sw $t0, -4276($fp)
  lw $t1, -4276($fp)
  lw $t0, 0($t1)
  sw $t0, -4280($fp)
  lw $t1, -4236($fp)
  lw $t2, -4280($fp)
  add $t0, $t1, $t2
  sw $t0, -4284($fp)
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -4288($fp)
  lw $t1, -4288($fp)
  li $t2, 10
  mul $t0, $t1, $t2
  sw $t0, -4292($fp)
  lw $t1, -4292($fp)
  li $t2, 10
  mul $t0, $t1, $t2
  sw $t0, -4296($fp)
  lw $t1, -4212($fp)
  move $t0, $t1
  sw $t0, -4300($fp)
  lw $t1, -4300($fp)
  li $t2, 10
  mul $t0, $t1, $t2
  sw $t0, -4304($fp)
  lw $t1, -4296($fp)
  lw $t2, -4304($fp)
  add $t0, $t1, $t2
  sw $t0, -4308($fp)
  lw $t1, -4228($fp)
  move $t0, $t1
  sw $t0, -4312($fp)
  lw $t1, -4308($fp)
  lw $t2, -4312($fp)
  add $t0, $t1, $t2
  sw $t0, -4316($fp)
  lw $t1, -4316($fp)
  addi $t0, $t1, -1
  sw $t0, -4320($fp)
  lw $t1, -4320($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -4324($fp)
  addi $t0, $fp, -4012
  lw $t2, -4324($fp)
  add $t0, $t0, $t2
  sw $t0, -4328($fp)
  lw $t1, -4328($fp)
  lw $t0, 0($t1)
  sw $t0, -4332($fp)
  lw $t1, -4284($fp)
  lw $t2, -4332($fp)
  sub $t0, $t1, $t2
  sw $t0, -4336($fp)
  lw $t1, -4336($fp)
  move $t0, $t1
  sw $t0, -8($fp)
  lw $t1, -4228($fp)
  move $t0, $t1
  sw $t0, -4340($fp)
  lw $t1, -4340($fp)
  addi $t0, $t1, 1
  sw $t0, -4344($fp)
  lw $t1, -4344($fp)
  move $t0, $t1
  sw $t0, -4228($fp)
  j label26
label28:
  lw $t1, -4212($fp)
  move $t0, $t1
  sw $t0, -4348($fp)
  lw $t1, -4348($fp)
  addi $t0, $t1, 1
  sw $t0, -4352($fp)
  lw $t1, -4352($fp)
  move $t0, $t1
  sw $t0, -4212($fp)
  j label19
label21:
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -4356($fp)
  lw $t1, -4356($fp)
  addi $t0, $t1, 1
  sw $t0, -4360($fp)
  lw $t1, -4360($fp)
  move $t0, $t1
  sw $t0, -12($fp)
  j label16
label18:
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -4364($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -4368($fp)
  lw $t1, -4364($fp)
  lw $t2, -4368($fp)
  add $t0, $t1, $t2
  sw $t0, -4372($fp)
  lw $t1, -4372($fp)
  move $t0, $t1
  sw $t0, -12($fp)
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -4376($fp)
  lw $a0, -4376($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
