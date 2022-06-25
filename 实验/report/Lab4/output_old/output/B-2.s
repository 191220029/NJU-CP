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
  addi $sp, $sp, -956
  li $t0, 3
  sw $t0, -636($fp)
  li $t0, 100
  sw $t0, -928($fp)
  li $t0, 1
  sw $t0, -532($fp)
  li $t0, 0
  sw $t0, -884($fp)
  li $t0, 0
  sw $t0, -868($fp)
label1:
  lw $t1, -884($fp)
  lw $t2, -636($fp)
  blt $t1, $t2, label2
  j label3
label2:
  lw $t1, -884($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -460($fp)
  addi $t1, $fp, -648
  lw $t2, -460($fp)
  add $t0, $t0, $t2
  sw $t0, -472($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -476($fp)
  lw $t1, -476($fp)
  lw $t0, -472($fp)
  sw $t1, 0($t0)
  lw $t1, -884($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -492($fp)
  addi $t1, $fp, -648
  lw $t2, -492($fp)
  add $t0, $t0, $t2
  sw $t0, -504($fp)
  lw $t1, -504($fp)
  lw $t0, 0($t1)
  sw $t0, -508($fp)
  lw $t1, -508($fp)
  li $t2, 0
  ble $t1, $t2, label4
  j label5
label4:
  li $t0, 0
  sw $t0, -532($fp)
label5:
  lw $t1, -884($fp)
  addi $t0, $t1, 1
  sw $t0, -528($fp)
  lw $t1, -528($fp)
  move $t0, $t1
  sw $t0, -884($fp)
  j label1
label3:
  lw $t1, -532($fp)
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
  li $t1, 0
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -544($fp)
  addi $t1, $fp, -936
  lw $t2, -544($fp)
  add $t0, $t0, $t2
  sw $t0, -552($fp)
  li $t1, 0
  lw $t0, -552($fp)
  sw $t1, 0($t0)
  li $t0, 1
  sw $t0, -884($fp)
label8:
  lw $t1, -928($fp)
  addi $t0, $t1, 1
  sw $t0, -572($fp)
  lw $t1, -884($fp)
  lw $t2, -572($fp)
  blt $t1, $t2, label9
  j label10
label9:
  lw $t1, -884($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -588($fp)
  addi $t1, $fp, -936
  lw $t2, -588($fp)
  add $t0, $t0, $t2
  sw $t0, -604($fp)
  lw $t1, -928($fp)
  addi $t0, $t1, 1
  sw $t0, -608($fp)
  lw $t1, -608($fp)
  lw $t0, -604($fp)
  sw $t1, 0($t0)
  lw $t1, -884($fp)
  addi $t0, $t1, 1
  sw $t0, -624($fp)
  lw $t1, -624($fp)
  move $t0, $t1
  sw $t0, -884($fp)
  j label8
label10:
  li $t0, 0
  sw $t0, -884($fp)
label11:
  lw $t1, -884($fp)
  lw $t2, -636($fp)
  blt $t1, $t2, label12
  j label13
label12:
  lw $t1, -884($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -652($fp)
  addi $t1, $fp, -648
  lw $t2, -652($fp)
  add $t0, $t0, $t2
  sw $t0, -664($fp)
  lw $t1, -664($fp)
  lw $t0, 0($t1)
  sw $t0, -672($fp)
  lw $t1, -672($fp)
  move $t0, $t1
  sw $t0, -808($fp)
  lw $t1, -808($fp)
  move $t0, $t1
  sw $t0, -868($fp)
label14:
  lw $t1, -928($fp)
  addi $t0, $t1, 1
  sw $t0, -696($fp)
  lw $t1, -868($fp)
  lw $t2, -696($fp)
  blt $t1, $t2, label15
  j label16
label15:
  lw $t1, -868($fp)
  lw $t2, -808($fp)
  sub $t0, $t1, $t2
  sw $t0, -712($fp)
  lw $t1, -712($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -724($fp)
  addi $t1, $fp, -936
  lw $t2, -724($fp)
  add $t0, $t0, $t2
  sw $t0, -736($fp)
  lw $t1, -736($fp)
  lw $t0, 0($t1)
  sw $t0, -740($fp)
  lw $t1, -740($fp)
  addi $t0, $t1, 1
  sw $t0, -776($fp)
  lw $t1, -868($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -760($fp)
  addi $t1, $fp, -936
  lw $t2, -760($fp)
  add $t0, $t0, $t2
  sw $t0, -772($fp)
  lw $t1, -772($fp)
  lw $t0, 0($t1)
  sw $t0, -780($fp)
  lw $t1, -776($fp)
  lw $t2, -780($fp)
  blt $t1, $t2, label17
  j label18
label17:
  lw $t1, -868($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -796($fp)
  addi $t1, $fp, -936
  lw $t2, -796($fp)
  add $t0, $t0, $t2
  sw $t0, -852($fp)
  lw $t1, -868($fp)
  lw $t2, -808($fp)
  sub $t0, $t1, $t2
  sw $t0, -816($fp)
  lw $t1, -816($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -828($fp)
  addi $t1, $fp, -936
  lw $t2, -828($fp)
  add $t0, $t0, $t2
  sw $t0, -840($fp)
  lw $t1, -840($fp)
  lw $t0, 0($t1)
  sw $t0, -844($fp)
  lw $t1, -844($fp)
  addi $t0, $t1, 1
  sw $t0, -856($fp)
  lw $t1, -856($fp)
  lw $t0, -852($fp)
  sw $t1, 0($t0)
label18:
  lw $t1, -868($fp)
  addi $t0, $t1, 1
  sw $t0, -872($fp)
  lw $t1, -872($fp)
  move $t0, $t1
  sw $t0, -868($fp)
  j label14
label16:
  lw $t1, -884($fp)
  addi $t0, $t1, 1
  sw $t0, -888($fp)
  lw $t1, -888($fp)
  move $t0, $t1
  sw $t0, -884($fp)
  j label11
label13:
  lw $t1, -928($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -904($fp)
  addi $t1, $fp, -936
  lw $t2, -904($fp)
  add $t0, $t0, $t2
  sw $t0, -916($fp)
  lw $t1, -916($fp)
  lw $t0, 0($t1)
  sw $t0, -920($fp)
  lw $t1, -920($fp)
  lw $t2, -928($fp)
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
  lw $t1, -928($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -940($fp)
  addi $t1, $fp, -936
  lw $t2, -940($fp)
  add $t0, $t0, $t2
  sw $t0, -952($fp)
  lw $t1, -952($fp)
  lw $t0, 0($t1)
  sw $t0, -956($fp)
  lw $a0, -956($fp)
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
