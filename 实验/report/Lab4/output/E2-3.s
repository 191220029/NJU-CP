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

func_merge:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -320
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t0, 12($fp)
  sw $t0, -8($fp)
  lw $t0, 16($fp)
  sw $t0, -12($fp)
  lw $t0, 20($fp)
  sw $t0, -16($fp)
  lw $t1, -8($fp)
  addi $t0, $t1, -1
  sw $t0, -100($fp)
  lw $t1, -12($fp)
  lw $t2, -100($fp)
  sub $t0, $t1, $t2
  sw $t0, -104($fp)
  lw $t1, -104($fp)
  move $t0, $t1
  sw $t0, -108($fp)
  lw $t1, -16($fp)
  lw $t2, -12($fp)
  sub $t0, $t1, $t2
  sw $t0, -112($fp)
  lw $t1, -112($fp)
  move $t0, $t1
  sw $t0, -116($fp)
  li $t0, 0
  sw $t0, -120($fp)
label1:
  lw $t1, -120($fp)
  lw $t2, -108($fp)
  blt $t1, $t2, label2
  j label3
label2:
  lw $t1, -120($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -124($fp)
  addi $t1, $fp, -56
  lw $t2, -124($fp)
  add $t0, $t1, $t2
  sw $t0, -128($fp)
  lw $t1, -8($fp)
  lw $t2, -120($fp)
  add $t0, $t1, $t2
  sw $t0, -132($fp)
  lw $t1, -132($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -136($fp)
  lw $t1, -4($fp)
  lw $t2, -136($fp)
  add $t0, $t1, $t2
  sw $t0, -140($fp)
  lw $t1, -140($fp)
  lw $t0, 0($t1)
  sw $t0, -144($fp)
  lw $t1, -144($fp)
  lw $t0, -128($fp)
  sw $t1, 0($t0)
  lw $t1, -120($fp)
  addi $t0, $t1, 1
  sw $t0, -148($fp)
  lw $t1, -148($fp)
  move $t0, $t1
  sw $t0, -120($fp)
  j label1
label3:
  li $t0, 0
  sw $t0, -152($fp)
label4:
  lw $t1, -152($fp)
  lw $t2, -116($fp)
  blt $t1, $t2, label5
  j label6
label5:
  lw $t1, -152($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -156($fp)
  addi $t1, $fp, -96
  lw $t2, -156($fp)
  add $t0, $t1, $t2
  sw $t0, -160($fp)
  lw $t1, -12($fp)
  addi $t0, $t1, 1
  sw $t0, -164($fp)
  lw $t1, -164($fp)
  lw $t2, -152($fp)
  add $t0, $t1, $t2
  sw $t0, -168($fp)
  lw $t1, -168($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -172($fp)
  lw $t1, -4($fp)
  lw $t2, -172($fp)
  add $t0, $t1, $t2
  sw $t0, -176($fp)
  lw $t1, -176($fp)
  lw $t0, 0($t1)
  sw $t0, -180($fp)
  lw $t1, -180($fp)
  lw $t0, -160($fp)
  sw $t1, 0($t0)
  lw $t1, -152($fp)
  addi $t0, $t1, 1
  sw $t0, -184($fp)
  lw $t1, -184($fp)
  move $t0, $t1
  sw $t0, -152($fp)
  j label4
label6:
  li $t0, 0
  sw $t0, -120($fp)
  li $t0, 0
  sw $t0, -152($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -188($fp)
label7:
  lw $t1, -120($fp)
  lw $t2, -108($fp)
  blt $t1, $t2, label10
  j label9
label10:
  lw $t1, -152($fp)
  lw $t2, -116($fp)
  blt $t1, $t2, label8
  j label9
label8:
  lw $t1, -120($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -192($fp)
  addi $t1, $fp, -56
  lw $t2, -192($fp)
  add $t0, $t1, $t2
  sw $t0, -196($fp)
  lw $t1, -196($fp)
  lw $t0, 0($t1)
  sw $t0, -200($fp)
  lw $t1, -152($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -204($fp)
  addi $t1, $fp, -96
  lw $t2, -204($fp)
  add $t0, $t1, $t2
  sw $t0, -208($fp)
  lw $t1, -208($fp)
  lw $t0, 0($t1)
  sw $t0, -212($fp)
  lw $t1, -200($fp)
  lw $t2, -212($fp)
  ble $t1, $t2, label11
  j label12
label11:
  lw $t1, -188($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -216($fp)
  lw $t1, -4($fp)
  lw $t2, -216($fp)
  add $t0, $t1, $t2
  sw $t0, -220($fp)
  lw $t1, -120($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -224($fp)
  addi $t1, $fp, -56
  lw $t2, -224($fp)
  add $t0, $t1, $t2
  sw $t0, -228($fp)
  lw $t1, -228($fp)
  lw $t0, 0($t1)
  sw $t0, -232($fp)
  lw $t1, -232($fp)
  lw $t0, -220($fp)
  sw $t1, 0($t0)
  lw $t1, -120($fp)
  addi $t0, $t1, 1
  sw $t0, -236($fp)
  lw $t1, -236($fp)
  move $t0, $t1
  sw $t0, -120($fp)
  j label13
label12:
  lw $t1, -188($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -240($fp)
  lw $t1, -4($fp)
  lw $t2, -240($fp)
  add $t0, $t1, $t2
  sw $t0, -244($fp)
  lw $t1, -152($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -248($fp)
  addi $t1, $fp, -96
  lw $t2, -248($fp)
  add $t0, $t1, $t2
  sw $t0, -252($fp)
  lw $t1, -252($fp)
  lw $t0, 0($t1)
  sw $t0, -256($fp)
  lw $t1, -256($fp)
  lw $t0, -244($fp)
  sw $t1, 0($t0)
  lw $t1, -152($fp)
  addi $t0, $t1, 1
  sw $t0, -260($fp)
  lw $t1, -260($fp)
  move $t0, $t1
  sw $t0, -152($fp)
label13:
  lw $t1, -188($fp)
  addi $t0, $t1, 1
  sw $t0, -264($fp)
  lw $t1, -264($fp)
  move $t0, $t1
  sw $t0, -188($fp)
  j label7
label9:
label14:
  lw $t1, -120($fp)
  lw $t2, -108($fp)
  blt $t1, $t2, label15
  j label16
label15:
  lw $t1, -188($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -268($fp)
  lw $t1, -4($fp)
  lw $t2, -268($fp)
  add $t0, $t1, $t2
  sw $t0, -272($fp)
  lw $t1, -120($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -276($fp)
  addi $t1, $fp, -56
  lw $t2, -276($fp)
  add $t0, $t1, $t2
  sw $t0, -280($fp)
  lw $t1, -280($fp)
  lw $t0, 0($t1)
  sw $t0, -284($fp)
  lw $t1, -284($fp)
  lw $t0, -272($fp)
  sw $t1, 0($t0)
  lw $t1, -120($fp)
  addi $t0, $t1, 1
  sw $t0, -288($fp)
  lw $t1, -288($fp)
  move $t0, $t1
  sw $t0, -120($fp)
  lw $t1, -188($fp)
  addi $t0, $t1, 1
  sw $t0, -292($fp)
  lw $t1, -292($fp)
  move $t0, $t1
  sw $t0, -188($fp)
  j label14
label16:
label17:
  lw $t1, -152($fp)
  lw $t2, -116($fp)
  blt $t1, $t2, label18
  j label19
label18:
  lw $t1, -188($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -296($fp)
  lw $t1, -4($fp)
  lw $t2, -296($fp)
  add $t0, $t1, $t2
  sw $t0, -300($fp)
  lw $t1, -152($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -304($fp)
  addi $t1, $fp, -96
  lw $t2, -304($fp)
  add $t0, $t1, $t2
  sw $t0, -308($fp)
  lw $t1, -308($fp)
  lw $t0, 0($t1)
  sw $t0, -312($fp)
  lw $t1, -312($fp)
  lw $t0, -300($fp)
  sw $t1, 0($t0)
  lw $t1, -152($fp)
  addi $t0, $t1, 1
  sw $t0, -316($fp)
  lw $t1, -316($fp)
  move $t0, $t1
  sw $t0, -152($fp)
  lw $t1, -188($fp)
  addi $t0, $t1, 1
  sw $t0, -320($fp)
  lw $t1, -320($fp)
  move $t0, $t1
  sw $t0, -188($fp)
  j label17
label19:
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

func_merge_sort:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -44
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t0, 12($fp)
  sw $t0, -8($fp)
  lw $t0, 16($fp)
  sw $t0, -12($fp)
  li $t0, 0
  sw $t0, -16($fp)
  lw $t1, -8($fp)
  lw $t2, -12($fp)
  bge $t1, $t2, label20
  j label21
label20:
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
label21:
  lw $t1, -12($fp)
  lw $t2, -8($fp)
  sub $t0, $t1, $t2
  sw $t0, -20($fp)
  lw $t1, -20($fp)
  li $t2, 2
  div $t1, $t2
  mflo $t0
  sw $t0, -24($fp)
  lw $t1, -8($fp)
  lw $t2, -24($fp)
  add $t0, $t1, $t2
  sw $t0, -28($fp)
  lw $t1, -28($fp)
  move $t0, $t1
  sw $t0, -16($fp)
  addi $sp, $sp, -4
  lw $t0, -16($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -8($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -4($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_merge_sort
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -32($fp)
  addi $sp, $sp, 12
  lw $t1, -16($fp)
  addi $t0, $t1, 1
  sw $t0, -36($fp)
  addi $sp, $sp, -4
  lw $t0, -12($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -36($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -4($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_merge_sort
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -40($fp)
  addi $sp, $sp, 12
  addi $sp, $sp, -4
  lw $t0, -12($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -16($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -8($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -4($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_merge
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -44($fp)
  addi $sp, $sp, 16
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

main:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -72
  li $t0, 6
  sw $t0, -4($fp)
  li $t0, 0
  sw $t0, -32($fp)
label22:
  lw $t1, -32($fp)
  lw $t2, -4($fp)
  blt $t1, $t2, label23
  j label24
label23:
  lw $t1, -32($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -36($fp)
  addi $t1, $fp, -28
  lw $t2, -36($fp)
  add $t0, $t1, $t2
  sw $t0, -40($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -44($fp)
  lw $t1, -44($fp)
  lw $t0, -40($fp)
  sw $t1, 0($t0)
  lw $t1, -32($fp)
  addi $t0, $t1, 1
  sw $t0, -48($fp)
  lw $t1, -48($fp)
  move $t0, $t1
  sw $t0, -32($fp)
  j label22
label24:
  lw $t1, -4($fp)
  addi $t0, $t1, -1
  sw $t0, -52($fp)
  addi $sp, $sp, -4
  lw $t0, -52($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  li $t0, 0
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -28($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_merge_sort
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -56($fp)
  addi $sp, $sp, 12
  li $t0, 0
  sw $t0, -32($fp)
label25:
  lw $t1, -32($fp)
  lw $t2, -4($fp)
  blt $t1, $t2, label26
  j label27
label26:
  lw $t1, -32($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -60($fp)
  addi $t1, $fp, -28
  lw $t2, -60($fp)
  add $t0, $t1, $t2
  sw $t0, -64($fp)
  lw $t1, -64($fp)
  lw $t0, 0($t1)
  sw $t0, -68($fp)
  lw $a0, -68($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  lw $t1, -32($fp)
  addi $t0, $t1, 1
  sw $t0, -72($fp)
  lw $t1, -72($fp)
  move $t0, $t1
  sw $t0, -32($fp)
  j label25
label27:
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
