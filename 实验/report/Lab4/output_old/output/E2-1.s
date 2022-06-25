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
  addi $sp, $sp, -712
  li $t0, 5
  sw $t0, -596($fp)
  li $t0, 0
  sw $t0, -704($fp)
label1:
  lw $t1, -704($fp)
  lw $t2, -596($fp)
  blt $t1, $t2, label2
  j label3
label2:
  li $t0, 0
  sw $t0, -560($fp)
label4:
  lw $t1, -560($fp)
  lw $t2, -596($fp)
  blt $t1, $t2, label5
  j label6
label5:
  li $t0, 0
  sw $t0, -296($fp)
  lw $t1, -560($fp)
  move $t0, $t1
  sw $t0, -284($fp)
  lw $t1, -704($fp)
  move $t0, $t1
  sw $t0, -264($fp)
  lw $t1, -264($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -264($fp)
  lw $t1, -296($fp)
  lw $t2, -264($fp)
  add $t0, $t1, $t2
  sw $t0, -296($fp)
  lw $t1, -284($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -284($fp)
  lw $t1, -296($fp)
  lw $t2, -284($fp)
  add $t0, $t1, $t2
  sw $t0, -296($fp)
  addi $t1, $fp, -656
  lw $t2, -296($fp)
  add $t0, $t0, $t2
  sw $t0, -328($fp)
  lw $t1, -704($fp)
  lw $t2, -704($fp)
  mul $t0, $t1, $t2
  sw $t0, -316($fp)
  lw $t1, -316($fp)
  lw $t2, -560($fp)
  add $t0, $t1, $t2
  sw $t0, -332($fp)
  lw $t1, -332($fp)
  lw $t0, -328($fp)
  sw $t1, 0($t0)
  lw $t1, -560($fp)
  addi $t0, $t1, 1
  sw $t0, -348($fp)
  lw $t1, -348($fp)
  move $t0, $t1
  sw $t0, -560($fp)
  j label4
label6:
  lw $t1, -704($fp)
  addi $t0, $t1, 1
  sw $t0, -364($fp)
  lw $t1, -364($fp)
  move $t0, $t1
  sw $t0, -704($fp)
  j label1
label3:
  li $t0, 0
  sw $t0, -704($fp)
label7:
  lw $t1, -704($fp)
  lw $t2, -596($fp)
  blt $t1, $t2, label8
  j label9
label8:
  li $t0, 0
  sw $t0, -560($fp)
label10:
  lw $t1, -560($fp)
  lw $t2, -596($fp)
  blt $t1, $t2, label11
  j label12
label11:
  li $t0, 0
  sw $t0, -456($fp)
  lw $t1, -704($fp)
  move $t0, $t1
  sw $t0, -444($fp)
  lw $t1, -560($fp)
  move $t0, $t1
  sw $t0, -424($fp)
  lw $t1, -424($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -424($fp)
  lw $t1, -456($fp)
  lw $t2, -424($fp)
  add $t0, $t1, $t2
  sw $t0, -456($fp)
  lw $t1, -444($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -444($fp)
  lw $t1, -456($fp)
  lw $t2, -444($fp)
  add $t0, $t1, $t2
  sw $t0, -456($fp)
  addi $t1, $fp, -656
  lw $t2, -456($fp)
  add $t0, $t0, $t2
  sw $t0, -544($fp)
  li $t0, 0
  sw $t0, -528($fp)
  lw $t1, -560($fp)
  move $t0, $t1
  sw $t0, -516($fp)
  lw $t1, -704($fp)
  move $t0, $t1
  sw $t0, -496($fp)
  lw $t1, -496($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -496($fp)
  lw $t1, -528($fp)
  lw $t2, -496($fp)
  add $t0, $t1, $t2
  sw $t0, -528($fp)
  lw $t1, -516($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -516($fp)
  lw $t1, -528($fp)
  lw $t2, -516($fp)
  add $t0, $t1, $t2
  sw $t0, -528($fp)
  addi $t1, $fp, -656
  lw $t2, -528($fp)
  add $t0, $t0, $t2
  sw $t0, -540($fp)
  lw $t1, -540($fp)
  lw $t0, 0($t1)
  sw $t0, -548($fp)
  lw $t1, -548($fp)
  lw $t0, -544($fp)
  sw $t1, 0($t0)
  lw $t1, -560($fp)
  addi $t0, $t1, 1
  sw $t0, -564($fp)
  lw $t1, -564($fp)
  move $t0, $t1
  sw $t0, -560($fp)
  j label10
label12:
  lw $t1, -704($fp)
  addi $t0, $t1, 1
  sw $t0, -580($fp)
  lw $t1, -580($fp)
  move $t0, $t1
  sw $t0, -704($fp)
  j label7
label9:
  li $t0, 0
  sw $t0, -712($fp)
  li $t0, 0
  sw $t0, -704($fp)
label13:
  lw $t1, -704($fp)
  lw $t2, -596($fp)
  blt $t1, $t2, label14
  j label15
label14:
  li $t0, 0
  sw $t0, -660($fp)
  lw $t1, -704($fp)
  move $t0, $t1
  sw $t0, -648($fp)
  li $t0, 0
  sw $t0, -628($fp)
  lw $t1, -628($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -628($fp)
  lw $t1, -660($fp)
  lw $t2, -628($fp)
  add $t0, $t1, $t2
  sw $t0, -660($fp)
  lw $t1, -648($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -648($fp)
  lw $t1, -660($fp)
  lw $t2, -648($fp)
  add $t0, $t1, $t2
  sw $t0, -660($fp)
  addi $t1, $fp, -656
  lw $t2, -660($fp)
  add $t0, $t0, $t2
  sw $t0, -672($fp)
  lw $t1, -672($fp)
  lw $t0, 0($t1)
  sw $t0, -680($fp)
  lw $t1, -712($fp)
  lw $t2, -680($fp)
  add $t0, $t1, $t2
  sw $t0, -692($fp)
  lw $t1, -692($fp)
  move $t0, $t1
  sw $t0, -712($fp)
  lw $t1, -704($fp)
  addi $t0, $t1, 1
  sw $t0, -708($fp)
  lw $t1, -708($fp)
  move $t0, $t1
  sw $t0, -704($fp)
  j label13
label15:
  lw $a0, -712($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
