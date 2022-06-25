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

func_dot_product:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -100
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t0, 12($fp)
  sw $t0, -8($fp)
  li $t1, 0
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -12($fp)
  lw $t1, -4($fp)
  lw $t2, -12($fp)
  add $t0, $t1, $t2
  sw $t0, -16($fp)
  lw $t1, -16($fp)
  lw $t0, 0($t1)
  sw $t0, -20($fp)
  li $t1, 0
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -24($fp)
  lw $t1, -8($fp)
  lw $t2, -24($fp)
  add $t0, $t1, $t2
  sw $t0, -28($fp)
  lw $t1, -28($fp)
  lw $t0, 0($t1)
  sw $t0, -32($fp)
  lw $t1, -20($fp)
  lw $t2, -32($fp)
  mul $t0, $t1, $t2
  sw $t0, -36($fp)
  li $t1, 1
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -40($fp)
  lw $t1, -4($fp)
  lw $t2, -40($fp)
  add $t0, $t1, $t2
  sw $t0, -44($fp)
  lw $t1, -44($fp)
  lw $t0, 0($t1)
  sw $t0, -48($fp)
  li $t1, 1
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -52($fp)
  lw $t1, -8($fp)
  lw $t2, -52($fp)
  add $t0, $t1, $t2
  sw $t0, -56($fp)
  lw $t1, -56($fp)
  lw $t0, 0($t1)
  sw $t0, -60($fp)
  lw $t1, -48($fp)
  lw $t2, -60($fp)
  mul $t0, $t1, $t2
  sw $t0, -64($fp)
  lw $t1, -36($fp)
  lw $t2, -64($fp)
  add $t0, $t1, $t2
  sw $t0, -68($fp)
  li $t1, 2
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -72($fp)
  lw $t1, -4($fp)
  lw $t2, -72($fp)
  add $t0, $t1, $t2
  sw $t0, -76($fp)
  lw $t1, -76($fp)
  lw $t0, 0($t1)
  sw $t0, -80($fp)
  li $t1, 2
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -84($fp)
  lw $t1, -8($fp)
  lw $t2, -84($fp)
  add $t0, $t1, $t2
  sw $t0, -88($fp)
  lw $t1, -88($fp)
  lw $t0, 0($t1)
  sw $t0, -92($fp)
  lw $t1, -80($fp)
  lw $t2, -92($fp)
  mul $t0, $t1, $t2
  sw $t0, -96($fp)
  lw $t1, -68($fp)
  lw $t2, -96($fp)
  add $t0, $t1, $t2
  sw $t0, -100($fp)
  lw $v0, -100($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

func_cross_product:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -216
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t0, 12($fp)
  sw $t0, -8($fp)
  lw $t0, 16($fp)
  sw $t0, -12($fp)
  li $t1, 0
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -16($fp)
  lw $t1, -12($fp)
  lw $t2, -16($fp)
  add $t0, $t1, $t2
  sw $t0, -20($fp)
  li $t1, 1
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -24($fp)
  lw $t1, -4($fp)
  lw $t2, -24($fp)
  add $t0, $t1, $t2
  sw $t0, -28($fp)
  lw $t1, -28($fp)
  lw $t0, 0($t1)
  sw $t0, -32($fp)
  li $t1, 2
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -36($fp)
  lw $t1, -8($fp)
  lw $t2, -36($fp)
  add $t0, $t1, $t2
  sw $t0, -40($fp)
  lw $t1, -40($fp)
  lw $t0, 0($t1)
  sw $t0, -44($fp)
  lw $t1, -32($fp)
  lw $t2, -44($fp)
  mul $t0, $t1, $t2
  sw $t0, -48($fp)
  li $t1, 2
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -52($fp)
  lw $t1, -4($fp)
  lw $t2, -52($fp)
  add $t0, $t1, $t2
  sw $t0, -56($fp)
  lw $t1, -56($fp)
  lw $t0, 0($t1)
  sw $t0, -60($fp)
  li $t1, 1
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -64($fp)
  lw $t1, -8($fp)
  lw $t2, -64($fp)
  add $t0, $t1, $t2
  sw $t0, -68($fp)
  lw $t1, -68($fp)
  lw $t0, 0($t1)
  sw $t0, -72($fp)
  lw $t1, -60($fp)
  lw $t2, -72($fp)
  mul $t0, $t1, $t2
  sw $t0, -76($fp)
  lw $t1, -48($fp)
  lw $t2, -76($fp)
  sub $t0, $t1, $t2
  sw $t0, -80($fp)
  lw $t1, -80($fp)
  lw $t0, -20($fp)
  sw $t1, 0($t0)
  li $t1, 1
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -84($fp)
  lw $t1, -12($fp)
  lw $t2, -84($fp)
  add $t0, $t1, $t2
  sw $t0, -88($fp)
  li $t1, 2
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -92($fp)
  lw $t1, -4($fp)
  lw $t2, -92($fp)
  add $t0, $t1, $t2
  sw $t0, -96($fp)
  lw $t1, -96($fp)
  lw $t0, 0($t1)
  sw $t0, -100($fp)
  li $t1, 0
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -104($fp)
  lw $t1, -8($fp)
  lw $t2, -104($fp)
  add $t0, $t1, $t2
  sw $t0, -108($fp)
  lw $t1, -108($fp)
  lw $t0, 0($t1)
  sw $t0, -112($fp)
  lw $t1, -100($fp)
  lw $t2, -112($fp)
  mul $t0, $t1, $t2
  sw $t0, -116($fp)
  li $t1, 0
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -120($fp)
  lw $t1, -4($fp)
  lw $t2, -120($fp)
  add $t0, $t1, $t2
  sw $t0, -124($fp)
  lw $t1, -124($fp)
  lw $t0, 0($t1)
  sw $t0, -128($fp)
  li $t1, 2
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -132($fp)
  lw $t1, -8($fp)
  lw $t2, -132($fp)
  add $t0, $t1, $t2
  sw $t0, -136($fp)
  lw $t1, -136($fp)
  lw $t0, 0($t1)
  sw $t0, -140($fp)
  lw $t1, -128($fp)
  lw $t2, -140($fp)
  mul $t0, $t1, $t2
  sw $t0, -144($fp)
  lw $t1, -116($fp)
  lw $t2, -144($fp)
  sub $t0, $t1, $t2
  sw $t0, -148($fp)
  lw $t1, -148($fp)
  lw $t0, -88($fp)
  sw $t1, 0($t0)
  li $t1, 2
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -152($fp)
  lw $t1, -12($fp)
  lw $t2, -152($fp)
  add $t0, $t1, $t2
  sw $t0, -156($fp)
  li $t1, 0
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -160($fp)
  lw $t1, -4($fp)
  lw $t2, -160($fp)
  add $t0, $t1, $t2
  sw $t0, -164($fp)
  lw $t1, -164($fp)
  lw $t0, 0($t1)
  sw $t0, -168($fp)
  li $t1, 1
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -172($fp)
  lw $t1, -8($fp)
  lw $t2, -172($fp)
  add $t0, $t1, $t2
  sw $t0, -176($fp)
  lw $t1, -176($fp)
  lw $t0, 0($t1)
  sw $t0, -180($fp)
  lw $t1, -168($fp)
  lw $t2, -180($fp)
  mul $t0, $t1, $t2
  sw $t0, -184($fp)
  li $t1, 1
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -188($fp)
  lw $t1, -4($fp)
  lw $t2, -188($fp)
  add $t0, $t1, $t2
  sw $t0, -192($fp)
  lw $t1, -192($fp)
  lw $t0, 0($t1)
  sw $t0, -196($fp)
  li $t1, 0
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -200($fp)
  lw $t1, -8($fp)
  lw $t2, -200($fp)
  add $t0, $t1, $t2
  sw $t0, -204($fp)
  lw $t1, -204($fp)
  lw $t0, 0($t1)
  sw $t0, -208($fp)
  lw $t1, -196($fp)
  lw $t2, -208($fp)
  mul $t0, $t1, $t2
  sw $t0, -212($fp)
  lw $t1, -184($fp)
  lw $t2, -212($fp)
  sub $t0, $t1, $t2
  sw $t0, -216($fp)
  lw $t1, -216($fp)
  lw $t0, -156($fp)
  sw $t1, 0($t0)
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

main:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -120
  li $t0, 0
  sw $t0, -40($fp)
label1:
  lw $t1, -40($fp)
  li $t2, 2
  blt $t1, $t2, label2
  j label3
label2:
  li $t0, 0
  sw $t0, -44($fp)
label4:
  lw $t1, -44($fp)
  li $t2, 3
  blt $t1, $t2, label5
  j label6
label5:
  li $t0, 0
  sw $t0, -48($fp)
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -52($fp)
  lw $t1, -40($fp)
  move $t0, $t1
  sw $t0, -56($fp)
  lw $t1, -56($fp)
  li $t2, 12
  mul $t0, $t1, $t2
  sw $t0, -56($fp)
  lw $t1, -48($fp)
  lw $t2, -56($fp)
  add $t0, $t1, $t2
  sw $t0, -48($fp)
  lw $t1, -52($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -52($fp)
  lw $t1, -48($fp)
  lw $t2, -52($fp)
  add $t0, $t1, $t2
  sw $t0, -48($fp)
  addi $t1, $fp, -24
  lw $t2, -48($fp)
  add $t0, $t1, $t2
  sw $t0, -60($fp)
  lw $t1, -40($fp)
  addi $t0, $t1, 1
  sw $t0, -64($fp)
  lw $t1, -40($fp)
  addi $t0, $t1, 1
  sw $t0, -68($fp)
  lw $t1, -64($fp)
  lw $t2, -68($fp)
  mul $t0, $t1, $t2
  sw $t0, -72($fp)
  lw $t1, -44($fp)
  addi $t0, $t1, 1
  sw $t0, -76($fp)
  lw $t1, -44($fp)
  addi $t0, $t1, 1
  sw $t0, -80($fp)
  lw $t1, -76($fp)
  lw $t2, -80($fp)
  mul $t0, $t1, $t2
  sw $t0, -84($fp)
  lw $t1, -72($fp)
  lw $t2, -84($fp)
  add $t0, $t1, $t2
  sw $t0, -88($fp)
  lw $t1, -88($fp)
  lw $t0, -60($fp)
  sw $t1, 0($t0)
  lw $t1, -44($fp)
  addi $t0, $t1, 1
  sw $t0, -92($fp)
  lw $t1, -92($fp)
  move $t0, $t1
  sw $t0, -44($fp)
  j label4
label6:
  lw $t1, -40($fp)
  addi $t0, $t1, 1
  sw $t0, -96($fp)
  lw $t1, -96($fp)
  move $t0, $t1
  sw $t0, -40($fp)
  j label1
label3:
  li $t1, 1
  li $t2, 12
  mul $t0, $t1, $t2
  sw $t0, -100($fp)
  addi $t1, $fp, -24
  lw $t2, -100($fp)
  add $t0, $t1, $t2
  sw $t0, -104($fp)
  li $t1, 0
  li $t2, 12
  mul $t0, $t1, $t2
  sw $t0, -108($fp)
  addi $t1, $fp, -24
  lw $t2, -108($fp)
  add $t0, $t1, $t2
  sw $t0, -112($fp)
  addi $sp, $sp, -4
  lw $t0, -36($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -104($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -112($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_cross_product
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -116($fp)
  addi $sp, $sp, 12
  addi $sp, $sp, -4
  lw $t0, -36($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -36($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_dot_product
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -120($fp)
  addi $sp, $sp, 8
  lw $a0, -120($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
