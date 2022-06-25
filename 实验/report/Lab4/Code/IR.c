#include "IR.h"
//#define IR_DEBUG
//#define IR_PRINT_DEBUG
//#define IR_CHKVAL
#define optimize

bool IRFlag = true;
Operand *C_ZERO, *C_ONE, *C_FOUR;
unsigned labelNo = 1, tmpNo = 1, varNo = 1;

void init_IR(){
    IR_tail = IR_head = (InterCodes*)malloc(sizeof(InterCodes));
    IR_head->prev = IR_head->next = NULL;
    C_ZERO = (Operand*)malloc(sizeof(Operand));
    C_ONE = (Operand*)malloc(sizeof(Operand));
    C_FOUR = (Operand*)malloc(sizeof(Operand));
    C_ZERO->kind = C_ONE->kind =C_FOUR->kind = O_CONSTANT;
    C_ZERO->u.value = 0;
    C_ONE->u.value = 1;
    C_FOUR->u.value = 4;
    return;
}

void init_Var(){
    #ifdef IR_DEBUG
    printf("init_Var started\n");
    #endif
    for(int i = 0; i <= HASHSIZE; i++){
        HashTable* t = hashTable[i];
        while(t){
            if(t->type->kind != sFUNCTION && t->type->kind != sSTRUCTURE){
                Operand* operand = (Operand*)malloc(sizeof(Operand));
                operand->kind = O_VARIABLE;
                if(t->type->kind == sARRAY || t->type->kind == sSTRUCTVAR){
                    operand->addrType = ADDRESS;
                    t->size = init_Size(t->type);
                }
                else 
                    operand->addrType = VAL;
                operand->u.var_no = varNo++;
                t->operand = operand;
            }
            t = t->next;
        }
    }
    #ifdef IR_DEBUG
    printf("init_Var completeted\n");
    #endif
    return;
}

unsigned init_Size(sType *type){
    if(type->kind == sINT)
        return 4;
     else if(type->kind == sARRAY) {
        unsigned size = type->u.array.size * init_Size(type->u.array.elem);
        type->u.array.size = size / type->u.array.size;
        return size;
    }
    else if(type->kind == sSTRUCTVAR){
        FieldList *structField = type->u.structVar;
        unsigned sizeSum = 0;
        while(structField){
            sizeSum += init_Size(structField->type);
            structField = structField->tail;
        }
        return sizeSum;
    }
    else {
        printf("IR-init_Size: Unhandled Type Number %d\n", type->kind);
        exit(-1);
    }
}

void IR_Program(Node* node){
    //printf("IR_Program is not finished.\n");
    if(node->smtmType == 1)
        IR_ExtDefList(node->child);
    return;
}
void IR_ExtDefList(Node* node){
    //printf("IR_ExtDefList is not finished.\n");
    //ExtDefList -> null
    if(node->smtmType == 1)
        ;
    //ExtDefList -> ExtDef ExtDefList
    else if(node->smtmType == 2){
        #ifdef IR_DEBUG
            fprintf(stderr, "IR_ExtDefList 2...\n");
        #endif
        IR_ExtDef(node->child);
        IR_ExtDefList(node->child->next);
    };
    return;
}

void IR_Specifier(Node *node){
    printf("IR_Specifier is not finished.\n");
    return;
}

void IR_ExtDecList(Node *node){
    printf("IR_ExtDecList is not finished.\n");
    return;
}

void IR_ExtDef(Node *node){
    //printf("IR_ExtDef is not finished.\n");
    #ifdef IR_DEBUG
        fprintf(stderr, "IR_ExtDef %d...\n", node->smtmType);
    #endif
    //ExtDef -> Specifier ExtDecList SEMI
    if(node->smtmType == 1){
        printf("!This testcase has GLOBAL VARIABLE, which is not in law according to hypothesis 4\n");
        exit(-1);
    }
    //ExtDef -> Specifier SEMI
    else if(node->smtmType == 2){
        ;
    }
    //ExtDef -> Specifier FunDec CompSt
    else if(node->smtmType == 3){
        IR_FunDec(node->child->next);
        IR_CompSt(node->child->next->next);
    }
    return;
}

void IR_FunDec(Node *node){
    //printf("IR_FunDec is not finished.\n");
    #ifdef IR_DEBUG
        fprintf(stderr, "IR_FunDec %d...\n", node->smtmType);
    #endif    

    Operand *func = (Operand*)malloc(sizeof(Operand));
    func->kind = O_FUNCTION;
    func->u.name = node->child->val.strVal;
    add_InterCode(SIN, I_FUNCTION, func);

    //FunDec -> ID LP VarList RP
    if(node->smtmType == 1){
        IR_VarList(node->child->next->next, true);
    }
    //FunDec -> ID LP RP
    else if(node->smtmType == 2){
        ;
    }
    return;
}

void IR_VarList(Node *node, bool funcFlag){
    //printf("IR_VarList is not finished.\n");
    #ifdef IR_DEBUG
        fprintf(stderr, "IR_VarList %d...\n", node->smtmType);
    #endif    
    IR_ParamDec(node->child, funcFlag);
    //VarList -> ParamDec COMMA VarList
    if(node->smtmType == 1){
        IR_VarList(node->child->next->next, funcFlag);
    }
    //VarList -> ParamDec
    else if(node->smtmType == 2){
        ;
    }
    return;
}

void IR_ParamDec(Node *node, bool funcFlag){
    //printf("IR_ParamDec is not finished.\n");
    //ParamDec -> Specifier VarDec
    #ifdef IR_DEBUG
        fprintf(stderr, "IR_ParamDec %d...\n", node->smtmType);
    #endif
    IR_VarDec(node->child->next, false, funcFlag);
    return;
}

void IR_CompSt(Node *node){
    #ifdef IR_DEBUG
        fprintf(stderr, "IR_CompSt %d...\n", node->smtmType);
    #endif  
    //printf("IR_CompSt is not finished.\n");
    //CompSt ->LC DefList StmtList RC
    if(node->smtmType == 1){
        IR_DefList(node->child->next);
        IR_StmtList(node->child->next->next);
    }
    return;
}

void IR_StructSpecifier(Node *node){
    printf("IR_StructSpecifier is not finished.\n");
    return;
}

void IR_OptTag(Node *node){
    printf("IR_OptTag is not finished.\n");
    return;
}

void IR_Tag(Node *node){
    printf("IR_Tag is not finished.\n");
    return;
}

void IR_VarDec(Node *node, bool structFlag, bool funcFlag){
    //printf("IR_VarDec is not finished.\n");
    #ifdef IR_DEBUG
        fprintf(stderr, "IR_VarDec %d...\n", node->smtmType);
    #endif  
     //VarDec -> ID
    if(node->smtmType == 1){
        if(structFlag){
            HashTable* strct = hash_find(node->child->val.strVal);
            add_InterCode(DEC ,strct->operand, strct->size);
        }
        else if(funcFlag){
            HashTable* func = hash_find(node->child->val.strVal);
            func->operand->kind = O_PARAMETER;
            add_InterCode(SIN, I_PARAMETER, func->operand);
        }
    }
    //VarDec -> VarDec LB INT RB
    else if(node->smtmType == 2){
        if(node->child->smtmType == 1){
            HashTable* array = hash_find(node->child->child->val.strVal);
            if(funcFlag){
                array->operand->addrType = VAL;
                add_InterCode(SIN, I_PARAMETER, array->operand);
            }
            else 
                add_InterCode(DEC, array->operand, array->size);
        }
        else {
            //printf("IR_VarDec: nested array\n");
            //exit(-1);
            Node *VarDec = node->child;
            while(VarDec->smtmType != 1)
                VarDec = VarDec->child;
            HashTable* array = hash_find(VarDec->child->val.strVal);
            if(funcFlag){
                add_InterCode(SIN, I_PARAMETER, array->operand);
            }
            else 
                add_InterCode(DEC, array->operand, array->size);
        }
    }
    return;
}

void IR_DefList(Node *node){
    //printf("IR_DefList is not finished.\n");
    //DefList -> Def DefList
    #ifdef IR_DEBUG
        fprintf(stderr, "IR_DefList %d...\n", node->smtmType);
    #endif  
    if(node->smtmType == 1){
        IR_Def(node->child);
        IR_DefList(node->child->next);
    }
    //DefList -> null
    return;
}

void IR_Def(Node *node){
    //printf("IR_Def is not finished.\n");
    #ifdef IR_DEBUG
        fprintf(stderr, "IR_Def %d...\n", node->smtmType);
    #endif  
    //Def -> Specifier DecList SEMI
    if(node->smtmType == 1){
        IR_DecList(node->child->next, node->child->syn->type->kind == sSTRUCTURE);
    }
    return;
}

void IR_DecList(Node *node, bool structFlag){
    //printf("IR_DecList is not finished.\n");
    #ifdef IR_DEBUG
        fprintf(stderr, "IR_DecList %d...\n", node->smtmType);
    #endif  
    //DecList -> Dec
    if(node->smtmType == 1){
        IR_Dec(node->child, structFlag);
    }
    //DecList -> Dec COMMA DecList
    else if(node->smtmType == 2){
        IR_Dec(node->child, structFlag);
        IR_DecList(node->child->next->next, structFlag);        
    }
    return;
}

void IR_Dec(Node *node, bool structFlag){
    //printf("IR_Dec is not finished.\n");
    #ifdef IR_DEBUG
        fprintf(stderr, "IR_Dec %d...\n", node->smtmType);
    #endif
    IR_VarDec(node->child, structFlag, false);
    //Dec -> VarDec
    if(node->smtmType == 1){
        ;
    }
    //Dec -> VarDec ASSIGNOP Exp
    else if(node->smtmType == 2){
        Node* VarDec = node->child;
        //VarDec -> ID
        if(VarDec->smtmType == 1){
            HashTable *res = hash_find(VarDec->child->val.strVal);
            Operand *t1 = create_Op(O_TEMPVAR, VAL);
            Exp_optimizer(node->child->next->next, t1);
            add_InterCode(ASSIGN, DEFAULT, res->operand, t1);
        }
        //VarDec -> VarDec LB INT RB
        else if(VarDec->smtmType == 2){
            if(node->child->next->next->syn->type->kind == sARRAY){
                Operand* t1 = create_Op(O_TEMPVAR, ADDRESS);
                IR_Exp(node->child->next->next, t1);

                HashTable* array = hash_find(VarDec->child->child->val.strVal);
                unsigned leftSize = array->type->u.array.size;
                unsigned rightSize = node->child->next->next->syn->type->u.array.size;
                unsigned size = leftSize > rightSize ? rightSize : leftSize;
                if(size > 0) {
                    Operand *t2 = create_Op(O_TEMPVAR, ADDRESS);
                    add_InterCode(ASSIGN, PTR, t2, array->operand);
                    add_InterCode(ASSIGN, COPY, t2, t1);
                    for(unsigned i = 0; i < size; i++){
                        add_InterCode(BINOP, I_ADD, DEFAULT, t2, t2, C_FOUR);
                        add_InterCode(BINOP, I_ADD, DEFAULT, t1, t1, C_FOUR);
                        add_InterCode(ASSIGN, COPY, t2, t1);
                    }
                }
            }
        }
    }
    return;
}

void IR_StmtList(Node *node){
    //printf("IR_StmtList is not finished.\n");
    #ifdef IR_DEBUG
        fprintf(stderr, "IR_StmtList %d...\n", node->smtmType);
    #endif
    //StmtList -> Stmt StmtList
    if(node->smtmType == 1){
        IR_Stmt(node->child);
        IR_StmtList(node->child->next);
    }
    //StmtList -> null
    else if(node->smtmType == 2){
        ;
    }
    return;
}

void IR_Stmt(Node *node){
    //printf("IR_Stmt is not finished.\n");
    #ifdef IR_DEBUG
        fprintf(stderr, "IR_Stmt %d...\n", node->smtmType);
    #endif
    //Stmt -> Exp SEMI
    if(node->smtmType == 1){
        IR_Exp(node->child, NULL);
    }
    //Stmt -> CompSt
    else if(node->smtmType == 2){
        IR_CompSt(node->child);
    }
    //Stmt -> RETURN Exp SEMI
    else if(node->smtmType == 3){
        Operand* t1 = create_Op(O_TEMPVAR, VAL);
        Exp_optimizer(node->child->next, t1);
        add_InterCode(SIN, I_RETURN, t1);
    }
    //Stmt -> IF LP Exp RP Stmt
    else if(node->smtmType == 4){
        Operand* label1 = create_Op(O_LABEL);
        Operand* label2 = create_Op(O_LABEL);
        IR_Conds(node->child->next->next, label1, label2);
        add_InterCode(SIN, I_LABEL, label1);
        IR_Stmt(node->child->next->next->next->next);
        add_InterCode(SIN, I_LABEL, label2);
    }
    //Stmt -> IF LP Exp RP Stmt ELSE Stmt
    else if(node->smtmType == 5){
        Operand* label1 = create_Op(O_LABEL);
        Operand* label2 = create_Op(O_LABEL);
        Operand* label3 = create_Op(O_LABEL);
        IR_Conds(node->child->next->next, label1, label2);
        add_InterCode(SIN, I_LABEL, label1);
        IR_Stmt(node->child->next->next->next->next);
        add_InterCode(SIN, I_GOTO, label3);
        add_InterCode(SIN, I_LABEL, label2);
        IR_Stmt(node->child->next->next->next->next->next->next);
        add_InterCode(SIN, I_LABEL, label3);
    }
    //Stmt -> WHILE LP Exp RP Stmt
    else if(node->smtmType == 6){
        Operand* label1 = create_Op(O_LABEL);
        Operand* label2 = create_Op(O_LABEL);
        Operand* label3 = create_Op(O_LABEL);
        add_InterCode(SIN, I_LABEL, label1);
        IR_Conds(node->child->next->next, label2, label3);
        add_InterCode(SIN, I_LABEL, label2);
        IR_Stmt(node->child->next->next->next->next);
        add_InterCode(SIN, I_GOTO, label1);
        add_InterCode(SIN, I_LABEL, label3);
    }
    return;
}

void IR_Exp(Node *node, Operand *place){
    //printf("IR_Exp is not finished.\n");
    #ifdef IR_DEBUG
        fprintf(stderr, "IR_Exp %d...\n", node->smtmType);
    #endif
    //Exp -> Exp ASSIGNOP Exp
    if(node->smtmType == 1){
        Node *Exp1 = node->child;
        Node* Exp2 = node->child->next->next;
        #ifdef IR_DEBUG
            printf("Exp1->Exp%d\n", Exp1->smtmType);
            printf("Exp2->Exp%d\n", Exp2->smtmType);
        #endif
        if(Exp1->smtmType == 14){
            //Exp -> Exp LB Exp RB
            Operand* t1 = create_Op(O_TEMPVAR, ADDRESS);
            IR_Exp(Exp1, t1);
            Operand* t2 = create_Op(O_TEMPVAR, VAL);
            if(Exp2->syn->type->kind != sINT)
                t2->addrType == ADDRESS;
            Exp_optimizer(Exp2, t2);
            if(t2->addrType == VAL)
                add_InterCode(ASSIGN, WVAL, t1, t2);
            else if(t2->addrType == ADDRESS) {
                if(Exp2->syn->type->kind == sARRAY){
                    printf("IR: Exp ASSIGNOP (Exp LB Exp(ARRAY) RB)\n");
                    exit(-1);
                } else {
                    printf("IR: Assign of structure\n");
                    exit(-1);
                }
            }
            if(place) {
                if(place->addrType == VAL)
                    add_InterCode(ASSIGN, RVAL, place, t1);
                else if(place->addrType == ADDRESS)
                    add_InterCode(ASSIGN, DEFAULT, place, t1);
            }

        }
        else if(Exp1->smtmType == 15){
            //Exp -> Exp DOT ID   
            Operand *t1 = create_Op(O_TEMPVAR, ADDRESS);
            IR_Exp(Exp1, t1);
            Operand *t2 = create_Op(O_TEMPVAR, VAL);
            if(Exp2->syn->type->kind != sINT)
                t2->addrType = ADDRESS;
            Exp_optimizer(Exp2, t2);
            if(t2->addrType == VAL)
                add_InterCode(ASSIGN, WVAL, t1, t2);
            else if(t2->addrType == ADDRESS){
                if(Exp1->syn->type->kind == sARRAY && 
                    Exp1->syn->type->u.array.elem->kind == sINT){
                    unsigned leftSize = Exp1->syn->type->u.array.size;
                    unsigned rightSize =Exp2->syn->type->u.array.size;
                    unsigned size = leftSize > rightSize ? rightSize : leftSize;
                    if (size > 0) {
                        add_InterCode(ASSIGN, COPY, t1, t2);
                        for (unsigned i = 1; i < size; i++) {
                            add_InterCode(BINOP, I_ADD, DEFAULT, t1, t1, C_FOUR);
                            add_InterCode(BINOP, I_ADD, DEFAULT, t2, t2, C_FOUR);
                            add_InterCode(ASSIGN, COPY, t1, t2);
                        }
                        if (size > 1 && place) {
                            Operand* Const = (Operand*)malloc(sizeof(Operand));
                            Const->kind = O_CONSTANT;
                            Const->u.value = 4 * (size - 1);
                            add_InterCode(BINOP, I_SUB, DEFAULT, t1, t1, Const);
                        }
                    }
                }
                else {
                    printf("IR_Exp: Assignment of structure\n");
                    exit(-1);
                }
            }
            if(place){
                if(place->addrType == VAL)
                    add_InterCode(ASSIGN, RVAL, place, t1);
                else if(place->addrType == ADDRESS)
                    add_InterCode(ASSIGN, DEFAULT, place, t1);
            }
        }
        else if(Exp1->smtmType == 16){
            //Exp -> ID
            HashTable *id = hash_find(Exp1->child->val.strVal);
            Operand *t1 = create_Op(O_TEMPVAR, VAL);
            if(Exp2->syn->type->kind != sINT)
                t1->addrType = ADDRESS;
            Exp_optimizer(Exp2, t1);
            if(id->operand->addrType == VAL)
                add_InterCode(ASSIGN, DEFAULT, id->operand, t1);
            else if(id->operand->addrType == ADDRESS){
                if(Exp2->syn->type->kind == sARRAY){
                    if(Exp2->syn->type->u.array.elem->kind == sINT){
                        unsigned leftSize = id->type->u.array.size;
                        unsigned rightSize = Exp2->syn->type->u.array.size;
                        unsigned size = leftSize > rightSize ? rightSize : leftSize;
                        if(size > 0){
                            Operand* t2 = create_Op(O_TEMPVAR, ADDRESS);
                            if(id->operand->kind == O_VARIABLE)
                                add_InterCode(ASSIGN, PTR, t2, id->operand);
                            else 
                                add_InterCode(ASSIGN,DEFAULT, t2, id->operand);
                            add_InterCode(ASSIGN, COPY, t2, t1);
                            for(unsigned i = 1; i < size; i++){
                                add_InterCode(BINOP, I_ADD, DEFAULT, t2, t2, C_FOUR);
                                add_InterCode(BINOP, I_ADD, DEFAULT, t1, t1, C_FOUR);
                                add_InterCode(ASSIGN, COPY, t2, t1);
                            }
                        }
                    }
                    else {
                        printf("Array type is not sINT, which is not in law with hypo1\n");
                        exit(-1);
                    }
                }
            }
            if(place)
                add_InterCode(ASSIGN, DEFAULT, place, id->operand);
        }
    }
    //Exp -> Exp AND Exp
    //          | Exp OR Exp
    //          | Exp RELOP Exp
    //          | NOT Exp
    else if(node->smtmType == 2 || node->smtmType == 3
        || node->smtmType == 4 || node->smtmType == 11){
        Operand* label1 = create_Op(O_LABEL);
        Operand* label2 = create_Op(O_LABEL);
        if(place)
            add_InterCode(ASSIGN, DEFAULT, place, C_ZERO);
        IR_Conds(node, label1, label2);
        add_InterCode(SIN, I_LABEL, label1);
        if(place)
            add_InterCode(ASSIGN, DEFAULT, place, C_ONE);
        add_InterCode(SIN, I_LABEL, label2);
    }
    //Exp -> Exp PLUS Exp
    //          | Exp MINUS Exp
    //          | Exp STAR Exp
    //          | Exp DIV Exp
    else if(node->smtmType == 5 || node->smtmType == 6 || node->smtmType == 7
                || node->smtmType == 8){
        Operand *t1 = create_Op(O_TEMPVAR, VAL);
        Operand *t2 = create_Op(O_TEMPVAR, VAL);
        Exp_optimizer(node->child, t1);
        Exp_optimizer(node->child->next->next, t2);
        #ifdef optimize 
            if(place){
                if(t1->kind == t2->kind && t2->kind == O_CONSTANT){
                    int res = 0;
                    switch(node->smtmType){
                        case 5:
                            res = t1->u.value + t2->u.value;
                        break;
                        case 6:
                            res = t1->u.value - t2->u.value;
                        break;
                        case 7:
                            res = t1->u.value * t2->u.value;
                        break;
                        case 8:
                            res = t1->u.value / t2->u.value;
                        break;
                    }
                    free(place);
                    place = create_Op(O_CONSTANT, res);
                }
                else 
                    switch(node->smtmType){
                        case 5:
                            add_InterCode(BINOP, I_ADD, DEFAULT, place, t1, t2);
                        break;
                        case 6:
                            add_InterCode(BINOP, I_SUB, DEFAULT, place, t1, t2);
                        break;
                        case 7:
                            add_InterCode(BINOP, I_MUL, DEFAULT, place, t1, t2);
                        break;
                        case 8:
                            add_InterCode(BINOP, I_DIV, DEFAULT, place, t1, t2);
                        break;
                }
            }
        #else 
            if(place)
                switch(node->smtmType){
                    case 5:
                        add_InterCode(BINOP, I_ADD, DEFAULT, place, t1, t2);
                    break;
                    case 6:
                        add_InterCode(BINOP, I_SUB, DEFAULT, place, t1, t2);
                    break;
                    case 7:
                        add_InterCode(BINOP, I_MUL, DEFAULT, place, t1, t2);
                    break;
                    case 8:
                        add_InterCode(BINOP, I_DIV, DEFAULT, place, t1, t2);
                    break;
                }
            #endif
    }
    //Exp -> LP Exp RP
    else if(node->smtmType == 9){
        IR_Exp(node->child->next, place);
    }
    //Exp -> MINUS Exp
    else if(node->smtmType == 10){
        Operand* t1 = create_Op(O_TEMPVAR, VAL);
        Exp_optimizer(node->child->next, t1);
        if(place){
            #ifdef optimize
                if(t1->kind == O_CONSTANT){
                    free(place);
                    place = create_Op(O_CONSTANT, -t1->u.value);
                }
                else 
                    add_InterCode(BINOP, I_SUB, DEFAULT, place, C_ZERO, t1);
            #else 
                add_InterCode(BINOP, I_SUB, DEFAULT, place, C_ZERO, t1);
            #endif
        }
    }
    //Exp -> ID LP Args RP
    else if(node->smtmType == 12){
        HashTable* func = hash_find(node->child->val.strVal);
        int argc = func->type->u.function.argc;
        Operand* arg_list[argc];
        IR_Args(node->child->next->next, arg_list, argc - 1);
        if (!strcmp(func->name, "write")) {
            add_InterCode(SIN, I_WRITE, arg_list[0]);
            if (place)
                add_InterCode(ASSIGN, DEFAULT, place, C_ZERO);
        } else {
            for (int i = 0; i < argc; i++) {
                add_InterCode(SIN, I_ARG, arg_list[i]);
            }
            Operand* oFunc = (Operand*)malloc(sizeof(Operand));
            oFunc->kind = O_FUNCTION;
            oFunc->u.name = func->name;
            if (place)
                add_InterCode(SINOP, I_CALL, place, oFunc);
            else {
                Operand* t1 = create_Op(O_TEMPVAR, VAL);
                add_InterCode(SINOP, I_CALL, t1, oFunc);
            }
        }
    }
    //Exp -> ID LP RP
    else if(node->smtmType == 13){
        HashTable* func = hash_find(node->child->val.strVal);
        if (!strcmp(func->name, "read")) {
            if (place)
                add_InterCode(SIN, I_READ, place);
            else {
                Operand* t1 = create_Op(O_TEMPVAR, VAL);
                add_InterCode(SIN, I_READ, t1);
            }
        } else {
            Operand* o_func = (Operand*)malloc(sizeof(Operand));
            o_func->kind = O_FUNCTION;
            o_func->u.name = func->name;
            if (place)
                add_InterCode(SINOP, I_CALL, place, o_func);
            else {
                Operand* t1 = create_Op(O_TEMPVAR, VAL);
                add_InterCode(SINOP, I_CALL, t1, o_func);
            }
        }
    }
    //Exp -> Exp LB Exp RB
    else if(node->smtmType == 14){
        Node* Exp1 = node->child, *Exp2 = node->child->next->next;
        if (Exp1->smtmType == 16) {
            //Exp1 -> ID
            HashTable* array = hash_find(Exp1->child->val.strVal);
            Operand* t1 = create_Op(O_TEMPVAR, VAL);
            Exp_optimizer(Exp2, t1);
            Operand* oSize = (Operand*)malloc(sizeof(Operand));
            oSize->kind = O_CONSTANT;
            sType* arrayType = array->type;
            if(arrayType->u.array.elem->kind == sSTRUCTVAR){
                oSize->u.value = init_Size(arrayType->u.array.elem);
            }
            else if(arrayType->u.array.elem->kind != sARRAY)
                oSize->u.value = 4;
            else 
                oSize->u.value = arrayType->u.array.size;
            Operand* t2 = create_Op(O_TEMPVAR, VAL);
            add_InterCode(BINOP, I_MUL, DEFAULT, t2, t1, oSize);
            if (place) {
                if (place->addrType == VAL) {
                    Operand* t3 = create_Op(O_TEMPVAR, ADDRESS);
                    if (array->operand->kind == O_VARIABLE) {
                        if(array->operand->addrType == ADDRESS)
                            add_InterCode(BINOP, I_ADD, PTR, t3, array->operand, t2);
                        else 
                            add_InterCode(BINOP, I_ADD, DEFAULT, t3, array->operand, t2);
                    } 
                    else {
                        add_InterCode(BINOP, I_ADD, DEFAULT, t3, array->operand, t2);
                    }
                    add_InterCode(ASSIGN, RVAL, place, t3);
                } 
                else {
                    if (array->operand->kind == O_VARIABLE)
                        if(array->operand->addrType == ADDRESS)
                            add_InterCode(BINOP, I_ADD, PTR, place, array->operand, t2);
                        else 
                            add_InterCode(BINOP, I_ADD, DEFAULT, place, array->operand, t2);
                            
                    else
                        add_InterCode(BINOP, I_ADD, DEFAULT, place, array->operand, t2);
                }
            }
        } 
        else {
            if (node->child->smtmType == 14) {
                //printf("IR_Exp: nested arrays\n");
                Node * p = node;
                HashTable *array = NULL;
                while(p->smtmType != 16)
                    p = p->child;
                array = hash_find(p->child->val.strVal);
                p = node;
                sType *arrayType = array->type;
                Operand* t1 = create_Op(O_TEMPVAR, VAL);
                add_InterCode(ASSIGN, DEFAULT, t1, C_ZERO);
                ArrayIndex* indexList = (ArrayIndex*)malloc(sizeof(ArrayIndex));
                indexList->operand = NULL; indexList->next = NULL;

                while(p->smtmType == 14){
                    Operand* t = create_Op(O_TEMPVAR, VAL);
                    IR_Exp(p->child->next->next, t);
                    ArrayIndex* index = (ArrayIndex*)malloc(sizeof(ArrayIndex));
                    index->operand = t; index->next = indexList;
                    indexList = index;
                    p = p->child;
                }
                while(indexList->operand != NULL){
                    if(arrayType == NULL){
                        printf("IR_Exp14: nested array exceeds defined depth\n");
                        exit(-1);
                    }
                    Operand *size = create_Op(O_CONSTANT, arrayType->u.array.size);
                    Operand *t = indexList->operand;
                    add_InterCode(BINOP, I_MUL, DEFAULT, t, t, size);
                    add_InterCode(BINOP, I_ADD, DEFAULT, t1, t1, t);
                    arrayType = arrayType->u.array.elem;
                    indexList = indexList->next;
                }
                //p -> ID
                if(p->smtmType == 16){
                   // Operand *eleSize = create_Op(O_CONSTANT, arrayType->u.array.size);
                    //add_InterCode(BINOP, I_MUL, DEFAULT, t1, t1, C_FOUR);
                    if (place) {
                        if (place->addrType == VAL) {
                            Operand* t3 = create_Op(O_TEMPVAR, ADDRESS);
                            if (array->operand->kind == O_VARIABLE) {
                                add_InterCode(BINOP, I_ADD, PTR, t3, array->operand, t1);
                            } else {
                                add_InterCode(BINOP, I_ADD, DEFAULT, t3, array->operand, t1);
                            }
                            add_InterCode(ASSIGN, RVAL, place, t3);
                        } else {
                            if (array->operand->kind == O_VARIABLE)
                                add_InterCode(BINOP, I_ADD, PTR, place, array->operand, t1);
                            else
                                add_InterCode(BINOP, I_ADD, DEFAULT, place, array->operand, t1);
                        }
                    }
                }
                else {
                    printf("IR_Exp14: Unhandled expression like (Exp but not ID)[(Exp)]\n");
                    exit(-1);
                }
                //exit(-1);
            }
            else {
                Operand* t0 = create_Op(O_TEMPVAR, ADDRESS);
                Exp_optimizer(node->child, t0);
                Operand* t1 = create_Op(O_TEMPVAR, VAL);
                Exp_optimizer(node->child->next->next, t1);
                HashTable* res = hash_find(node->child->syn->name);
                unsigned elemSize = res->size / node->child->syn->type->u.array.size;
                Operand* oSize = (Operand*)malloc(sizeof(Operand));
                oSize->kind = O_CONSTANT;
                oSize->u.value = elemSize;
                Operand* t2 = create_Op(O_TEMPVAR, VAL);
                add_InterCode(BINOP, I_MUL, DEFAULT, t2, t1, oSize);
                if (place) {
                    if (node->syn->type->kind == sINT) {
                        if (place->addrType == VAL) {
                            Operand* t3 = create_Op(O_TEMPVAR, ADDRESS);
                            add_InterCode(BINOP, I_ADD, DEFAULT, t3, t0, t2);
                            add_InterCode(ASSIGN, RVAL, place, t3);
                        } else {
                            add_InterCode(BINOP, I_ADD, DEFAULT, place, t0, t2);
                        }
                    } else {
                        add_InterCode(BINOP, I_ADD, DEFAULT, place, t0, t2);
                    }
                }
            }
        }
    }
    //Exp -> Exp DOT ID
    else if(node->smtmType == 15){
        if (!place)
            return;
        Node* Exp1 = node->child;
        if (Exp1->smtmType == 16) {
            HashTable* strct = hash_find(node->child->child->val.strVal);
            FieldList* field = strct->type->u.structVar;
            unsigned offset = 0;
            while (strcmp(field->name, node->child->next->next->val.strVal)) {
                HashTable* tmp = hash_find(field->name);
                offset += tmp->size;
                field = field->tail;
            }
            Operand* c = (Operand*)malloc(sizeof(Operand));
            c->kind = O_CONSTANT;
            c->u.value = offset;
            if (place) {
                if (place->addrType == VAL) {
                    Operand* t1 = create_Op(O_TEMPVAR, ADDRESS);
                    if (strct->operand->kind == O_VARIABLE)
                        add_InterCode(BINOP, I_ADD, PTR, t1, strct->operand, c);
                    else
                        add_InterCode(BINOP, I_ADD, DEFAULT, t1, strct->operand, c);
                    add_InterCode(ASSIGN, RVAL, place, t1);
                } else {
                    if (strct->operand->kind == O_VARIABLE)
                        add_InterCode(BINOP, I_ADD, PTR, place, strct->operand, c);
                    else
                        add_InterCode(BINOP, I_ADD, DEFAULT, place, strct->operand, c);
                }
            }
        } else {
            Operand* t0 = create_Op(O_TEMPVAR, ADDRESS);
            IR_Exp(Exp1, t0);
            FieldList* field = node->child->syn->type->u.structVar;
            unsigned offset = 0;
            while (strcmp(field->name, node->child->next->next->val.strVal)) {
                HashTable* tmp = hash_find(field->name);
                offset += tmp->size;
                field = field->tail;
            }
            Operand* c = (Operand*)malloc(sizeof(Operand));
            c->kind = O_CONSTANT;
            c->u.value = offset;
            if (place) {
                if (node->syn->type->kind == sINT) {
                    if (place->addrType == VAL) {
                        Operand* t1 = create_Op(O_TEMPVAR, ADDRESS);
                        add_InterCode(BINOP, I_ADD, DEFAULT, t1, t0, c);
                        add_InterCode(ASSIGN, RVAL, place, t1);
                    } else {
                        add_InterCode(BINOP, I_ADD, DEFAULT, place, t0, c);
                    }
                } else {
                    add_InterCode(BINOP, I_ADD, DEFAULT, place, t0, c);
                }
            }
        }
    }
    //Exp -> ID
    else if(node->smtmType == 16){
        if (place) {
            HashTable* id = hash_find(node->child->val.strVal);
            if (id->operand->addrType == VAL) {
                if (place->addrType == VAL || id->type->kind == sARRAY)
                    add_InterCode(ASSIGN, DEFAULT, place, id->operand);
                else {
                    add_InterCode(ASSIGN, WVAL, place, id->operand);
                }
            } 
            else {
                if (id->operand->kind == O_VARIABLE)
                    add_InterCode(ASSIGN, PTR, place, id->operand);
                else
                    add_InterCode(ASSIGN, DEFAULT, place, id->operand);
            }
        }
    }
    //Exp -> INT
    else if(node->smtmType == 17){
        if (place) {
            Operand* op = (Operand*)malloc(sizeof(Operand));
            op->kind = O_CONSTANT;
            op->u.value = node->child->val.intVal;
            #ifdef IR_CHKVAL
                printf("const operand created, val = %d\n", op->u.value);
            #endif
            add_InterCode(ASSIGN, DEFAULT, place, op);
        }
    }
    return;
}

void IR_Args(Node *node, Operand** argList, int i){
    //printf("IR_Args is not finished.\n");
    #ifdef IR_DEBUG
        fprintf(stderr, "IR_Args %d...\n", node->smtmType);
    #endif
    /*if(node->child->syn->type->kind == sARRAY){
        printf("IR_Args: Unhandled Array as Args\n");

        //exit(-1);
    }*/
    Operand* t1 = create_Op(O_TEMPVAR, VAL);
    if (node->child->syn->type->kind != sINT)
        t1->addrType = ADDRESS;
    //Args -> Exp COMMA Args
    if(node->smtmType == 1){
        IR_Args(node->child->next->next, argList, i - 1);
        Exp_optimizer(node->child, t1);
        argList[i] = t1;
        }
    //Args -> Exp
    else if(node->smtmType == 2){
        Exp_optimizer(node->child, t1);
        argList[i] = t1;
    }
    return;
}

void IR_Conds(Node* node, Operand* trueLabel, Operand* falseLable){
    #ifdef IR_DEBUG
        fprintf(stderr, "IR_Conds %d...\n", node->smtmType);
    #endif

    switch(node->smtmType){
        case 2: {
            // Exp AND Exp
            Operand* label1 = create_Op(O_LABEL);
            IR_Conds(node->child, label1, falseLable);
            add_InterCode(SIN, I_LABEL, label1);
            IR_Conds(node->child->next->next, trueLabel, falseLable);}
        break;
        case 3: {
            // Exp OR Exp
            Operand* label1 = create_Op(O_LABEL);
            IR_Conds(node->child, trueLabel, label1);
            add_InterCode(SIN, I_LABEL, label1);
            IR_Conds(node->child->next->next, trueLabel, falseLable);
        }
        break;
        case 4: {
            // Exp RELOP Exp
            Operand* t1 = create_Op(O_TEMPVAR, VAL);
            Operand* t2 = create_Op(O_TEMPVAR, VAL);
            Exp_optimizer(node->child, t1);
            Exp_optimizer(node->child->next->next, t2);
            add_InterCode(COND, t1, t2, trueLabel, node->child->next->val.strVal);
            add_InterCode(SIN, I_GOTO, falseLable);
        }
        break;
        case 11: {
            // NOT Exp
            IR_Conds(node->child->next, falseLable, trueLabel);
        }
        break;
        default: {
            //printf("cond %d at line %d, label %d\n", node->smtmType ,node->lineNum, falseLable->u.var_no);
            Operand* t1 = create_Op(O_TEMPVAR, VAL);
            Exp_optimizer(node, t1);
            add_InterCode(COND, t1, C_ZERO, trueLabel, "!=");
            add_InterCode(SIN ,I_GOTO, falseLable);
        }
        break;
    }
}

void add_InterCode(I_Type iType, ...){
    va_list paramList;
    va_start(paramList, iType);
    InterCodes* p = (InterCodes*)malloc(sizeof(InterCodes));
    switch(iType){
        case SIN:
            p->code.kind = va_arg(paramList, int);
            p->code.u.sin.op = va_arg(paramList, Operand*);
        break;
        case ASSIGN:
            p->code.kind = I_ASSIGN;
            p->code.action = va_arg(paramList, int);
            p->code.u.assign.left = va_arg(paramList, Operand*);
            p->code.u.assign.right = va_arg(paramList, Operand*);
        break;
        case BINOP:
            p->code.kind = va_arg(paramList, int);
            p->code.action = va_arg(paramList, int);
            p->code.u.binop.result = va_arg(paramList, Operand*);
            p->code.u.binop.op1 = va_arg(paramList, Operand*);
            p->code.u.binop.op2 = va_arg(paramList, Operand*);
        break;
        case SINOP:
            p->code.kind = va_arg(paramList, int);
            p->code.u.sinop.result = va_arg(paramList, Operand*);
            p->code.u.sinop.op = va_arg(paramList, Operand*);
        break;
        case DEC:
            p->code.kind = I_DECLEAR;
            p->code.u.dec.op = va_arg(paramList, Operand*);
            p->code.u.dec.size = va_arg(paramList, int);            
        break;
        case COND:
            p->code.kind = I_IF;
            p->code.u.cond.op1 = va_arg(paramList, Operand*);
            p->code.u.cond.op2 = va_arg(paramList, Operand*);
            p->code.u.cond.target = va_arg(paramList, Operand*);
            strcpy(p->code.u.cond.relop, va_arg(paramList, char*));
        break;
        default:
            printf("Unhandled case in add_InterCode: %d\n", iType);
            exit(-1);
    }
    p->next = NULL;
    p->prev = IR_tail;
    IR_tail->next = p;
    IR_tail = IR_tail->next;
    return;
}

Operand* create_Op(O_kind oKind, ...){
    va_list paramList;
    va_start(paramList, oKind);
    Operand* p = (Operand*)malloc(sizeof(Operand));
    
    switch(oKind){
        case O_TEMPVAR:
            p->kind = O_TEMPVAR;
            p->addrType = va_arg(paramList, int);
            p->u.var_no = tmpNo++;
        break;
        case O_LABEL:
            p->kind = O_LABEL;
            p->u.var_no = labelNo++;
        break;
        case O_CONSTANT:
            p->kind = O_CONSTANT;
            p->u.value = va_arg(paramList, int);
        break;
        default:
            printf("Unhandled case in create_Op: %d\n", oKind);
            exit(-1);
    }
    return p;
}

void printIRCode(const char* dstFilePath){
    #ifdef IR_PRINT_DEBUG
        printf("IRCode: \n");
    #endif
    FILE* file = fopen(dstFilePath, "w");
    InterCodes *p = IR_head->next;
    while(p){
        if(!p->isDelete)
        switch(p->code.kind){
            case I_ASSIGN:{
                #ifdef IR_PRINT_DEBUG
                    printf("I_ASSIGN\n");
                #endif
                char leftHand[32], rightHand[32];
                printOperand(p->code.u.assign.left, leftHand);
                printOperand(p->code.u.assign.right, rightHand);
                switch(p->code.action){
                    case DEFAULT:
                        fprintf(file, "%s := %s\n", leftHand, rightHand);
                        #ifdef IR_PRINT_DEBUG
                            printf("ASSIGN DEFAULT:%s := %s\n", leftHand, rightHand);
                        #endif
                    break;
                    case PTR:
                        fprintf(file, "%s := &%s\n", leftHand, rightHand);
                        #ifdef IR_PRINT_DEBUG
                            printf("ASSIGN PTR:%s := &%s\n", leftHand, rightHand);
                        #endif
                    break;
                    case RVAL:
                        fprintf(file, "%s := *%s\n", leftHand, rightHand);
                        #ifdef IR_PRINT_DEBUG
                            printf("ASSIGN RVAL:%s := *%s\n", leftHand, rightHand);
                        #endif
                    break;
                    case WVAL:
                        fprintf(file, "*%s := %s\n", leftHand, rightHand);
                        #ifdef IR_PRINT_DEBUG
                            printf("ASSIGN WVAL:*%s := %s\n", leftHand, rightHand);
                        #endif
                    break;
                    case COPY:
                        fprintf(file, "*%s := *%s\n", leftHand, rightHand);
                        #ifdef IR_PRINT_DEBUG
                            printf("ASSIGN COPY:*%s := *%s\n", leftHand, rightHand);
                        #endif
                    break;
                    }
                }
            break;
            case I_ADD:
                #ifdef IR_PRINT_DEBUG
                    printf("I_ADD\n");
                #endif
               { char res[32], op1[32], op2[32];
                printOperand(p->code.u.binop.result, res);
                printOperand(p->code.u.binop.op1, op1);
                printOperand(p->code.u.binop.op2, op2);
                switch(p->code.action){
                    case DEFAULT:
                        fprintf(file, "%s := %s + %s\n", res, op1, op2);
                        #ifdef IR_PRINT_DEBUG
                            printf("%s := %s + %s\n", res, op1, op2);
                        #endif
                    break;
                    case PTR:
                        fprintf(file, "%s := &%s + %s\n", res, op1, op2);
                    break;
                    default:
                        printf("printIRCode-ADD: Invalid action\n");
                        exit(-1);
                }}
            break;
            case I_SUB:
                #ifdef IR_PRINT_DEBUG
                    printf("I_SUB\n");
                #endif
                {char res[32], op1[32], op2[32];
                printOperand(p->code.u.binop.result, res);
                printOperand(p->code.u.binop.op1, op1);
                printOperand(p->code.u.binop.op2, op2);
                fprintf(file, "%s := %s - %s\n", res, op1, op2);
                #ifdef IR_PRINT_DEBUG
                    printf("%s := %s - %s\n", res, op1, op2);
                #endif
                }
            break;
            case I_MUL:
                #ifdef IR_PRINT_DEBUG
                    printf("I_MUL\n");
                #endif
                {char res[32], op1[32], op2[32];
                printOperand(p->code.u.binop.result, res);
                printOperand(p->code.u.binop.op1, op1);
                printOperand(p->code.u.binop.op2, op2);
                fprintf(file, "%s := %s * %s\n", res, op1, op2);
                #ifdef IR_PRINT_DEBUG
                    printf("%s := %s * %s\n", res, op1, op2);
                #endif
                }
            break;
            case I_DIV:
                #ifdef IR_PRINT_DEBUG
                    printf("I_DIV\n");
                #endif
                {char res[32], op1[32], op2[32];
                printOperand(p->code.u.binop.result, res);
                printOperand(p->code.u.binop.op1, op1);
                printOperand(p->code.u.binop.op2, op2);
                fprintf(file, "%s := %s / %s\n", res, op1, op2);
                #ifdef IR_PRINT_DEBUG
                    printf("%s := %s / %s\n", res, op1, op2);
                #endif
                }
            break;
            case I_LABEL:
                #ifdef IR_PRINT_DEBUG
                    printf("I_LABEL\n");
                #endif
                {char label[32];
                printOperand(p->code.u.sin.op, label);
                fprintf(file, "LABEL %s :\n", label);
                #ifdef IR_PRINT_DEBUG
                    printf("LABEL %s :\n", label);
                #endif
                }
            break;
            case I_FUNCTION:
                #ifdef IR_PRINT_DEBUG
                    printf("I_FUNCTION\n");
                #endif
                 {char func[32];
                printOperand(p->code.u.sin.op, func);
                fprintf(file, "FUNCTION %s :\n", func);
                #ifdef IR_PRINT_DEBUG
                    printf("FUNCTION %s :\n", func);
                #endif
                }
            break;
            case I_IF:
                #ifdef IR_PRINT_DEBUG
                    printf("I_IF\n");
                #endif
                {char target[32], op1[32], op2[32];
                printOperand(p->code.u.cond.target, target);
                printOperand(p->code.u.cond.op1, op1);
                printOperand(p->code.u.cond.op2, op2);
                fprintf(file, "IF %s %s %s GOTO %s\n", op1, p->code.u.cond.relop, op2, target);
                #ifdef IR_PRINT_DEBUG
                    printf("IF %s %s %s GOTO %s\n", op1, p->code.u.cond.relop, op2, target);
                #endif
                }
            break;
            case I_GOTO:
                #ifdef IR_PRINT_DEBUG
                    printf("I_GOTO\n");
                #endif
                {char s[32];
                printOperand(p->code.u.sin.op, s);
                fprintf(file, "GOTO %s\n", s);
                #ifdef IR_PRINT_DEBUG
                    printf("GOTO %s\n", s);
                #endif
                }
            break;
            case I_PARAMETER:
                #ifdef IR_PRINT_DEBUG
                    printf("I_PARAMETER\n");
                #endif
                {char s[32];
                printOperand(p->code.u.sin.op, s);
                fprintf(file, "PARAM %s\n", s);
                #ifdef IR_PRINT_DEBUG
                    printf("PARAM %s\n", s);
                #endif
                }
            break;
            case I_CALL:
                #ifdef IR_PRINT_DEBUG
                    printf("I_CALL\n");
                #endif
                {char res[32], op[32];
                printOperand(p->code.u.sinop.result, res);
                printOperand(p->code.u.sinop.op, op);
                fprintf(file, "%s := CALL %s\n", res, op);
                #ifdef IR_PRINT_DEBUG
                    printf("%s := CALL %s\n", res, op);
                #endif
                }
            break;
            case I_ARG:
                #ifdef IR_PRINT_DEBUG
                    printf("I_ARG\n");
                #endif
               { char s[32];
                printOperand(p->code.u.sin.op, s);
                if(p->code.u.sin.op->addrType == ADDRESS
                    && p->code.u.sin.op->kind == O_VARIABLE)
                    fprintf(file, "ARG &%s\n", s);
                else 
                    fprintf(file, "ARG %s\n", s);
                #ifdef IR_PRINT_DEBUG
                    printf("ARG %s\n", s);
                #endif
                }
            break;
            case I_READ:
                #ifdef IR_PRINT_DEBUG
                    printf("I_READ\n");
                #endif
            {char s[32];
                printOperand(p->code.u.sin.op, s);
                fprintf(file, "READ %s\n", s);
                #ifdef IR_PRINT_DEBUG
                    printf("READ %s\n", s);
                #endif
                }
            break;
            case I_WRITE:
                #ifdef IR_PRINT_DEBUG
                    printf("I_WRITE\n");
                #endif
                {char s[32];
                printOperand(p->code.u.sin.op, s);
                if (p->code.u.sin.op->addrType == VAL || p->code.u.sin.op->kind == O_CONSTANT){
                    fprintf(file, "WRITE %s\n", s);
                #ifdef IR_PRINT_DEBUG
                    printf("WRITE %s\n", s);
                #endif
                }
                else {
                    fprintf(file, "WRITE *%s\n", s);
                #ifdef IR_PRINT_DEBUG
                    printf("WRITE *%s\n", s);
                #endif
                }
            }
            break;
            case I_RETURN:
                #ifdef IR_PRINT_DEBUG
                    printf("I_RETURN\n");
                #endif
                {char s[32];
                printOperand(p->code.u.sin.op, s);
                fprintf(file, "RETURN %s\n", s);
                #ifdef IR_PRINT_DEBUG
                    printf("RETURN %s\n", s);
                #endif
                }
            break;
            case I_DECLEAR:
                #ifdef IR_PRINT_DEBUG
                    printf("I_DECLEAR\n");
                #endif
                {char op[32];
                printOperand(p->code.u.dec.op, op);
                fprintf(file, "DEC %s %u\n", op, p->code.u.dec.size);
                #ifdef IR_PRINT_DEBUG
                    printf("DEC %s %u\n", op, p->code.u.dec.size);
                #endif
                }
            break;
            default:;
        }
        p = p->next;
    }
    fclose(file);
    return;
}

void printOperand(Operand* operand, char* s){
    //printf("operand == NULL = %d\n", operand == NULL);
    switch(operand->kind){
        case O_VARIABLE:
            sprintf(s, "v%d", operand->u.var_no);
        break;
        case O_CONSTANT:
            sprintf(s, "#%d", operand->u.value);
        break;
        case O_LABEL:
            sprintf(s, "label%d", operand->u.var_no);
        break;
        case O_FUNCTION:
            sprintf(s, "%s", operand->u.name);
        break;
        case O_PARAMETER:
            sprintf(s, "v%d", operand->u.var_no);
        break;
        case O_TEMPVAR:
            sprintf(s, "t%d", operand->u.var_no);
        break;
    }
}


void Exp_optimizer(Node* Exp, Operand *t){
    #ifdef optimize 
        //Exp -> INT
        if(Exp->smtmType == 17){
            if(t != NULL)
                free(t);
            t = create_Op(O_CONSTANT, Exp->child->val.intVal);
        }
        //Exp -> ID
        else if(Exp->smtmType == 16){
            HashTable* v = hash_find(Exp->child->val.strVal);
            Operand* op = v->operand;
            t->kind = op->kind;
            t->addrType = op->addrType;
            t->u.var_no = op->u.var_no;
        }
        else {
            IR_Exp(Exp, t);
        }
    #else
        IR_Exp(Exp, t);
    #endif
}
