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
  addi $sp, $sp, -660
  li $t0, 1
  sw $t0, -420($fp)
  li $t0, 0
  sw $t0, -424($fp)
label1:
  lw $t1, -424($fp)
  move $t0, $t1
  sw $t0, -428($fp)
  lw $t1, -428($fp)
  li $t2, 3
  blt $t1, $t2, label2
  j label3
label2:
  lw $t1, -424($fp)
  move $t0, $t1
  sw $t0, -432($fp)
  lw $t1, -432($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -436($fp)
  addi $t0, $fp, -12
  lw $t2, -436($fp)
  add $t0, $t0, $t2
  sw $t0, -440($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -444($fp)
  lw $t0, -440($fp)
  lw $t1, -444($fp)
  sw $t1, 0($t0)
  lw $t1, -424($fp)
  move $t0, $t1
  sw $t0, -448($fp)
  lw $t1, -448($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -452($fp)
  addi $t0, $fp, -12
  lw $t2, -452($fp)
  add $t0, $t0, $t2
  sw $t0, -456($fp)
  lw $t1, -456($fp)
  lw $t0, 0($t1)
  sw $t0, -460($fp)
  lw $t1, -460($fp)
  li $t2, 0
  ble $t1, $t2, label4
  j label5
label4:
  li $t0, 0
  sw $t0, -420($fp)
label5:
  lw $t1, -424($fp)
  move $t0, $t1
  sw $t0, -464($fp)
  lw $t1, -464($fp)
  addi $t0, $t1, 1
  sw $t0, -468($fp)
  lw $t1, -468($fp)
  move $t0, $t1
  sw $t0, -424($fp)
  j label1
label3:
  lw $t1, -420($fp)
  move $t0, $t1
  sw $t0, -472($fp)
  lw $t1, -472($fp)
  li $t2, 0
  beq $t1, $t2, label6
  j label7
label6:
  li $a0, -1
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
label7:
  addi $t0, $fp, -416
  sw $t0, -476($fp)
  li $t0, 0
  sw $t0, -480($fp)
  lw $t0, -476($fp)
  lw $t1, -480($fp)
  sw $t1, 0($t0)
  li $t0, 1
  sw $t0, -424($fp)
label8:
  lw $t1, -424($fp)
  move $t0, $t1
  sw $t0, -484($fp)
  lw $t1, -484($fp)
  li $t2, 101
  blt $t1, $t2, label9
  j label10
label9:
  lw $t1, -424($fp)
  move $t0, $t1
  sw $t0, -488($fp)
  lw $t1, -488($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -492($fp)
  addi $t0, $fp, -416
  lw $t2, -492($fp)
  add $t0, $t0, $t2
  sw $t0, -496($fp)
  li $t0, 101
  sw $t0, -500($fp)
  lw $t0, -496($fp)
  lw $t1, -500($fp)
  sw $t1, 0($t0)
  lw $t1, -424($fp)
  move $t0, $t1
  sw $t0, -504($fp)
  lw $t1, -504($fp)
  addi $t0, $t1, 1
  sw $t0, -508($fp)
  lw $t1, -508($fp)
  move $t0, $t1
  sw $t0, -424($fp)
  j label8
label10:
  li $t0, 0
  sw $t0, -424($fp)
label11:
  lw $t1, -424($fp)
  move $t0, $t1
  sw $t0, -512($fp)
  lw $t1, -512($fp)
  li $t2, 3
  blt $t1, $t2, label12
  j label13
label12:
  lw $t1, -424($fp)
  move $t0, $t1
  sw $t0, -516($fp)
  lw $t1, -516($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -520($fp)
  addi $t0, $fp, -12
  lw $t2, -520($fp)
  add $t0, $t0, $t2
  sw $t0, -524($fp)
  lw $t1, -524($fp)
  lw $t0, 0($t1)
  sw $t0, -528($fp)
  lw $t1, -528($fp)
  move $t0, $t1
  sw $t0, -532($fp)
  lw $t1, -532($fp)
  move $t0, $t1
  sw $t0, -536($fp)
  lw $t1, -536($fp)
  move $t0, $t1
  sw $t0, -540($fp)
label14:
  lw $t1, -540($fp)
  move $t0, $t1
  sw $t0, -544($fp)
  lw $t1, -544($fp)
  li $t2, 101
  blt $t1, $t2, label15
  j label16
label15:
  lw $t1, -540($fp)
  move $t0, $t1
  sw $t0, -548($fp)
  lw $t1, -532($fp)
  move $t0, $t1
  sw $t0, -552($fp)
  lw $t1, -548($fp)
  lw $t2, -552($fp)
  sub $t0, $t1, $t2
  sw $t0, -556($fp)
  lw $t1, -556($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -560($fp)
  addi $t0, $fp, -416
  lw $t2, -560($fp)
  add $t0, $t0, $t2
  sw $t0, -564($fp)
  lw $t1, -564($fp)
  lw $t0, 0($t1)
  sw $t0, -568($fp)
  lw $t1, -568($fp)
  addi $t0, $t1, 1
  sw $t0, -572($fp)
  lw $t1, -540($fp)
  move $t0, $t1
  sw $t0, -576($fp)
  lw $t1, -576($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -580($fp)
  addi $t0, $fp, -416
  lw $t2, -580($fp)
  add $t0, $t0, $t2
  sw $t0, -584($fp)
  lw $t1, -584($fp)
  lw $t0, 0($t1)
  sw $t0, -588($fp)
  lw $t1, -572($fp)
  lw $t2, -588($fp)
  blt $t1, $t2, label17
  j label18
label17:
  lw $t1, -540($fp)
  move $t0, $t1
  sw $t0, -592($fp)
  lw $t1, -592($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -596($fp)
  addi $t0, $fp, -416
  lw $t2, -596($fp)
  add $t0, $t0, $t2
  sw $t0, -600($fp)
  lw $t1, -540($fp)
  move $t0, $t1
  sw $t0, -604($fp)
  lw $t1, -532($fp)
  move $t0, $t1
  sw $t0, -608($fp)
  lw $t1, -604($fp)
  lw $t2, -608($fp)
  sub $t0, $t1, $t2
  sw $t0, -612($fp)
  lw $t1, -612($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -616($fp)
  addi $t0, $fp, -416
  lw $t2, -616($fp)
  add $t0, $t0, $t2
  sw $t0, -620($fp)
  lw $t1, -620($fp)
  lw $t0, 0($t1)
  sw $t0, -624($fp)
  lw $t1, -624($fp)
  addi $t0, $t1, 1
  sw $t0, -628($fp)
  lw $t0, -600($fp)
  lw $t1, -628($fp)
  sw $t1, 0($t0)
label18:
  lw $t1, -540($fp)
  move $t0, $t1
  sw $t0, -632($fp)
  lw $t1, -632($fp)
  addi $t0, $t1, 1
  sw $t0, -636($fp)
  lw $t1, -636($fp)
  move $t0, $t1
  sw $t0, -540($fp)
  j label14
label16:
  lw $t1, -424($fp)
  move $t0, $t1
  sw $t0, -640($fp)
  lw $t1, -640($fp)
  addi $t0, $t1, 1
  sw $t0, -644($fp)
  lw $t1, -644($fp)
  move $t0, $t1
  sw $t0, -424($fp)
  j label11
label13:
  addi $t0, $fp, -16
  sw $t0, -648($fp)
  lw $t1, -648($fp)
  lw $t0, 0($t1)
  sw $t0, -652($fp)
  lw $t1, -652($fp)
  li $t2, 100
  bgt $t1, $t2, label19
  j label20
label19:
  li $a0, -1
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  j label21
label20:
  addi $t0, $fp, -16
  sw $t0, -656($fp)
  lw $t1, -656($fp)
  lw $t0, 0($t1)
  sw $t0, -660($fp)
  lw $a0, -660($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
label21:
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
