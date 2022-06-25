#pragma once
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdarg.h>

typedef enum {
    Int, Float, Type, Id, Relop, Rkw, Null, Gu
}wType;

typedef enum __bool { false = 0, true = 1, } bool;
typedef struct _sType sType;
typedef struct _FieldList FieldList;
typedef struct _HashTable HashTable;

typedef struct Node {
    char* name;
    wType type;
    int smtmType;
    int lineNum;
    struct Node* child;
    struct Node* next;
    struct Node* parent;
    union {
        unsigned intVal;
        float floatVal;
        char strVal[40];
    }val;
    FieldList* inh;
    FieldList* syntax;
}Node;

Node* root;

Node* createNode(char* _name, wType _wType, int _smtmType, ...);
void printNode(Node* node, int depth);
