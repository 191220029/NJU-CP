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
  addi $sp, $sp, -8
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t0, 12($fp)
  sw $t0, -8($fp)
  lw $t1, -4($fp)
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
  lw $v0, -8($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
label3:

func_bit_or:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -8
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t0, 12($fp)
  sw $t0, -8($fp)
  lw $t1, -4($fp)
  li $t2, 0
  beq $t1, $t2, label4
  j label5
label4:
  lw $v0, -8($fp)
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
  addi $sp, $sp, -4
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t1, -4($fp)
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
  addi $sp, $sp, -20
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t0, 12($fp)
  sw $t0, -8($fp)
  lw $t1, -4($fp)
  lw $t2, -8($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -12($fp)
  lw $t1, -12($fp)
  lw $t2, -8($fp)
  mul $t0, $t1, $t2
  sw $t0, -16($fp)
  lw $t1, -4($fp)
  lw $t2, -16($fp)
  sub $t0, $t1, $t2
  sw $t0, -20($fp)
  lw $v0, -20($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

func_and:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -536
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t0, 12($fp)
  sw $t0, -8($fp)
  li $t0, 32
  sw $t0, -12($fp)
  li $t0, 0
  sw $t0, -400($fp)
  li $t0, 0
  sw $t0, -404($fp)
  lw $t1, -4($fp)
  li $t2, 0
  ble $t1, $t2, label10
  j label12
label12:
  lw $t1, -8($fp)
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
  lw $t1, -400($fp)
  lw $t2, -12($fp)
  blt $t1, $t2, label14
  j label15
label14:
  lw $t1, -400($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -408($fp)
  addi $t1, $fp, -140
  lw $t2, -408($fp)
  add $t0, $t1, $t2
  sw $t0, -412($fp)
  li $t1, 0
  lw $t0, -412($fp)
  sw $t1, 0($t0)
  lw $t1, -400($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -416($fp)
  addi $t1, $fp, -268
  lw $t2, -416($fp)
  add $t0, $t1, $t2
  sw $t0, -420($fp)
  li $t1, 0
  lw $t0, -420($fp)
  sw $t1, 0($t0)
  lw $t1, -400($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -424($fp)
  addi $t1, $fp, -396
  lw $t2, -424($fp)
  add $t0, $t1, $t2
  sw $t0, -428($fp)
  li $t1, 0
  lw $t0, -428($fp)
  sw $t1, 0($t0)
  lw $t1, -400($fp)
  addi $t0, $t1, 1
  sw $t0, -432($fp)
  lw $t1, -432($fp)
  move $t0, $t1
  sw $t0, -400($fp)
  j label13
label15:
  li $t0, 0
  sw $t0, -400($fp)
label16:
  lw $t1, -400($fp)
  lw $t2, -12($fp)
  blt $t1, $t2, label17
  j label18
label17:
  lw $t1, -400($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -436($fp)
  addi $t1, $fp, -140
  lw $t2, -436($fp)
  add $t0, $t1, $t2
  sw $t0, -440($fp)
  addi $sp, $sp, -4
  li $t0, 2
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -4($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -444($fp)
  addi $sp, $sp, 8
  lw $t1, -444($fp)
  lw $t0, -440($fp)
  sw $t1, 0($t0)
  lw $t1, -400($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -448($fp)
  addi $t1, $fp, -268
  lw $t2, -448($fp)
  add $t0, $t1, $t2
  sw $t0, -452($fp)
  addi $sp, $sp, -4
  li $t0, 2
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -8($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -456($fp)
  addi $sp, $sp, 8
  lw $t1, -456($fp)
  lw $t0, -452($fp)
  sw $t1, 0($t0)
  lw $t1, -4($fp)
  li $t2, 2
  div $t1, $t2
  mflo $t0
  sw $t0, -460($fp)
  lw $t1, -460($fp)
  move $t0, $t1
  sw $t0, -4($fp)
  lw $t1, -8($fp)
  li $t2, 2
  div $t1, $t2
  mflo $t0
  sw $t0, -464($fp)
  lw $t1, -464($fp)
  move $t0, $t1
  sw $t0, -8($fp)
  lw $t1, -400($fp)
  addi $t0, $t1, 1
  sw $t0, -468($fp)
  lw $t1, -468($fp)
  move $t0, $t1
  sw $t0, -400($fp)
  j label16
label18:
  li $t0, 0
  sw $t0, -400($fp)
label19:
  lw $t1, -400($fp)
  lw $t2, -12($fp)
  blt $t1, $t2, label20
  j label21
label20:
  lw $t1, -400($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -472($fp)
  addi $t1, $fp, -396
  lw $t2, -472($fp)
  add $t0, $t1, $t2
  sw $t0, -476($fp)
  lw $t1, -400($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -480($fp)
  addi $t1, $fp, -268
  lw $t2, -480($fp)
  add $t0, $t1, $t2
  sw $t0, -484($fp)
  lw $t1, -484($fp)
  lw $t0, 0($t1)
  sw $t0, -488($fp)
  lw $t1, -400($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -492($fp)
  addi $t1, $fp, -140
  lw $t2, -492($fp)
  add $t0, $t1, $t2
  sw $t0, -496($fp)
  lw $t1, -496($fp)
  lw $t0, 0($t1)
  sw $t0, -500($fp)
  addi $sp, $sp, -4
  lw $t0, -488($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -500($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_bit_and
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -504($fp)
  addi $sp, $sp, 8
  lw $t1, -504($fp)
  lw $t0, -476($fp)
  sw $t1, 0($t0)
  lw $t1, -400($fp)
  addi $t0, $t1, 1
  sw $t0, -508($fp)
  lw $t1, -508($fp)
  move $t0, $t1
  sw $t0, -400($fp)
  j label19
label21:
  lw $t1, -12($fp)
  addi $t0, $t1, -1
  sw $t0, -512($fp)
  lw $t1, -512($fp)
  move $t0, $t1
  sw $t0, -400($fp)
label22:
  lw $t1, -400($fp)
  li $t2, 0
  bge $t1, $t2, label23
  j label24
label23:
  lw $t1, -404($fp)
  li $t2, 2
  mul $t0, $t1, $t2
  sw $t0, -516($fp)
  lw $t1, -400($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -520($fp)
  addi $t1, $fp, -396
  lw $t2, -520($fp)
  add $t0, $t1, $t2
  sw $t0, -524($fp)
  lw $t1, -524($fp)
  lw $t0, 0($t1)
  sw $t0, -528($fp)
  lw $t1, -516($fp)
  lw $t2, -528($fp)
  add $t0, $t1, $t2
  sw $t0, -532($fp)
  lw $t1, -532($fp)
  move $t0, $t1
  sw $t0, -404($fp)
  lw $t1, -400($fp)
  addi $t0, $t1, -1
  sw $t0, -536($fp)
  lw $t1, -536($fp)
  move $t0, $t1
  sw $t0, -400($fp)
  j label22
label24:
  lw $v0, -404($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

main:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -20
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
  addi $sp, $sp, -4
  lw $t0, -16($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -8($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_and
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -20($fp)
  addi $sp, $sp, 8
  lw $a0, -20($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
