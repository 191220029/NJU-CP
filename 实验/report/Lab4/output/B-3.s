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
  addi $sp, $sp, -452
  li $t0, 5
  sw $t0, -4($fp)
  li $t0, 0
  sw $t0, -48($fp)
label1:
  lw $t1, -48($fp)
  lw $t2, -4($fp)
  blt $t1, $t2, label2
  j label3
label2:
  lw $t1, -48($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -52($fp)
  addi $t1, $fp, -24
  lw $t2, -52($fp)
  add $t0, $t1, $t2
  sw $t0, -56($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -60($fp)
  lw $t1, -60($fp)
  lw $t0, -56($fp)
  sw $t1, 0($t0)
  lw $t1, -48($fp)
  addi $t0, $t1, 1
  sw $t0, -64($fp)
  lw $t1, -64($fp)
  move $t0, $t1
  sw $t0, -48($fp)
  j label1
label3:
  li $t0, 1
  sw $t0, -68($fp)
label4:
  lw $t1, -68($fp)
  lw $t2, -4($fp)
  blt $t1, $t2, label5
  j label6
label5:
  li $t0, 0
  sw $t0, -48($fp)
label7:
  li $t1, 2
  lw $t2, -68($fp)
  mul $t0, $t1, $t2
  sw $t0, -72($fp)
  lw $t1, -4($fp)
  lw $t2, -72($fp)
  sub $t0, $t1, $t2
  sw $t0, -76($fp)
  lw $t1, -48($fp)
  lw $t2, -76($fp)
  ble $t1, $t2, label8
  j label9
label8:
  lw $t1, -48($fp)
  move $t0, $t1
  sw $t0, -80($fp)
  lw $t1, -80($fp)
  lw $t2, -68($fp)
  add $t0, $t1, $t2
  sw $t0, -84($fp)
  lw $t1, -84($fp)
  move $t0, $t1
  sw $t0, -88($fp)
  lw $t1, -80($fp)
  move $t0, $t1
  sw $t0, -92($fp)
  lw $t1, -88($fp)
  move $t0, $t1
  sw $t0, -96($fp)
  lw $t1, -96($fp)
  lw $t2, -68($fp)
  add $t0, $t1, $t2
  sw $t0, -100($fp)
  lw $t1, -100($fp)
  move $t0, $t1
  sw $t0, -104($fp)
  lw $t1, -96($fp)
  move $t0, $t1
  sw $t0, -108($fp)
label10:
  lw $t1, -92($fp)
  lw $t2, -88($fp)
  blt $t1, $t2, label13
  j label12
label13:
  lw $t1, -108($fp)
  lw $t2, -104($fp)
  blt $t1, $t2, label11
  j label12
label11:
  lw $t1, -92($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -112($fp)
  addi $t1, $fp, -24
  lw $t2, -112($fp)
  add $t0, $t1, $t2
  sw $t0, -116($fp)
  lw $t1, -116($fp)
  lw $t0, 0($t1)
  sw $t0, -120($fp)
  lw $t1, -108($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -124($fp)
  addi $t1, $fp, -24
  lw $t2, -124($fp)
  add $t0, $t1, $t2
  sw $t0, -128($fp)
  lw $t1, -128($fp)
  lw $t0, 0($t1)
  sw $t0, -132($fp)
  lw $t1, -120($fp)
  lw $t2, -132($fp)
  blt $t1, $t2, label14
  j label15
label14:
  lw $t1, -48($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -136($fp)
  addi $t1, $fp, -44
  lw $t2, -136($fp)
  add $t0, $t1, $t2
  sw $t0, -140($fp)
  lw $t1, -92($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -144($fp)
  addi $t1, $fp, -24
  lw $t2, -144($fp)
  add $t0, $t1, $t2
  sw $t0, -148($fp)
  lw $t1, -148($fp)
  lw $t0, 0($t1)
  sw $t0, -152($fp)
  lw $t1, -152($fp)
  lw $t0, -140($fp)
  sw $t1, 0($t0)
  lw $t1, -92($fp)
  addi $t0, $t1, 1
  sw $t0, -156($fp)
  lw $t1, -156($fp)
  move $t0, $t1
  sw $t0, -92($fp)
  j label16
label15:
  lw $t1, -48($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -160($fp)
  addi $t1, $fp, -44
  lw $t2, -160($fp)
  add $t0, $t1, $t2
  sw $t0, -164($fp)
  lw $t1, -108($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -168($fp)
  addi $t1, $fp, -24
  lw $t2, -168($fp)
  add $t0, $t1, $t2
  sw $t0, -172($fp)
  lw $t1, -172($fp)
  lw $t0, 0($t1)
  sw $t0, -176($fp)
  lw $t1, -176($fp)
  lw $t0, -164($fp)
  sw $t1, 0($t0)
  lw $t1, -108($fp)
  addi $t0, $t1, 1
  sw $t0, -180($fp)
  lw $t1, -180($fp)
  move $t0, $t1
  sw $t0, -108($fp)
label16:
  lw $t1, -48($fp)
  addi $t0, $t1, 1
  sw $t0, -184($fp)
  lw $t1, -184($fp)
  move $t0, $t1
  sw $t0, -48($fp)
  j label10
label12:
label17:
  lw $t1, -92($fp)
  lw $t2, -88($fp)
  blt $t1, $t2, label18
  j label19
label18:
  lw $t1, -48($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -188($fp)
  addi $t1, $fp, -44
  lw $t2, -188($fp)
  add $t0, $t1, $t2
  sw $t0, -192($fp)
  lw $t1, -92($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -196($fp)
  addi $t1, $fp, -24
  lw $t2, -196($fp)
  add $t0, $t1, $t2
  sw $t0, -200($fp)
  lw $t1, -200($fp)
  lw $t0, 0($t1)
  sw $t0, -204($fp)
  lw $t1, -204($fp)
  lw $t0, -192($fp)
  sw $t1, 0($t0)
  lw $t1, -92($fp)
  addi $t0, $t1, 1
  sw $t0, -208($fp)
  lw $t1, -208($fp)
  move $t0, $t1
  sw $t0, -92($fp)
  lw $t1, -48($fp)
  addi $t0, $t1, 1
  sw $t0, -212($fp)
  lw $t1, -212($fp)
  move $t0, $t1
  sw $t0, -48($fp)
  j label17
label19:
label20:
  lw $t1, -108($fp)
  lw $t2, -104($fp)
  blt $t1, $t2, label21
  j label22
label21:
  lw $t1, -48($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -216($fp)
  addi $t1, $fp, -44
  lw $t2, -216($fp)
  add $t0, $t1, $t2
  sw $t0, -220($fp)
  lw $t1, -108($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -224($fp)
  addi $t1, $fp, -24
  lw $t2, -224($fp)
  add $t0, $t1, $t2
  sw $t0, -228($fp)
  lw $t1, -228($fp)
  lw $t0, 0($t1)
  sw $t0, -232($fp)
  lw $t1, -232($fp)
  lw $t0, -220($fp)
  sw $t1, 0($t0)
  lw $t1, -108($fp)
  addi $t0, $t1, 1
  sw $t0, -236($fp)
  lw $t1, -236($fp)
  move $t0, $t1
  sw $t0, -108($fp)
  lw $t1, -48($fp)
  addi $t0, $t1, 1
  sw $t0, -240($fp)
  lw $t1, -240($fp)
  move $t0, $t1
  sw $t0, -48($fp)
  j label20
label22:
  j label7
label9:
  lw $t1, -48($fp)
  lw $t2, -68($fp)
  add $t0, $t1, $t2
  sw $t0, -244($fp)
  lw $t1, -244($fp)
  lw $t2, -4($fp)
  blt $t1, $t2, label23
  j label24
label23:
  lw $t1, -48($fp)
  move $t0, $t1
  sw $t0, -80($fp)
  lw $t1, -80($fp)
  lw $t2, -68($fp)
  add $t0, $t1, $t2
  sw $t0, -248($fp)
  lw $t1, -248($fp)
  move $t0, $t1
  sw $t0, -88($fp)
  lw $t1, -80($fp)
  move $t0, $t1
  sw $t0, -92($fp)
  lw $t1, -88($fp)
  move $t0, $t1
  sw $t0, -96($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -104($fp)
  lw $t1, -96($fp)
  move $t0, $t1
  sw $t0, -108($fp)
label26:
  lw $t1, -92($fp)
  lw $t2, -88($fp)
  blt $t1, $t2, label29
  j label28
label29:
  lw $t1, -108($fp)
  lw $t2, -104($fp)
  blt $t1, $t2, label27
  j label28
label27:
  lw $t1, -92($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -252($fp)
  addi $t1, $fp, -24
  lw $t2, -252($fp)
  add $t0, $t1, $t2
  sw $t0, -256($fp)
  lw $t1, -256($fp)
  lw $t0, 0($t1)
  sw $t0, -260($fp)
  lw $t1, -108($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -264($fp)
  addi $t1, $fp, -24
  lw $t2, -264($fp)
  add $t0, $t1, $t2
  sw $t0, -268($fp)
  lw $t1, -268($fp)
  lw $t0, 0($t1)
  sw $t0, -272($fp)
  lw $t1, -260($fp)
  lw $t2, -272($fp)
  blt $t1, $t2, label30
  j label31
label30:
  lw $t1, -48($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -276($fp)
  addi $t1, $fp, -44
  lw $t2, -276($fp)
  add $t0, $t1, $t2
  sw $t0, -280($fp)
  lw $t1, -92($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -284($fp)
  addi $t1, $fp, -24
  lw $t2, -284($fp)
  add $t0, $t1, $t2
  sw $t0, -288($fp)
  lw $t1, -288($fp)
  lw $t0, 0($t1)
  sw $t0, -292($fp)
  lw $t1, -292($fp)
  lw $t0, -280($fp)
  sw $t1, 0($t0)
  lw $t1, -92($fp)
  addi $t0, $t1, 1
  sw $t0, -296($fp)
  lw $t1, -296($fp)
  move $t0, $t1
  sw $t0, -92($fp)
  lw $t1, -48($fp)
  addi $t0, $t1, 1
  sw $t0, -300($fp)
  lw $t1, -300($fp)
  move $t0, $t1
  sw $t0, -48($fp)
  j label32
label31:
  lw $t1, -48($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -304($fp)
  addi $t1, $fp, -44
  lw $t2, -304($fp)
  add $t0, $t1, $t2
  sw $t0, -308($fp)
  lw $t1, -108($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -312($fp)
  addi $t1, $fp, -24
  lw $t2, -312($fp)
  add $t0, $t1, $t2
  sw $t0, -316($fp)
  lw $t1, -316($fp)
  lw $t0, 0($t1)
  sw $t0, -320($fp)
  lw $t1, -320($fp)
  lw $t0, -308($fp)
  sw $t1, 0($t0)
  lw $t1, -108($fp)
  addi $t0, $t1, 1
  sw $t0, -324($fp)
  lw $t1, -324($fp)
  move $t0, $t1
  sw $t0, -108($fp)
  lw $t1, -48($fp)
  addi $t0, $t1, 1
  sw $t0, -328($fp)
  lw $t1, -328($fp)
  move $t0, $t1
  sw $t0, -48($fp)
label32:
  j label26
label28:
label33:
  lw $t1, -92($fp)
  lw $t2, -88($fp)
  blt $t1, $t2, label34
  j label35
label34:
  lw $t1, -48($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -332($fp)
  addi $t1, $fp, -44
  lw $t2, -332($fp)
  add $t0, $t1, $t2
  sw $t0, -336($fp)
  lw $t1, -92($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -340($fp)
  addi $t1, $fp, -24
  lw $t2, -340($fp)
  add $t0, $t1, $t2
  sw $t0, -344($fp)
  lw $t1, -344($fp)
  lw $t0, 0($t1)
  sw $t0, -348($fp)
  lw $t1, -348($fp)
  lw $t0, -336($fp)
  sw $t1, 0($t0)
  lw $t1, -92($fp)
  addi $t0, $t1, 1
  sw $t0, -352($fp)
  lw $t1, -352($fp)
  move $t0, $t1
  sw $t0, -92($fp)
  lw $t1, -48($fp)
  addi $t0, $t1, 1
  sw $t0, -356($fp)
  lw $t1, -356($fp)
  move $t0, $t1
  sw $t0, -48($fp)
  j label33
label35:
label36:
  lw $t1, -108($fp)
  lw $t2, -104($fp)
  blt $t1, $t2, label37
  j label38
label37:
  lw $t1, -48($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -360($fp)
  addi $t1, $fp, -44
  lw $t2, -360($fp)
  add $t0, $t1, $t2
  sw $t0, -364($fp)
  lw $t1, -108($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -368($fp)
  addi $t1, $fp, -24
  lw $t2, -368($fp)
  add $t0, $t1, $t2
  sw $t0, -372($fp)
  lw $t1, -372($fp)
  lw $t0, 0($t1)
  sw $t0, -376($fp)
  lw $t1, -376($fp)
  lw $t0, -364($fp)
  sw $t1, 0($t0)
  lw $t1, -108($fp)
  addi $t0, $t1, 1
  sw $t0, -380($fp)
  lw $t1, -380($fp)
  move $t0, $t1
  sw $t0, -108($fp)
  lw $t1, -48($fp)
  addi $t0, $t1, 1
  sw $t0, -384($fp)
  lw $t1, -384($fp)
  move $t0, $t1
  sw $t0, -48($fp)
  j label36
label38:
  j label25
label24:
label39:
  lw $t1, -48($fp)
  lw $t2, -4($fp)
  blt $t1, $t2, label40
  j label41
label40:
  lw $t1, -48($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -388($fp)
  addi $t1, $fp, -44
  lw $t2, -388($fp)
  add $t0, $t1, $t2
  sw $t0, -392($fp)
  lw $t1, -48($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -396($fp)
  addi $t1, $fp, -24
  lw $t2, -396($fp)
  add $t0, $t1, $t2
  sw $t0, -400($fp)
  lw $t1, -400($fp)
  lw $t0, 0($t1)
  sw $t0, -404($fp)
  lw $t1, -404($fp)
  lw $t0, -392($fp)
  sw $t1, 0($t0)
  lw $t1, -48($fp)
  addi $t0, $t1, 1
  sw $t0, -408($fp)
  lw $t1, -408($fp)
  move $t0, $t1
  sw $t0, -48($fp)
  j label39
label41:
label25:
  li $t0, 0
  sw $t0, -48($fp)
label42:
  lw $t1, -48($fp)
  lw $t2, -4($fp)
  blt $t1, $t2, label43
  j label44
label43:
  lw $t1, -48($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -412($fp)
  addi $t1, $fp, -24
  lw $t2, -412($fp)
  add $t0, $t1, $t2
  sw $t0, -416($fp)
  lw $t1, -48($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -420($fp)
  addi $t1, $fp, -44
  lw $t2, -420($fp)
  add $t0, $t1, $t2
  sw $t0, -424($fp)
  lw $t1, -424($fp)
  lw $t0, 0($t1)
  sw $t0, -428($fp)
  lw $t1, -428($fp)
  lw $t0, -416($fp)
  sw $t1, 0($t0)
  lw $t1, -48($fp)
  addi $t0, $t1, 1
  sw $t0, -432($fp)
  lw $t1, -432($fp)
  move $t0, $t1
  sw $t0, -48($fp)
  j label42
label44:
  lw $t1, -68($fp)
  li $t2, 2
  mul $t0, $t1, $t2
  sw $t0, -436($fp)
  lw $t1, -436($fp)
  move $t0, $t1
  sw $t0, -68($fp)
  j label4
label6:
  li $t0, 0
  sw $t0, -48($fp)
label45:
  lw $t1, -48($fp)
  lw $t2, -4($fp)
  blt $t1, $t2, label46
  j label47
label46:
  lw $t1, -48($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -440($fp)
  addi $t1, $fp, -24
  lw $t2, -440($fp)
  add $t0, $t1, $t2
  sw $t0, -444($fp)
  lw $t1, -444($fp)
  lw $t0, 0($t1)
  sw $t0, -448($fp)
  lw $a0, -448($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  lw $t1, -48($fp)
  addi $t0, $t1, 1
  sw $t0, -452($fp)
  lw $t1, -452($fp)
  move $t0, $t1
  sw $t0, -48($fp)
  j label45
label47:
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
