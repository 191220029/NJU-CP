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

main:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -212
  addi $t0, $fp, -44
  sw $t0, -48($fp)
  li $t0, 1
  sw $t0, -52($fp)
  lw $t0, -48($fp)
  lw $t1, -52($fp)
  sw $t1, 0($t0)
  addi $t0, $fp, -40
  sw $t0, -56($fp)
  li $t0, 1
  sw $t0, -60($fp)
  lw $t0, -56($fp)
  lw $t1, -60($fp)
  sw $t1, 0($t0)
  li $t0, 2
  sw $t0, -64($fp)
label1:
  lw $t1, -64($fp)
  move $t0, $t1
  sw $t0, -68($fp)
  lw $t1, -68($fp)
  li $t2, 11
  blt $t1, $t2, label2
  j label3
label2:
  lw $t1, -64($fp)
  move $t0, $t1
  sw $t0, -72($fp)
  lw $t1, -72($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -76($fp)
  addi $t0, $fp, -44
  lw $t2, -76($fp)
  add $t0, $t0, $t2
  sw $t0, -80($fp)
  li $t0, 0
  sw $t0, -84($fp)
  lw $t0, -80($fp)
  lw $t1, -84($fp)
  sw $t1, 0($t0)
  lw $t1, -64($fp)
  move $t0, $t1
  sw $t0, -88($fp)
  lw $t1, -88($fp)
  addi $t0, $t1, 1
  sw $t0, -92($fp)
  lw $t1, -92($fp)
  move $t0, $t1
  sw $t0, -64($fp)
  j label1
label3:
  li $t0, 2
  sw $t0, -64($fp)
label4:
  lw $t1, -64($fp)
  move $t0, $t1
  sw $t0, -96($fp)
  lw $t1, -96($fp)
  li $t2, 11
  blt $t1, $t2, label5
  j label6
label5:
  li $t0, 0
  sw $t0, -100($fp)
label7:
  lw $t1, -100($fp)
  move $t0, $t1
  sw $t0, -104($fp)
  lw $t1, -64($fp)
  move $t0, $t1
  sw $t0, -108($fp)
  lw $t1, -104($fp)
  lw $t2, -108($fp)
  blt $t1, $t2, label8
  j label9
label8:
  lw $t1, -64($fp)
  move $t0, $t1
  sw $t0, -112($fp)
  lw $t1, -112($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -116($fp)
  addi $t0, $fp, -44
  lw $t2, -116($fp)
  add $t0, $t0, $t2
  sw $t0, -120($fp)
  lw $t1, -64($fp)
  move $t0, $t1
  sw $t0, -124($fp)
  lw $t1, -124($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -128($fp)
  addi $t0, $fp, -44
  lw $t2, -128($fp)
  add $t0, $t0, $t2
  sw $t0, -132($fp)
  lw $t1, -132($fp)
  lw $t0, 0($t1)
  sw $t0, -136($fp)
  lw $t1, -100($fp)
  move $t0, $t1
  sw $t0, -140($fp)
  lw $t1, -140($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -144($fp)
  addi $t0, $fp, -44
  lw $t2, -144($fp)
  add $t0, $t0, $t2
  sw $t0, -148($fp)
  lw $t1, -148($fp)
  lw $t0, 0($t1)
  sw $t0, -152($fp)
  lw $t1, -64($fp)
  move $t0, $t1
  sw $t0, -156($fp)
  lw $t1, -100($fp)
  move $t0, $t1
  sw $t0, -160($fp)
  lw $t1, -156($fp)
  lw $t2, -160($fp)
  sub $t0, $t1, $t2
  sw $t0, -164($fp)
  lw $t1, -164($fp)
  addi $t0, $t1, -1
  sw $t0, -168($fp)
  lw $t1, -168($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -172($fp)
  addi $t0, $fp, -44
  lw $t2, -172($fp)
  add $t0, $t0, $t2
  sw $t0, -176($fp)
  lw $t1, -176($fp)
  lw $t0, 0($t1)
  sw $t0, -180($fp)
  lw $t1, -152($fp)
  lw $t2, -180($fp)
  mul $t0, $t1, $t2
  sw $t0, -184($fp)
  lw $t1, -136($fp)
  lw $t2, -184($fp)
  add $t0, $t1, $t2
  sw $t0, -188($fp)
  lw $t0, -120($fp)
  lw $t1, -188($fp)
  sw $t1, 0($t0)
  lw $t1, -100($fp)
  move $t0, $t1
  sw $t0, -192($fp)
  lw $t1, -192($fp)
  addi $t0, $t1, 1
  sw $t0, -196($fp)
  lw $t1, -196($fp)
  move $t0, $t1
  sw $t0, -100($fp)
  j label7
label9:
  lw $t1, -64($fp)
  move $t0, $t1
  sw $t0, -200($fp)
  lw $t1, -200($fp)
  addi $t0, $t1, 1
  sw $t0, -204($fp)
  lw $t1, -204($fp)
  move $t0, $t1
  sw $t0, -64($fp)
  j label4
label6:
  addi $t0, $fp, -4
  sw $t0, -208($fp)
  lw $t1, -208($fp)
  lw $t0, 0($t1)
  sw $t0, -212($fp)
  lw $a0, -212($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
