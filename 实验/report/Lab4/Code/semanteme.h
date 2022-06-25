#pragma once
#include "tree.h"
#define HASHSIZE 0x3FFF

typedef struct Operand_ Operand;
struct _FieldList
{
    char* name;
    sType* type;
    FieldList* tail;
    bool funcVarFlag;
    bool funDecFlag;
};


struct _sType
{
    enum{ sINT, sFLOAT, sARRAY, sSTRUCTURE, sSTRUCTVAR, sFUNCTION, sWRONGFUNC} kind;
    union {
        //int, float:
        int basic;
        //array:
        struct{
            sType* elem;
            int size;
        } array;
        //struct:
        FieldList* structure;
        FieldList* structVar;
        //function:
        struct {
            sType*  type;
            int argc;
            FieldList* argList;
        } function;
    } u;
};

struct _HashTable
{
    char* name;
    sType* type;
    HashTable* next;
    unsigned size;
    HashTable* stackRoot;
    HashTable* down;
    bool isStackNode;
    Operand* operand;
} *hashTable[HASHSIZE+1], *hashStack, *curStackField, *funDecList;

unsigned hash_pjw(char* name);
void serror(int typeNo, int lineNo, const char* err);

void initTable();
void hash_add(HashTable* a);
HashTable* hash_find(char* name);

void initStack();
HashTable* stack_newNode();
void del_curStackField();
bool fieldContain(HashTable* rootA, HashTable* rootB);

void initFunDecList();
void FunDecList_add(HashTable *a);
HashTable* FunDecList_find(char* a);
void FunDecList_del(char* a);
void FunDecList_chk();

void smtm_Program(Node* node);
void smtm_ExtDefList(Node* node);
void smtm_Specifier(Node *node);
void smtm_ExtDecList(Node *node);
void smtm_ExtDef(Node *node);
void smtm_FunDec(Node *node);
void smtm_VarList(Node *node);
void smtm_ParamDec(Node *node);
void smtm_CompSt(Node *node);
void smtm_StructSpecifier(Node *node);
void smtm_OptTag(Node *node);
void smtm_Tag(Node *node);
void smtm_VarDec(Node *node);
void smtm_DefList(Node *node);
void smtm_Def(Node *node);
void smtm_DecList(Node *node);
void smtm_Dec(Node *node);
void smtm_StmtList(Node *node);
void smtm_Stmt(Node *node);
void smtm_Exp(Node *node);
void smtm_Args(Node *node);

bool structFieldCmp(FieldList* a, FieldList* b);
bool funcFieldCmp(FieldList* a, FieldList* b);
bool arrayTypeCmp(sType*a, sType* b);
