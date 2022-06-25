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
  addi $sp, $sp, -780
  li $t0, 0
  sw $t0, -44($fp)
label1:
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -48($fp)
  lw $t1, -48($fp)
  li $t2, 5
  blt $t1, $t2, label2
  j label3
label2:
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -52($fp)
  lw $t1, -52($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -56($fp)
  addi $t0, $fp, -20
  lw $t2, -56($fp)
  add $t0, $t0, $t2
  sw $t0, -60($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -64($fp)
  lw $t0, -60($fp)
  lw $t1, -64($fp)
  sw $t1, 0($t0)
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -68($fp)
  lw $t1, -68($fp)
  addi $t0, $t1, 1
  sw $t0, -72($fp)
  lw $t1, -72($fp)
  move $t0, $t1
  sw $t0, -44($fp)
  j label1
label3:
  li $t0, 1
  sw $t0, -76($fp)
label4:
  lw $t1, -76($fp)
  move $t0, $t1
  sw $t0, -80($fp)
  lw $t1, -80($fp)
  li $t2, 5
  blt $t1, $t2, label5
  j label6
label5:
  li $t0, 0
  sw $t0, -44($fp)
label7:
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -84($fp)
  lw $t1, -76($fp)
  move $t0, $t1
  sw $t0, -88($fp)
  li $t1, 2
  lw $t2, -88($fp)
  mul $t0, $t1, $t2
  sw $t0, -92($fp)
  li $t1, 5
  lw $t2, -92($fp)
  sub $t0, $t1, $t2
  sw $t0, -96($fp)
  lw $t1, -84($fp)
  lw $t2, -96($fp)
  ble $t1, $t2, label8
  j label9
label8:
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -100($fp)
  lw $t1, -100($fp)
  move $t0, $t1
  sw $t0, -104($fp)
  lw $t1, -104($fp)
  move $t0, $t1
  sw $t0, -108($fp)
  lw $t1, -76($fp)
  move $t0, $t1
  sw $t0, -112($fp)
  lw $t1, -108($fp)
  lw $t2, -112($fp)
  add $t0, $t1, $t2
  sw $t0, -116($fp)
  lw $t1, -116($fp)
  move $t0, $t1
  sw $t0, -120($fp)
  lw $t1, -104($fp)
  move $t0, $t1
  sw $t0, -124($fp)
  lw $t1, -124($fp)
  move $t0, $t1
  sw $t0, -128($fp)
  lw $t1, -120($fp)
  move $t0, $t1
  sw $t0, -132($fp)
  lw $t1, -132($fp)
  move $t0, $t1
  sw $t0, -136($fp)
  lw $t1, -136($fp)
  move $t0, $t1
  sw $t0, -140($fp)
  lw $t1, -76($fp)
  move $t0, $t1
  sw $t0, -144($fp)
  lw $t1, -140($fp)
  lw $t2, -144($fp)
  add $t0, $t1, $t2
  sw $t0, -148($fp)
  lw $t1, -148($fp)
  move $t0, $t1
  sw $t0, -152($fp)
  lw $t1, -136($fp)
  move $t0, $t1
  sw $t0, -156($fp)
  lw $t1, -156($fp)
  move $t0, $t1
  sw $t0, -160($fp)
label10:
  lw $t1, -128($fp)
  move $t0, $t1
  sw $t0, -164($fp)
  lw $t1, -120($fp)
  move $t0, $t1
  sw $t0, -168($fp)
  lw $t1, -164($fp)
  lw $t2, -168($fp)
  blt $t1, $t2, label13
  j label12
label13:
  lw $t1, -160($fp)
  move $t0, $t1
  sw $t0, -172($fp)
  lw $t1, -152($fp)
  move $t0, $t1
  sw $t0, -176($fp)
  lw $t1, -172($fp)
  lw $t2, -176($fp)
  blt $t1, $t2, label11
  j label12
label11:
  lw $t1, -128($fp)
  move $t0, $t1
  sw $t0, -180($fp)
  lw $t1, -180($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -184($fp)
  addi $t0, $fp, -20
  lw $t2, -184($fp)
  add $t0, $t0, $t2
  sw $t0, -188($fp)
  lw $t1, -188($fp)
  lw $t0, 0($t1)
  sw $t0, -192($fp)
  lw $t1, -160($fp)
  move $t0, $t1
  sw $t0, -196($fp)
  lw $t1, -196($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -200($fp)
  addi $t0, $fp, -20
  lw $t2, -200($fp)
  add $t0, $t0, $t2
  sw $t0, -204($fp)
  lw $t1, -204($fp)
  lw $t0, 0($t1)
  sw $t0, -208($fp)
  lw $t1, -192($fp)
  lw $t2, -208($fp)
  blt $t1, $t2, label14
  j label15
label14:
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -212($fp)
  lw $t1, -212($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -216($fp)
  addi $t0, $fp, -40
  lw $t2, -216($fp)
  add $t0, $t0, $t2
  sw $t0, -220($fp)
  lw $t1, -128($fp)
  move $t0, $t1
  sw $t0, -224($fp)
  lw $t1, -224($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -228($fp)
  addi $t0, $fp, -20
  lw $t2, -228($fp)
  add $t0, $t0, $t2
  sw $t0, -232($fp)
  lw $t1, -232($fp)
  lw $t0, 0($t1)
  sw $t0, -236($fp)
  lw $t0, -220($fp)
  lw $t1, -236($fp)
  sw $t1, 0($t0)
  lw $t1, -128($fp)
  move $t0, $t1
  sw $t0, -240($fp)
  lw $t1, -240($fp)
  addi $t0, $t1, 1
  sw $t0, -244($fp)
  lw $t1, -244($fp)
  move $t0, $t1
  sw $t0, -128($fp)
  j label16
label15:
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -248($fp)
  lw $t1, -248($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -252($fp)
  addi $t0, $fp, -40
  lw $t2, -252($fp)
  add $t0, $t0, $t2
  sw $t0, -256($fp)
  lw $t1, -160($fp)
  move $t0, $t1
  sw $t0, -260($fp)
  lw $t1, -260($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -264($fp)
  addi $t0, $fp, -20
  lw $t2, -264($fp)
  add $t0, $t0, $t2
  sw $t0, -268($fp)
  lw $t1, -268($fp)
  lw $t0, 0($t1)
  sw $t0, -272($fp)
  lw $t0, -256($fp)
  lw $t1, -272($fp)
  sw $t1, 0($t0)
  lw $t1, -160($fp)
  move $t0, $t1
  sw $t0, -276($fp)
  lw $t1, -276($fp)
  addi $t0, $t1, 1
  sw $t0, -280($fp)
  lw $t1, -280($fp)
  move $t0, $t1
  sw $t0, -160($fp)
label16:
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -284($fp)
  lw $t1, -284($fp)
  addi $t0, $t1, 1
  sw $t0, -288($fp)
  lw $t1, -288($fp)
  move $t0, $t1
  sw $t0, -44($fp)
  j label10
label12:
label17:
  lw $t1, -128($fp)
  move $t0, $t1
  sw $t0, -292($fp)
  lw $t1, -120($fp)
  move $t0, $t1
  sw $t0, -296($fp)
  lw $t1, -292($fp)
  lw $t2, -296($fp)
  blt $t1, $t2, label18
  j label19
label18:
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -300($fp)
  lw $t1, -300($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -304($fp)
  addi $t0, $fp, -40
  lw $t2, -304($fp)
  add $t0, $t0, $t2
  sw $t0, -308($fp)
  lw $t1, -128($fp)
  move $t0, $t1
  sw $t0, -312($fp)
  lw $t1, -312($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -316($fp)
  addi $t0, $fp, -20
  lw $t2, -316($fp)
  add $t0, $t0, $t2
  sw $t0, -320($fp)
  lw $t1, -320($fp)
  lw $t0, 0($t1)
  sw $t0, -324($fp)
  lw $t0, -308($fp)
  lw $t1, -324($fp)
  sw $t1, 0($t0)
  lw $t1, -128($fp)
  move $t0, $t1
  sw $t0, -328($fp)
  lw $t1, -328($fp)
  addi $t0, $t1, 1
  sw $t0, -332($fp)
  lw $t1, -332($fp)
  move $t0, $t1
  sw $t0, -128($fp)
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -336($fp)
  lw $t1, -336($fp)
  addi $t0, $t1, 1
  sw $t0, -340($fp)
  lw $t1, -340($fp)
  move $t0, $t1
  sw $t0, -44($fp)
  j label17
label19:
label20:
  lw $t1, -160($fp)
  move $t0, $t1
  sw $t0, -344($fp)
  lw $t1, -152($fp)
  move $t0, $t1
  sw $t0, -348($fp)
  lw $t1, -344($fp)
  lw $t2, -348($fp)
  blt $t1, $t2, label21
  j label22
label21:
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -352($fp)
  lw $t1, -352($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -356($fp)
  addi $t0, $fp, -40
  lw $t2, -356($fp)
  add $t0, $t0, $t2
  sw $t0, -360($fp)
  lw $t1, -160($fp)
  move $t0, $t1
  sw $t0, -364($fp)
  lw $t1, -364($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -368($fp)
  addi $t0, $fp, -20
  lw $t2, -368($fp)
  add $t0, $t0, $t2
  sw $t0, -372($fp)
  lw $t1, -372($fp)
  lw $t0, 0($t1)
  sw $t0, -376($fp)
  lw $t0, -360($fp)
  lw $t1, -376($fp)
  sw $t1, 0($t0)
  lw $t1, -160($fp)
  move $t0, $t1
  sw $t0, -380($fp)
  lw $t1, -380($fp)
  addi $t0, $t1, 1
  sw $t0, -384($fp)
  lw $t1, -384($fp)
  move $t0, $t1
  sw $t0, -160($fp)
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -388($fp)
  lw $t1, -388($fp)
  addi $t0, $t1, 1
  sw $t0, -392($fp)
  lw $t1, -392($fp)
  move $t0, $t1
  sw $t0, -44($fp)
  j label20
label22:
  j label7
label9:
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -396($fp)
  lw $t1, -76($fp)
  move $t0, $t1
  sw $t0, -400($fp)
  lw $t1, -396($fp)
  lw $t2, -400($fp)
  add $t0, $t1, $t2
  sw $t0, -404($fp)
  lw $t1, -404($fp)
  li $t2, 5
  blt $t1, $t2, label23
  j label24
label23:
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -408($fp)
  lw $t1, -408($fp)
  move $t0, $t1
  sw $t0, -104($fp)
  lw $t1, -104($fp)
  move $t0, $t1
  sw $t0, -412($fp)
  lw $t1, -76($fp)
  move $t0, $t1
  sw $t0, -416($fp)
  lw $t1, -412($fp)
  lw $t2, -416($fp)
  add $t0, $t1, $t2
  sw $t0, -420($fp)
  lw $t1, -420($fp)
  move $t0, $t1
  sw $t0, -120($fp)
  lw $t1, -104($fp)
  move $t0, $t1
  sw $t0, -424($fp)
  lw $t1, -424($fp)
  move $t0, $t1
  sw $t0, -128($fp)
  lw $t1, -120($fp)
  move $t0, $t1
  sw $t0, -428($fp)
  lw $t1, -428($fp)
  move $t0, $t1
  sw $t0, -136($fp)
  lw $t1, -136($fp)
  move $t0, $t1
  sw $t0, -432($fp)
  lw $t1, -432($fp)
  move $t0, $t1
  sw $t0, -160($fp)
label26:
  lw $t1, -128($fp)
  move $t0, $t1
  sw $t0, -436($fp)
  lw $t1, -120($fp)
  move $t0, $t1
  sw $t0, -440($fp)
  lw $t1, -436($fp)
  lw $t2, -440($fp)
  blt $t1, $t2, label29
  j label28
label29:
  lw $t1, -160($fp)
  move $t0, $t1
  sw $t0, -444($fp)
  lw $t1, -444($fp)
  li $t2, 5
  blt $t1, $t2, label27
  j label28
label27:
  lw $t1, -128($fp)
  move $t0, $t1
  sw $t0, -448($fp)
  lw $t1, -448($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -452($fp)
  addi $t0, $fp, -20
  lw $t2, -452($fp)
  add $t0, $t0, $t2
  sw $t0, -456($fp)
  lw $t1, -456($fp)
  lw $t0, 0($t1)
  sw $t0, -460($fp)
  lw $t1, -160($fp)
  move $t0, $t1
  sw $t0, -464($fp)
  lw $t1, -464($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -468($fp)
  addi $t0, $fp, -20
  lw $t2, -468($fp)
  add $t0, $t0, $t2
  sw $t0, -472($fp)
  lw $t1, -472($fp)
  lw $t0, 0($t1)
  sw $t0, -476($fp)
  lw $t1, -460($fp)
  lw $t2, -476($fp)
  blt $t1, $t2, label30
  j label31
label30:
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -480($fp)
  lw $t1, -480($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -484($fp)
  addi $t0, $fp, -40
  lw $t2, -484($fp)
  add $t0, $t0, $t2
  sw $t0, -488($fp)
  lw $t1, -128($fp)
  move $t0, $t1
  sw $t0, -492($fp)
  lw $t1, -492($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -496($fp)
  addi $t0, $fp, -20
  lw $t2, -496($fp)
  add $t0, $t0, $t2
  sw $t0, -500($fp)
  lw $t1, -500($fp)
  lw $t0, 0($t1)
  sw $t0, -504($fp)
  lw $t0, -488($fp)
  lw $t1, -504($fp)
  sw $t1, 0($t0)
  lw $t1, -128($fp)
  move $t0, $t1
  sw $t0, -508($fp)
  lw $t1, -508($fp)
  addi $t0, $t1, 1
  sw $t0, -512($fp)
  lw $t1, -512($fp)
  move $t0, $t1
  sw $t0, -128($fp)
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -516($fp)
  lw $t1, -516($fp)
  addi $t0, $t1, 1
  sw $t0, -520($fp)
  lw $t1, -520($fp)
  move $t0, $t1
  sw $t0, -44($fp)
  j label32
label31:
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -524($fp)
  lw $t1, -524($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -528($fp)
  addi $t0, $fp, -40
  lw $t2, -528($fp)
  add $t0, $t0, $t2
  sw $t0, -532($fp)
  lw $t1, -160($fp)
  move $t0, $t1
  sw $t0, -536($fp)
  lw $t1, -536($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -540($fp)
  addi $t0, $fp, -20
  lw $t2, -540($fp)
  add $t0, $t0, $t2
  sw $t0, -544($fp)
  lw $t1, -544($fp)
  lw $t0, 0($t1)
  sw $t0, -548($fp)
  lw $t0, -532($fp)
  lw $t1, -548($fp)
  sw $t1, 0($t0)
  lw $t1, -160($fp)
  move $t0, $t1
  sw $t0, -552($fp)
  lw $t1, -552($fp)
  addi $t0, $t1, 1
  sw $t0, -556($fp)
  lw $t1, -556($fp)
  move $t0, $t1
  sw $t0, -160($fp)
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -560($fp)
  lw $t1, -560($fp)
  addi $t0, $t1, 1
  sw $t0, -564($fp)
  lw $t1, -564($fp)
  move $t0, $t1
  sw $t0, -44($fp)
label32:
  j label26
label28:
label33:
  lw $t1, -128($fp)
  move $t0, $t1
  sw $t0, -568($fp)
  lw $t1, -120($fp)
  move $t0, $t1
  sw $t0, -572($fp)
  lw $t1, -568($fp)
  lw $t2, -572($fp)
  blt $t1, $t2, label34
  j label35
label34:
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -576($fp)
  lw $t1, -576($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -580($fp)
  addi $t0, $fp, -40
  lw $t2, -580($fp)
  add $t0, $t0, $t2
  sw $t0, -584($fp)
  lw $t1, -128($fp)
  move $t0, $t1
  sw $t0, -588($fp)
  lw $t1, -588($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -592($fp)
  addi $t0, $fp, -20
  lw $t2, -592($fp)
  add $t0, $t0, $t2
  sw $t0, -596($fp)
  lw $t1, -596($fp)
  lw $t0, 0($t1)
  sw $t0, -600($fp)
  lw $t0, -584($fp)
  lw $t1, -600($fp)
  sw $t1, 0($t0)
  lw $t1, -128($fp)
  move $t0, $t1
  sw $t0, -604($fp)
  lw $t1, -604($fp)
  addi $t0, $t1, 1
  sw $t0, -608($fp)
  lw $t1, -608($fp)
  move $t0, $t1
  sw $t0, -128($fp)
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -612($fp)
  lw $t1, -612($fp)
  addi $t0, $t1, 1
  sw $t0, -616($fp)
  lw $t1, -616($fp)
  move $t0, $t1
  sw $t0, -44($fp)
  j label33
label35:
label36:
  lw $t1, -160($fp)
  move $t0, $t1
  sw $t0, -620($fp)
  lw $t1, -620($fp)
  li $t2, 5
  blt $t1, $t2, label37
  j label38
label37:
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -624($fp)
  lw $t1, -624($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -628($fp)
  addi $t0, $fp, -40
  lw $t2, -628($fp)
  add $t0, $t0, $t2
  sw $t0, -632($fp)
  lw $t1, -160($fp)
  move $t0, $t1
  sw $t0, -636($fp)
  lw $t1, -636($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -640($fp)
  addi $t0, $fp, -20
  lw $t2, -640($fp)
  add $t0, $t0, $t2
  sw $t0, -644($fp)
  lw $t1, -644($fp)
  lw $t0, 0($t1)
  sw $t0, -648($fp)
  lw $t0, -632($fp)
  lw $t1, -648($fp)
  sw $t1, 0($t0)
  lw $t1, -160($fp)
  move $t0, $t1
  sw $t0, -652($fp)
  lw $t1, -652($fp)
  addi $t0, $t1, 1
  sw $t0, -656($fp)
  lw $t1, -656($fp)
  move $t0, $t1
  sw $t0, -160($fp)
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -660($fp)
  lw $t1, -660($fp)
  addi $t0, $t1, 1
  sw $t0, -664($fp)
  lw $t1, -664($fp)
  move $t0, $t1
  sw $t0, -44($fp)
  j label36
label38:
  j label25
label24:
label39:
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -668($fp)
  lw $t1, -668($fp)
  li $t2, 5
  blt $t1, $t2, label40
  j label41
label40:
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -672($fp)
  lw $t1, -672($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -676($fp)
  addi $t0, $fp, -40
  lw $t2, -676($fp)
  add $t0, $t0, $t2
  sw $t0, -680($fp)
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -684($fp)
  lw $t1, -684($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -688($fp)
  addi $t0, $fp, -20
  lw $t2, -688($fp)
  add $t0, $t0, $t2
  sw $t0, -692($fp)
  lw $t1, -692($fp)
  lw $t0, 0($t1)
  sw $t0, -696($fp)
  lw $t0, -680($fp)
  lw $t1, -696($fp)
  sw $t1, 0($t0)
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -700($fp)
  lw $t1, -700($fp)
  addi $t0, $t1, 1
  sw $t0, -704($fp)
  lw $t1, -704($fp)
  move $t0, $t1
  sw $t0, -44($fp)
  j label39
label41:
label25:
  li $t0, 0
  sw $t0, -44($fp)
label42:
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -708($fp)
  lw $t1, -708($fp)
  li $t2, 5
  blt $t1, $t2, label43
  j label44
label43:
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -712($fp)
  lw $t1, -712($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -716($fp)
  addi $t0, $fp, -20
  lw $t2, -716($fp)
  add $t0, $t0, $t2
  sw $t0, -720($fp)
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -724($fp)
  lw $t1, -724($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -728($fp)
  addi $t0, $fp, -40
  lw $t2, -728($fp)
  add $t0, $t0, $t2
  sw $t0, -732($fp)
  lw $t1, -732($fp)
  lw $t0, 0($t1)
  sw $t0, -736($fp)
  lw $t0, -720($fp)
  lw $t1, -736($fp)
  sw $t1, 0($t0)
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -740($fp)
  lw $t1, -740($fp)
  addi $t0, $t1, 1
  sw $t0, -744($fp)
  lw $t1, -744($fp)
  move $t0, $t1
  sw $t0, -44($fp)
  j label42
label44:
  lw $t1, -76($fp)
  move $t0, $t1
  sw $t0, -748($fp)
  lw $t1, -748($fp)
  li $t2, 2
  mul $t0, $t1, $t2
  sw $t0, -752($fp)
  lw $t1, -752($fp)
  move $t0, $t1
  sw $t0, -76($fp)
  j label4
label6:
  li $t0, 0
  sw $t0, -44($fp)
label45:
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -756($fp)
  lw $t1, -756($fp)
  li $t2, 5
  blt $t1, $t2, label46
  j label47
label46:
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -760($fp)
  lw $t1, -760($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -764($fp)
  addi $t0, $fp, -20
  lw $t2, -764($fp)
  add $t0, $t0, $t2
  sw $t0, -768($fp)
  lw $t1, -768($fp)
  lw $t0, 0($t1)
  sw $t0, -772($fp)
  lw $a0, -772($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -776($fp)
  lw $t1, -776($fp)
  addi $t0, $t1, 1
  sw $t0, -780($fp)
  lw $t1, -780($fp)
  move $t0, $t1
  sw $t0, -44($fp)
  j label45
label47:
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
