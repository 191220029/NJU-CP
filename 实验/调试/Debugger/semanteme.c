#pragma once
#include "semanteme.h"


bool semanticFlag = true;

unsigned hash_pjw(char* name) {
    unsigned val = 0, i;
    for (; *name; ++name) {
        val = (val << 2) + *name;
        if (i = val & ~HASHSIZE)
            val = (val ^ (i >> 12)) & HASHSIZE;
    }
    return val;
}

void add(HashTable* a) {
    unsigned index = hash_pjw(a->name);
    a->next = hashTable[index];
    hashTable[index] = a;
}

HashTable* search(char* name) {
    unsigned index = hash_pjw(name);
    for (HashTable* p = hashTable[index]; p != NULL; p = p->next) {
        if (!strcmp(p->name, name))
            return p;
    }
    return NULL;
}

void serror(int typeNo, int lineNo, const char* err) {
    printf("Error type %d at line %d: %s", typeNo, lineNo, err);
    semanticFlag = false;
    return;
}

void initTable() {
    memset(hashTable, Null, sizeof(int) * (HASHSIZE + 1));
    sType* type = (sType*)malloc(sizeof(sType));
    type->kind = sINT;

    sType* function = (sType*)malloc(sizeof(Type));
    function->kind = sFUNCTION;
    function->u.function.argc = 0;
    function->u.function.argList = NULL;
    function->u.function.type = type;

    HashTable* s = (HashTable*)malloc(sizeof(HashTable));
    s->name = "read";
    return;
}

void smtm_Program(Node* node) {
    if (!strcmp("ExtDefList", node->child->name)) {
        printf("smtm_Program\n");
        smtm_ExtDefList(node->child);
    }
    return;
}

void smtm_ExtDefList(Node* node) {
    //ExtDefList -> ExtDef ExtDefList
    if (node->smtmType == 2) {
        smtm_ExtDef(node->child);
        smtm_ExtDefList(node->child->next);
    };
}


void smtm_ExtDef(Node* node) {
    FieldList* extdef = (FieldList*)malloc(sizeof(FieldList));
    extdef->type = (sType*)malloc(sizeof(sType));
    extdef->tail = NULL;
    //ExtDef -> Specifier ExtDecList SEMI
    if (node->smtmType == 1) {
        node->child->inh = extdef;
        smtm_Specifier(node->child);
        node->child->next->inh = node->child->syntax;
        smtm_ExtDecList(node->child->next);
    }
    //ExtDef -> Specifier SEMI
    else if (node->smtmType == 2) {
        node->child->inh = extdef;
        smtm_Specifier(node->child);
    }
    //ExtDef -> Specifier FunDec CompSt
    else if (node->smtmType == 3) {
        extdef->type->kind = sFUNCTION;
        node->child->inh = extdef;
        node->child->next->inh = extdef;
        smtm_Specifier(node->child);
        //set return val type of func
        if (node->child->syntax->type->kind == sSTRUCTURE) {
            sType* tType = (sType*)malloc(sizeof(sType));
            tType->kind = sSTRUCTURE;
            tType->u.structVar = node->child->syntax->type->u.structure;
            node->child->inh->type->u.function.type = tType;
        }
        else {
            node->child->inh->type->u.function.type = node->child->syntax->type;
        }
        node->child->inh->type->u.function.argList = NULL;
        node->child->inh->type->u.function.argc = 0;
        smtm_FunDec(node->child->next);
        node->child->next->next->inh = node->child->syntax;
        smtm_CompSt(node->child->next->next);
    }
    return;
}

void smtm_Specifier(Node* node) {
    return;
}
void smtm_ExtDecList(Node* node) {
    return;
}
void smtm_FunDec(Node* node) {
    return;
}
void smtm_CompSt(Node* node) {
    return;
}
void smtm_VarDec(Node* node) {
    return;
}
void smtm_StructSpecifier(Node* node) {
    return;
}
void smtm_OptTag(Node* node) {
    return;
}
void smtm_DefList(Node* node) {
    return;
}
void smtm_Tag(Node* node) {
    return;
}
void smtm_VarList(Node* node) {
    return;
}
void smtm_ParamDec(Node* node) {
    return;
}
void smtm_StmtList(Node* node) {
    return;
}
void smtm_Stmt(Node* node) {
    return;
}
void smtm_Exp(Node* node) {
    return;
}
void smtm_Def(Node* node) {
    return;
}
void smtm_DecList(Node* node) {
    return;
}
void smtm_Dec(Node* node) {
    return;
}
void smtm_Args(Node* node) {
    return;
}