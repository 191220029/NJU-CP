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
  addi $sp, $sp, -392
  li $t0, 11
  sw $t0, -356($fp)
  li $t1, 0
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -60($fp)
  addi $t1, $fp, -372
  lw $t2, -60($fp)
  add $t0, $t0, $t2
  sw $t0, -68($fp)
  li $t1, 1
  lw $t0, -68($fp)
  sw $t1, 0($t0)
  li $t1, 1
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -80($fp)
  addi $t1, $fp, -372
  lw $t2, -80($fp)
  add $t0, $t0, $t2
  sw $t0, -88($fp)
  li $t1, 1
  lw $t0, -88($fp)
  sw $t1, 0($t0)
  li $t0, 2
  sw $t0, -348($fp)
label1:
  lw $t1, -348($fp)
  lw $t2, -356($fp)
  blt $t1, $t2, label2
  j label3
label2:
  lw $t1, -348($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -116($fp)
  addi $t1, $fp, -372
  lw $t2, -116($fp)
  add $t0, $t0, $t2
  sw $t0, -124($fp)
  li $t1, 0
  lw $t0, -124($fp)
  sw $t1, 0($t0)
  lw $t1, -348($fp)
  addi $t0, $t1, 1
  sw $t0, -140($fp)
  lw $t1, -140($fp)
  move $t0, $t1
  sw $t0, -348($fp)
  j label1
label3:
  li $t0, 2
  sw $t0, -348($fp)
label4:
  lw $t1, -348($fp)
  lw $t2, -356($fp)
  blt $t1, $t2, label5
  j label6
label5:
  li $t0, 0
  sw $t0, -332($fp)
label7:
  lw $t1, -332($fp)
  lw $t2, -348($fp)
  blt $t1, $t2, label8
  j label9
label8:
  lw $t1, -348($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -180($fp)
  addi $t1, $fp, -372
  lw $t2, -180($fp)
  add $t0, $t0, $t2
  sw $t0, -316($fp)
  lw $t1, -348($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -200($fp)
  addi $t1, $fp, -372
  lw $t2, -200($fp)
  add $t0, $t0, $t2
  sw $t0, -212($fp)
  lw $t1, -212($fp)
  lw $t0, 0($t1)
  sw $t0, -304($fp)
  lw $t1, -332($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -228($fp)
  addi $t1, $fp, -372
  lw $t2, -228($fp)
  add $t0, $t0, $t2
  sw $t0, -240($fp)
  lw $t1, -240($fp)
  lw $t0, 0($t1)
  sw $t0, -292($fp)
  lw $t1, -348($fp)
  lw $t2, -332($fp)
  sub $t0, $t1, $t2
  sw $t0, -256($fp)
  lw $t1, -256($fp)
  addi $t0, $t1, -1
  sw $t0, -264($fp)
  lw $t1, -264($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -276($fp)
  addi $t1, $fp, -372
  lw $t2, -276($fp)
  add $t0, $t0, $t2
  sw $t0, -288($fp)
  lw $t1, -288($fp)
  lw $t0, 0($t1)
  sw $t0, -296($fp)
  lw $t1, -292($fp)
  lw $t2, -296($fp)
  mul $t0, $t1, $t2
  sw $t0, -308($fp)
  lw $t1, -304($fp)
  lw $t2, -308($fp)
  add $t0, $t1, $t2
  sw $t0, -320($fp)
  lw $t1, -320($fp)
  lw $t0, -316($fp)
  sw $t1, 0($t0)
  lw $t1, -332($fp)
  addi $t0, $t1, 1
  sw $t0, -336($fp)
  lw $t1, -336($fp)
  move $t0, $t1
  sw $t0, -332($fp)
  j label7
label9:
  lw $t1, -348($fp)
  addi $t0, $t1, 1
  sw $t0, -352($fp)
  lw $t1, -352($fp)
  move $t0, $t1
  sw $t0, -348($fp)
  j label4
label6:
  lw $t1, -356($fp)
  addi $t0, $t1, -1
  sw $t0, -364($fp)
  lw $t1, -364($fp)
  li $t2, 4
  mul $t0, $t1, $t2
  sw $t0, -376($fp)
  addi $t1, $fp, -372
  lw $t2, -376($fp)
  add $t0, $t0, $t2
  sw $t0, -388($fp)
  lw $t1, -388($fp)
  lw $t0, 0($t1)
  sw $t0, -392($fp)
  lw $a0, -392($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
