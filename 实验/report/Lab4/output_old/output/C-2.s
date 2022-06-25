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

func_bit_and:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -16
  lw $t0, 8($fp)
  sw $t0, -12($fp)
  lw $t0, 12($fp)
  sw $t0, -16($fp)
  lw $t1, -12($fp)
  li $t2, 0
  beq $t1, $t2, label1
  j label2
label1:
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
  j label3
label2:
  lw $v0, -16($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
label3:

func_bit_or:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -16
  lw $t0, 8($fp)
  sw $t0, -12($fp)
  lw $t0, 12($fp)
  sw $t0, -16($fp)
  lw $t1, -12($fp)
  li $t2, 0
  beq $t1, $t2, label4
  j label5
label4:
  lw $v0, -16($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
  j label6
label5:
  li $v0, 1
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
label6:

func_bit_not:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -8
  lw $t0, 8($fp)
  sw $t0, -8($fp)
  lw $t1, -8($fp)
  li $t2, 0
  beq $t1, $t2, label7
  j label8
label7:
  li $v0, 1
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
  j label9
label8:
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
label9:

func_mod:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -48
  lw $t0, 8($fp)
  sw $t0, -36($fp)
  lw $t0, 12($fp)
  sw $t0, -28($fp)
  lw $t1, -36($fp)
  lw $t2, -28($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -24($fp)
  lw $t1, -24($fp)
  lw $t2, -28($fp)
  mul $t0, $t1, $t2
  sw $t0, -40($fp)
  lw $t1, -36($fp)
  lw $t2, -40($fp)
  sub $t0, $t1, $t2
  sw $t0, -48($fp)
  lw $v0, -48($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

func_and:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -860
  lw $t0, 8($fp)
  sw $t0, -604($fp)
  lw $t0, 12($fp)
  sw $t0, -620($fp)
  li $t0, 32
  sw $t0, -768($fp)
  li $t0, 0
  sw $t0, -852($fp)
  li $t0, 0
  sw $t0, -860($fp)
  lw $t1, -604($fp)
  li $t2, 0
  ble $t1, $t2, label10
  j label12
label12:
  lw $t1, -620($fp)
  li $t2, 0
  ble $t1, $t2, label10
  j label11
label10:
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
label11:
label13:
  lw $t1, -852($fp)
  lw $t2, -768($fp)
  blt $t1, $t2, label14
  j label15
label14:
  lw $t1, -852($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -436($fp)
  addi $t1, $fp, -712
  lw $t2, -436($fp)
  add $t0, $t0, $t2
  sw $t0, -444($fp)
  li $t1, 0
  lw $t0, -444($fp)
  sw $t1, 0($t0)
  lw $t1, -852($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -460($fp)
  addi $t1, $fp, -684
  lw $t2, -460($fp)
  add $t0, $t0, $t2
  sw $t0, -468($fp)
  li $t1, 0
  lw $t0, -468($fp)
  sw $t1, 0($t0)
  lw $t1, -852($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -484($fp)
  addi $t1, $fp, -804
  lw $t2, -484($fp)
  add $t0, $t0, $t2
  sw $t0, -492($fp)
  li $t1, 0
  lw $t0, -492($fp)
  sw $t1, 0($t0)
  lw $t1, -852($fp)
  addi $t0, $t1, 1
  sw $t0, -508($fp)
  lw $t1, -508($fp)
  move $t0, $t1
  sw $t0, -852($fp)
  j label13
label15:
  li $t0, 0
  sw $t0, -852($fp)
label16:
  lw $t1, -852($fp)
  lw $t2, -768($fp)
  blt $t1, $t2, label17
  j label18
label17:
  lw $t1, -852($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -536($fp)
  addi $t1, $fp, -712
  lw $t2, -536($fp)
  add $t0, $t0, $t2
  sw $t0, -552($fp)
  addi $sp, $sp, -4
  li $t0, 2
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -604($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -556($fp)
  addi $sp, $sp, 8
  lw $t1, -556($fp)
  lw $t0, -552($fp)
  sw $t1, 0($t0)
  lw $t1, -852($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -572($fp)
  addi $t1, $fp, -684
  lw $t2, -572($fp)
  add $t0, $t0, $t2
  sw $t0, -588($fp)
  addi $sp, $sp, -4
  li $t0, 2
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -620($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -592($fp)
  addi $sp, $sp, 8
  lw $t1, -592($fp)
  lw $t0, -588($fp)
  sw $t1, 0($t0)
  lw $t1, -604($fp)
  li $t2, 2
  div $t1, $t2
  mflo $t0
  sw $t0, -608($fp)
  lw $t1, -608($fp)
  move $t0, $t1
  sw $t0, -604($fp)
  lw $t1, -620($fp)
  li $t2, 2
  div $t1, $t2
  mflo $t0
  sw $t0, -624($fp)
  lw $t1, -624($fp)
  move $t0, $t1
  sw $t0, -620($fp)
  lw $t1, -852($fp)
  addi $t0, $t1, 1
  sw $t0, -640($fp)
  lw $t1, -640($fp)
  move $t0, $t1
  sw $t0, -852($fp)
  j label16
label18:
  li $t0, 0
  sw $t0, -852($fp)
label19:
  lw $t1, -852($fp)
  lw $t2, -768($fp)
  blt $t1, $t2, label20
  j label21
label20:
  lw $t1, -852($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -668($fp)
  addi $t1, $fp, -804
  lw $t2, -668($fp)
  add $t0, $t0, $t2
  sw $t0, -744($fp)
  lw $t1, -852($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -688($fp)
  addi $t1, $fp, -684
  lw $t2, -688($fp)
  add $t0, $t0, $t2
  sw $t0, -700($fp)
  lw $t1, -700($fp)
  lw $t0, 0($t1)
  sw $t0, -732($fp)
  lw $t1, -852($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -716($fp)
  addi $t1, $fp, -712
  lw $t2, -716($fp)
  add $t0, $t0, $t2
  sw $t0, -728($fp)
  lw $t1, -728($fp)
  lw $t0, 0($t1)
  sw $t0, -736($fp)
  addi $sp, $sp, -4
  lw $t0, -732($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -736($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_bit_and
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -748($fp)
  addi $sp, $sp, 8
  lw $t1, -748($fp)
  lw $t0, -744($fp)
  sw $t1, 0($t0)
  lw $t1, -852($fp)
  addi $t0, $t1, 1
  sw $t0, -764($fp)
  lw $t1, -764($fp)
  move $t0, $t1
  sw $t0, -852($fp)
  j label19
label21:
  lw $t1, -768($fp)
  addi $t0, $t1, -1
  sw $t0, -780($fp)
  lw $t1, -780($fp)
  move $t0, $t1
  sw $t0, -852($fp)
label22:
  lw $t1, -852($fp)
  li $t2, 0
  bge $t1, $t2, label23
  j label24
label23:
  lw $t1, -860($fp)
  li $t2, 2
  mul $t0, $t1, $t2
  sw $t0, -824($fp)
  lw $t1, -852($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -808($fp)
  addi $t1, $fp, -804
  lw $t2, -808($fp)
  add $t0, $t0, $t2
  sw $t0, -820($fp)
  lw $t1, -820($fp)
  lw $t0, 0($t1)
  sw $t0, -828($fp)
  lw $t1, -824($fp)
  lw $t2, -828($fp)
  add $t0, $t1, $t2
  sw $t0, -840($fp)
  lw $t1, -840($fp)
  move $t0, $t1
  sw $t0, -860($fp)
  lw $t1, -852($fp)
  addi $t0, $t1, -1
  sw $t0, -856($fp)
  lw $t1, -856($fp)
  move $t0, $t1
  sw $t0, -852($fp)
  j label22
label24:
  lw $v0, -860($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

main:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -40
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -12($fp)
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -32($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -24($fp)
  lw $t1, -24($fp)
  move $t0, $t1
  sw $t0, -28($fp)
  addi $sp, $sp, -4
  lw $t0, -28($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -32($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_and
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -40($fp)
  addi $sp, $sp, 8
  lw $a0, -40($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
