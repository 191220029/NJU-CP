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

_fact:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -28
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -8($fp)
  lw $t1, -8($fp)
  li $t2, 0
  ble $t1, $t2, label1
  j label2
label1:
  li $v0, 1
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
  j label3
label2:
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -12($fp)
  lw $t1, -12($fp)
  addi $t0, $t1, -1
  sw $t0, -16($fp)
  addi $sp, $sp, -4
  lw $t0, -16($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _fact
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -20($fp)
  addi $sp, $sp, 4
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -24($fp)
  lw $t1, -20($fp)
  lw $t2, -24($fp)
  mul $t0, $t1, $t2
  sw $t0, -28($fp)
  lw $v0, -28($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
label3:

_isqrt:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -68
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  li $t0, 0
  sw $t0, -8($fp)
label4:
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -12($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -16($fp)
  lw $t1, -12($fp)
  lw $t2, -16($fp)
  blt $t1, $t2, label5
  j label6
label5:
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -20($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -24($fp)
  lw $t1, -20($fp)
  lw $t2, -24($fp)
  mul $t0, $t1, $t2
  sw $t0, -28($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -32($fp)
  lw $t1, -28($fp)
  lw $t2, -32($fp)
  ble $t1, $t2, label9
  j label8
label9:
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -36($fp)
  lw $t1, -36($fp)
  addi $t0, $t1, 1
  sw $t0, -40($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -44($fp)
  lw $t1, -44($fp)
  addi $t0, $t1, 1
  sw $t0, -48($fp)
  lw $t1, -40($fp)
  lw $t2, -48($fp)
  mul $t0, $t1, $t2
  sw $t0, -52($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -56($fp)
  lw $t1, -52($fp)
  lw $t2, -56($fp)
  bgt $t1, $t2, label7
  j label8
label7:
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -60($fp)
  lw $v0, -60($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
label8:
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -64($fp)
  lw $t1, -64($fp)
  addi $t0, $t1, 1
  sw $t0, -68($fp)
  lw $t1, -68($fp)
  move $t0, $t1
  sw $t0, -8($fp)
  j label4
label6:
  li $v0, -1
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

_mod:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -44
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t0, 12($fp)
  sw $t0, -8($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -12($fp)
  lw $t1, -12($fp)
  li $t2, 0
  blt $t1, $t2, label10
  j label13
label13:
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -16($fp)
  lw $t1, -16($fp)
  li $t2, 0
  ble $t1, $t2, label10
  j label11
label10:
  li $v0, -1
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
  j label12
label11:
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -20($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -24($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -28($fp)
  lw $t1, -24($fp)
  lw $t2, -28($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -32($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -36($fp)
  lw $t1, -32($fp)
  lw $t2, -36($fp)
  mul $t0, $t1, $t2
  sw $t0, -40($fp)
  lw $t1, -20($fp)
  lw $t2, -40($fp)
  sub $t0, $t1, $t2
  sw $t0, -44($fp)
  lw $v0, -44($fp)
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
label12:

_is_prime:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -48
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  li $t0, 2
  sw $t0, -8($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -12($fp)
  addi $sp, $sp, -4
  lw $t0, -12($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _isqrt
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -16($fp)
  addi $sp, $sp, 4
  lw $t1, -16($fp)
  move $t0, $t1
  sw $t0, -20($fp)
label14:
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -24($fp)
  lw $t1, -20($fp)
  move $t0, $t1
  sw $t0, -28($fp)
  lw $t1, -24($fp)
  lw $t2, -28($fp)
  ble $t1, $t2, label15
  j label16
label15:
  lw $t1, -8($fp)
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
  li $t2, 0
  beq $t1, $t2, label17
  j label18
label17:
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
label18:
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -44($fp)
  lw $t1, -44($fp)
  addi $t0, $t1, 1
  sw $t0, -48($fp)
  lw $t1, -48($fp)
  move $t0, $t1
  sw $t0, -8($fp)
  j label14
label16:
  li $v0, 1
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

main:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -44
  li $t0, 2
  sw $t0, -4($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -8($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  sw $t0, -12($fp)
label19:
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -16($fp)
  lw $t1, -12($fp)
  move $t0, $t1
  sw $t0, -20($fp)
  addi $sp, $sp, -4
  lw $t0, -20($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _fact
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -24($fp)
  addi $sp, $sp, 4
  lw $t1, -16($fp)
  lw $t2, -24($fp)
  blt $t1, $t2, label20
  j label21
label20:
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -28($fp)
  addi $sp, $sp, -4
  lw $t0, -28($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal _is_prime
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -32($fp)
  addi $sp, $sp, 4
  lw $t1, -32($fp)
  li $t2, 0
  bne $t1, $t2, label22
  j label23
label22:
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -36($fp)
  lw $a0, -36($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
label23:
  lw $t1, -4($fp)
  move $t0, $t1
  sw $t0, -40($fp)
  lw $t1, -40($fp)
  addi $t0, $t1, 1
  sw $t0, -44($fp)
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -4($fp)
  j label19
label21:
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
