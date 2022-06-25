#include "semanteme.h"
//#define SEM_DEBUG
//#define STACK_DEBUG

bool semanticFlag = true;

unsigned hash_pjw(char* name){
    unsigned val = 0, i;
    for (; *name; ++name) {
        val = (val << 2) + *name;
        if (i = val & ~HASHSIZE)
            val = (val ^ (i >> 12)) & HASHSIZE;
    }
    return val;
}

void hash_add(HashTable* a){
    a->stackRoot = curStackField;
    a->isStackNode = false;
    a->down = NULL;
    HashTable* p = curStackField;
    while(p->down)
        p = p->down;
    p->down = a;

    unsigned index = hash_pjw(a->name);
    a->next = hashTable[index];
    hashTable[index] = a;
    #ifdef SEM_DEBUG
    printf("hash_table: '\"%s\" added to table\n", a->name);
    #endif
    return;
}

HashTable* hash_find(char* name){
    unsigned index = hash_pjw(name);
    #ifdef SEM_DEBUG
        printf("hash_table: finding \"%s\"\n", name);
        printf("index = %d\n", index);
        printf("hashtable = %d\n", hashTable[index] == NULL);
    #endif
    if(hashTable[index] != NULL){
        for(HashTable* p = hashTable[index]; p != NULL; p = p->next){
            if(!strcmp(p->name, name)){
                #ifdef SEM_DEBUG
                    //printType(p->type, 0);
                #endif
                return p;
            }
        }
    }
    return NULL;
}

void serror(int typeNo, int lineNo, const char* err){
    printf("Error type %d at line %d: %s.\n", typeNo, lineNo, err);
    semanticFlag = false;
    return;
}

void initTable(){
    //memset(hashTable, Null, sizeof(int) * (HASHSIZE+1));
   for(int i = 0; i <= HASHSIZE ; i++)
    hashTable[i] = NULL;
    return;
}

void initStack(){
    hashStack = (HashTable*)malloc(sizeof(HashTable));
    hashStack->isStackNode = true;
    hashStack->down = hashStack->next = hashStack->stackRoot = NULL;
    hashStack->name = NULL;
    hashStack->size = 0;
    hashStack->type = NULL;

    curStackField = hashStack;
    #ifdef STACK_DEBUG
        printf("FieldStack init completed\n");
    #endif
    return;
}

HashTable* stack_newNode(){
    #ifdef STACK_DEBUG
        printf("FieldStack added new stackNode\n");
    #endif
    HashTable* newNode = (HashTable*)malloc(sizeof(HashTable));
    newNode->isStackNode = true;
    newNode->down = newNode->next = newNode->stackRoot = NULL;
    newNode->name = NULL;
    newNode->size = 0;
    newNode->type = NULL;

    HashTable *p = hashStack;
    while(p->next)
        p = p->next;
    p->next = newNode;
    return newNode;
}

void del_curStackField(){
    #ifdef STACK_DEBUG
        printf("deleting current Field\n");
    #endif
    if(curStackField == hashStack) //global filed is not needed to delete
        return;
    HashTable* p = NULL;
    HashTable *t = hashStack;
    while(t->next){
        if(t->next == curStackField){
            curStackField = t;
            p = t->next;
            break;
        }
        t = t->next;
    }
    #ifdef STACK_DEBUG
        printf("\tFind last curStackFiled\n");
    #endif
    if(p == NULL){
        printf("ERROR: Field to Del does not exist.\n");
        exit(-1);
    }
    curStackField->next = p->next;
    #ifdef STACK_DEBUG
        printf("\tReAssign curStackFiled\n");
    #endif
    if(p->down && p->down->type && p->down->type->kind == sSTRUCTURE){
        #ifdef STACK_DEBUG
            printf("\tThis is a structField\n");
        #endif
        return;
    }
    while(p){
        HashTable *q = p->down;
        free(p);
        p = q;
    }
    return;
}

int fieldDepth(HashTable *root){
    int depth = 0;
    HashTable* head = hashStack;
    while(head){
        if(head == root)
            return depth;
        depth++;
        head = head->next;
    }
    return 0;
}

bool fieldContain(HashTable* rootA, HashTable* rootB){
    HashTable *head = hashStack;
    int order = 0, orderA = 0, orderB = 0;
    while(head && (orderA == 0 || orderB == 0)){
        if(head == rootA)
            orderA = order;
        if(head == rootB)
            orderB = order;
        head = head->next;
        order++;
    }
    #ifdef STACK_DEBUG
        printf("fieldContain: orderA = %d, orderB = %d\n", orderA, orderB);
    #endif
    return orderA < orderB;
}

void initFunDecList(){
    funDecList = (HashTable*)malloc(sizeof(HashTable));
    funDecList->next = funDecList->down = funDecList->stackRoot = NULL;
    funDecList->name = NULL;
    funDecList->isStackNode = false;
    funDecList->size = 0;
    funDecList->type = NULL;
    return;
}

void FunDecList_add(HashTable *a){
    HashTable* p = funDecList;
    while(p->next)
        p = p->next;
    p->next = (HashTable*)malloc(sizeof(HashTable));
    p = p->next;
    p->name = a->name;
    p->next = NULL;
    p->type = a->type;
    p->stackRoot = a->stackRoot;
    p->isStackNode = a->isStackNode;
    p->down = NULL;
    p->size = a->size;
}

HashTable* FunDecList_find(char* a){
    HashTable *p = funDecList->next;
    while(p){
        if(!strcmp(p->name, a))
            return p;
        p = p->next;
    }
    return NULL;
}

void FunDecList_del(char* a){
    HashTable *p = funDecList;
    while(p->next){
        if(!strcmp(p->next->name, a)){
            HashTable* q = p->next;
            p->next = p->next->next;
            free(q);
            return;
        }
        p = p->next;
    }
    return;
}

void FunDecList_chk(){
    HashTable* head = funDecList->next;
    char s[512];
    while(head){
        sprintf(s, "Undefined function \"%s\"", head->name);
        serror(18, head->size, s);
        head = head->next;
    }

    return;
}

void smtm_Program(Node* node){
    if(!strcmp("ExtDefList", node->child->name)){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Program...\n");
        #endif
        smtm_ExtDefList(node->child);
    }
    return;
}

void smtm_ExtDefList(Node* node){
    //ExtDefList -> null
    if(node->smtmType == 1)
        ;
    //ExtDefList -> ExtDef ExtDefList
    else if(node->smtmType == 2){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_ExtDefList 2...\n");
        #endif
        smtm_ExtDef(node->child);
        smtm_ExtDefList(node->child->next);
    };
}


void smtm_ExtDef(Node *node){
    FieldList* extdef = (FieldList*)malloc(sizeof(FieldList));
    extdef->type = (sType*)malloc(sizeof(sType));
    extdef->tail = NULL;
    //ExtDef -> Specifier ExtDecList SEMI
    if(node->smtmType == 1){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_ExtDef 1...\n");
        #endif
        
        node->child->inh = extdef;
        smtm_Specifier(node->child);
        node->child->next->inh = node->child->syn;
        smtm_ExtDecList(node->child->next);
        
    }
    //ExtDef -> Specifier SEMI
    else if(node->smtmType == 2){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_ExtDef 2...\n");
        #endif
        
        node->child->inh = extdef;
        
        smtm_Specifier(node->child);
    }
    //ExtDef -> Specifier FunDec CompSt
    else if(node->smtmType == 3){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_ExtDef 3...\n");
        #endif
        
        extdef->type->kind = sFUNCTION;
        node->child->inh = extdef;
        node->child->next->inh = extdef;
        
        smtm_Specifier(node->child);
        //set return val type of func
        
        if(node->child->syn->type->kind == sSTRUCTURE){
            sType* tType = (sType*)malloc(sizeof(sType));
            tType->kind = sSTRUCTVAR;
            tType->u.structVar = node->child->syn->type->u.structure;
            node->child->inh->type->u.function.type = tType;
        }
        else {
            node->child->inh->type->u.function.type = node->child->syn->type;
        }
        node->child->inh->type->u.function.argList = NULL;
        node->child->inh->type->u.function.argc = 0;
        node->child->next->inh->funDecFlag = false;
        smtm_FunDec(node->child->next);
        
        node->child->next->next->inh = node->child->syn;
        
        smtm_CompSt(node->child->next->next);
        
    }
    //ExtDef -> Specifier FunDec SEMI
    else if(node->smtmType == 4){
        extdef->type->kind = sFUNCTION;
        node->child->inh = extdef;
        node->child->next->inh = extdef;
        smtm_Specifier(node->child);

        if(node->child->syn->type->kind == sSTRUCTURE){
            sType* tType = (sType*)malloc(sizeof(sType));
            tType->kind = sSTRUCTVAR;
            tType->u.structVar = node->child->syn->type->u.structure;
            node->child->inh->type->u.function.type = tType;
        }else {
            node->child->inh->type->u.function.type = node->child->syn->type;
        }
        node->child->inh->type->u.function.argList = NULL;
        node->child->inh->type->u.function.argc = 0;
        node->child->next->inh->funDecFlag = true;
        smtm_FunDec(node->child->next);
    }
    return;
}

void smtm_Specifier(Node *node){
    
    FieldList* syn = (FieldList*)malloc(sizeof(FieldList));
    syn->type = (sType*)malloc(sizeof(sType));
    syn->tail = NULL;
    
    //Specifier -> TYPE
    if(node->smtmType == 1){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Specifier 1...\n");
        #endif
        
        if(!strcmp("int", node->child->val.strVal))
            syn->type->kind = sINT;
        else if(!strcmp("float", node->child->val.strVal))
            syn->type->kind = sFLOAT;
        node->syn = syn;
        #ifdef SEM_DEBUG
            printf("Specifier: type is %d\n", node->syn->type->kind);
        #endif

        
    }

    //Specifier ->StructSpecifier
    else if(node->smtmType == 2){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Specifier 2...\n");
        #endif
        
        syn->type->kind = sSTRUCTURE;
        syn->type->u.structure = NULL;
        node->child->inh = syn;
        
        smtm_StructSpecifier(node->child);
        node->syn = node->child->syn;

    }
    return ;
}
void smtm_ExtDecList(Node *node){
    //printf("smtm_ExtDecList not finished\n");
    //ExtDecList -> VarDec...
    if(node->inh->type->kind == sSTRUCTVAR && node->inh->type->u.structure == NULL){
        char s[512];
        sprintf(s, "Undefined structure \"%s\"", node->inh->name);
        serror(17, node->lineNum, s);
        return;
    }
    node->child->inh = node->inh;
    smtm_VarDec(node->child);
    node->syn = node->child->syn;
    //ExtDecList -> VarDec
    if(node->smtmType == 1){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_ExtDecList 1...\n");
        #endif
        ;
    }
    //ExtDecList -> VarDec COMMA ExtDecList
    else if(node->smtmType == 2){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_ExtDecList 1...\n");
        #endif
        node->child->next->next->inh = node->inh;
        smtm_ExtDecList(node->child->next->next);
        FieldList *p = node->syn;
        while(p->tail) p = p->tail;
        p->tail = node->child->next->next->syn;
    }
    return ;
}

void smtm_FunDec(Node *node){
    //FunDec -> ID ...
    

    

    if(node->smtmType == 1){
        //FunDec -> ID LP VarList RP
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_FunDec 1...\n");
        #endif        
        //HashTable* func = hash_find(node->child->val.strVal);
        node->child->next->next->inh = node->inh;
        smtm_VarList(node->child->next->next);
        node->inh->type->u.function.argList = node->child->next->next->syn;
    }
    //FunDec -> ID LP RP
    else if(node->smtmType == 2){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_FunDec 2...\n");
        #endif
        //HashTable* func = hash_find(node->child->val.strVal);
        node->inh->type->u.function.argList = NULL;
    }


    HashTable* func = hash_find(node->child->val.strVal);
    if(func && func->stackRoot == curStackField && !node->inh->funDecFlag){

        char s[512];
        sprintf(s, "duplicate function definition \"%s\"", node->child->val.strVal);
        serror(4, node->lineNum, s);
        node->inh->type->kind = sWRONGFUNC;
    }
    else {
        HashTable *dec = FunDecList_find(node->child->val.strVal);
        
        if(node->inh->funDecFlag){
            //printf("FunDec found!\n");
            HashTable* oldDec = FunDecList_find(node->child->val.strVal);
            HashTable* func = (HashTable*)malloc(sizeof(HashTable));
            func->name = node->child->val.strVal;
            func->next = NULL;
            func->size = 0;
            func->type = node->inh->type;
            func->size = node->lineNum;
            if(!oldDec ) {
                if(!hash_find(node->child->val.strVal))
                    FunDecList_add(func);
            }
            else if(!funcFieldCmp(func->type->u.function.argList, oldDec->type->u.function.argList)){
                char s[512];
                sprintf(s, "Inconsistent declaration of function \"%s\"", func->name);
                serror(19, oldDec->size, s);
            }
            
        }
        else {
            HashTable* func = (HashTable*)malloc(sizeof(HashTable));
            //printf("FunDef:%s\n", node->child->val.strVal);
            func->name = node->child->val.strVal;
            func->next = NULL;
            func->size = 0;
            func->type = node->inh->type;
            hash_add(func);

            if(dec){
                if(!funcFieldCmp(dec->type->u.function.argList, func->type->u.function.argList)){
                    char s[512];
                    sprintf(s, "Inconsistent declaration of function \"%s\"", node->child->val.strVal);
                    serror(19, dec->size, s);
                }
                FunDecList_del(node->child->val.strVal);
            }
        }
    } 

    return ;
}

void smtm_VarList(Node *node){
    //VarList -> ParamDec COMMA VarList
    if(node->smtmType == 1){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_VarList1...\n");
        #endif
        smtm_ParamDec(node->child);
        if(node->child->syn) node->inh->type->u.function.argc++;
        else {node->inh->type->kind = sWRONGFUNC; return;}
        node->syn = node->child->syn;
        node->child->next->next->inh = node->inh;
        smtm_VarList(node->child->next->next);
        FieldList* p = node->syn;
        while(p->tail) p = p->tail;
        p->tail = node->child->next->next->syn;
    }
    //VarList -> ParamDec
    else if(node->smtmType == 2){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_VarList2...\n");
        #endif
        smtm_ParamDec(node->child);
        if(node->child->syn) node->inh->type->u.function.argc++;
        else {node->inh->type->kind = sWRONGFUNC; return;}
        node->syn = node->child->syn;
    }
    return ;
}

void smtm_ParamDec(Node *node){
    //ParamDec -> Specifier VarDec
    if(node->smtmType == 1){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_ParamDec1...\n");
        #endif
        smtm_Specifier(node->child);
        node->child->next->inh = node->child->syn;
        node->child->next->inh->funcVarFlag = true;
        smtm_VarDec(node->child->next);
        //node->syn = node->child->next->syn;

        if(node->child->next->syn){
            node->syn = (FieldList*)malloc(sizeof(FieldList));
            node->syn->name = node->child->next->syn->name;
            node->syn->type = node->child->next->syn->type;
            node->syn->tail = NULL;
        }
        else node->syn = NULL;
    }
    return ;
}

void smtm_CompSt(Node *node){
    //CompSt ->LC DefList StmtList RC
    if(node->smtmType == 1){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_CompSt1...\n");
        #endif

        curStackField = stack_newNode();

        node->child->next->inh = node->inh;
        node->child->next->next->inh = node->inh;
        smtm_DefList(node->child->next);
        smtm_StmtList(node->child->next->next);

        del_curStackField();
    }
    return ;
}

void smtm_StmtList(Node *node){
    //StmtList -> Stmt StmtList
    if(node->smtmType == 1){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_StmtList1...\n");
        #endif
        node->child->inh = node->inh;
        node->child->next->inh = node->inh;
        smtm_Stmt(node->child);
        smtm_StmtList(node->child->next);
    }
    //StmtList -> null
    else if(node->smtmType == 2){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_StmtList2...\n");
        #endif
        ;
    }
    return ;
}

void smtm_Stmt(Node *node){
    //Stmt -> Exp SEMI
    if(node->smtmType == 1){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Stmt1...\n");
        #endif
        smtm_Exp(node->child);
    }
    //Stmt -> CompSt
    else if(node->smtmType == 2){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Stmt2...\n");
        #endif
        node->child->inh = node->inh;
        smtm_CompSt(node->child);
    }
    //Stmt -> RETURN Exp SEMI
    else if(node->smtmType == 3){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Stmt3...\n");
        #endif
        smtm_Exp(node->child->next);
        if(node->child->next->syn && node->inh->type->kind != node->child->next->syn->type->kind)
            if(node->inh->type->kind == sSTRUCTURE && node->child->next->syn->type->kind == sSTRUCTVAR 
                && structFieldCmp(node->inh->type->u.structure, node->child->next->syn->type->u.structVar))
                {;}
            else serror(8, node->child->next->lineNum, " Type mismatched for return");
    }
    //Stmt -> IF LP Exp RP Stmt
    else if(node->smtmType == 4){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Stmt4...\n");
        #endif
        node->child->next->next->next->next->inh = node->inh;
        smtm_Exp(node->child->next->next);
        if(node->child->next->next->syn && node->child->next->next->syn->type->kind != sINT)
            serror(7, node->child->next->next->lineNum, "Type mismatched for operands");
        smtm_Stmt(node->child->next->next->next->next);
    }
    //Stmt -> IF LP Exp RP Stmt ELSE Stmt
    else if(node->smtmType == 5){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Stmt5...\n");
        #endif
        node->child->next->next->next->next->inh = node->child->next->next->next->next->next->next->inh = node->inh;
        smtm_Exp(node->child->next->next);
        #ifdef SEM_DEBUG
            fprintf(stderr, "return from Exp in smtm_Stmt5...\n");
        #endif
        if(node->child->next->next->syn && node->child->next->next->syn->type->kind != sINT)
            serror(7, node->child->next->next->lineNum, "Type mismatched for operands");
        smtm_Stmt(node->child->next->next->next->next);
        smtm_Stmt(node->child->next->next->next->next->next->next);
        #ifdef SEM_DEBUG
            fprintf(stderr, "return from smtm_Stmt5...\n");
        #endif
    }
    //Stmt -> WHILE LP Exp RP Stmt
    else if(node->smtmType == 6){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Stmt6...\n");
        #endif
        node->child->next->next->next->next->inh = node->inh;
        smtm_Exp(node->child->next->next);
        if(node->child->next->next->syn && node->child->next->next->syn->type->kind != sINT)
            serror(7, node->child->next->next->lineNum, "Type mismatched for operands");
        smtm_Stmt(node->child->next->next->next->next);
        }
    return ;
}

void smtm_StructSpecifier(Node *node){
    #ifdef SEM_DEBUG
    if(!node->inh)
        fprintf(stderr, "DUBUGGER(smtm_StructSpecifier): node->inh == NULL\n");
    else if(node->inh->type->kind != sSTRUCTURE)
        fprintf(stderr, "DUBUGGER(smtm_StructSpecifier): node->inh->type->kind != sSTRUCTURE\n");
    #endif
    //StructSpecifier ->STRUCT OptTag LC DefList RC
    if(node->smtmType == 1){
        #ifdef SEM_DEBUG
        fprintf(stderr, "smtm_StructSpecifier1...\n");
        #endif
        
        curStackField = stack_newNode();

        FieldList* p = (FieldList*)malloc(sizeof(FieldList));
        p->type = (sType*)malloc(sizeof(sType));
        p->type->kind = sSTRUCTURE;
        p->tail = NULL;
        node->child->next->inh = node->inh;
        node->child->next->next->next->inh = node->inh;
        node->child->next->next->next->structVarFlag = true;
        
        smtm_OptTag(node->child->next);
        smtm_DefList(node->child->next->next->next);
        
        //printf("return from DefList in StructSpecifier\n");

        if(!node->inh->type->u.structure)
            node->inh->type->u.structure = node->child->next->next->next->syn;
        else{
            FieldList* q = node->inh->type->u.structure;
            if(q->type->kind == sSTRUCTURE)
                q->type->u.structure = p;
            else 
                q->tail = p;
        }
        #ifdef SEM_DEBUG
            //printf("Defining structure has ");
            //printType(node->child->next->next->next->syn->type, 0);
        #endif
        node->syn = node->inh;
        
        del_curStackField();
    }
    //StructSpecifier -> STRUCT Tag
    else if(node->smtmType == 2){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_StructSpecifier2...\n");
        #endif
        node->inh->type->u.structure = NULL;
        node->child->next->inh = node->inh;
        smtm_Tag(node->child->next);
        node->syn = node->inh;
    }
    return ;
}

void smtm_OptTag(Node *node){
    #ifdef SEM_DEBUG
        if(!node->inh)
            fprintf(stderr, "DUBUGGER(smtm_OptTag): node->inh == NULL\n");
    #endif
    //OptTag -> ID
    if(node->smtmType == 1){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_OptTag1...\n");
        #endif
        HashTable* strct = hash_find(node->child->val.strVal);
        if(strct && fieldContain(strct->stackRoot, curStackField)){
            char s[512];
            sprintf(s, "Duplicated name \"%s\"", node->child->val.strVal);
            serror(16, node->lineNum, s);
        }
        else {
            HashTable* strct = (HashTable*)malloc(sizeof(HashTable));
            strct->next = NULL;
            strct->size = 0;
            strct->type = node->inh->type;
            strct->name = node->inh->name = node->child->val.strVal;
            hash_add(strct);
        }
    }
    return ;
}

void smtm_Tag(Node *node){
    //Tag -> ID
    if(node->smtmType == 1){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Tag1...\n");
        #endif
        HashTable* id = hash_find(node->child->val.strVal);
        if(id){
            node->inh->name = id->name;
            node->inh->type = id->type;
            #ifdef SEM_DEBUG
                //printType(node->inh->type->u.structVar->type, 0);
            #endif
        }
        else 
            node->inh->name = node->child->val.strVal;
    }
    return ;
}

void smtm_VarDec(Node *node){
    //VarDec -> ID
    if(node->smtmType == 1){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_VarDec1...\n");
        #endif
        HashTable* id = hash_find(node->child->val.strVal);
        //if(id)
         //   printf("%d, %d\n",  fieldDepth(id->stackRoot), fieldDepth(curStackField));
        if(id && fieldDepth(id->stackRoot) >= fieldDepth(curStackField)){
            if(node->structVarFlag){
                char s[512];
                sprintf(s, "Redefined field \"%s\"", node->child->val.strVal);
                serror(15, node->lineNum, s);
                return;
            }
            else if(id->type->kind == sSTRUCTURE || node->inh->funcVarFlag == false){
                char s[512];
                sprintf(s, "Redefined variable \"%s\"", node->child->val.strVal);
                serror(3, node->lineNum, s);
                //return;
            }
        }
        HashTable* i = (HashTable*)malloc(sizeof(HashTable));
        i->next = NULL;
        i->name = node->child->val.strVal;
        i->size = 0;
        
        FieldList* field = (FieldList*)malloc(sizeof(FieldList));
        field->tail = NULL;
        switch (node->inh->type->kind) {
        case sINT:
            i->size = 4;
            field->name = node->child->val.strVal;
            field->type = i->type = node->inh->type;
            node->syn = field;
            #ifdef SEM_DEBUG
                printf("VarDec: Defining var %s as type INT\n", field->name);
            #endif
            break;
        case  sFLOAT:
            i->size = 4;
            field->name = node->child->val.strVal;
            field->type = i->type = node->inh->type;
            node->syn = field;
            #ifdef SEM_DEBUG
                printf("VarDec: Defining var %s as type FLOAT\n", field->name);
            #endif
            break;           
        case sARRAY:
            i->size = 0;
            field->name = node->child->val.strVal;
            field->type = i->type = node->inh->type;
            node->syn = field;
            #ifdef SEM_DEBUG
                printf("VarDec: Defining var %s as type ARRAY\n", field->name);
            #endif
            break;       
        case sSTRUCTURE:       
        case sSTRUCTVAR:
            if(node->inh->type->u.structure == NULL){
                node->syn = NULL;
                /*char s[512];
                sprintf(s, "Undefined structure \"%s\"", node->inh->name);
                serror(17, node->lineNum, s);*/
                //return;
                field->name = node->child->val.strVal;
                field->type = (sType*)malloc(sizeof(sType));
                field->type->kind = sSTRUCTVAR;
                field->type->u.structVar = NULL;
                i->type = field->type;
                node->syn = field;
            }
            else {
                field->name =node->child->val.strVal;
                field->type = (sType*)malloc(sizeof(sType));
                field->type->kind = sSTRUCTVAR;
                field->type->u.structVar = node->inh->type->u.structure;
                i->type = field->type;
                
                node->syn = field;
            }
            
            #ifdef SEM_DEBUG
                printf("VarDec: Defining var %s as type STRUTURE/STRUTUREVAR\n", field->name);
            #endif
            break;
        default:
            #ifdef SEM_DEBUG
                fprintf(stderr, "DUBUGGER:smtm_VarDec1: unable to handle varType %d\n", node->inh->type->kind);
            #endif
            break;
        }      
        hash_add(i);
        
    }
    //VarDec -> VarDec LB INT RB
    else if(node->smtmType == 2){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_VarDec2...\n");
        #endif
        node->child->structVarFlag |= node->structVarFlag;
        FieldList* field = (FieldList*)malloc(sizeof(FieldList));
        field->tail = NULL;
        field->type = (sType*)malloc(sizeof(sType));
        field->type->kind = sARRAY;
        field->type->u.array.size = node->child->next->next->val.intVal;
        if(node->inh->type->kind == sSTRUCTURE){
            field->type->u.array.elem = (sType*)malloc(sizeof(sType));
            field->type->u.array.elem->kind = sSTRUCTVAR;
            field->type->u.array.elem->u.structVar = node->inh->type->u.structure;
        }
        else 
            field->type->u.array.elem = node->inh->type;
        #ifdef SEM_DEBUG
            //printType(field->type, 0);
        #endif
        node->child->inh = field;
        smtm_VarDec(node->child);
        node->syn = node->child->syn;
    }
    return ;
}

void smtm_DefList(Node *node){
    //DefList -> Def DefList
    if(node->smtmType == 1){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_DefList1...\n");
        #endif
        if(node->structVarFlag)
            node->child->next->structVarFlag = node->child->structVarFlag = true;
        node->child->inh = node->child->next->inh = node->inh;
        smtm_Def(node->child);
        node->syn = node->child->syn;
        smtm_DefList(node->child->next);
        FieldList* p = node->syn;
        if(p) {
            while(p->tail) p = p->tail;
            p->tail = node->child->next->syn;
        }
    }
    //DefList -> null
    return ;
}

void smtm_Def(Node *node){
    //Def -> Specifier DecList SEMI
    if(node->smtmType == 1){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Def1...\n");
        #endif
        if(node->structVarFlag)
            node->child->structVarFlag = node->child->next->structVarFlag = node->structVarFlag;
        node->child->inh = node->inh;
        smtm_Specifier(node->child);
        node->child->next->inh = node->child->syn;
        smtm_DecList(node->child->next);
        node->syn = node->child->next->syn;
    }
    return ;
}

void smtm_DecList(Node *node){
    if(node->inh->type->kind == sSTRUCTURE && node->inh->type->u.structure == NULL){
        char s[512];
        sprintf(s, "Undefined structure\"%s\"", node->inh->name);
        serror(17, node->lineNum, s);
        //return;
    }

    //DecList -> Dec
    if(node->smtmType == 1){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_DecList1...\n");
        #endif
        node->child->structVarFlag |= node->structVarFlag;
        node->child->inh = node->inh;
        smtm_Dec(node->child);
        node->syn = node->child->syn;
    }
    //DecList -> Dec COMMA DecList
    else if(node->smtmType == 2){
        node->child->structVarFlag |= node->structVarFlag;
        node->child->inh = node->inh;
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_DecList2...\n");
        #endif
        smtm_Dec(node->child);
        node->syn = node->child->syn;
        node->child->next->next->structVarFlag |= node->structVarFlag;
        node->child->next->next->inh = node->inh;
        smtm_DecList(node->child->next->next);
        FieldList* p = node->syn;
        while(p->tail) p = p->tail;
        p->tail = node->child->next->next->syn;
    }
    return ;
}

void smtm_Dec(Node *node){
    //Dec -> VarDec
    if(node->smtmType == 1){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Dec1...\n");
        #endif
        node->child->structVarFlag |= node->structVarFlag;
        node->child->inh = node->inh;
        smtm_VarDec(node->child);
        node->syn = node->child->syn;
    }
    //Dec -> VarDec ASSIGNOP Exp
    else if(node->smtmType == 2){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Dec2...\n");
        #endif
        node->child->structVarFlag |= node->structVarFlag;
        node->child->inh = node->inh;
        smtm_VarDec(node->child);
        node->syn = node->child->syn;

        if(node->structVarFlag) {
            char s[512];
            sprintf(s, "Initing field in a struct\"%s\"", node->child->syn->name);
            serror(15, node->child->lineNum, s);
            return;
        }
        
        smtm_Exp(node->child->next->next);

        if(node->child->syn && node->child->next->next->syn && 
            node->child->syn->type->kind != node->child->next->next->syn->type->kind)
            serror(5, node->child->lineNum, "Type mismatched for assignment");
    }
    return ;
}

void smtm_Exp(Node *node){
    //Exp -> Exp ASSIGNOP Exp
    if(node->smtmType == 1){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Exp1...\n");
            HashTable* res = hash_find("Point");
            if(res){ printf("\nstruct Point: \n");printType(res->type, 0);}
        #endif
        if(node->child->smtmType == 14 || node->child->smtmType == 15 || node->child->smtmType == 16)
            smtm_Exp(node->child);
        else {
            serror(6, node->child->lineNum, "The left-hand side of an assignment must be a variable");
            smtm_Exp(node->child->next->next);
            return;
        }

        smtm_Exp(node->child->next->next);
        if(node->child->syn && node->child->next->next->syn){
            FieldList *syn1 = node->child->syn, *syn2 = node->child->next->next->syn;
            if(syn1->type->kind != syn2->type->kind){
                #ifdef SEM_DEBUG
                    printType(syn1->type, 0);
                    printf("assignment type mismatch: lefthand is %d, righthand is %d. ", syn1->type->kind, syn2->type->kind);
                #endif
                serror(5, node->child->lineNum, "Type mismatched for assignment");
            }
            else if(syn1->type->kind == sSTRUCTVAR){
                if(!structFieldCmp(syn1->type->u.structVar, syn2->type->u.structVar)){
                    #ifdef SEM_DEBUG
                        printf("struct type mismatch");
                    #endif
                    serror(5, node->child->lineNum, "Type mismatched for assignment");
                }
                else 
                    node->syn = node->child->syn;
            }
            else if(syn1->type->kind == sARRAY){
                if(!arrayTypeCmp(syn1->type, syn2->type))
                    serror(5, node->child->lineNum, "Type mismatched for assignment");
                else 
                    node->syn = node->child->syn;
            }
            else node->syn = node->child->syn;
        }
        else 
            serror(5, node->child->lineNum, "Type mismatched for assignment");
    }
    //Exp -> Exp AND Exp
    //          | Exp OR Exp
    else if(node->smtmType == 2 || node->smtmType == 3){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Exp%d...\n", node->smtmType);
        #endif
        smtm_Exp(node->child);
        smtm_Exp(node->child->next->next);
        FieldList *syn1 = node->child->syn, *syn2 = node->child->next->next->syn;
        if(syn1 && syn2){
            if(syn1->type->kind == sINT && syn2->type->kind == sINT){
                FieldList* field = (FieldList*)malloc(sizeof(FieldList));
                field->tail = NULL;
                field->name = NULL;
                field->type = (sType*)malloc(sizeof(sType));
                field->type->kind = sINT;
                node->syn = field;
            }
            else 
                serror(7, node->child->lineNum, "Type mismatched for operands");
        }
    }
    
    /*else if(node->smtmType == 3){
        
        
    }*/
    //Exp -> Exp RELOP Exp
    else if(node->smtmType == 4){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Exp4...\n");
        #endif
        smtm_Exp(node->child);
        smtm_Exp(node->child->next->next);
        FieldList *syn1 = node->child->syn, *syn2 = node->child->next->next->syn;
        if(syn1 && syn2){
            if(syn1->type->kind == syn2->type->kind &&(syn1->type->kind == sINT || syn1->type->kind == sFLOAT)){
                FieldList* field = (FieldList*)malloc(sizeof(FieldList));
                field->type = (sType*)malloc(sizeof(sType));
                field->tail = NULL;
                field->name = NULL;
                field->type->kind = sINT;
                node->syn = field;
            }
            else 
                serror(7, node->child->lineNum, "Type mismatched for operands");
        }
    }
    //Exp -> Exp PLUS Exp
    //          | Exp MINUS Exp
    //          | Exp STAR Exp
    //          | Exp DIV Ex
    else if(node->smtmType == 5 || node->smtmType == 6 || node->smtmType == 7
                || node->smtmType == 8){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Exp%d...\n", node->smtmType);
        #endif
        smtm_Exp(node->child);
        smtm_Exp(node->child->next->next);
        FieldList *syn1 = node->child->syn, *syn2 = node->child->next->next->syn;
        if(syn1 && syn2){
            if(syn1->type->kind == syn2->type->kind &&(syn1->type->kind == sINT || syn1->type->kind == sFLOAT)){
                FieldList* field = (FieldList*)malloc(sizeof(FieldList));
                field->type = (sType*)malloc(sizeof(sType));
                field->tail =NULL;
                field->name = NULL;
                field->type->kind = syn1->type->kind;
                node->syn = field;
            }
            else 
                serror(7, node->child->lineNum, "Type mismatched for operands");
        }
        else 
            serror(7, node->child->lineNum, "Type mismatched for operands");
    }
    
    /*
    else if(node->smtmType == 6){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Exp6...\n");
        #endif
    }*/
    /*
    else if(node->smtmType == 7){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Exp7...\n");
        #endif
    }
    */
    /*
    else if(node->smtmType == 8){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Exp8...\n");
        #endif
    }
    */
    //Exp -> LP Exp RP
    else if(node->smtmType == 9){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Exp9...\n");
        #endif
        smtm_Exp(node->child->next);
        node->syn = node->child->next->syn;
    }
    //Exp -> MINUS Exp
    else if(node->smtmType == 10){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Exp10...\n");
        #endif
        smtm_Exp(node->child->next);
        FieldList* syn1 = node->child->next->syn;
        if(syn1 && syn1->type->kind == sINT || syn1->type->kind == sFLOAT)
            node->syn = syn1;
        else 
            serror(7, node->lineNum, "Type mismatched for operands");
    }
    //Exp -> NOT Exp
    else if(node->smtmType == 11){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Exp11...\n");
        #endif
        smtm_Exp(node->child->next);
        FieldList* syn1 = node->child->next->syn;
        if(syn1 && syn1->type->kind == sINT)
            node->syn = syn1;
        else 
            serror(7, node->lineNum, "Type mismatched for operands");
    }
    //Exp -> ID LP Args RP
    else if(node->smtmType == 12){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Exp12...\n");
        #endif
        smtm_Args(node->child->next->next);
        if(node->child->next->next->syn == NULL){
            node->syn = NULL;
            return;
        }
        HashTable* funcField = hash_find(node->child->val.strVal);
        if(funcField){
            if(funcField->type->kind == sFUNCTION){
                if(funcFieldCmp(funcField->type->u.function.argList, node->child->next->next->syn)){
                    FieldList* field = (FieldList*)malloc(sizeof(FieldList));
                    field->type = funcField->type->u.function.type;
                    field->tail = NULL;
                    field->name = NULL;
                    node->syn = field;
                }
                else {
                    char s[512];
                    sprintf(s, "Function \"%s\" is not applicable for arguments", node->child->val.strVal);
                    serror(9, node->lineNum, s);
                }
            }
            else {
                char s[512];
                sprintf(s, "\"%s\" is not a function", node->child->val.strVal);
                serror(11, node->lineNum, s);
            }
        }
        else {
            HashTable* dec = FunDecList_find(node->child->val.strVal);
            char s[512];
            sprintf(s, "Undefined function \"%s\"", node->child->val.strVal);
            if(dec)
                //serror(18, dec->size, s);
                ;
            else 
                serror(2, node->lineNum, s);
            
        }
    }
    //Exp -> ID LP RP
    else if(node->smtmType == 13){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Exp13...\n");
        #endif
        HashTable* funcField = hash_find(node->child->val.strVal);
        if(funcField){
            if(funcField->type->kind == sFUNCTION){
                if(funcField->type->u.function.argc == 0){
                    FieldList* field = (FieldList*)malloc(sizeof(FieldList));
                    field->tail = NULL;
                    field->name = NULL;
                    field->type = funcField->type->u.function.type;
                    node->syn = field;
                }
                else {
                    char s[512];
                    sprintf(s, "Function \"%s\" is not applicable for arguments", node->child->val.strVal);
                    serror(9, node->lineNum, s);
                }
            }
            else {
                char s[512];
                sprintf(s, "\"%s\" is not a function", node->child->val.strVal);
                serror(11, node->lineNum, s);
            }
        }
        else {
            char s[512];
            sprintf(s, "Undefined function \"%s\"", node->child->val.strVal);
            serror(2, node->lineNum, s);
        }
    }
    //Exp -> Exp LB Exp RB
    else if(node->smtmType == 14){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Exp14...\n");
        #endif
        smtm_Exp(node->child);
        smtm_Exp(node->child->next->next);
        FieldList* syn1 = node->child->syn, *syn2 = node->child->next->next->syn;
        if(syn1 == NULL || syn2 == NULL) return;
        else if(syn1->type->kind == sARRAY){
            FieldList* field = (FieldList*)malloc(sizeof(FieldList));
            field->type = syn1->type->u.array.elem;
            field->name = syn1->name;
            field->tail = NULL;
            node->syn = field;
        }
        else {
            char s[512];
            sprintf(s, "\"%s\" is not an array", syn1->name);
            serror(10, node->child->lineNum, s);
        }

        if(syn2->type->kind == sINT){
            ;
        }
        else {
            char s[512];
            sprintf(s, "\"%d\" is not an integer", node->child->next->next->val.intVal);
            serror(12, node->child->next->next->lineNum, s);
        }
    }
    //Exp -> Exp DOT ID
    else if(node->smtmType == 15){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Exp15...\n");
        #endif
        smtm_Exp(node->child);
        FieldList* syn1 = node->child->syn;
        if(syn1 == NULL) return;
        else if(syn1->type->kind == sSTRUCTVAR) {
            #ifdef SEM_DEBUG
                printType(syn1->type, 0);
            #endif
            FieldList *p = syn1->type->u.structVar;
            bool validVarFlag = false;
            while(p){
                if(!strcmp(p->name, node->child->next->next->val.strVal)){
                    #ifdef SEM_DEBUG
                        printf("name matched: %s, kind = %d\n", p->name, p->type->kind);
                    #endif
                    validVarFlag = true;
                    node->syn = p;
                    break;
                }
                p = p->tail;
            }
            if(!validVarFlag){
                char s[512];
                sprintf(s, "Non-existent field\"%s\"", node->child->next->next->val.strVal);
                serror(14, node->child->lineNum, s);
            }
        }
        else 
            serror(13, node->child->lineNum, " Illegal use of \".\"");
    }
    //Exp -> ID
    else if(node->smtmType == 16){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Exp16...\n");
        #endif
        HashTable* id = hash_find(node->child->val.strVal);
        if(id){
            FieldList* field = (FieldList*)malloc(sizeof(FieldList));
            #ifdef SEM_DEBUG
                printType(id->type, 0);
            #endif
            field->type = id->type;
            field->tail = NULL;
            field->name = id->name;
            node->syn = field;
        }
        else {
            char s[512];
            sprintf(s, "Undefined variable \"%s\"", node->child->val.strVal);
            serror(1, node->lineNum, s);
        }
    }
    //Exp -> INT
    else if(node->smtmType == 17){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Exp17...\n");
        #endif
        FieldList* field = (FieldList*)malloc(sizeof(FieldList));
        field->tail = NULL;
        field->name = NULL;
        field->type = (sType*)malloc(sizeof(sType));
        field->type->kind = sINT;
        node->syn = field;
    }
    //Exp -> FLOAT
    else if(node->smtmType == 18){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Exp18...\n");
        #endif
        FieldList* field = (FieldList*)malloc(sizeof(FieldList));
        field->tail = NULL;
        field->name = NULL;
        field->type = (sType*)malloc(sizeof(sType));
        field->type->kind = sFLOAT;
        node->syn = field;
    }
    return ;
}

void smtm_Args(Node *node){
    //Args -> Exp...
    smtm_Exp(node->child);
    FieldList* syn1 = node->child->syn;
    if(syn1){
        node->syn = (FieldList*)malloc(sizeof(FieldList));
        node->syn->tail = NULL;
        node->syn->name = syn1->name;
        node->syn->type = syn1->type;
    }
    else 
        node->syn = NULL;
    //Args -> Exp COMMA Args
    if(node->smtmType == 1){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Args1...\n");
        #endif
        smtm_Args(node->child->next->next);
        if(node->syn)
            node->syn->tail = node->child->next->next->syn;
    }
    //Args -> Exp
    else if(node->smtmType == 2){
        #ifdef SEM_DEBUG
            fprintf(stderr, "smtm_Args2...\n");
        #endif
        ;
        /*smtm_Exp(node->child);
        FieldList* syn1 = node->child->syn;
        if(syn1){
            node->syn = (FieldList*)malloc(sizeof(FieldList));
            node->syn->tail = NULL;
            node->syn->name = syn1->name;
            node->syn->type = syn1->type;
        }
        else 
            node->syn = NULL;*/
    }
    return ;
}

bool structFieldCmp(FieldList* a, FieldList* b){
    while(a != NULL && b != NULL) {
        if(a == b) return true;
        if(a->type->kind != b->type->kind) return false;
        if(a->type->kind ==sSTRUCTURE || a->type->kind == sSTRUCTVAR)
            if(!structFieldCmp(a->type->u.structVar, b->type->u.structVar)) return false;
        else if(a->type->kind == sARRAY)
            if(!arrayTypeCmp(a->type, b->type)) return false;
        a = a->tail, b = b->tail;
    }
    if(a == NULL && b == NULL)
        return true;
    return false;
}

bool funcFieldCmp(FieldList* a, FieldList* b){
    while(a != NULL && b != NULL) {
        if(a->type->kind != b->type->kind) return false;
        if(a->type->kind == sSTRUCTVAR)
            if(!structFieldCmp(a->type->u.structVar, b->type->u.structVar)) return false;
        else if(a->type->kind == sARRAY)
            if(!arrayTypeCmp(a->type, b->type)) return false;
        else if(a == b) return true;
        a = a->tail, b = b->tail;
    }
    if(a == NULL && b == NULL)
        return true;
    return false;
}

bool arrayTypeCmp(sType*a, sType* b){
    while(a != NULL && b != NULL) {
        if(a->u.array.elem->kind != b->u.array.elem->kind) return false;
        if(a->u.array.elem->kind == sSTRUCTURE || a->u.array.elem->kind == sSTRUCTVAR)
            if(!structFieldCmp(a->u.array.elem->u.structure, b->u.array.elem->u.structure)) return false;
            else return true;
        else if(a->u.array.elem->kind != sARRAY)
            return true;
        else if(a == b) return true;
        a = a->u.array.elem, b = b->u.array.elem;
    }
    if(a == NULL && b == NULL)
        return true;
    return false;
}


void printType(sType* type, int depth)
{
    for (int i = 0; i < depth; ++i)
        printf("  ");
    printf("type: ");
    switch (type->kind) {
    case sINT:
        printf("int\n");
        break;
    case sFLOAT:
        printf("float\n");
        break;
    case sARRAY:
        printf("array, size: %d\n", type->u.array.size);
        printType(type->u.array.elem, depth + 1);
        break;
    case sSTRUCTURE: {
        printf("structure\n");
        FieldList* p = type->u.structure;
        while (p) {
            for (int i = 0; i < depth + 1; ++i)
                printf("  ");
            printf("name: %s\n", p->name);
            printType(p->type, depth + 1);
            p = p->tail;
        }
        break;
    }
    case sSTRUCTVAR: {
        printf("structvar\n");
        FieldList* p = type->u.structVar;
        while (p) {
            for (int i = 0; i < depth + 1; ++i)
                printf("  ");
            printf("name: %s\n", p->name);
            printType(p->type, depth + 1);
            p = p->tail;
        }
    } break;
    case sFUNCTION: {
        printf("function\n");
        sType* ret = type->u.function.type;
        for (int i = 0; i < depth + 1; ++i)
            printf("  ");
        printf("return:\n");
        printType(ret, depth + 2);
        for (int i = 0; i < depth + 1; ++i)
            printf("  ");
        printf("argc: %d\n", type->u.function.argc);
        for (int i = 0; i < depth + 1; ++i)
            printf("  ");
        printf("args:\n");
        FieldList* p = type->u.function.argList;
        while (p) {
            for (int i = 0; i < depth + 2; ++i)
                printf("  ");
            printf("name: %s\n", p->name);
            printType(p->type, depth + 2);
            p = p->tail;
        }
    } break;
    default:
        // printf("%d\n", type->kind);
        break;
    }
}