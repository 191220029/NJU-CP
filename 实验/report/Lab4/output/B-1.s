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

func_quick_power_mod:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -44
  lw $t0, 8($fp)
  sw $t0, -4($fp)
  lw $t0, 12($fp)
  sw $t0, -8($fp)
  lw $t0, 16($fp)
  sw $t0, -12($fp)
  li $t0, 1
  sw $t0, -16($fp)
  lw $t1, -4($fp)
  li $t2, 0
  ble $t1, $t2, label1
  j label5
label5:
  lw $t1, -8($fp)
  li $t2, 0
  ble $t1, $t2, label1
  j label4
label4:
  lw $t1, -12($fp)
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
  addi $sp, $sp, -4
  lw $t0, -12($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -4($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -20($fp)
  addi $sp, $sp, 8
  lw $t1, -20($fp)
  move $t0, $t1
  sw $t0, -4($fp)
label6:
  lw $t1, -8($fp)
  li $t2, 0
  bne $t1, $t2, label7
  j label8
label7:
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
  sw $v0, -24($fp)
  addi $sp, $sp, 8
  lw $t1, -24($fp)
  li $t2, 1
  beq $t1, $t2, label9
  j label10
label9:
  lw $t1, -16($fp)
  lw $t2, -4($fp)
  mul $t0, $t1, $t2
  sw $t0, -28($fp)
  addi $sp, $sp, -4
  lw $t0, -12($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -28($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -32($fp)
  addi $sp, $sp, 8
  lw $t1, -32($fp)
  move $t0, $t1
  sw $t0, -16($fp)
label10:
  lw $t1, -8($fp)
  li $t2, 2
  div $t1, $t2
  mflo $t0
  sw $t0, -36($fp)
  lw $t1, -36($fp)
  move $t0, $t1
  sw $t0, -8($fp)
  lw $t1, -4($fp)
  lw $t2, -4($fp)
  mul $t0, $t1, $t2
  sw $t0, -40($fp)
  addi $sp, $sp, -4
  lw $t0, -12($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -40($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_mod
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -44($fp)
  addi $sp, $sp, 8
  lw $t1, -44($fp)
  move $t0, $t1
  sw $t0, -4($fp)
  j label6
label8:
  lw $v0, -16($fp)
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
  li $t2, 3
  blt $t1, $t2, label12
  j label13
label12:
  lw $t1, -16($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -20($fp)
  addi $t1, $fp, -12
  lw $t2, -20($fp)
  add $t0, $t1, $t2
  sw $t0, -24($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -28($fp)
  lw $t1, -28($fp)
  lw $t0, -24($fp)
  sw $t1, 0($t0)
  lw $t1, -16($fp)
  addi $t0, $t1, 1
  sw $t0, -32($fp)
  lw $t1, -32($fp)
  move $t0, $t1
  sw $t0, -16($fp)
  j label11
label13:
  li $t1, 2
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -36($fp)
  addi $t1, $fp, -12
  lw $t2, -36($fp)
  add $t0, $t1, $t2
  sw $t0, -40($fp)
  lw $t1, -40($fp)
  lw $t0, 0($t1)
  sw $t0, -44($fp)
  li $t1, 1
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -48($fp)
  addi $t1, $fp, -12
  lw $t2, -48($fp)
  add $t0, $t1, $t2
  sw $t0, -52($fp)
  lw $t1, -52($fp)
  lw $t0, 0($t1)
  sw $t0, -56($fp)
  li $t1, 0
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -60($fp)
  addi $t1, $fp, -12
  lw $t2, -60($fp)
  add $t0, $t1, $t2
  sw $t0, -64($fp)
  lw $t1, -64($fp)
  lw $t0, 0($t1)
  sw $t0, -68($fp)
  addi $sp, $sp, -4
  lw $t0, -44($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -56($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  lw $t0, -68($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_quick_power_mod
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
