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

func_cal_bmi:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -92
  lw $t0, 8($fp)
  sw $t0, -48($fp)
  lw $t1, -48($fp)
  addi $t0, $t1, 16
  sw $t0, -88($fp)
  lw $t1, -48($fp)
  addi $t0, $t1, 12
  sw $t0, -28($fp)
  lw $t1, -28($fp)
  lw $t0, 0($t1)
  sw $t0, -76($fp)
  lw $t1, -48($fp)
  addi $t0, $t1, 8
  sw $t0, -44($fp)
  lw $t1, -44($fp)
  lw $t0, 0($t1)
  sw $t0, -64($fp)
  lw $t1, -48($fp)
  addi $t0, $t1, 8
  sw $t0, -60($fp)
  lw $t1, -60($fp)
  lw $t0, 0($t1)
  sw $t0, -68($fp)
  lw $t1, -64($fp)
  lw $t2, -68($fp)
  mul $t0, $t1, $t2
  sw $t0, -80($fp)
  lw $t1, -76($fp)
  lw $t2, -80($fp)
  div $t1, $t2
  mflo $t0
  sw $t0, -92($fp)
  lw $t1, -92($fp)
  lw $t0, -88($fp)
  sw $t1, 0($t0)
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra

main:
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -560
  li $t0, 0
  sw $t0, -556($fp)
  li $t0, 10
  sw $t0, -504($fp)
label1:
  lw $t1, -556($fp)
  lw $t2, -504($fp)
  blt $t1, $t2, label2
  j label3
label2:
  lw $t1, -556($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -232($fp)
  addi $t1, $fp, -516
  lw $t2, -232($fp)
  add $t0, $t0, $t2
  sw $t0, -240($fp)
  lw $t1, -240($fp)
  addi $t0, $t1, 0
  sw $t0, -248($fp)
  lw $t1, -556($fp)
  lw $t0, -248($fp)
  sw $t1, 0($t0)
  lw $t1, -556($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -268($fp)
  addi $t1, $fp, -516
  lw $t2, -268($fp)
  add $t0, $t0, $t2
  sw $t0, -276($fp)
  lw $t1, -276($fp)
  addi $t0, $t1, 4
  sw $t0, -292($fp)
  li $t1, 20
  lw $t2, -556($fp)
  add $t0, $t1, $t2
  sw $t0, -296($fp)
  lw $t1, -296($fp)
  lw $t0, -292($fp)
  sw $t1, 0($t0)
  lw $t1, -556($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -312($fp)
  addi $t1, $fp, -516
  lw $t2, -312($fp)
  add $t0, $t0, $t2
  sw $t0, -320($fp)
  lw $t1, -320($fp)
  addi $t0, $t1, 8
  sw $t0, -336($fp)
  li $t1, 2
  lw $t2, -556($fp)
  add $t0, $t1, $t2
  sw $t0, -340($fp)
  lw $t1, -340($fp)
  lw $t0, -336($fp)
  sw $t1, 0($t0)
  lw $t1, -556($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -356($fp)
  addi $t1, $fp, -516
  lw $t2, -356($fp)
  add $t0, $t0, $t2
  sw $t0, -364($fp)
  lw $t1, -364($fp)
  addi $t0, $t1, 12
  sw $t0, -416($fp)
  lw $t1, -556($fp)
  lw $t2, -556($fp)
  mul $t0, $t1, $t2
  sw $t0, -384($fp)
  lw $t1, -384($fp)
  lw $t2, -556($fp)
  mul $t0, $t1, $t2
  sw $t0, -396($fp)
  lw $t1, -396($fp)
  lw $t2, -556($fp)
  mul $t0, $t1, $t2
  sw $t0, -408($fp)
  li $t1, 90
  lw $t2, -408($fp)
  add $t0, $t1, $t2
  sw $t0, -420($fp)
  lw $t1, -420($fp)
  lw $t0, -416($fp)
  sw $t1, 0($t0)
  lw $t1, -556($fp)
  addi $t0, $t1, 1
  sw $t0, -436($fp)
  lw $t1, -436($fp)
  move $t0, $t1
  sw $t0, -556($fp)
  j label1
label3:
  li $t0, 0
  sw $t0, -556($fp)
label4:
  lw $t1, -556($fp)
  lw $t2, -504($fp)
  blt $t1, $t2, label5
  j label6
label5:
  lw $t1, -556($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -464($fp)
  addi $t1, $fp, -516
  lw $t2, -464($fp)
  add $t0, $t0, $t2
  sw $t0, -472($fp)
  addi $sp, $sp, -4
  lw $t0, -472($fp)
  sw $t0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal func_cal_bmi
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  sw $v0, -476($fp)
  addi $sp, $sp, 4
  lw $t1, -556($fp)
  addi $t0, $t1, 1
  sw $t0, -492($fp)
  lw $t1, -492($fp)
  move $t0, $t1
  sw $t0, -556($fp)
  j label4
label6:
  li $t0, 0
  sw $t0, -556($fp)
label7:
  lw $t1, -556($fp)
  lw $t2, -504($fp)
  blt $t1, $t2, label8
  j label9
label8:
  lw $t1, -556($fp)
  li $t2, 20
  mul $t0, $t1, $t2
  sw $t0, -520($fp)
  addi $t1, $fp, -516
  lw $t2, -520($fp)
  add $t0, $t0, $t2
  sw $t0, -528($fp)
  lw $t1, -528($fp)
  addi $t0, $t1, 16
  sw $t0, -540($fp)
  lw $t1, -540($fp)
  lw $t0, 0($t1)
  sw $t0, -544($fp)
  lw $a0, -544($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  lw $t1, -556($fp)
  addi $t0, $t1, 1
  sw $t0, -560($fp)
  lw $t1, -560($fp)
  move $t0, $t1
  sw $t0, -556($fp)
  j label7
label9:
  li $v0, 0
  addi $sp, $fp, 4
  lw $fp, 0($fp)
  jr $ra
