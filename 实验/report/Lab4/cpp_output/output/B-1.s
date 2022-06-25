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

_quick_power_mod:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -104
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t0, 12($fp)
  sw $t0, -8($fp)
  lw $t0, 16($fp)
  sw $t0, -12($fp)
  li $t0, 1
  sw $t0, -16($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -20($fp)
  lw $t1, -20($fp)
  li $t2, 0
  ble $t1, $t2, label1
  j label5
label5:
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -24($fp)
  lw $t1, -24($fp)
  li $t2, 0
  ble $t1, $t2, label1
  j label4
label4:
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -28($fp)
  lw $t1, -28($fp)
  li $t2, 0
  ble $t1, $t2, label1
  j label2
label1:
  li $v0, -1
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
  j label3
label2:
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -32($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -36($fp)
  addi $sp, $sp, -4
  lw $t0, -32($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -36($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -40($fp)
  addi $sp, $sp, 8
  lw $t1, -40($fp)
  move $t0, $t1
  sw $t0, -4($fp)
label6:
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -44($fp)
  lw $t1, -44($fp)
  li $t2, 0
  bne $t1, $t2, label7
  j label8
label7:
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -48($fp)
  addi $sp, $sp, -4
  li $t0, 2
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -48($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -52($fp)
  addi $sp, $sp, 8
  lw $t1, -52($fp)
  li $t2, 1
  beq $t1, $t2, label9
  j label10
label9:
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -56($fp)
  lw $t1, -16($fp)
  move $t0, $t1
  sw $t0, -60($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -64($fp)
  lw $t1, -60($fp)
  lw $t2, -64($fp)
  mul $t0, $t1, $t2
  sw $t0, -68($fp)
  addi $sp, $sp, -4
  lw $t0, -56($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -68($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -72($fp)
  addi $sp, $sp, 8
  lw $t1, -72($fp)
  move $t0, $t1
  sw $t0, -16($fp)
label10:
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -76($fp)
  lw $t1, -76($fp)
  li $t2, 2
  div $t1, $t2
  mflo $t0
  sw $t0, -80($fp)
  lw $t1, -80($fp)
  move $t0, $t1
  sw $t0, -8($fp)
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -84($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -88($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -92($fp)
  lw $t1, -88($fp)
  lw $t2, -92($fp)
  mul $t0, $t1, $t2
  sw $t0, -96($fp)
  addi $sp, $sp, -4
  lw $t0, -84($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -96($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -100($fp)
  addi $sp, $sp, 8
  lw $t1, -100($fp)
  move $t0, $t1
  sw $t0, -4($fp)
  j label6
label8:
  lw $t1, -16($fp)
  move $t0, $t1
  sw $t0, -104($fp)
  lw $v0, -104($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
label3:

main:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -72
  li $t0, 0
  sw $t0, -16($fp)
label11:
  lw $t1, -16($fp)
  move $t0, $t1
  sw $t0, -20($fp)
  lw $t1, -20($fp)
  li $t2, 3
  blt $t1, $t2, label12
  j label13
label12:
  lw $t1, -16($fp)
  move $t0, $t1
  sw $t0, -24($fp)
  lw $t1, -24($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -28($fp)
  addi $t0, $fp, -12
  lw $t2, -28($fp)
  add $t0, $t0, $t2
  sw $t0, -32($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -36($fp)
  lw $t0, -32($fp)
  lw $t1, -36($fp)
  sw $t1, 0($t0)
  lw $t1, -16($fp)
  move $t0, $t1
  sw $t0, -40($fp)
  lw $t1, -40($fp)
  addi $t0, $t1, 1
  sw $t0, -44($fp)
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -16($fp)
  j label11
label13:
  addi $t0, $fp, -4
  sw $t0, -48($fp)
  lw $t1, -48($fp)
  lw $t0, 0($t1)
  sw $t0, -52($fp)
  addi $t0, $fp, -8
  sw $t0, -56($fp)
  lw $t1, -56($fp)
  lw $t0, 0($t1)
  sw $t0, -60($fp)
  addi $t0, $fp, -12
  sw $t0, -64($fp)
  lw $t1, -64($fp)
  lw $t0, 0($t1)
  sw $t0, -68($fp)
  addi $sp, $sp, -4
  lw $t0, -52($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -60($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -68($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _quick_power_mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -72($fp)
  addi $sp, $sp, 12
  lw $a0, -72($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
