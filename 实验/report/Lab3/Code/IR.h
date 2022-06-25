#pragma once
#include "string.h"
#include "semanteme.h"

//typedef struct Operand_ Operand;
typedef enum O_kind_ O_kind;
enum O_kind_ { O_VARIABLE, O_CONSTANT, O_LABEL, O_FUNCTION, O_PARAMETER, O_TEMPVAR};
struct Operand_ {
    O_kind kind;
    union {
        int var_no;
        int value;
        char* name;
    } u;
    enum {VAL, ADDRESS} addrType;
};

typedef struct _InterCode InterCode;
struct _InterCode{
    enum {I_ASSIGN, I_ADD, I_SUB, I_MUL, I_DIV, I_LABEL, I_FUNCTION, I_IF, I_GOTO, I_PARAMETER,
    I_CALL, I_ARG, I_READ, I_WRITE, I_RETURN, I_DECLEAR} kind;
    union {
        struct {Operand *right, *left;} assign;
        struct {Operand *result, *op1, *op2;} binop;
        struct {Operand *result, *op;} sinop;
        struct {Operand *op;} sin;
        struct {Operand *op1, *op2, *target; char relop[3];} cond;
        struct {Operand *op; unsigned size;} dec;  
    }u;
    enum {DEFAULT, PTR, RVAL, WVAL, COPY} action;
};
typedef  enum I_Type I_Type;
enum I_Type {ASSIGN, BINOP, SINOP, SIN, COND, DEC};

typedef struct _InterCodes InterCodes;
struct _InterCodes {
    InterCode code;
    InterCodes *prev, *next;
};
InterCodes *IR_head, *IR_tail;

typedef struct _ArrayIndex ArrayIndex;
struct _ArrayIndex{
    Operand* operand;
    ArrayIndex* next;
};

void init_IR();
void init_Var();
unsigned init_Size(sType *type);

void IR_Program(Node* node);
void IR_ExtDefList(Node* node);
void IR_Specifier(Node *node);
void IR_ExtDecList(Node *node);
void IR_ExtDef(Node *node);
void IR_FunDec(Node *node);
void IR_VarList(Node *node, bool funcFlag);
void IR_ParamDec(Node *node, bool funcFlag);
void IR_CompSt(Node *node);
void IR_StructSpecifier(Node *node);
void IR_OptTag(Node *node);
void IR_Tag(Node *node);
void IR_VarDec(Node *node, bool structFlag, bool funcFlag);
void IR_DefList(Node *node);
void IR_Def(Node *node);
void IR_DecList(Node *node, bool structFlag);
void IR_Dec(Node *node, bool structFlag);
void IR_StmtList(Node *node);
void IR_Stmt(Node *node);
void IR_Exp(Node *node, Operand *place);
void IR_Args(Node *node, Operand** argList, int i);

void IR_Conds(Node* node, Operand* trueLabel, Operand* falseLable);

void add_InterCode(I_Type iType, ...);
Operand* create_Op(O_kind oKind, ...);

void printIRCode(const char* dstFilePath);
void printOperand(Operand* operand, char* s);

void Exp_optimizer(Node* Exp, Operand *t);

