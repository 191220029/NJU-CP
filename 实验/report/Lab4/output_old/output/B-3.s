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
  addi $sp, $sp, -1420
  li $t0, 5
  sw $t0, -1372($fp)
  li $t0, 0
  sw $t0, -1416($fp)
label1:
  lw $t1, -1416($fp)
  lw $t2, -1372($fp)
  blt $t1, $t2, label2
  j label3
label2:
  lw $t1, -1416($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -72($fp)
  addi $t1, $fp, -1384
  lw $t2, -72($fp)
  add $t0, $t0, $t2
  sw $t0, -84($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -88($fp)
  lw $t1, -88($fp)
  lw $t0, -84($fp)
  sw $t1, 0($t0)
  lw $t1, -1416($fp)
  addi $t0, $t1, 1
  sw $t0, -104($fp)
  lw $t1, -104($fp)
  move $t0, $t1
  sw $t0, -1416($fp)
  j label1
label3:
  li $t0, 1
  sw $t0, -1356($fp)
label4:
  lw $t1, -1356($fp)
  lw $t2, -1372($fp)
  blt $t1, $t2, label5
  j label6
label5:
  li $t0, 0
  sw $t0, -1416($fp)
label7:
  li $t1, 2
  lw $t2, -1356($fp)
  mul $t0, $t1, $t2
  sw $t0, -136($fp)
  lw $t1, -1372($fp)
  lw $t2, -136($fp)
  sub $t0, $t1, $t2
  sw $t0, -148($fp)
  lw $t1, -1416($fp)
  lw $t2, -148($fp)
  ble $t1, $t2, label8
  j label9
label8:
  lw $t1, -1416($fp)
  move $t0, $t1
  sw $t0, -708($fp)
  lw $t1, -708($fp)
  lw $t2, -1356($fp)
  add $t0, $t1, $t2
  sw $t0, -176($fp)
  lw $t1, -176($fp)
  move $t0, $t1
  sw $t0, -996($fp)
  lw $t1, -708($fp)
  move $t0, $t1
  sw $t0, -1064($fp)
  lw $t1, -996($fp)
  move $t0, $t1
  sw $t0, -732($fp)
  lw $t1, -732($fp)
  lw $t2, -1356($fp)
  add $t0, $t1, $t2
  sw $t0, -212($fp)
  lw $t1, -212($fp)
  move $t0, $t1
  sw $t0, -1092($fp)
  lw $t1, -732($fp)
  move $t0, $t1
  sw $t0, -1160($fp)
label10:
  lw $t1, -1064($fp)
  lw $t2, -996($fp)
  blt $t1, $t2, label13
  j label12
label13:
  lw $t1, -1160($fp)
  lw $t2, -1092($fp)
  blt $t1, $t2, label11
  j label12
label11:
  lw $t1, -1064($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -252($fp)
  addi $t1, $fp, -1384
  lw $t2, -252($fp)
  add $t0, $t0, $t2
  sw $t0, -264($fp)
  lw $t1, -264($fp)
  lw $t0, 0($t1)
  sw $t0, -296($fp)
  lw $t1, -1160($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -280($fp)
  addi $t1, $fp, -1384
  lw $t2, -280($fp)
  add $t0, $t0, $t2
  sw $t0, -292($fp)
  lw $t1, -292($fp)
  lw $t0, 0($t1)
  sw $t0, -300($fp)
  lw $t1, -296($fp)
  lw $t2, -300($fp)
  blt $t1, $t2, label14
  j label15
label14:
  lw $t1, -1416($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -316($fp)
  addi $t1, $fp, -1304
  lw $t2, -316($fp)
  add $t0, $t0, $t2
  sw $t0, -352($fp)
  lw $t1, -1064($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -336($fp)
  addi $t1, $fp, -1384
  lw $t2, -336($fp)
  add $t0, $t0, $t2
  sw $t0, -348($fp)
  lw $t1, -348($fp)
  lw $t0, 0($t1)
  sw $t0, -356($fp)
  lw $t1, -356($fp)
  lw $t0, -352($fp)
  sw $t1, 0($t0)
  lw $t1, -1064($fp)
  addi $t0, $t1, 1
  sw $t0, -372($fp)
  lw $t1, -372($fp)
  move $t0, $t1
  sw $t0, -1064($fp)
  j label16
label15:
  lw $t1, -1416($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -388($fp)
  addi $t1, $fp, -1304
  lw $t2, -388($fp)
  add $t0, $t0, $t2
  sw $t0, -424($fp)
  lw $t1, -1160($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -408($fp)
  addi $t1, $fp, -1384
  lw $t2, -408($fp)
  add $t0, $t0, $t2
  sw $t0, -420($fp)
  lw $t1, -420($fp)
  lw $t0, 0($t1)
  sw $t0, -428($fp)
  lw $t1, -428($fp)
  lw $t0, -424($fp)
  sw $t1, 0($t0)
  lw $t1, -1160($fp)
  addi $t0, $t1, 1
  sw $t0, -444($fp)
  lw $t1, -444($fp)
  move $t0, $t1
  sw $t0, -1160($fp)
label16:
  lw $t1, -1416($fp)
  addi $t0, $t1, 1
  sw $t0, -460($fp)
  lw $t1, -460($fp)
  move $t0, $t1
  sw $t0, -1416($fp)
  j label10
label12:
label17:
  lw $t1, -1064($fp)
  lw $t2, -996($fp)
  blt $t1, $t2, label18
  j label19
label18:
  lw $t1, -1416($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -484($fp)
  addi $t1, $fp, -1304
  lw $t2, -484($fp)
  add $t0, $t0, $t2
  sw $t0, -520($fp)
  lw $t1, -1064($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -504($fp)
  addi $t1, $fp, -1384
  lw $t2, -504($fp)
  add $t0, $t0, $t2
  sw $t0, -516($fp)
  lw $t1, -516($fp)
  lw $t0, 0($t1)
  sw $t0, -524($fp)
  lw $t1, -524($fp)
  lw $t0, -520($fp)
  sw $t1, 0($t0)
  lw $t1, -1064($fp)
  addi $t0, $t1, 1
  sw $t0, -540($fp)
  lw $t1, -540($fp)
  move $t0, $t1
  sw $t0, -1064($fp)
  lw $t1, -1416($fp)
  addi $t0, $t1, 1
  sw $t0, -556($fp)
  lw $t1, -556($fp)
  move $t0, $t1
  sw $t0, -1416($fp)
  j label17
label19:
label20:
  lw $t1, -1160($fp)
  lw $t2, -1092($fp)
  blt $t1, $t2, label21
  j label22
label21:
  lw $t1, -1416($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -580($fp)
  addi $t1, $fp, -1304
  lw $t2, -580($fp)
  add $t0, $t0, $t2
  sw $t0, -616($fp)
  lw $t1, -1160($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -600($fp)
  addi $t1, $fp, -1384
  lw $t2, -600($fp)
  add $t0, $t0, $t2
  sw $t0, -612($fp)
  lw $t1, -612($fp)
  lw $t0, 0($t1)
  sw $t0, -620($fp)
  lw $t1, -620($fp)
  lw $t0, -616($fp)
  sw $t1, 0($t0)
  lw $t1, -1160($fp)
  addi $t0, $t1, 1
  sw $t0, -636($fp)
  lw $t1, -636($fp)
  move $t0, $t1
  sw $t0, -1160($fp)
  lw $t1, -1416($fp)
  addi $t0, $t1, 1
  sw $t0, -652($fp)
  lw $t1, -652($fp)
  move $t0, $t1
  sw $t0, -1416($fp)
  j label20
label22:
  j label7
label9:
  lw $t1, -1416($fp)
  lw $t2, -1356($fp)
  add $t0, $t1, $t2
  sw $t0, -668($fp)
  lw $t1, -668($fp)
  lw $t2, -1372($fp)
  blt $t1, $t2, label23
  j label24
label23:
  lw $t1, -1416($fp)
  move $t0, $t1
  sw $t0, -708($fp)
  lw $t1, -708($fp)
  lw $t2, -1356($fp)
  add $t0, $t1, $t2
  sw $t0, -700($fp)
  lw $t1, -700($fp)
  move $t0, $t1
  sw $t0, -996($fp)
  lw $t1, -708($fp)
  move $t0, $t1
  sw $t0, -1064($fp)
  lw $t1, -996($fp)
  move $t0, $t1
  sw $t0, -732($fp)
  lw $t1, -1372($fp)
  move $t0, $t1
  sw $t0, -1092($fp)
  lw $t1, -732($fp)
  move $t0, $t1
  sw $t0, -1160($fp)
label26:
  lw $t1, -1064($fp)
  lw $t2, -996($fp)
  blt $t1, $t2, label29
  j label28
label29:
  lw $t1, -1160($fp)
  lw $t2, -1092($fp)
  blt $t1, $t2, label27
  j label28
label27:
  lw $t1, -1064($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -764($fp)
  addi $t1, $fp, -1384
  lw $t2, -764($fp)
  add $t0, $t0, $t2
  sw $t0, -776($fp)
  lw $t1, -776($fp)
  lw $t0, 0($t1)
  sw $t0, -808($fp)
  lw $t1, -1160($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -792($fp)
  addi $t1, $fp, -1384
  lw $t2, -792($fp)
  add $t0, $t0, $t2
  sw $t0, -804($fp)
  lw $t1, -804($fp)
  lw $t0, 0($t1)
  sw $t0, -812($fp)
  lw $t1, -808($fp)
  lw $t2, -812($fp)
  blt $t1, $t2, label30
  j label31
label30:
  lw $t1, -1416($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -828($fp)
  addi $t1, $fp, -1304
  lw $t2, -828($fp)
  add $t0, $t0, $t2
  sw $t0, -864($fp)
  lw $t1, -1064($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -848($fp)
  addi $t1, $fp, -1384
  lw $t2, -848($fp)
  add $t0, $t0, $t2
  sw $t0, -860($fp)
  lw $t1, -860($fp)
  lw $t0, 0($t1)
  sw $t0, -868($fp)
  lw $t1, -868($fp)
  lw $t0, -864($fp)
  sw $t1, 0($t0)
  lw $t1, -1064($fp)
  addi $t0, $t1, 1
  sw $t0, -884($fp)
  lw $t1, -884($fp)
  move $t0, $t1
  sw $t0, -1064($fp)
  lw $t1, -1416($fp)
  addi $t0, $t1, 1
  sw $t0, -900($fp)
  lw $t1, -900($fp)
  move $t0, $t1
  sw $t0, -1416($fp)
  j label32
label31:
  lw $t1, -1416($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -916($fp)
  addi $t1, $fp, -1304
  lw $t2, -916($fp)
  add $t0, $t0, $t2
  sw $t0, -952($fp)
  lw $t1, -1160($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -936($fp)
  addi $t1, $fp, -1384
  lw $t2, -936($fp)
  add $t0, $t0, $t2
  sw $t0, -948($fp)
  lw $t1, -948($fp)
  lw $t0, 0($t1)
  sw $t0, -956($fp)
  lw $t1, -956($fp)
  lw $t0, -952($fp)
  sw $t1, 0($t0)
  lw $t1, -1160($fp)
  addi $t0, $t1, 1
  sw $t0, -972($fp)
  lw $t1, -972($fp)
  move $t0, $t1
  sw $t0, -1160($fp)
  lw $t1, -1416($fp)
  addi $t0, $t1, 1
  sw $t0, -988($fp)
  lw $t1, -988($fp)
  move $t0, $t1
  sw $t0, -1416($fp)
label32:
  j label26
label28:
label33:
  lw $t1, -1064($fp)
  lw $t2, -996($fp)
  blt $t1, $t2, label34
  j label35
label34:
  lw $t1, -1416($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -1012($fp)
  addi $t1, $fp, -1304
  lw $t2, -1012($fp)
  add $t0, $t0, $t2
  sw $t0, -1048($fp)
  lw $t1, -1064($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -1032($fp)
  addi $t1, $fp, -1384
  lw $t2, -1032($fp)
  add $t0, $t0, $t2
  sw $t0, -1044($fp)
  lw $t1, -1044($fp)
  lw $t0, 0($t1)
  sw $t0, -1052($fp)
  lw $t1, -1052($fp)
  lw $t0, -1048($fp)
  sw $t1, 0($t0)
  lw $t1, -1064($fp)
  addi $t0, $t1, 1
  sw $t0, -1068($fp)
  lw $t1, -1068($fp)
  move $t0, $t1
  sw $t0, -1064($fp)
  lw $t1, -1416($fp)
  addi $t0, $t1, 1
  sw $t0, -1084($fp)
  lw $t1, -1084($fp)
  move $t0, $t1
  sw $t0, -1416($fp)
  j label33
label35:
label36:
  lw $t1, -1160($fp)
  lw $t2, -1092($fp)
  blt $t1, $t2, label37
  j label38
label37:
  lw $t1, -1416($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -1108($fp)
  addi $t1, $fp, -1304
  lw $t2, -1108($fp)
  add $t0, $t0, $t2
  sw $t0, -1144($fp)
  lw $t1, -1160($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -1128($fp)
  addi $t1, $fp, -1384
  lw $t2, -1128($fp)
  add $t0, $t0, $t2
  sw $t0, -1140($fp)
  lw $t1, -1140($fp)
  lw $t0, 0($t1)
  sw $t0, -1148($fp)
  lw $t1, -1148($fp)
  lw $t0, -1144($fp)
  sw $t1, 0($t0)
  lw $t1, -1160($fp)
  addi $t0, $t1, 1
  sw $t0, -1164($fp)
  lw $t1, -1164($fp)
  move $t0, $t1
  sw $t0, -1160($fp)
  lw $t1, -1416($fp)
  addi $t0, $t1, 1
  sw $t0, -1180($fp)
  lw $t1, -1180($fp)
  move $t0, $t1
  sw $t0, -1416($fp)
  j label36
label38:
  j label25
label24:
label39:
  lw $t1, -1416($fp)
  lw $t2, -1372($fp)
  blt $t1, $t2, label40
  j label41
label40:
  lw $t1, -1416($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -1204($fp)
  addi $t1, $fp, -1304
  lw $t2, -1204($fp)
  add $t0, $t0, $t2
  sw $t0, -1240($fp)
  lw $t1, -1416($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -1224($fp)
  addi $t1, $fp, -1384
  lw $t2, -1224($fp)
  add $t0, $t0, $t2
  sw $t0, -1236($fp)
  lw $t1, -1236($fp)
  lw $t0, 0($t1)
  sw $t0, -1244($fp)
  lw $t1, -1244($fp)
  lw $t0, -1240($fp)
  sw $t1, 0($t0)
  lw $t1, -1416($fp)
  addi $t0, $t1, 1
  sw $t0, -1260($fp)
  lw $t1, -1260($fp)
  move $t0, $t1
  sw $t0, -1416($fp)
  j label39
label41:
label25:
  li $t0, 0
  sw $t0, -1416($fp)
label42:
  lw $t1, -1416($fp)
  lw $t2, -1372($fp)
  blt $t1, $t2, label43
  j label44
label43:
  lw $t1, -1416($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -1288($fp)
  addi $t1, $fp, -1384
  lw $t2, -1288($fp)
  add $t0, $t0, $t2
  sw $t0, -1324($fp)
  lw $t1, -1416($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -1308($fp)
  addi $t1, $fp, -1304
  lw $t2, -1308($fp)
  add $t0, $t0, $t2
  sw $t0, -1320($fp)
  lw $t1, -1320($fp)
  lw $t0, 0($t1)
  sw $t0, -1328($fp)
  lw $t1, -1328($fp)
  lw $t0, -1324($fp)
  sw $t1, 0($t0)
  lw $t1, -1416($fp)
  addi $t0, $t1, 1
  sw $t0, -1344($fp)
  lw $t1, -1344($fp)
  move $t0, $t1
  sw $t0, -1416($fp)
  j label42
label44:
  lw $t1, -1356($fp)
  li $t2, 2
  mul $t0, $t1, $t2
  sw $t0, -1360($fp)
  lw $t1, -1360($fp)
  move $t0, $t1
  sw $t0, -1356($fp)
  j label4
label6:
  li $t0, 0
  sw $t0, -1416($fp)
label45:
  lw $t1, -1416($fp)
  lw $t2, -1372($fp)
  blt $t1, $t2, label46
  j label47
label46:
  lw $t1, -1416($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -1388($fp)
  addi $t1, $fp, -1384
  lw $t2, -1388($fp)
  add $t0, $t0, $t2
  sw $t0, -1400($fp)
  lw $t1, -1400($fp)
  lw $t0, 0($t1)
  sw $t0, -1404($fp)
  lw $a0, -1404($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  lw $t1, -1416($fp)
  addi $t0, $t1, 1
  sw $t0, -1420($fp)
  lw $t1, -1420($fp)
  move $t0, $t1
  sw $t0, -1416($fp)
  j label45
label47:
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
