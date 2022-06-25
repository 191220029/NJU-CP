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
  addi $sp, $sp, -216
  lw $t0, 8($fp)
  sw $t0, -148($fp)
  lw $t0, 12($fp)
  sw $t0, -172($fp)
  li $t1, 0
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -20($fp)
  lw $t1, -148($fp)
  lw $t2, -20($fp)
  add $t0, $t1, $t2
  sw $t0, -32($fp)
  lw $t1, -32($fp)
  lw $t0, 0($t1)
  sw $t0, -60($fp)
  li $t1, 0
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -44($fp)
  lw $t1, -172($fp)
  lw $t2, -44($fp)
  add $t0, $t1, $t2
  sw $t0, -56($fp)
  lw $t1, -56($fp)
  lw $t0, 0($t1)
  sw $t0, -64($fp)
  lw $t1, -60($fp)
  lw $t2, -64($fp)
  mul $t0, $t1, $t2
  sw $t0, -132($fp)
  li $t1, 1
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -80($fp)
  lw $t1, -148($fp)
  lw $t2, -80($fp)
  add $t0, $t1, $t2
  sw $t0, -92($fp)
  lw $t1, -92($fp)
  lw $t0, 0($t1)
  sw $t0, -120($fp)
  li $t1, 1
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -104($fp)
  lw $t1, -172($fp)
  lw $t2, -104($fp)
  add $t0, $t1, $t2
  sw $t0, -116($fp)
  lw $t1, -116($fp)
  lw $t0, 0($t1)
  sw $t0, -124($fp)
  lw $t1, -120($fp)
  lw $t2, -124($fp)
  mul $t0, $t1, $t2
  sw $t0, -136($fp)
  lw $t1, -132($fp)
  lw $t2, -136($fp)
  add $t0, $t1, $t2
  sw $t0, -204($fp)
  li $t1, 2
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -152($fp)
  lw $t1, -148($fp)
  lw $t2, -152($fp)
  add $t0, $t1, $t2
  sw $t0, -164($fp)
  lw $t1, -164($fp)
  lw $t0, 0($t1)
  sw $t0, -192($fp)
  li $t1, 2
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -176($fp)
  lw $t1, -172($fp)
  lw $t2, -176($fp)
  add $t0, $t1, $t2
  sw $t0, -188($fp)
  lw $t1, -188($fp)
  lw $t0, 0($t1)
  sw $t0, -196($fp)
  lw $t1, -192($fp)
  lw $t2, -196($fp)
  mul $t0, $t1, $t2
  sw $t0, -208($fp)
  lw $t1, -204($fp)
  lw $t2, -208($fp)
  add $t0, $t1, $t2
  sw $t0, -216($fp)
  lw $v0, -216($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

func_cross_product:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -480
  lw $t0, 8($fp)
  sw $t0, -408($fp)
  lw $t0, 12($fp)
  sw $t0, -432($fp)
  lw $t0, 16($fp)
  sw $t0, -332($fp)
  li $t1, 0
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -24($fp)
  lw $t1, -332($fp)
  lw $t2, -24($fp)
  add $t0, $t1, $t2
  sw $t0, -164($fp)
  li $t1, 1
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -40($fp)
  lw $t1, -408($fp)
  lw $t2, -40($fp)
  add $t0, $t1, $t2
  sw $t0, -52($fp)
  lw $t1, -52($fp)
  lw $t0, 0($t1)
  sw $t0, -80($fp)
  li $t1, 2
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -64($fp)
  lw $t1, -432($fp)
  lw $t2, -64($fp)
  add $t0, $t1, $t2
  sw $t0, -76($fp)
  lw $t1, -76($fp)
  lw $t0, 0($t1)
  sw $t0, -84($fp)
  lw $t1, -80($fp)
  lw $t2, -84($fp)
  mul $t0, $t1, $t2
  sw $t0, -152($fp)
  li $t1, 2
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -100($fp)
  lw $t1, -408($fp)
  lw $t2, -100($fp)
  add $t0, $t1, $t2
  sw $t0, -112($fp)
  lw $t1, -112($fp)
  lw $t0, 0($t1)
  sw $t0, -140($fp)
  li $t1, 1
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -124($fp)
  lw $t1, -432($fp)
  lw $t2, -124($fp)
  add $t0, $t1, $t2
  sw $t0, -136($fp)
  lw $t1, -136($fp)
  lw $t0, 0($t1)
  sw $t0, -144($fp)
  lw $t1, -140($fp)
  lw $t2, -144($fp)
  mul $t0, $t1, $t2
  sw $t0, -156($fp)
  lw $t1, -152($fp)
  lw $t2, -156($fp)
  sub $t0, $t1, $t2
  sw $t0, -168($fp)
  lw $t1, -168($fp)
  lw $t0, -164($fp)
  sw $t1, 0($t0)
  li $t1, 1
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -180($fp)
  lw $t1, -332($fp)
  lw $t2, -180($fp)
  add $t0, $t1, $t2
  sw $t0, -320($fp)
  li $t1, 2
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -196($fp)
  lw $t1, -408($fp)
  lw $t2, -196($fp)
  add $t0, $t1, $t2
  sw $t0, -208($fp)
  lw $t1, -208($fp)
  lw $t0, 0($t1)
  sw $t0, -236($fp)
  li $t1, 0
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -220($fp)
  lw $t1, -432($fp)
  lw $t2, -220($fp)
  add $t0, $t1, $t2
  sw $t0, -232($fp)
  lw $t1, -232($fp)
  lw $t0, 0($t1)
  sw $t0, -240($fp)
  lw $t1, -236($fp)
  lw $t2, -240($fp)
  mul $t0, $t1, $t2
  sw $t0, -308($fp)
  li $t1, 0
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -256($fp)
  lw $t1, -408($fp)
  lw $t2, -256($fp)
  add $t0, $t1, $t2
  sw $t0, -268($fp)
  lw $t1, -268($fp)
  lw $t0, 0($t1)
  sw $t0, -296($fp)
  li $t1, 2
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -280($fp)
  lw $t1, -432($fp)
  lw $t2, -280($fp)
  add $t0, $t1, $t2
  sw $t0, -292($fp)
  lw $t1, -292($fp)
  lw $t0, 0($t1)
  sw $t0, -300($fp)
  lw $t1, -296($fp)
  lw $t2, -300($fp)
  mul $t0, $t1, $t2
  sw $t0, -312($fp)
  lw $t1, -308($fp)
  lw $t2, -312($fp)
  sub $t0, $t1, $t2
  sw $t0, -324($fp)
  lw $t1, -324($fp)
  lw $t0, -320($fp)
  sw $t1, 0($t0)
  li $t1, 2
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -336($fp)
  lw $t1, -332($fp)
  lw $t2, -336($fp)
  add $t0, $t1, $t2
  sw $t0, -476($fp)
  li $t1, 0
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -352($fp)
  lw $t1, -408($fp)
  lw $t2, -352($fp)
  add $t0, $t1, $t2
  sw $t0, -364($fp)
  lw $t1, -364($fp)
  lw $t0, 0($t1)
  sw $t0, -392($fp)
  li $t1, 1
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -376($fp)
  lw $t1, -432($fp)
  lw $t2, -376($fp)
  add $t0, $t1, $t2
  sw $t0, -388($fp)
  lw $t1, -388($fp)
  lw $t0, 0($t1)
  sw $t0, -396($fp)
  lw $t1, -392($fp)
  lw $t2, -396($fp)
  mul $t0, $t1, $t2
  sw $t0, -464($fp)
  li $t1, 1
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -412($fp)
  lw $t1, -408($fp)
  lw $t2, -412($fp)
  add $t0, $t1, $t2
  sw $t0, -424($fp)
  lw $t1, -424($fp)
  lw $t0, 0($t1)
  sw $t0, -452($fp)
  li $t1, 0
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -436($fp)
  lw $t1, -432($fp)
  lw $t2, -436($fp)
  add $t0, $t1, $t2
  sw $t0, -448($fp)
  lw $t1, -448($fp)
  lw $t0, 0($t1)
  sw $t0, -456($fp)
  lw $t1, -452($fp)
  lw $t2, -456($fp)
  mul $t0, $t1, $t2
  sw $t0, -468($fp)
  lw $t1, -464($fp)
  lw $t2, -468($fp)
  sub $t0, $t1, $t2
  sw $t0, -480($fp)
  lw $t1, -480($fp)
  lw $t0, -476($fp)
  sw $t1, 0($t0)
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

main:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -296
  li $t0, 0
  sw $t0, -228($fp)
label1:
  lw $t1, -228($fp)
  li $t2, 2
  blt $t1, $t2, label2
  j label3
label2:
  li $t0, 0
  sw $t0, -212($fp)
label4:
  lw $t1, -212($fp)
  li $t2, 3
  blt $t1, $t2, label5
  j label6
label5:
  li $t0, 0
  sw $t0, -120($fp)
  lw $t1, -212($fp)
  move $t0, $t1
  sw $t0, -108($fp)
  lw $t1, -228($fp)
  move $t0, $t1
  sw $t0, -88($fp)
  lw $t1, -88($fp)
  li $t2, 12
  mul $t0, $t1, $t2
  sw $t0, -88($fp)
  lw $t1, -120($fp)
  lw $t2, -88($fp)
  add $t0, $t1, $t2
  sw $t0, -120($fp)
  lw $t1, -108($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -108($fp)
  lw $t1, -120($fp)
  lw $t2, -108($fp)
  add $t0, $t1, $t2
  sw $t0, -120($fp)
  addi $t1, $fp, -256
  lw $t2, -120($fp)
  add $t0, $t0, $t2
  sw $t0, -196($fp)
  lw $t1, -228($fp)
  addi $t0, $t1, 1
  sw $t0, -144($fp)
  lw $t1, -228($fp)
  addi $t0, $t1, 1
  sw $t0, -148($fp)
  lw $t1, -144($fp)
  lw $t2, -148($fp)
  mul $t0, $t1, $t2
  sw $t0, -184($fp)
  lw $t1, -212($fp)
  addi $t0, $t1, 1
  sw $t0, -172($fp)
  lw $t1, -212($fp)
  addi $t0, $t1, 1
  sw $t0, -176($fp)
  lw $t1, -172($fp)
  lw $t2, -176($fp)
  mul $t0, $t1, $t2
  sw $t0, -188($fp)
  lw $t1, -184($fp)
  lw $t2, -188($fp)
  add $t0, $t1, $t2
  sw $t0, -200($fp)
  lw $t1, -200($fp)
  lw $t0, -196($fp)
  sw $t1, 0($t0)
  lw $t1, -212($fp)
  addi $t0, $t1, 1
  sw $t0, -216($fp)
  lw $t1, -216($fp)
  move $t0, $t1
  sw $t0, -212($fp)
  j label4
label6:
  lw $t1, -228($fp)
  addi $t0, $t1, 1
  sw $t0, -232($fp)
  lw $t1, -232($fp)
  move $t0, $t1
  sw $t0, -228($fp)
  j label1
label3:
  li $t1, 1
  li $t2, 12
  mul $t0, $t1, $t2
  sw $t0, -244($fp)
  addi $t1, $fp, -256
  lw $t2, -244($fp)
  add $t0, $t0, $t2
  sw $t0, -272($fp)
  li $t1, 0
  li $t2, 12
  mul $t0, $t1, $t2
  sw $t0, -260($fp)
  addi $t1, $fp, -256
  lw $t2, -260($fp)
  add $t0, $t0, $t2
  sw $t0, -276($fp)
  addi $sp, $sp, -4
  lw $t0, -288($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -272($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -276($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_cross_product
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -280($fp)
  addi $sp, $sp, 12
  addi $sp, $sp, -4
  lw $t0, -288($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -288($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_dot_product
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -296($fp)
  addi $sp, $sp, 8
  lw $a0, -296($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
