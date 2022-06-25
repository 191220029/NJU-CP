#include "tree.h"

Node* createNode(char* _name, wType _wType, int _smtmType, ...) {
    Node *a = (Node*)malloc(sizeof(Node));
    va_list paramList;
    a->name = _name;
    //fprintf(stderr, "%s\n", _name);
    a->type = _wType;
    a->smtmType = _smtmType;
    a->child = a->next = a->parent = NULL;
    a->structVarFlag = false;
    va_start(paramList, _smtmType);
    switch(_wType){
        case Int: {
            if(!strcmp(a->name, "INT"))
                a->val.intVal = (unsigned)atoi(va_arg(paramList, char*));
            else if (!strcmp(a->name, "OCT"))
                sscanf(va_arg(paramList, char*), "%ou", &a->val.intVal);
            else// if (!strcmp(a->name, "HEX"))
                sscanf(va_arg(paramList, char*), "%xu", &a->val.intVal);
            break;
        }
        case Float: {
            a->val.floatVal = (float)atof(va_arg(paramList, char*));
            break;
        }
        case Type: {
            strcpy(a->val.strVal, va_arg(paramList, char*));
            break;
        }
        case Id: {
            strcpy(a->val.strVal, va_arg(paramList, char*));
            break;
        }
        case Relop: {
            strcpy(a->val.strVal, va_arg(paramList, char*));
            break;
        }
        case Rkw: {
            strcpy(a->val.strVal, va_arg(paramList, char*));
            break;
        }
        case Null: {
            break;
        }
        case Gu:{
            int n = va_arg(paramList, int);
            a->lineNum = va_arg(paramList, int);
            a->child = (struct Node*)va_arg(paramList, Node*);
            a->child->parent = (struct Node*)a;
            Node* p = (Node*)a->child;
            for(int i = 0; i < n - 1; i++){
                p->next = (struct Node*)va_arg(paramList, Node*);
                p = (Node*)p->next;
            }
            break;
        }
        default:;
    }
    va_end(paramList);
    return a;
}

void printNode(Node* node, int depth){
        if(node->type != Null){
            for(int i = 0; i <depth; i++)
                printf("  ");
        }
        Node *p = node;
        switch(p->type){
            case Int: {
                printf("INT: %u\n", p->val.intVal);
                break;
            }
            case Float: {
                printf("FLOAT: %f\n", p->val.floatVal);
                break;
            }
            case Type: {
                printf("TYPE: %s\n", p->val.strVal);
                break;
            }
            case Id: {
                printf("ID: %s\n", p->val.strVal);
                break;
            }
            case Relop: {
                printf("%s\n", p->name);
                break;
            }
            case Rkw: {
                printf("%s\n", p->name);
                break;
            }
            case Null: {
                break;
            }
            case Gu:{
                printf("%s (%d)\n", p->name, p->lineNum);
                break;
            }
            default:;
        }
        if(p->child)
            printNode((Node*)p->child, depth + 1);
        if(p->next)
            printNode((Node*)p->next, depth);
}