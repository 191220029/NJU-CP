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

_bit_and:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -16
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t0, 12($fp)
  sw $t0, -8($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -12($fp)
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
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -16($fp)
  lw $v0, -16($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
label3:

_bit_or:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -16
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t0, 12($fp)
  sw $t0, -8($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -12($fp)
  lw $t1, -12($fp)
  li $t2, 0
  beq $t1, $t2, label4
  j label5
label4:
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -16($fp)
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

_bit_not:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -8
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t1, -4($fp)
  move $t0, $t1
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

_mod:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -36
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t0, 12($fp)
  sw $t0, -8($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -12($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -16($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -20($fp)
  lw $t1, -16($fp)
  lw $t2, -20($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -24($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -28($fp)
  lw $t1, -24($fp)
  lw $t2, -28($fp)
  mul $t0, $t1, $t2
  sw $t0, -32($fp)
  lw $t1, -12($fp)
  lw $t2, -32($fp)
  sub $t0, $t1, $t2
  sw $t0, -36($fp)
  lw $v0, -36($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

_and:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -640
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t0, 12($fp)
  sw $t0, -8($fp)
  li $t0, 0
  sw $t0, -396($fp)
  li $t0, 0
  sw $t0, -400($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -404($fp)
  lw $t1, -404($fp)
  li $t2, 0
  ble $t1, $t2, label10
  j label12
label12:
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -408($fp)
  lw $t1, -408($fp)
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
  lw $t1, -396($fp)
  move $t0, $t1
  sw $t0, -412($fp)
  lw $t1, -412($fp)
  li $t2, 32
  blt $t1, $t2, label14
  j label15
label14:
  lw $t1, -396($fp)
  move $t0, $t1
  sw $t0, -416($fp)
  lw $t1, -416($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -420($fp)
  addi $t0, $fp, -136
  lw $t2, -420($fp)
  add $t0, $t0, $t2
  sw $t0, -424($fp)
  li $t0, 0
  sw $t0, -428($fp)
  lw $t0, -424($fp)
  lw $t1, -428($fp)
  sw $t1, 0($t0)
  lw $t1, -396($fp)
  move $t0, $t1
  sw $t0, -432($fp)
  lw $t1, -432($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -436($fp)
  addi $t0, $fp, -264
  lw $t2, -436($fp)
  add $t0, $t0, $t2
  sw $t0, -440($fp)
  li $t0, 0
  sw $t0, -444($fp)
  lw $t0, -440($fp)
  lw $t1, -444($fp)
  sw $t1, 0($t0)
  lw $t1, -396($fp)
  move $t0, $t1
  sw $t0, -448($fp)
  lw $t1, -448($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -452($fp)
  addi $t0, $fp, -392
  lw $t2, -452($fp)
  add $t0, $t0, $t2
  sw $t0, -456($fp)
  li $t0, 0
  sw $t0, -460($fp)
  lw $t0, -456($fp)
  lw $t1, -460($fp)
  sw $t1, 0($t0)
  lw $t1, -396($fp)
  move $t0, $t1
  sw $t0, -464($fp)
  lw $t1, -464($fp)
  addi $t0, $t1, 1
  sw $t0, -468($fp)
  lw $t1, -468($fp)
  move $t0, $t1
  sw $t0, -396($fp)
  j label13
label15:
  li $t0, 0
  sw $t0, -396($fp)
label16:
  lw $t1, -396($fp)
  move $t0, $t1
  sw $t0, -472($fp)
  lw $t1, -472($fp)
  li $t2, 32
  blt $t1, $t2, label17
  j label18
label17:
  lw $t1, -396($fp)
  move $t0, $t1
  sw $t0, -476($fp)
  lw $t1, -476($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -480($fp)
  addi $t0, $fp, -136
  lw $t2, -480($fp)
  add $t0, $t0, $t2
  sw $t0, -484($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -488($fp)
  addi $sp, $sp, -4
  li $t0, 2
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -488($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -492($fp)
  addi $sp, $sp, 8
  lw $t0, -484($fp)
  lw $t1, -492($fp)
  sw $t1, 0($t0)
  lw $t1, -396($fp)
  move $t0, $t1
  sw $t0, -496($fp)
  lw $t1, -496($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -500($fp)
  addi $t0, $fp, -264
  lw $t2, -500($fp)
  add $t0, $t0, $t2
  sw $t0, -504($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -508($fp)
  addi $sp, $sp, -4
  li $t0, 2
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -508($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -512($fp)
  addi $sp, $sp, 8
  lw $t0, -504($fp)
  lw $t1, -512($fp)
  sw $t1, 0($t0)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -516($fp)
  lw $t1, -516($fp)
  li $t2, 2
  div $t1, $t2
  mflo $t0
  sw $t0, -520($fp)
  lw $t1, -520($fp)
  move $t0, $t1
  sw $t0, -4($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -524($fp)
  lw $t1, -524($fp)
  li $t2, 2
  div $t1, $t2
  mflo $t0
  sw $t0, -528($fp)
  lw $t1, -528($fp)
  move $t0, $t1
  sw $t0, -8($fp)
  lw $t1, -396($fp)
  move $t0, $t1
  sw $t0, -532($fp)
  lw $t1, -532($fp)
  addi $t0, $t1, 1
  sw $t0, -536($fp)
  lw $t1, -536($fp)
  move $t0, $t1
  sw $t0, -396($fp)
  j label16
label18:
  li $t0, 0
  sw $t0, -396($fp)
label19:
  lw $t1, -396($fp)
  move $t0, $t1
  sw $t0, -540($fp)
  lw $t1, -540($fp)
  li $t2, 32
  blt $t1, $t2, label20
  j label21
label20:
  lw $t1, -396($fp)
  move $t0, $t1
  sw $t0, -544($fp)
  lw $t1, -544($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -548($fp)
  addi $t0, $fp, -392
  lw $t2, -548($fp)
  add $t0, $t0, $t2
  sw $t0, -552($fp)
  lw $t1, -396($fp)
  move $t0, $t1
  sw $t0, -556($fp)
  lw $t1, -556($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -560($fp)
  addi $t0, $fp, -264
  lw $t2, -560($fp)
  add $t0, $t0, $t2
  sw $t0, -564($fp)
  lw $t1, -564($fp)
  lw $t0, 0($t1)
  sw $t0, -568($fp)
  lw $t1, -396($fp)
  move $t0, $t1
  sw $t0, -572($fp)
  lw $t1, -572($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -576($fp)
  addi $t0, $fp, -136
  lw $t2, -576($fp)
  add $t0, $t0, $t2
  sw $t0, -580($fp)
  lw $t1, -580($fp)
  lw $t0, 0($t1)
  sw $t0, -584($fp)
  addi $sp, $sp, -4
  lw $t0, -568($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -584($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _bit_and
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -588($fp)
  addi $sp, $sp, 8
  lw $t0, -552($fp)
  lw $t1, -588($fp)
  sw $t1, 0($t0)
  lw $t1, -396($fp)
  move $t0, $t1
  sw $t0, -592($fp)
  lw $t1, -592($fp)
  addi $t0, $t1, 1
  sw $t0, -596($fp)
  lw $t1, -596($fp)
  move $t0, $t1
  sw $t0, -396($fp)
  j label19
label21:
  li $t0, 31
  sw $t0, -396($fp)
label22:
  lw $t1, -396($fp)
  move $t0, $t1
  sw $t0, -600($fp)
  lw $t1, -600($fp)
  li $t2, 0
  bge $t1, $t2, label23
  j label24
label23:
  lw $t1, -400($fp)
  move $t0, $t1
  sw $t0, -604($fp)
  lw $t1, -604($fp)
  li $t2, 2
  mul $t0, $t1, $t2
  sw $t0, -608($fp)
  lw $t1, -396($fp)
  move $t0, $t1
  sw $t0, -612($fp)
  lw $t1, -612($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -616($fp)
  addi $t0, $fp, -392
  lw $t2, -616($fp)
  add $t0, $t0, $t2
  sw $t0, -620($fp)
  lw $t1, -620($fp)
  lw $t0, 0($t1)
  sw $t0, -624($fp)
  lw $t1, -608($fp)
  lw $t2, -624($fp)
  add $t0, $t1, $t2
  sw $t0, -628($fp)
  lw $t1, -628($fp)
  move $t0, $t1
  sw $t0, -400($fp)
  lw $t1, -396($fp)
  move $t0, $t1
  sw $t0, -632($fp)
  lw $t1, -632($fp)
  addi $t0, $t1, -1
  sw $t0, -636($fp)
  lw $t1, -636($fp)
  move $t0, $t1
  sw $t0, -396($fp)
  j label22
label24:
  lw $t1, -400($fp)
  move $t0, $t1
  sw $t0, -640($fp)
  lw $v0, -640($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

main:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -28
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -4($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -8($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -12($fp)
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -16($fp)
  lw $t1, -16($fp)
  move $t0, $t1
  sw $t0, -20($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -24($fp)
  addi $sp, $sp, -4
  lw $t0, -20($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -24($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _and
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -28($fp)
  addi $sp, $sp, 8
  lw $a0, -28($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
