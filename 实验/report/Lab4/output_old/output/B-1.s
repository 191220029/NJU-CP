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

func_quick_power_mod:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -148
  lw $t0, 8($fp)
  sw $t0, -140($fp)
  lw $t0, 12($fp)
  sw $t0, -108($fp)
  lw $t0, 16($fp)
  sw $t0, -128($fp)
  li $t0, 1
  sw $t0, -148($fp)
  lw $t1, -140($fp)
  li $t2, 0
  ble $t1, $t2, label1
  j label5
label5:
  lw $t1, -108($fp)
  li $t2, 0
  ble $t1, $t2, label1
  j label4
label4:
  lw $t1, -128($fp)
  li $t2, 0
  ble $t1, $t2, label1
  j label2
label1:
  li $v0, -1
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
  j label3
label2:
  addi $sp, $sp, -4
  lw $t0, -128($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -140($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -48($fp)
  addi $sp, $sp, 8
  lw $t1, -48($fp)
  move $t0, $t1
  sw $t0, -140($fp)
label6:
  lw $t1, -108($fp)
  li $t2, 0
  bne $t1, $t2, label7
  j label8
label7:
  addi $sp, $sp, -4
  li $t0, 2
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -108($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -64($fp)
  addi $sp, $sp, 8
  lw $t1, -64($fp)
  li $t2, 1
  beq $t1, $t2, label9
  j label10
label9:
  lw $t1, -148($fp)
  lw $t2, -140($fp)
  mul $t0, $t1, $t2
  sw $t0, -84($fp)
  addi $sp, $sp, -4
  lw $t0, -128($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -84($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -96($fp)
  addi $sp, $sp, 8
  lw $t1, -96($fp)
  move $t0, $t1
  sw $t0, -148($fp)
label10:
  lw $t1, -108($fp)
  li $t2, 2
  div $t1, $t2
  mflo $t0
  sw $t0, -112($fp)
  lw $t1, -112($fp)
  move $t0, $t1
  sw $t0, -108($fp)
  lw $t1, -140($fp)
  lw $t2, -140($fp)
  mul $t0, $t1, $t2
  sw $t0, -132($fp)
  addi $sp, $sp, -4
  lw $t0, -128($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -132($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -144($fp)
  addi $sp, $sp, 8
  lw $t1, -144($fp)
  move $t0, $t1
  sw $t0, -140($fp)
  j label6
label8:
  lw $v0, -148($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
label3:

main:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -160
  li $t0, 0
  sw $t0, -64($fp)
label11:
  lw $t1, -64($fp)
  li $t2, 3
  blt $t1, $t2, label12
  j label13
label12:
  lw $t1, -64($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -36($fp)
  addi $t1, $fp, -124
  lw $t2, -36($fp)
  add $t0, $t0, $t2
  sw $t0, -48($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -52($fp)
  lw $t1, -52($fp)
  lw $t0, -48($fp)
  sw $t1, 0($t0)
  lw $t1, -64($fp)
  addi $t0, $t1, 1
  sw $t0, -68($fp)
  lw $t1, -68($fp)
  move $t0, $t1
  sw $t0, -64($fp)
  j label11
label13:
  li $t1, 2
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -80($fp)
  addi $t1, $fp, -124
  lw $t2, -80($fp)
  add $t0, $t0, $t2
  sw $t0, -92($fp)
  lw $t1, -92($fp)
  lw $t0, 0($t1)
  sw $t0, -144($fp)
  li $t1, 1
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -104($fp)
  addi $t1, $fp, -124
  lw $t2, -104($fp)
  add $t0, $t0, $t2
  sw $t0, -116($fp)
  lw $t1, -116($fp)
  lw $t0, 0($t1)
  sw $t0, -148($fp)
  li $t1, 0
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -128($fp)
  addi $t1, $fp, -124
  lw $t2, -128($fp)
  add $t0, $t0, $t2
  sw $t0, -140($fp)
  lw $t1, -140($fp)
  lw $t0, 0($t1)
  sw $t0, -152($fp)
  addi $sp, $sp, -4
  lw $t0, -144($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -148($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -152($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_quick_power_mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -160($fp)
  addi $sp, $sp, 12
  lw $a0, -160($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
