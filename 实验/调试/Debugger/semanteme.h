#pragma once
#include "tree.h"
#define HASHSIZE 0x3FFF

struct _FieldList
{
    char* name;
    sType* type;
    FieldList* tail;
};


struct _sType
{
    enum { sINT, sFLOAT, sARRARY, sSTRUCTURE, sSTRUCTVAR, sFUNCTION, sWRONGFUNC } kind;
    union {
        //int, float:
        int basic;
        //array:
        struct {
            sType* elem;
            int size;
        } array;
        //struct:
        FieldList* structure;
        FieldList* structVar;
        //function:
        struct {
            sType* type;
            int argc;
            FieldList* argList;
        } function;
    } u;
};

struct _HashTable
{
    char* name;
    wType type;
    HashTable* next;
    unsigned size;
} *hashTable[HASHSIZE + 1];


unsigned hash_pjw(char* name);
void serror(int typeNo, int lineNo, const char* err);

void smtm_Program(Node* node);
void smtm_ExtDefList(Node* node);
void smtm_Specifier(Node* node);
void smtm_ExtDecList(Node* node);
void smtm_ExtDef(Node* node);
void smtm_FunDec(Node* node);
void smtm_CompSt(Node* node);
void smtm_VarDec(Node* node);
void smtm_StructSpecifier(Node* node);
void smtm_OptTag(Node* node);
void smtm_DefList(Node* node);
void smtm_Tag(Node* node);
void smtm_VarList(Node* node);
void smtm_ParamDec(Node* node);
void smtm_StmtList(Node* node);
void smtm_Stmt(Node* node);
void smtm_Exp(Node* node);
void smtm_Def(Node* node);
void smtm_DecList(Node* node);
void smtm_Dec(Node* node);
void smtm_Args(Node* node);

