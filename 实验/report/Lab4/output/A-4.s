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
  addi $sp, $sp, -168
  li $t0, 11
  sw $t0, -48($fp)
  li $t1, 0
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -52($fp)
  addi $t1, $fp, -44
  lw $t2, -52($fp)
  add $t0, $t1, $t2
  sw $t0, -56($fp)
  li $t1, 1
  lw $t0, -56($fp)
  sw $t1, 0($t0)
  li $t1, 1
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -60($fp)
  addi $t1, $fp, -44
  lw $t2, -60($fp)
  add $t0, $t1, $t2
  sw $t0, -64($fp)
  li $t1, 1
  lw $t0, -64($fp)
  sw $t1, 0($t0)
  li $t0, 2
  sw $t0, -68($fp)
label1:
  lw $t1, -68($fp)
  lw $t2, -48($fp)
  blt $t1, $t2, label2
  j label3
label2:
  lw $t1, -68($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -72($fp)
  addi $t1, $fp, -44
  lw $t2, -72($fp)
  add $t0, $t1, $t2
  sw $t0, -76($fp)
  li $t1, 0
  lw $t0, -76($fp)
  sw $t1, 0($t0)
  lw $t1, -68($fp)
  addi $t0, $t1, 1
  sw $t0, -80($fp)
  lw $t1, -80($fp)
  move $t0, $t1
  sw $t0, -68($fp)
  j label1
label3:
  li $t0, 2
  sw $t0, -68($fp)
label4:
  lw $t1, -68($fp)
  lw $t2, -48($fp)
  blt $t1, $t2, label5
  j label6
label5:
  li $t0, 0
  sw $t0, -84($fp)
label7:
  lw $t1, -84($fp)
  lw $t2, -68($fp)
  blt $t1, $t2, label8
  j label9
label8:
  lw $t1, -68($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -88($fp)
  addi $t1, $fp, -44
  lw $t2, -88($fp)
  add $t0, $t1, $t2
  sw $t0, -92($fp)
  lw $t1, -68($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -96($fp)
  addi $t1, $fp, -44
  lw $t2, -96($fp)
  add $t0, $t1, $t2
  sw $t0, -100($fp)
  lw $t1, -100($fp)
  lw $t0, 0($t1)
  sw $t0, -104($fp)
  lw $t1, -84($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -108($fp)
  addi $t1, $fp, -44
  lw $t2, -108($fp)
  add $t0, $t1, $t2
  sw $t0, -112($fp)
  lw $t1, -112($fp)
  lw $t0, 0($t1)
  sw $t0, -116($fp)
  lw $t1, -68($fp)
  lw $t2, -84($fp)
  sub $t0, $t1, $t2
  sw $t0, -120($fp)
  lw $t1, -120($fp)
  addi $t0, $t1, -1
  sw $t0, -124($fp)
  lw $t1, -124($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -128($fp)
  addi $t1, $fp, -44
  lw $t2, -128($fp)
  add $t0, $t1, $t2
  sw $t0, -132($fp)
  lw $t1, -132($fp)
  lw $t0, 0($t1)
  sw $t0, -136($fp)
  lw $t1, -116($fp)
  lw $t2, -136($fp)
  mul $t0, $t1, $t2
  sw $t0, -140($fp)
  lw $t1, -104($fp)
  lw $t2, -140($fp)
  add $t0, $t1, $t2
  sw $t0, -144($fp)
  lw $t1, -144($fp)
  lw $t0, -92($fp)
  sw $t1, 0($t0)
  lw $t1, -84($fp)
  addi $t0, $t1, 1
  sw $t0, -148($fp)
  lw $t1, -148($fp)
  move $t0, $t1
  sw $t0, -84($fp)
  j label7
label9:
  lw $t1, -68($fp)
  addi $t0, $t1, 1
  sw $t0, -152($fp)
  lw $t1, -152($fp)
  move $t0, $t1
  sw $t0, -68($fp)
  j label4
label6:
  lw $t1, -48($fp)
  addi $t0, $t1, -1
  sw $t0, -156($fp)
  lw $t1, -156($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -160($fp)
  addi $t1, $fp, -44
  lw $t2, -160($fp)
  add $t0, $t1, $t2
  sw $t0, -164($fp)
  lw $t1, -164($fp)
  lw $t0, 0($t1)
  sw $t0, -168($fp)
  lw $a0, -168($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
