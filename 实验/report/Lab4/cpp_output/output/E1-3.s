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

_cal_bmi:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -40
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t1, -4($fp)
  addi $t0, $t1, 16
  sw $t0, -8($fp)
  lw $t1, -4($fp)
  addi $t0, $t1, 12
  sw $t0, -12($fp)
  lw $t1, -12($fp)
  lw $t0, 0($t1)
  sw $t0, -16($fp)
  lw $t1, -4($fp)
  addi $t0, $t1, 8
  sw $t0, -20($fp)
  lw $t1, -20($fp)
  lw $t0, 0($t1)
  sw $t0, -24($fp)
  lw $t1, -4($fp)
  addi $t0, $t1, 8
  sw $t0, -28($fp)
  lw $t1, -28($fp)
  lw $t0, 0($t1)
  sw $t0, -32($fp)
  lw $t1, -24($fp)
  lw $t2, -32($fp)
  mul $t0, $t1, $t2
  sw $t0, -36($fp)
  lw $t1, -16($fp)
  lw $t2, -36($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -40($fp)
  lw $t0, -8($fp)
  lw $t1, -40($fp)
  sw $t1, 0($t0)
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

_cal_avg_bmi:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -88
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  li $t0, 0
  sw $t0, -8($fp)
  li $t0, 0
  sw $t0, -12($fp)
label1:
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -16($fp)
  lw $t1, -16($fp)
  li $t2, 5
  blt $t1, $t2, label2
  j label3
label2:
  lw $t1, -4($fp)
  addi $t0, $t1, 0
  sw $t0, -20($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -24($fp)
  lw $t1, -24($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -28($fp)
  lw $t1, -20($fp)
  lw $t2, -28($fp)
  add $t0, $t1, $t2
  sw $t0, -32($fp)
  addi $sp, $sp, -4
  lw $t0, -32($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _cal_bmi
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -36($fp)
  addi $sp, $sp, 4
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -40($fp)
  lw $t1, -4($fp)
  addi $t0, $t1, 0
  sw $t0, -44($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -48($fp)
  lw $t1, -48($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -52($fp)
  lw $t1, -44($fp)
  lw $t2, -52($fp)
  add $t0, $t1, $t2
  sw $t0, -56($fp)
  lw $t1, -56($fp)
  addi $t0, $t1, 16
  sw $t0, -60($fp)
  lw $t1, -60($fp)
  lw $t0, 0($t1)
  sw $t0, -64($fp)
  lw $t1, -40($fp)
  lw $t2, -64($fp)
  add $t0, $t1, $t2
  sw $t0, -68($fp)
  lw $t1, -68($fp)
  move $t0, $t1
  sw $t0, -12($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -72($fp)
  lw $t1, -72($fp)
  addi $t0, $t1, 1
  sw $t0, -76($fp)
  lw $t1, -76($fp)
  move $t0, $t1
  sw $t0, -8($fp)
  j label1
label3:
  lw $t1, -4($fp)
  addi $t0, $t1, 100
  sw $t0, -80($fp)
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -84($fp)
  lw $t1, -84($fp)
  li $t2, 5
  div $t1, $t2
  mflo $t0
  sw $t0, -88($fp)
  lw $t0, -80($fp)
  lw $t1, -88($fp)
  sw $t1, 0($t0)
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

main:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -1348
  li $t0, 0
  sw $t0, -1044($fp)
label4:
  lw $t1, -1044($fp)
  move $t0, $t1
  sw $t0, -1048($fp)
  lw $t1, -1048($fp)
  li $t2, 10
  blt $t1, $t2, label5
  j label6
label5:
  li $t0, 0
  sw $t0, -1052($fp)
label7:
  lw $t1, -1052($fp)
  move $t0, $t1
  sw $t0, -1056($fp)
  lw $t1, -1056($fp)
  li $t2, 5
  blt $t1, $t2, label8
  j label9
label8:
  lw $t1, -1044($fp)
  move $t0, $t1
  sw $t0, -1060($fp)
  lw $t1, -1060($fp)
  li $t2, 104
  mul $t0, $t1, $t2
  sw $t0, -1064($fp)
  addi $t0, $fp, -1040
  lw $t2, -1064($fp)
  add $t0, $t0, $t2
  sw $t0, -1068($fp)
  lw $t1, -1068($fp)
  addi $t0, $t1, 0
  sw $t0, -1072($fp)
  lw $t1, -1052($fp)
  move $t0, $t1
  sw $t0, -1076($fp)
  lw $t1, -1076($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -1080($fp)
  lw $t1, -1072($fp)
  lw $t2, -1080($fp)
  add $t0, $t1, $t2
  sw $t0, -1084($fp)
  lw $t1, -1084($fp)
  addi $t0, $t1, 0
  sw $t0, -1088($fp)
  lw $t1, -1044($fp)
  move $t0, $t1
  sw $t0, -1092($fp)
  lw $t1, -1092($fp)
  li $t2, 2
  div $t1, $t2
  mflo $t0
  sw $t0, -1096($fp)
  lw $t1, -1052($fp)
  move $t0, $t1
  sw $t0, -1100($fp)
  lw $t1, -1096($fp)
  lw $t2, -1100($fp)
  add $t0, $t1, $t2
  sw $t0, -1104($fp)
  lw $t0, -1088($fp)
  lw $t1, -1104($fp)
  sw $t1, 0($t0)
  lw $t1, -1044($fp)
  move $t0, $t1
  sw $t0, -1108($fp)
  lw $t1, -1108($fp)
  li $t2, 104
  mul $t0, $t1, $t2
  sw $t0, -1112($fp)
  addi $t0, $fp, -1040
  lw $t2, -1112($fp)
  add $t0, $t0, $t2
  sw $t0, -1116($fp)
  lw $t1, -1116($fp)
  addi $t0, $t1, 0
  sw $t0, -1120($fp)
  lw $t1, -1052($fp)
  move $t0, $t1
  sw $t0, -1124($fp)
  lw $t1, -1124($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -1128($fp)
  lw $t1, -1120($fp)
  lw $t2, -1128($fp)
  add $t0, $t1, $t2
  sw $t0, -1132($fp)
  lw $t1, -1132($fp)
  addi $t0, $t1, 4
  sw $t0, -1136($fp)
  lw $t1, -1044($fp)
  move $t0, $t1
  sw $t0, -1140($fp)
  lw $t1, -1140($fp)
  li $t2, 2
  div $t1, $t2
  mflo $t0
  sw $t0, -1144($fp)
  lw $t1, -1144($fp)
  addi $t0, $t1, 20
  sw $t0, -1148($fp)
  lw $t1, -1052($fp)
  move $t0, $t1
  sw $t0, -1152($fp)
  lw $t1, -1148($fp)
  lw $t2, -1152($fp)
  add $t0, $t1, $t2
  sw $t0, -1156($fp)
  lw $t0, -1136($fp)
  lw $t1, -1156($fp)
  sw $t1, 0($t0)
  lw $t1, -1044($fp)
  move $t0, $t1
  sw $t0, -1160($fp)
  lw $t1, -1160($fp)
  li $t2, 104
  mul $t0, $t1, $t2
  sw $t0, -1164($fp)
  addi $t0, $fp, -1040
  lw $t2, -1164($fp)
  add $t0, $t0, $t2
  sw $t0, -1168($fp)
  lw $t1, -1168($fp)
  addi $t0, $t1, 0
  sw $t0, -1172($fp)
  lw $t1, -1052($fp)
  move $t0, $t1
  sw $t0, -1176($fp)
  lw $t1, -1176($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -1180($fp)
  lw $t1, -1172($fp)
  lw $t2, -1180($fp)
  add $t0, $t1, $t2
  sw $t0, -1184($fp)
  lw $t1, -1184($fp)
  addi $t0, $t1, 8
  sw $t0, -1188($fp)
  lw $t1, -1044($fp)
  move $t0, $t1
  sw $t0, -1192($fp)
  lw $t1, -1192($fp)
  li $t2, 2
  div $t1, $t2
  mflo $t0
  sw $t0, -1196($fp)
  lw $t1, -1196($fp)
  addi $t0, $t1, 2
  sw $t0, -1200($fp)
  lw $t1, -1052($fp)
  move $t0, $t1
  sw $t0, -1204($fp)
  lw $t1, -1200($fp)
  lw $t2, -1204($fp)
  add $t0, $t1, $t2
  sw $t0, -1208($fp)
  lw $t0, -1188($fp)
  lw $t1, -1208($fp)
  sw $t1, 0($t0)
  lw $t1, -1044($fp)
  move $t0, $t1
  sw $t0, -1212($fp)
  lw $t1, -1212($fp)
  li $t2, 104
  mul $t0, $t1, $t2
  sw $t0, -1216($fp)
  addi $t0, $fp, -1040
  lw $t2, -1216($fp)
  add $t0, $t0, $t2
  sw $t0, -1220($fp)
  lw $t1, -1220($fp)
  addi $t0, $t1, 0
  sw $t0, -1224($fp)
  lw $t1, -1052($fp)
  move $t0, $t1
  sw $t0, -1228($fp)
  lw $t1, -1228($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -1232($fp)
  lw $t1, -1224($fp)
  lw $t2, -1232($fp)
  add $t0, $t1, $t2
  sw $t0, -1236($fp)
  lw $t1, -1236($fp)
  addi $t0, $t1, 12
  sw $t0, -1240($fp)
  lw $t1, -1044($fp)
  move $t0, $t1
  sw $t0, -1244($fp)
  lw $t1, -1244($fp)
  li $t2, 2
  div $t1, $t2
  mflo $t0
  sw $t0, -1248($fp)
  lw $t1, -1248($fp)
  addi $t0, $t1, 90
  sw $t0, -1252($fp)
  lw $t1, -1052($fp)
  move $t0, $t1
  sw $t0, -1256($fp)
  lw $t1, -1052($fp)
  move $t0, $t1
  sw $t0, -1260($fp)
  lw $t1, -1256($fp)
  lw $t2, -1260($fp)
  mul $t0, $t1, $t2
  sw $t0, -1264($fp)
  lw $t1, -1052($fp)
  move $t0, $t1
  sw $t0, -1268($fp)
  lw $t1, -1264($fp)
  lw $t2, -1268($fp)
  mul $t0, $t1, $t2
  sw $t0, -1272($fp)
  lw $t1, -1052($fp)
  move $t0, $t1
  sw $t0, -1276($fp)
  lw $t1, -1272($fp)
  lw $t2, -1276($fp)
  mul $t0, $t1, $t2
  sw $t0, -1280($fp)
  lw $t1, -1252($fp)
  lw $t2, -1280($fp)
  add $t0, $t1, $t2
  sw $t0, -1284($fp)
  lw $t0, -1240($fp)
  lw $t1, -1284($fp)
  sw $t1, 0($t0)
  lw $t1, -1052($fp)
  move $t0, $t1
  sw $t0, -1288($fp)
  lw $t1, -1288($fp)
  addi $t0, $t1, 1
  sw $t0, -1292($fp)
  lw $t1, -1292($fp)
  move $t0, $t1
  sw $t0, -1052($fp)
  j label7
label9:
  lw $t1, -1044($fp)
  move $t0, $t1
  sw $t0, -1296($fp)
  lw $t1, -1296($fp)
  li $t2, 104
  mul $t0, $t1, $t2
  sw $t0, -1300($fp)
  addi $t0, $fp, -1040
  lw $t2, -1300($fp)
  add $t0, $t0, $t2
  sw $t0, -1304($fp)
  addi $sp, $sp, -4
  lw $t0, -1304($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _cal_avg_bmi
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -1308($fp)
  addi $sp, $sp, 4
  lw $t1, -1044($fp)
  move $t0, $t1
  sw $t0, -1312($fp)
  lw $t1, -1312($fp)
  addi $t0, $t1, 1
  sw $t0, -1316($fp)
  lw $t1, -1316($fp)
  move $t0, $t1
  sw $t0, -1044($fp)
  j label4
label6:
  li $t0, 0
  sw $t0, -1044($fp)
label10:
  lw $t1, -1044($fp)
  move $t0, $t1
  sw $t0, -1320($fp)
  lw $t1, -1320($fp)
  li $t2, 10
  blt $t1, $t2, label11
  j label12
label11:
  lw $t1, -1044($fp)
  move $t0, $t1
  sw $t0, -1324($fp)
  lw $t1, -1324($fp)
  li $t2, 104
  mul $t0, $t1, $t2
  sw $t0, -1328($fp)
  addi $t0, $fp, -1040
  lw $t2, -1328($fp)
  add $t0, $t0, $t2
  sw $t0, -1332($fp)
  lw $t1, -1332($fp)
  addi $t0, $t1, 100
  sw $t0, -1336($fp)
  lw $t1, -1336($fp)
  lw $t0, 0($t1)
  sw $t0, -1340($fp)
  lw $a0, -1340($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  lw $t1, -1044($fp)
  move $t0, $t1
  sw $t0, -1344($fp)
  lw $t1, -1344($fp)
  addi $t0, $t1, 1
  sw $t0, -1348($fp)
  lw $t1, -1348($fp)
  move $t0, $t1
  sw $t0, -1044($fp)
  j label10
label12:
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
