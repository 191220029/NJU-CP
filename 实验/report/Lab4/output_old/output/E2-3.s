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

func_merge:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -792
  lw $t0, 8($fp)
  sw $t0, -716($fp)
  lw $t0, 12($fp)
  sw $t0, -360($fp)
  lw $t0, 16($fp)
  sw $t0, -276($fp)
  lw $t0, 20($fp)
  sw $t0, -128($fp)
  lw $t1, -360($fp)
  addi $t0, $t1, -1
  sw $t0, -112($fp)
  lw $t1, -276($fp)
  lw $t2, -112($fp)
  sub $t0, $t1, $t2
  sw $t0, -124($fp)
  lw $t1, -124($fp)
  move $t0, $t1
  sw $t0, -608($fp)
  lw $t1, -128($fp)
  lw $t2, -276($fp)
  sub $t0, $t1, $t2
  sw $t0, -144($fp)
  lw $t1, -144($fp)
  move $t0, $t1
  sw $t0, -704($fp)
  li $t0, 0
  sw $t0, -676($fp)
label1:
  lw $t1, -676($fp)
  lw $t2, -608($fp)
  blt $t1, $t2, label2
  j label3
label2:
  lw $t1, -676($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -172($fp)
  addi $t1, $fp, -640
  lw $t2, -172($fp)
  add $t0, $t0, $t2
  sw $t0, -220($fp)
  lw $t1, -360($fp)
  lw $t2, -676($fp)
  add $t0, $t1, $t2
  sw $t0, -192($fp)
  lw $t1, -192($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -204($fp)
  lw $t1, -716($fp)
  lw $t2, -204($fp)
  add $t0, $t1, $t2
  sw $t0, -216($fp)
  lw $t1, -216($fp)
  lw $t0, 0($t1)
  sw $t0, -224($fp)
  lw $t1, -224($fp)
  lw $t0, -220($fp)
  sw $t1, 0($t0)
  lw $t1, -676($fp)
  addi $t0, $t1, 1
  sw $t0, -240($fp)
  lw $t1, -240($fp)
  move $t0, $t1
  sw $t0, -676($fp)
  j label1
label3:
  li $t0, 0
  sw $t0, -772($fp)
label4:
  lw $t1, -772($fp)
  lw $t2, -704($fp)
  blt $t1, $t2, label5
  j label6
label5:
  lw $t1, -772($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -268($fp)
  addi $t1, $fp, -736
  lw $t2, -268($fp)
  add $t0, $t0, $t2
  sw $t0, -324($fp)
  lw $t1, -276($fp)
  addi $t0, $t1, 1
  sw $t0, -284($fp)
  lw $t1, -284($fp)
  lw $t2, -772($fp)
  add $t0, $t1, $t2
  sw $t0, -296($fp)
  lw $t1, -296($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -308($fp)
  lw $t1, -716($fp)
  lw $t2, -308($fp)
  add $t0, $t1, $t2
  sw $t0, -320($fp)
  lw $t1, -320($fp)
  lw $t0, 0($t1)
  sw $t0, -328($fp)
  lw $t1, -328($fp)
  lw $t0, -324($fp)
  sw $t1, 0($t0)
  lw $t1, -772($fp)
  addi $t0, $t1, 1
  sw $t0, -344($fp)
  lw $t1, -344($fp)
  move $t0, $t1
  sw $t0, -772($fp)
  j label4
label6:
  li $t0, 0
  sw $t0, -676($fp)
  li $t0, 0
  sw $t0, -772($fp)
  lw $t1, -360($fp)
  move $t0, $t1
  sw $t0, -788($fp)
label7:
  lw $t1, -676($fp)
  lw $t2, -608($fp)
  blt $t1, $t2, label10
  j label9
label10:
  lw $t1, -772($fp)
  lw $t2, -704($fp)
  blt $t1, $t2, label8
  j label9
label8:
  lw $t1, -676($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -392($fp)
  addi $t1, $fp, -640
  lw $t2, -392($fp)
  add $t0, $t0, $t2
  sw $t0, -404($fp)
  lw $t1, -404($fp)
  lw $t0, 0($t1)
  sw $t0, -436($fp)
  lw $t1, -772($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -420($fp)
  addi $t1, $fp, -736
  lw $t2, -420($fp)
  add $t0, $t0, $t2
  sw $t0, -432($fp)
  lw $t1, -432($fp)
  lw $t0, 0($t1)
  sw $t0, -440($fp)
  lw $t1, -436($fp)
  lw $t2, -440($fp)
  ble $t1, $t2, label11
  j label12
label11:
  lw $t1, -788($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -456($fp)
  lw $t1, -716($fp)
  lw $t2, -456($fp)
  add $t0, $t1, $t2
  sw $t0, -492($fp)
  lw $t1, -676($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -476($fp)
  addi $t1, $fp, -640
  lw $t2, -476($fp)
  add $t0, $t0, $t2
  sw $t0, -488($fp)
  lw $t1, -488($fp)
  lw $t0, 0($t1)
  sw $t0, -496($fp)
  lw $t1, -496($fp)
  lw $t0, -492($fp)
  sw $t1, 0($t0)
  lw $t1, -676($fp)
  addi $t0, $t1, 1
  sw $t0, -512($fp)
  lw $t1, -512($fp)
  move $t0, $t1
  sw $t0, -676($fp)
  j label13
label12:
  lw $t1, -788($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -528($fp)
  lw $t1, -716($fp)
  lw $t2, -528($fp)
  add $t0, $t1, $t2
  sw $t0, -564($fp)
  lw $t1, -772($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -548($fp)
  addi $t1, $fp, -736
  lw $t2, -548($fp)
  add $t0, $t0, $t2
  sw $t0, -560($fp)
  lw $t1, -560($fp)
  lw $t0, 0($t1)
  sw $t0, -568($fp)
  lw $t1, -568($fp)
  lw $t0, -564($fp)
  sw $t1, 0($t0)
  lw $t1, -772($fp)
  addi $t0, $t1, 1
  sw $t0, -584($fp)
  lw $t1, -584($fp)
  move $t0, $t1
  sw $t0, -772($fp)
label13:
  lw $t1, -788($fp)
  addi $t0, $t1, 1
  sw $t0, -600($fp)
  lw $t1, -600($fp)
  move $t0, $t1
  sw $t0, -788($fp)
  j label7
label9:
label14:
  lw $t1, -676($fp)
  lw $t2, -608($fp)
  blt $t1, $t2, label15
  j label16
label15:
  lw $t1, -788($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -624($fp)
  lw $t1, -716($fp)
  lw $t2, -624($fp)
  add $t0, $t1, $t2
  sw $t0, -660($fp)
  lw $t1, -676($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -644($fp)
  addi $t1, $fp, -640
  lw $t2, -644($fp)
  add $t0, $t0, $t2
  sw $t0, -656($fp)
  lw $t1, -656($fp)
  lw $t0, 0($t1)
  sw $t0, -664($fp)
  lw $t1, -664($fp)
  lw $t0, -660($fp)
  sw $t1, 0($t0)
  lw $t1, -676($fp)
  addi $t0, $t1, 1
  sw $t0, -680($fp)
  lw $t1, -680($fp)
  move $t0, $t1
  sw $t0, -676($fp)
  lw $t1, -788($fp)
  addi $t0, $t1, 1
  sw $t0, -696($fp)
  lw $t1, -696($fp)
  move $t0, $t1
  sw $t0, -788($fp)
  j label14
label16:
label17:
  lw $t1, -772($fp)
  lw $t2, -704($fp)
  blt $t1, $t2, label18
  j label19
label18:
  lw $t1, -788($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -720($fp)
  lw $t1, -716($fp)
  lw $t2, -720($fp)
  add $t0, $t1, $t2
  sw $t0, -756($fp)
  lw $t1, -772($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -740($fp)
  addi $t1, $fp, -736
  lw $t2, -740($fp)
  add $t0, $t0, $t2
  sw $t0, -752($fp)
  lw $t1, -752($fp)
  lw $t0, 0($t1)
  sw $t0, -760($fp)
  lw $t1, -760($fp)
  lw $t0, -756($fp)
  sw $t1, 0($t0)
  lw $t1, -772($fp)
  addi $t0, $t1, 1
  sw $t0, -776($fp)
  lw $t1, -776($fp)
  move $t0, $t1
  sw $t0, -772($fp)
  lw $t1, -788($fp)
  addi $t0, $t1, 1
  sw $t0, -792($fp)
  lw $t1, -792($fp)
  move $t0, $t1
  sw $t0, -788($fp)
  j label17
label19:
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

func_merge_sort:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -124
  lw $t0, 8($fp)
  sw $t0, -120($fp)
  lw $t0, 12($fp)
  sw $t0, -116($fp)
  lw $t0, 16($fp)
  sw $t0, -108($fp)
  li $t0, 0
  sw $t0, -112($fp)
  lw $t1, -116($fp)
  lw $t2, -108($fp)
  bge $t1, $t2, label20
  j label21
label20:
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
label21:
  lw $t1, -108($fp)
  lw $t2, -116($fp)
  sub $t0, $t1, $t2
  sw $t0, -40($fp)
  lw $t1, -40($fp)
  li $t2, 2
  div $t1, $t2
  mflo $t0
  sw $t0, -52($fp)
  lw $t1, -116($fp)
  lw $t2, -52($fp)
  add $t0, $t1, $t2
  sw $t0, -64($fp)
  lw $t1, -64($fp)
  move $t0, $t1
  sw $t0, -112($fp)
  addi $sp, $sp, -4
  lw $t0, -112($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -116($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -120($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_merge_sort
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -80($fp)
  addi $sp, $sp, 12
  lw $t1, -112($fp)
  addi $t0, $t1, 1
  sw $t0, -96($fp)
  addi $sp, $sp, -4
  lw $t0, -108($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -96($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -120($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_merge_sort
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -104($fp)
  addi $sp, $sp, 12
  addi $sp, $sp, -4
  lw $t0, -108($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -112($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -116($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -120($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_merge
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -124($fp)
  addi $sp, $sp, 16
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

main:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -168
  li $t0, 6
  sw $t0, -120($fp)
  li $t0, 0
  sw $t0, -164($fp)
label22:
  lw $t1, -164($fp)
  lw $t2, -120($fp)
  blt $t1, $t2, label23
  j label24
label23:
  lw $t1, -164($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -56($fp)
  addi $t1, $fp, -132
  lw $t2, -56($fp)
  add $t0, $t0, $t2
  sw $t0, -68($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -72($fp)
  lw $t1, -72($fp)
  lw $t0, -68($fp)
  sw $t1, 0($t0)
  lw $t1, -164($fp)
  addi $t0, $t1, 1
  sw $t0, -88($fp)
  lw $t1, -88($fp)
  move $t0, $t1
  sw $t0, -164($fp)
  j label22
label24:
  lw $t1, -120($fp)
  addi $t0, $t1, -1
  sw $t0, -100($fp)
  addi $sp, $sp, -4
  lw $t0, -100($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  li $t0, 0
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -132($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_merge_sort
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -108($fp)
  addi $sp, $sp, 12
  li $t0, 0
  sw $t0, -164($fp)
label25:
  lw $t1, -164($fp)
  lw $t2, -120($fp)
  blt $t1, $t2, label26
  j label27
label26:
  lw $t1, -164($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -136($fp)
  addi $t1, $fp, -132
  lw $t2, -136($fp)
  add $t0, $t0, $t2
  sw $t0, -148($fp)
  lw $t1, -148($fp)
  lw $t0, 0($t1)
  sw $t0, -152($fp)
  lw $a0, -152($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  lw $t1, -164($fp)
  addi $t0, $t1, 1
  sw $t0, -168($fp)
  lw $t1, -168($fp)
  move $t0, $t1
  sw $t0, -164($fp)
  j label25
label27:
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
