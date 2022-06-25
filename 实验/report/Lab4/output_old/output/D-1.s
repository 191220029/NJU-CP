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
  addi $sp, $sp, -40
  lw $t0, 8($fp)
  sw $t0, -28($fp)
  lw $t1, -28($fp)
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
  lw $t1, -28($fp)
  addi $t0, $t1, -1
  sw $t0, -20($fp)
  addi $sp, $sp, -4
  lw $t0, -20($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_fact
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -32($fp)
  addi $sp, $sp, 4
  lw $t1, -28($fp)
  lw $t2, -32($fp)
  mul $t0, $t1, $t2
  sw $t0, -40($fp)
  lw $v0, -40($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
label3:

func_isqrt:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -92
  lw $t0, 8($fp)
  sw $t0, -72($fp)
  li $t0, 0
  sw $t0, -88($fp)
label4:
  lw $t1, -88($fp)
  lw $t2, -72($fp)
  blt $t1, $t2, label5
  j label6
label5:
  lw $t1, -88($fp)
  lw $t2, -88($fp)
  mul $t0, $t1, $t2
  sw $t0, -32($fp)
  lw $t1, -32($fp)
  lw $t2, -72($fp)
  ble $t1, $t2, label9
  j label8
label9:
  lw $t1, -88($fp)
  addi $t0, $t1, 1
  sw $t0, -56($fp)
  lw $t1, -88($fp)
  addi $t0, $t1, 1
  sw $t0, -60($fp)
  lw $t1, -56($fp)
  lw $t2, -60($fp)
  mul $t0, $t1, $t2
  sw $t0, -68($fp)
  lw $t1, -68($fp)
  lw $t2, -72($fp)
  bgt $t1, $t2, label7
  j label8
label7:
  lw $v0, -88($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
label8:
  lw $t1, -88($fp)
  addi $t0, $t1, 1
  sw $t0, -92($fp)
  lw $t1, -92($fp)
  move $t0, $t1
  sw $t0, -88($fp)
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
  addi $sp, $sp, -48
  lw $t0, 8($fp)
  sw $t0, -36($fp)
  lw $t0, 12($fp)
  sw $t0, -28($fp)
  lw $t1, -36($fp)
  lw $t2, -28($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -24($fp)
  lw $t1, -24($fp)
  lw $t2, -28($fp)
  mul $t0, $t1, $t2
  sw $t0, -40($fp)
  lw $t1, -36($fp)
  lw $t2, -40($fp)
  sub $t0, $t1, $t2
  sw $t0, -48($fp)
  lw $v0, -48($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

main:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -4796
  li $t0, 1331
  sw $t0, -4372($fp)
  li $t0, 1217
  sw $t0, -4120($fp)
  li $t0, -22121
  sw $t0, -4780($fp)
  li $t0, 5
  sw $t0, -4776($fp)
  lw $t1, -4120($fp)
  li $t2, 7
  mul $t0, $t1, $t2
  sw $t0, -28($fp)
  lw $t1, -28($fp)
  lw $t2, -4372($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -56($fp)
  lw $t1, -4120($fp)
  addi $t0, $t1, 23
  sw $t0, -48($fp)
  li $t1, 2080
  lw $t2, -48($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -60($fp)
  lw $t1, -56($fp)
  lw $t2, -60($fp)
  add $t0, $t1, $t2
  sw $t0, -72($fp)
  lw $t1, -72($fp)
  move $t0, $t1
  sw $t0, -4412($fp)
  lw $t1, -4120($fp)
  addi $t0, $t1, 20
  sw $t0, -84($fp)
  lw $t1, -84($fp)
  addi $t0, $t1, 3
  sw $t0, -92($fp)
  li $t1, 19990
  lw $t2, -92($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -104($fp)
  lw $t1, -104($fp)
  move $t0, $t1
  sw $t0, -4424($fp)
  li $t0, 0
  sw $t0, -4796($fp)
  li $t0, 0
  sw $t0, -4752($fp)
  li $t0, 0
  sw $t0, -4736($fp)
label10:
  addi $sp, $sp, -4
  lw $t0, -4120($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_isqrt
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4128($fp)
  addi $sp, $sp, 4
  addi $sp, $sp, -4
  lw $t0, -4128($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_isqrt
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4136($fp)
  addi $sp, $sp, 4
  addi $sp, $sp, -4
  lw $t0, -4136($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_fact
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4148($fp)
  addi $sp, $sp, 4
  lw $t1, -4796($fp)
  lw $t2, -4148($fp)
  blt $t1, $t2, label11
  j label12
label11:
  lw $t1, -4796($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -4164($fp)
  addi $t1, $fp, -4688
  lw $t2, -4164($fp)
  add $t0, $t0, $t2
  sw $t0, -4188($fp)
  addi $sp, $sp, -4
  li $t0, 4
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -4796($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4180($fp)
  addi $sp, $sp, 8
  addi $sp, $sp, -4
  lw $t0, -4180($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_fact
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4192($fp)
  addi $sp, $sp, 4
  lw $t1, -4192($fp)
  lw $t0, -4188($fp)
  sw $t1, 0($t0)
  lw $t1, -4796($fp)
  li $t2, 4
  div $t1, $t2
  mflo $t0
  sw $t0, -4204($fp)
  lw $t1, -4204($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -4216($fp)
  lw $t1, -4796($fp)
  lw $t2, -4216($fp)
  add $t0, $t1, $t2
  sw $t0, -4228($fp)
  lw $t1, -4228($fp)
  move $t0, $t1
  sw $t0, -4372($fp)
  lw $t1, -4796($fp)
  li $t2, 4
  div $t1, $t2
  mflo $t0
  sw $t0, -4240($fp)
  lw $t1, -4240($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -4252($fp)
  lw $t1, -4372($fp)
  lw $t2, -4252($fp)
  add $t0, $t1, $t2
  sw $t0, -4264($fp)
  lw $t1, -4264($fp)
  move $t0, $t1
  sw $t0, -4372($fp)
  lw $t1, -4796($fp)
  li $t2, 4
  div $t1, $t2
  mflo $t0
  sw $t0, -4276($fp)
  lw $t1, -4276($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -4288($fp)
  lw $t1, -4372($fp)
  lw $t2, -4288($fp)
  add $t0, $t1, $t2
  sw $t0, -4300($fp)
  lw $t1, -4300($fp)
  move $t0, $t1
  sw $t0, -4372($fp)
  lw $t1, -4796($fp)
  li $t2, 4
  div $t1, $t2
  mflo $t0
  sw $t0, -4312($fp)
  lw $t1, -4312($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -4324($fp)
  lw $t1, -4372($fp)
  lw $t2, -4324($fp)
  add $t0, $t1, $t2
  sw $t0, -4336($fp)
  lw $t1, -4336($fp)
  move $t0, $t1
  sw $t0, -4372($fp)
label13:
  lw $t1, -4776($fp)
  lw $t2, -4776($fp)
  mul $t0, $t1, $t2
  sw $t0, -4352($fp)
  lw $t1, -4352($fp)
  lw $t2, -4776($fp)
  mul $t0, $t1, $t2
  sw $t0, -4368($fp)
  lw $t1, -4780($fp)
  lw $t2, -4368($fp)
  blt $t1, $t2, label14
  j label15
label14:
  addi $sp, $sp, -4
  li $t0, 10
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -4372($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4380($fp)
  addi $sp, $sp, 8
  lw $t1, -4380($fp)
  addi $t0, $t1, 10
  sw $t0, -4388($fp)
  lw $t1, -4388($fp)
  lw $t2, -4780($fp)
  add $t0, $t1, $t2
  sw $t0, -4400($fp)
  lw $t1, -4400($fp)
  addi $t0, $t1, 1
  sw $t0, -4408($fp)
  lw $t1, -4408($fp)
  lw $t2, -4412($fp)
  add $t0, $t1, $t2
  sw $t0, -4420($fp)
  lw $t1, -4420($fp)
  lw $t2, -4424($fp)
  sub $t0, $t1, $t2
  sw $t0, -4436($fp)
  lw $t1, -4436($fp)
  move $t0, $t1
  sw $t0, -4780($fp)
  j label13
label15:
  addi $sp, $sp, -4
  lw $t0, -4780($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_isqrt
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4448($fp)
  addi $sp, $sp, 4
  addi $sp, $sp, -4
  li $t0, 10
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -4448($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4456($fp)
  addi $sp, $sp, 8
  addi $sp, $sp, -4
  lw $t0, -4456($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_fact
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4468($fp)
  addi $sp, $sp, 4
  lw $t1, -4780($fp)
  lw $t2, -4468($fp)
  add $t0, $t1, $t2
  sw $t0, -4480($fp)
  lw $t1, -4480($fp)
  move $t0, $t1
  sw $t0, -4780($fp)
  lw $t1, -4796($fp)
  addi $t0, $t1, 1
  sw $t0, -4496($fp)
  lw $t1, -4496($fp)
  move $t0, $t1
  sw $t0, -4796($fp)
  j label10
label12:
  li $t0, 0
  sw $t0, -4796($fp)
label16:
  lw $t1, -4796($fp)
  li $t2, 10
  blt $t1, $t2, label17
  j label18
label17:
  li $t0, 0
  sw $t0, -4752($fp)
label19:
  lw $t1, -4752($fp)
  li $t2, 10
  blt $t1, $t2, label20
  j label21
label20:
  lw $t1, -4796($fp)
  li $t2, 0
  beq $t1, $t2, label25
  j label23
label25:
  lw $t1, -4752($fp)
  li $t2, 0
  beq $t1, $t2, label22
  j label23
label22:
  li $t0, 1
  sw $t0, -4736($fp)
  j label24
label23:
  li $t0, 0
  sw $t0, -4736($fp)
label24:
label26:
  lw $t1, -4736($fp)
  li $t2, 10
  blt $t1, $t2, label27
  j label28
label27:
  lw $t1, -4796($fp)
  li $t2, 10
  mul $t0, $t1, $t2
  sw $t0, -4544($fp)
  lw $t1, -4544($fp)
  li $t2, 10
  mul $t0, $t1, $t2
  sw $t0, -4560($fp)
  lw $t1, -4752($fp)
  li $t2, 10
  mul $t0, $t1, $t2
  sw $t0, -4564($fp)
  lw $t1, -4560($fp)
  lw $t2, -4564($fp)
  add $t0, $t1, $t2
  sw $t0, -4572($fp)
  lw $t1, -4572($fp)
  lw $t2, -4736($fp)
  add $t0, $t1, $t2
  sw $t0, -4584($fp)
  lw $t1, -4584($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -4596($fp)
  addi $t1, $fp, -4688
  lw $t2, -4596($fp)
  add $t0, $t0, $t2
  sw $t0, -4608($fp)
  lw $t1, -4608($fp)
  lw $t0, 0($t1)
  sw $t0, -4616($fp)
  lw $t1, -4776($fp)
  lw $t2, -4616($fp)
  add $t0, $t1, $t2
  sw $t0, -4708($fp)
  lw $t1, -4796($fp)
  li $t2, 10
  mul $t0, $t1, $t2
  sw $t0, -4632($fp)
  lw $t1, -4632($fp)
  li $t2, 10
  mul $t0, $t1, $t2
  sw $t0, -4648($fp)
  lw $t1, -4752($fp)
  li $t2, 10
  mul $t0, $t1, $t2
  sw $t0, -4652($fp)
  lw $t1, -4648($fp)
  lw $t2, -4652($fp)
  add $t0, $t1, $t2
  sw $t0, -4660($fp)
  lw $t1, -4660($fp)
  lw $t2, -4736($fp)
  add $t0, $t1, $t2
  sw $t0, -4672($fp)
  lw $t1, -4672($fp)
  addi $t0, $t1, -1
  sw $t0, -4680($fp)
  lw $t1, -4680($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -4692($fp)
  addi $t1, $fp, -4688
  lw $t2, -4692($fp)
  add $t0, $t0, $t2
  sw $t0, -4704($fp)
  lw $t1, -4704($fp)
  lw $t0, 0($t1)
  sw $t0, -4712($fp)
  lw $t1, -4708($fp)
  lw $t2, -4712($fp)
  sub $t0, $t1, $t2
  sw $t0, -4724($fp)
  lw $t1, -4724($fp)
  move $t0, $t1
  sw $t0, -4776($fp)
  lw $t1, -4736($fp)
  addi $t0, $t1, 1
  sw $t0, -4740($fp)
  lw $t1, -4740($fp)
  move $t0, $t1
  sw $t0, -4736($fp)
  j label26
label28:
  lw $t1, -4752($fp)
  addi $t0, $t1, 1
  sw $t0, -4756($fp)
  lw $t1, -4756($fp)
  move $t0, $t1
  sw $t0, -4752($fp)
  j label19
label21:
  lw $t1, -4796($fp)
  addi $t0, $t1, 1
  sw $t0, -4772($fp)
  lw $t1, -4772($fp)
  move $t0, $t1
  sw $t0, -4796($fp)
  j label16
label18:
  lw $t1, -4776($fp)
  lw $t2, -4780($fp)
  add $t0, $t1, $t2
  sw $t0, -4792($fp)
  lw $t1, -4792($fp)
  move $t0, $t1
  sw $t0, -4796($fp)
  lw $a0, -4796($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
