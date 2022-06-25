#include"mipGen.h"

#define saveReg(addr) \
if(addr != -1){\
    fprintf(f, "  sw $t0, -%d($fp)\n", addr);\
}

//#define mipDebug

int *var_offset;
int *tmp_offset;
extern unsigned labelNo, tmpNo, varNo;
char headMipsCode[] = ".data\n_prompt: .asciiz \"Enter an integer:\"\n_ret: .asciiz \"\\n\"\n.globl main\n\
.text\nread:\n  li $v0, 4\n  la $a0, _prompt\n  syscall\n  li $v0, 5\n  syscall\n  jr $ra\n\n\
write:\n  li $v0, 1\n  syscall\n  li $v0, 4\n  la $a0, _ret\n  syscall\n  move $v0, $0\n  jr $ra\n";
enum _RELOPTYPE{EQ, NEQ, GT, LT, GE, LE};

void initMipGen(){
    var_offset = (int*)malloc(sizeof(int) * varNo);
    tmp_offset = (int*)malloc(sizeof(int) * tmpNo);
    for(int i = 0; i < varNo; i++)
        var_offset[i] = -1;
    for(int i = 0; i < tmpNo; i++)
        tmp_offset[i] = -1;
    #ifdef mipDebug
        printf("initMipGen completed\n");
    #endif
    return;
}

void MipGen(const char* dstFilePath){
    FILE* f = fopen(dstFilePath, "w");
    fprintf(f, "%s", headMipsCode);

    InterCodes* IRCode = IR_head->next;
    while(IRCode){
        switch(IRCode->code.kind){
            case I_ASSIGN:{
                Operand* leftOp = IRCode->code.u.assign.left;
                Operand* rightOp = IRCode->code.u.assign.right;
                switch(IRCode->code.action){
                    case DEFAULT:{ //a = b
                        int resOffset = findOffset(leftOp);
                        if(rightOp->kind == O_CONSTANT)
                            fprintf(f, "  li $t0, %d\n", rightOp->u.value);
                        else {
                            fprintf(f, "  lw $t1, -%d($fp)\n", findOffset(rightOp));
                            fprintf(f, "  move $t0, $t1\n");
                        }
                        saveReg(resOffset);
                    }
                    break;
                    case PTR: {//a = &b
                        int resOffset = findOffset(leftOp);
                        fprintf(f, "  addi $t0, $fp, -%d\n", findOffset(rightOp));
                        saveReg(resOffset);
                    }
                    break;
                    case RVAL: {//a = *b
                        int resOffset = findOffset(leftOp);
                        // if(rightOp->kind == O_CONSTANT)
                        //     fprintf(f, "  li $t1, %d\n", rightOp->u.value);
                        // else 
                            fprintf(f, "  lw $t1, -%d($fp)\n", findOffset(rightOp));
                        fprintf(f, "  lw $t0, 0($t1)\n");
                        saveReg(resOffset);
                    }
                    break;
                    case WVAL: {// *a = b
                        if(rightOp->kind == O_CONSTANT)
                            fprintf(f, "  li $t1, %d\n", rightOp->u.value);
                        else 
                            fprintf(f, "  lw $t1, -%d($fp)\n", findOffset(rightOp));
                        fprintf(f, "  lw $t0, -%d($fp)\n", findOffset(leftOp));
                        fprintf(f, "  sw $t1, 0($t0)\n");
                    }
                    break;
                    case COPY: //*a = *b
                        fprintf(f, "  lw $t0, -%d($fp)\n", findOffset(leftOp));
                        fprintf(f, "  lw $t1, -%d($fp)\n", findOffset(rightOp));
                        fprintf(f, "  lw $t1, 0($t1)\n");
                        fprintf(f, "  sw $t1, 0($t0)\n");
                    break;
                }
            }
            break;
            case I_ADD:{
                Operand *res = IRCode->code.u.binop.result;
                Operand *op1 = IRCode->code.u.binop.op1;
                Operand *op2 = IRCode->code.u.binop.op2;
                int resOffset = findOffset(res);
                if(IRCode->code.action == DEFAULT){
                    if(op1->kind == O_CONSTANT && op2->kind == O_CONSTANT){
                        fprintf(f, "  li $t1, %d\n", op1->u.value);
                        fprintf(f, "  addi $t0, $t1, %d\n", op2->u.value);
                    }
                    else if (op1->kind != O_CONSTANT && op2->kind != O_CONSTANT) {
                        fprintf(f, "  lw $t1, -%d($fp)\n", findOffset(op1));
                        fprintf(f, "  lw $t2, -%d($fp)\n", findOffset(op2));
                        fprintf(f, "  add $t0, $t1, $t2\n");
                    } else if (op1->kind == O_CONSTANT && op2->kind != O_CONSTANT) {
                        fprintf(f, "  li $t1, %d\n", op1->u.value);
                        fprintf(f, "  lw $t2, -%d($fp)\n", findOffset(op2));
                        fprintf(f, "  add $t0, $t1, $t2\n");
                    } else {
                        fprintf(f, "  lw $t1, -%d($fp)\n", findOffset(op1));
                        fprintf(f, "  addi $t0, $t1, %d\n", op2->u.value);
                    }
                }
                else if(IRCode->code.action == PTR)
                    if(op2->kind == O_CONSTANT){
                        int ptrOffset = op2->u.value - findOffset(op1);
                        fprintf(f, "  addi $t0, $fp, %d\n", ptrOffset);
                    }
                    else {
                        fprintf(f, "  addi $t1, $fp, -%d\n", findOffset(op1));
                        fprintf(f, "  lw $t2, -%d($fp)\n", findOffset(op2));
                        fprintf(f, "  add $t0, $t1, $t2\n");
                    }
                saveReg(resOffset);
            }
            break;
            case I_SUB:{
                Operand *res = IRCode->code.u.binop.result;
                Operand *op1 = IRCode->code.u.binop.op1;
                Operand *op2 = IRCode->code.u.binop.op2;
                int resOffset = findOffset(res);
                if(op1->kind == O_CONSTANT && op2->kind == O_CONSTANT){
                    fprintf(f, "  li $t1, %d\n", op1->u.value);
                    fprintf(f, "  addi $t0, $t1, %d\n", -op2->u.value);
                }
                else if (op1->kind != O_CONSTANT && op2->kind == O_CONSTANT) {
                    fprintf(f, "  lw $t1, -%d($fp)\n", findOffset(op1));
                    fprintf(f, "  addi $t0, $t1, %d\n", -op2->u.value);
                } else if (op1->kind == O_CONSTANT && op2->kind != O_CONSTANT) {
                    fprintf(f, "  li $t1, %d\n", op1->u.value);
                    fprintf(f, "  lw $t2, -%d($fp)\n", findOffset(op2));
                    fprintf(f, "  sub $t0, $t1, $t2\n");
                } else {
                    fprintf(f, "  lw $t1, -%d($fp)\n", findOffset(op1));
                    fprintf(f, "  lw $t2, -%d($fp)\n", findOffset(op2));
                    fprintf(f, "  sub $t0, $t1, $t2\n");
                }
                saveReg(resOffset);
            }
            break;
            case I_MUL:{
                Operand *res = IRCode->code.u.binop.result;
                Operand *op1 = IRCode->code.u.binop.op1;
                Operand *op2 = IRCode->code.u.binop.op2;
                int resOffset = findOffset(res);
                if(op1->kind == O_CONSTANT && op2->kind == O_CONSTANT){
                    fprintf(f, "  li $t1, %d\n", op1->u.value);
                    fprintf(f, "  li $t2, %d\n", op2->u.value);
                }
                if(op1->kind != O_CONSTANT && op2->kind != O_CONSTANT) {
                    fprintf(f, "  lw $t1, -%d($fp)\n", findOffset(op1));
                    fprintf(f, "  lw $t2, -%d($fp)\n", findOffset(op2));
                } else if(op1->kind == O_CONSTANT && op2->kind != O_CONSTANT) {
                    fprintf(f, "  li $t1, %d\n", op1->u.value);
                    fprintf(f, "  lw $t2, -%d($fp)\n", findOffset(op2));
                } else if(op1->kind != O_CONSTANT && op2->kind == O_CONSTANT){
                    fprintf(f, "  lw $t1, -%d($fp)\n", findOffset(op1));
                    fprintf(f, "  li $t2, %d\n", op2->u.value);
                }
                fprintf(f, "  mul $t0, $t1, $t2\n");
                saveReg(resOffset);
            }
            break;
            case I_DIV:{
                Operand *res = IRCode->code.u.binop.result;
                Operand *op1 = IRCode->code.u.binop.op1;
                Operand *op2 = IRCode->code.u.binop.op2;
                int resOffset = findOffset(res);
                if(op1->kind == O_CONSTANT && op2->kind == O_CONSTANT){
                    fprintf(f, "  li $t1, %d\n", op1->u.value);
                    fprintf(f, "  li $t2, %d\n", op2->u.value);
                }
                if (op1->kind != O_CONSTANT && op2->kind != O_CONSTANT) {
                    fprintf(f, "  lw $t1, -%d($fp)\n", findOffset(op1));
                    fprintf(f, "  lw $t2, -%d($fp)\n", findOffset(op2));
                } else if (op1->kind == O_CONSTANT && op2->kind != O_CONSTANT) {
                    fprintf(f, "  li $t1, %d\n", op1->u.value);
                    fprintf(f, "  lw $t2, -%d($fp)\n", findOffset(op2));
                } else {
                    fprintf(f, "  lw $t1, -%d($fp)\n", findOffset(op1));
                    fprintf(f, "  li $t2, %d\n", op2->u.value);
                }
                fprintf(f, "  div $t1, $t2\n");
                fprintf(f, "  mflo $t0\n");
                saveReg(resOffset);
            }
            break;
            case I_LABEL:{
                char s[128];
                printOperand(IRCode->code.u.sin.op, s);
                fprintf(f, "%s:\n", s);
            }
            break;
            case I_FUNCTION:{
                Operand *op = IRCode->code.u.sin.op;
                int stackSize = funcStackSpace(IRCode->next);
                if(!strcmp("main", op->u.name))
                    fprintf(f, "\n%s:\n", op->u.name);
                else 
                    fprintf(f, "\nfunc_%s:\n", op->u.name);
                fprintf(f, "  addi $sp, $sp, -4\n  sw $fp, 0($sp)\n  move $fp, $sp\n");
                fprintf(f, "  addi $sp, $sp, -%d\n", stackSize);
            }
            break;
            case I_IF:{
                Operand *op1 = IRCode->code.u.cond.op1;
                Operand *op2 = IRCode->code.u.cond.op2;
                Operand *targetOp = IRCode->code.u.cond.target;
                RELOPTYPE t = relopType(IRCode->code.u.cond.relop);
                char target[128];
                printOperand(targetOp, target);
                
                if(op1->kind == O_CONSTANT)
                    fprintf(f, "  li $t1, %d\n", op1->u.value);
                else
                    fprintf(f, "  lw $t1, -%d($fp)\n", findOffset(op1));
                if(op2->kind == O_CONSTANT)
                    fprintf(f, "  li $t2, %d\n", op2->u.value);
                else 
                    fprintf(f, "  lw $t2, -%d($fp)\n", findOffset(op2));
                
                switch(t){
                    case GT:
                        fprintf(f, "  bgt $t1, $t2, %s\n", target);
                    break;
                    case LT:
                        fprintf(f, "  blt $t1, $t2, %s\n", target);
                    break;
                    case GE:
                        fprintf(f, "  bge $t1, $t2, %s\n", target);
                    break;
                    case LE:
                        fprintf(f, "  ble $t1, $t2, %s\n", target);
                    break;
                    case EQ:
                        fprintf(f, "  beq $t1, $t2, %s\n", target);
                    break;
                    case NEQ:
                        fprintf(f, "  bne $t1, $t2, %s\n", target);
                    break;
                }
            }
            break;
            case I_GOTO:{
                char s[128];
                printOperand(IRCode->code.u.sin.op, s);
                fprintf(f, "  j %s\n", s);
            }
            break;
            case I_PARAMETER:{
                HashTable* func = hash_find(IRCode->prev->code.u.sin.op->u.name);
                // int i = 0;
                // Operand* param = IRCode->code.u.sin.op;
                // fprintf(f, "  lw $t0, %d($fp)\n", 8 + i * 4);
                // fprintf(f, "  sw $t0, -%d($fp)\n", findOffset(param));
                // do{
                //     i++;
                //     IRCode = IRCode->next;
                //     param = IRCode->code.u.sin.op;
                //     fprintf(f, "  lw $t0, %d($fp)\n", 8 + i * 4);
                //     fprintf(f, "  sw $t0, -%d($fp)\n", findOffset(param));
                // }while(i < func->type->u.function.argc);
                for(int i = 0; i < func->type->u.function.argc; i++){
                    Operand* param = IRCode->code.u.sin.op;
                    fprintf(f, "  lw $t0, %d($fp)\n", 8 + i * 4);
                    fprintf(f, "  sw $t0, -%d($fp)\n", findOffset(param));
                    IRCode = IRCode->next;
                }
                IRCode = IRCode->prev;
            }
            break;
            case I_CALL:{
                Operand *result = IRCode->code.u.sinop.result;
                Operand *op = IRCode->code.u.sinop.op;

                HashTable* func = hash_find(op->u.name);

                fprintf(f, "  addi $sp, $sp, -4\n  sw $ra, 0($sp)\n");
                fprintf(f, "  jal func_%s\n", op->u.name);
                fprintf(f, "  lw $ra, 0($sp)\n  addi $sp, $sp, 4\n");
                fprintf(f, "  sw $v0, -%d($fp)\n", findOffset(result));
                fprintf(f, "  addi $sp, $sp, %d\n", 4 * func->type->u.function.argc);
            }
            break;
            case I_ARG:{
                Operand *op = IRCode->code.u.sin.op;                
                fprintf(f, "  addi $sp, $sp, -4\n");
                if(op->kind == O_CONSTANT)
                    fprintf(f, "  li $t0, %d\n", op->u.value);
                else 
                    fprintf(f, "  lw $t0, -%d($fp)\n", findOffset(op));
                fprintf(f, "  sw $t0, 0($sp)\n");
            }
            break;
            case I_READ:{
                Operand *op = IRCode->code.u.sin.op;
                fprintf(f, "  addi $sp, $sp, -4\n  sw $ra, 0($sp)\n");
                fprintf(f, "  jal read\n  lw $ra, 0($sp)\n  addi $sp, $sp, 4\n");
                fprintf(f, "  sw $v0, -%d($fp)\n", findOffset(op));
            }
            break;
            case I_WRITE:{
                Operand *op = IRCode->code.u.sin.op;
                if(op->kind == O_CONSTANT)
                    fprintf(f, "  li $a0, %d\n", op->u.value);
                else 
                    fprintf(f, "  lw $a0, -%d($fp)\n", findOffset(op));
                fprintf(f, "  addi $sp, $sp, -4\n  sw $ra, 0($sp)\n");
                fprintf(f, "  jal write\n  lw $ra, 0($sp)\n  addi $sp, $sp, 4\n");
            }
            break;
            case I_RETURN:{
                Operand *op = IRCode->code.u.sin.op;
                if(op->kind == O_CONSTANT)
                    fprintf(f, "  li $v0, %d\n", op->u.value);
                else 
                    fprintf(f, "  lw $v0, -%d($fp)\n", findOffset(op));
                fprintf(f, "  addi $sp, $fp, 4\n  lw $fp, 0($fp)\n");
                fprintf(f, "  jr $ra\n");
            }
            break;
            case I_DECLEAR:{
                ;
            }
            break;
            default:;
        }
        IRCode = IRCode->next;
    }
    fclose(f);
    return;
}

int funcStackSpace(InterCodes *IRCodes){
    int base = 4;
    InterCodes *p = IRCodes;
    while(p && p->code.kind != I_FUNCTION){
        switch(p->code.kind){
            case I_ASSIGN:
                base += opStackSpace(p->code.u.assign.left, base);
                base += opStackSpace(p->code.u.assign.right, base);
            break;
            case I_ADD:
            case I_SUB:
            case I_MUL:
            case I_DIV:
                base += opStackSpace(p->code.u.binop.op1, base);
                base += opStackSpace(p->code.u.binop.op2, base);
                base += opStackSpace(p->code.u.binop.result, base);
            break;
            case I_LABEL:

            break;
            // case I_FUNCTION:
            
            // break;
            case I_IF:
                base += opStackSpace(p->code.u.cond.op1, base);
                base += opStackSpace(p->code.u.cond.op2, base);
            break;
            case I_GOTO:

            break;
            case I_CALL:
                base += opStackSpace(p->code.u.sinop.result, base);
            break;
            case I_ARG:
            case I_READ:
            case I_WRITE:
            case I_RETURN:
            case I_PARAMETER:
                base += opStackSpace(p->code.u.sin.op, base);
            break;
            case I_DECLEAR:
                if(var_offset[p->code.u.dec.op->u.var_no] == -1){
                    base += p->code.u.dec.size;
                    var_offset[p->code.u.dec.op->u.var_no] = base - 4;
                }
            break;
            default:;
        }
        p = p->next;
    }
    return base - 4;
}

int opStackSpace(Operand* op, int base){
    int *offset = NULL;
    if(op->kind == O_TEMPVAR)
        offset = tmp_offset;
    else if(op->kind == O_VARIABLE || op->kind == O_PARAMETER){
        offset = var_offset;
    }

    if(offset && offset[op->u.var_no] == -1){
        offset[op->u.var_no] = base;
        return 4;
    }
    return 0;
}


int findOffset(Operand* op){
    int *offset = var_offset;
    if(op->kind == O_TEMPVAR)
        offset = tmp_offset;
    return offset[op->u.var_no];
}

int relopType(const char* s){
    if (!strcmp(">", s))
        return GT;
    if (!strcmp("<", s))
        return LT;
    if (!strcmp(">=", s))
        return GE;
    if (!strcmp("<=", s))
        return LE;
    if (!strcmp("==", s))
        return EQ;
    if (!strcmp("!=", s))
        return NEQ;
    char error[128];
    sprintf(error, "%s", s);
    warnHandle(error);

}

void warnHandle(const char* s){
    printf("WARNING: %s.\n", s);
}