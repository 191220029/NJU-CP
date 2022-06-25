%locations
%define parse.error verbose
%{
    #include "tree.h"
    int yylex();
    int yyerror(const char* s, ...);

    typedef unsigned char uint8_t;

    int correct = 1;

    int syserr = 0;
    int defined_err = 0;
    int ignore_line = 0;

%}

/* declared types */
%union{
    Node *node;
}

%right <node> ASSIGNOP
%left <node> OR
%left <node> AND
%left <node> RELOP
%left <node> PLUS MINUS
%left <node> STAR DIV
%left <node> NOT
%left <node> LP RP LB RB DOT
%token <node> INT FLOAT TYPE STRUCT RETURN IF ELSE WHILE ID SEMI COMMA LC RC

%type <node> Program ExtDefList ExtDef Specifier ExtDecList FunDec CompSt StructSpecifier OptTag VarList ParamDec VarDec DefList Tag StmtList Exp Stmt Def DecList Dec Args //Complex


%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE

%%
/* High-level Definitions */
Program : ExtDefList {root = createNode("Program", Gu, 1, 1, @1.first_line, $1);}
    ;

//ExtDefList may have 0 or positive num of ExtDef
ExtDefList : {$$ = createNode("ExtDefList", Null, 1);} 
    | ExtDef ExtDefList {$$ = createNode("ExtDefList", Gu, 2, 2, @1.first_line, $1, $2);}
    ;

ExtDef : Specifier ExtDecList SEMI {$$ = createNode("ExtDef", Gu, 1, 3, @1.first_line, $1, $2, $3);} //This is def of global variable
    | Specifier SEMI {$$ = createNode("ExtDef", Gu, 2, 2, @1.first_line, $1, $2);} //This is def of struct
    | Specifier FunDec CompSt {$$ = createNode("ExtDef", Gu, 3, 3, @1.first_line, $1, $2, $3);} //This is def of function
    | Specifier FunDec SEMI {$$ = createNode("ExtDef", Gu, 4, 2, @1.first_line, $1, $2);}
    //| error SEMI {yyerror("Missing type error SEMI", @1.first_line); yyerrok;} //Missing/Invalid Specifier
    //| Specifier error {yyerror("Missing \';\' Specifier error", @2.first_line); yyerrok;} //Missing SEMI
    //| Specifier error SEMI {yyerror("Invalid Definition. Specifier error SEMI", @2.first_line); yyerrok;} //Missing SEMI
    ;

//Def of variable
ExtDecList : VarDec {$$ = createNode("ExtDecList", Gu, 1, 1, @1.first_line, $1);}
    | VarDec COMMA ExtDecList {$$ = createNode("ExtDecList", Gu, 2, 3, @1.first_line, $1, $2, $3);}
    //| VarDec error COMMA ExtDecList {yyerror("Invalid varbose' VarDec error ExtDecList", @2.first_line); yyerrok;}
    //| VarDec error ExtDecList   {yyerror("Missing \',\' VarDec error ExtDecList", @2.first_line); yyerrok;} //Missing COMMA
    //| VarDec error {yyerror("Missing \';\' VarDec error", @2.first_line); yyerrok;}
    ;
/* Specifiers */
Specifier : TYPE {$$ = createNode("Specifier", Gu, 1, 1, @1.first_line, $1);} //single TYPE
    | StructSpecifier {$$ = createNode("Specifier", Gu, 2, 1, @1.first_line, $1);} //struct descriptor
    ;

StructSpecifier : STRUCT OptTag LC DefList RC {$$ = createNode("StructSpecifier", Gu, 1, 5, @1.first_line, $1, $2, $3, $4, $5);} //Def of struct
    | STRUCT Tag  {$$ = createNode("StructSpecifier", Gu, 2, 2, @1.first_line, $1, $2);} //Dec of struct
    | STRUCT OptTag LC error RC {yyerror("Invalid struct define", @2.first_line); yyerrok;}
    ;

OptTag : ID {$$ = createNode("OptTag", Gu, 1, 1, @1.first_line, $1);}
    | {$$ = createNode("OptTag", Null, 2);}
    ;

Tag : ID {$$ = createNode("Tag", Gu, 1, 1, @1.first_line, $1);}
    ;

/* Declarators */
//variable declaration
VarDec : ID {$$ = createNode("VarDec", Gu, 1, 1, @1.first_line, $1);}
    | VarDec LB INT RB {$$ = createNode("VarDec", Gu, 2, 4, @1.first_line, $1, $2, $3, $4);}
    //| VarDec error RB {yyerror("Missing \'[\'", @3.first_line); yyerrok;}
    //| VarDec LB error RB {yyerror("Missing INT VarDec LB error RB", @3.first_line); yyerrok;}
    //| VarDec LB error {yyerror("Missing \']\' VarDec LB error", @3.first_line); yyerrok;}
    ;

//function declaration
FunDec : ID LP VarList RP {$$ = createNode("FunDec", Gu, 1, 4, @1.first_line, $1, $2, $3, $4);}
    | ID LP RP {$$ = createNode("FunDec", Gu, 2, 3, @1.first_line, $1, $2, $3);} //func without param
    //| error LP VarList RP {yyerror("Identifier expected", @1.first_line); yyerrok;}
    //| ID LP VarList error {yyerror("Missing \')\'", @1.first_line); yyerrok;}
    //| ID LP error RP {yyerror("Invalid argument(s)", @3.first_line); yyerrok;}
    //| ID LP error {yyerror("ID LP error", @3.first_line);}
    //| error LP VarList     {yyerror("Invalid function name", @1.first_line); yyerrok;}
    ;

//param list
VarList : ParamDec COMMA VarList {$$ = createNode("VarList", Gu, 1, 3, @1.first_line, $1, $2, $3);}
    | ParamDec {$$ = createNode("VarList", Gu, 2, 1, @1.first_line, $1);}
    ;

//param
ParamDec : Specifier VarDec {$$ = createNode("ParamDec", Gu, 1, 2, @1.first_line, $1, $2);}
    ;

/* Statements */
//content in {}
CompSt : LC DefList StmtList RC {$$ = createNode("CompSt", Gu, 1, 4, @1.first_line, $1, $2, $3, $4);}
    //| LC StmtList error RC {yyerror("Define before using", @1.first_line);}
    //| LC error RC {yyerror("Invalid statement(s)", @1.first_line); yyerrok;}
    ;

StmtList : Stmt StmtList {$$ = createNode("StmtList", Gu, 1, 2, @1.first_line, $1, $2);}
    | {{$$ = createNode("StmtList", Null, 2);}}
    //| error StmtList {yyerror("error StmtList", @1.first_line);}
    //| Stmt error StmtList {yyerror("Stmt error StmtList", @2.first_line);}
    ;

Stmt : Exp SEMI {$$ = createNode("Stmt", Gu, 1, 2, @1.first_line, $1, $2);}
    | CompSt {$$ = createNode("Stmt", Gu, 2, 1, @1.first_line, $1);}
    | RETURN Exp SEMI {$$ = createNode("Stmt", Gu, 3, 3, @1.first_line, $1, $2, $3);}
    //| IF LP Exp RP Stmt {$$ = createNode("Stmt", Gu, 5, @1.first_line, $1, $2, $3, $4, $5);}
    | IF LP Exp RP Stmt %prec LOWER_THAN_ELSE {$$ = createNode("Stmt", Gu, 4, 5, @1.first_line, $1, $2, $3, $4, $5);}
    | IF LP Exp RP Stmt ELSE Stmt {$$ = createNode("Stmt", Gu, 5, 7, @1.first_line, $1, $2, $3, $4, $5, $6, $7);}
    | WHILE LP Exp RP Stmt {$$ = createNode("Stmt", Gu, 6, 5, @1.first_line, $1, $2, $3, $4, $5);}
    //| WHILE LP Exp Stmt {yyerror("syntex error", @3.first_line); yyerror("Missing \')\'", @3.last_line); yyerrok;}
    //| Exp WHILE LP Exp RP Stmt {yyerror("syntex error", @1.last_line); yyerror("Missing \';\' Exp WHILE LP Exp RP Stmt"); yyerrok;}
    //| IF LP error RP Stmt ELSE Stmt {yyerror("Invalid expression IF LP error RP Stmt ELSE Stmt", @1.first_line); yyerrok;}
    //| error SEMI {yyerror("Invalid expression or Definition after statement error SEMI", @1.first_line); yyerrok;}
    //| Exp Exp SEMI{yyerror("syntax error", @1.first_line); yyerror("Invalid statement Exp error SEMI", @1.first_line); yyerrok;}
    //| Exp error SEMI{yyerror("Invalid statement Exp error SEMI", @1.first_line); yyerrok;}
    //| Exp error {if (@1.first_line != ignore_line) {yyerror("Missing \';\' Exp error", @1.first_line); yyerrok;} yyerrok;}
    //| Exp error SEMI {yyerror("Missing \';\'", @2.first_line);}
    //| RETURN Exp error {yyerror("Missing \';\' RETURN Exp error", @3.first_line); yyerrok;}
    //| RETURN error SEMI {yyerror("Invalid return value", @2.first_line);}
    ;

/* Local Definitions */
DefList : Def DefList {$$ = createNode("DefList", Gu, 1, 2, @1.first_line, $1, $2);}
    | {{$$ = createNode("DefList", Null, 2);}}
    ;
Def : Specifier DecList SEMI {$$ = createNode("Def", Gu, 1, 3, @1.first_line, $1, $2, $3);}//一条变量定义
    //| Specifier error SEMI {yyerror("Missing ID", @2.first_line);}
    //| Specifier DecList error {yyerror("Missing \';\' Specifier DecList error", @3.first_line); yyerrok;}
    //|Specifier error {yyerror("Specifier DecList error Missing \';\'", @2.first_line); yyerrok;}
    ;
DecList : Dec {$$ = createNode("DecList", Gu, 1, 1, @1.first_line, $1);}
    | Dec COMMA DecList {$$ = createNode("DecList", Gu, 2, 3, @1.first_line, $1, $2, $3);}
    //| Dec error DecList {yyerror("Missing \',\' Dec error DecList", @2.first_line);}
    //| Dec error {yyerror("Missing \';\' Dec error", @2.first_line); yyerrok;}
    ;
Dec : VarDec {$$ = createNode("Dec", Gu, 1, 1, @1.first_line, $1);}
    | VarDec ASSIGNOP Exp {$$ = createNode("Dec", Gu, 2, 3, @1.first_line, $1, $2, $3);} // 定义时可以初始化
    //| VarDec ASSIGNOP error {yyerror("Invalid expression", @3.first_line); yyerrok;}
    ;

// Expressions
Exp : Exp ASSIGNOP Exp {$$ = createNode("Exp", Gu, 1, 3, @1.first_line, $1, $2, $3);}
    | Exp AND Exp {$$ = createNode("Exp", Gu, 2, 3, @1.first_line, $1, $2, $3);}
    | Exp OR Exp {$$ = createNode("Exp", Gu, 3, 3, @1.first_line, $1, $2, $3);}
    | Exp RELOP Exp {$$ = createNode("Exp", Gu, 4, 3, @1.first_line, $1, $2, $3);}
    //| Exp RELOP error Exp {yyerror("Invalid expression' Exp RELOP error Exp", @3.first_line);}

    | Exp PLUS Exp {$$ = createNode("Exp", Gu, 5, 3, @1.first_line, $1, $2, $3);}
    | Exp MINUS Exp {$$ = createNode("Exp", Gu, 6, 3, @1.first_line, $1, $2, $3);}
    | Exp STAR Exp {$$ = createNode("Exp", Gu, 7, 3, @1.first_line, $1, $2, $3);}
    | Exp DIV Exp {$$ = createNode("Exp", Gu, 8, 3, @1.first_line, $1, $2, $3);}
    | LP Exp RP {$$ = createNode("Exp", Gu, 9, 3, @1.first_line, $1, $2, $3);}
    | MINUS Exp {$$ = createNode("Exp", Gu, 10, 2, @1.first_line, $1, $2);}
    | NOT Exp {$$ = createNode("Exp", Gu, 11, 2, @1.first_line, $1, $2);}
    | ID LP Args RP {$$ = createNode("Exp", Gu, 12, 4, @1.first_line, $1, $2, $3, $4);}
    | ID LP RP {$$ = createNode("Exp", Gu, 13, 3, @1.first_line, $1, $2, $3);}
    | Exp LB Exp RB {$$ = createNode("Exp", Gu, 14, 4, @1.first_line, $1, $2, $3, $4);}
    | Exp DOT ID {$$ = createNode("Exp", Gu, 15, 3, @1.first_line, $1, $2, $3);}
    | ID {$$ = createNode("Exp", Gu, 16, 1, @1.first_line, $1);}
    | INT {$$ = createNode("Exp", Gu, 17, 1, @1.first_line, $1);}
    | FLOAT {$$ = createNode("Exp", Gu, 18, 1, @1.first_line, $1);}
    //| Exp DIV error Exp {yyerror("Invalid expression", @3.first_line); yyerrok;}
    //| Exp ASSIGNOP error {yyerror("Invalid expression", @3.first_line); yyerrok;}
    //| Exp AND error {yyerror("Invalid expression", @3.first_line); yyerrok;}
    //| Exp OR error {yyerror("Invalid expression", @3.first_line); yyerrok;}
    //| Exp RELOP error {yyerror("Invalid expression Exp RELOP error", @3.first_line); yyerrok;}
    //| Exp PLUS error {yyerror("Invalid expression Exp PLUS error", @3.first_line); yyerrok;}
    //| Exp MINUS error {yyerror("Invalid expression", @3.first_line); yyerrok;}
    //| Exp STAR error {yyerror("Invalid expression", @3.first_line); yyerrok;}
    //| Exp DIV error {yyerror("Invalid expression", @3.first_line); yyerrok;}
    //| LP error RP {yyerror("Invalid expression", @2.first_line);}
    //| MINUS error {yyerror("Invalid expression", @2.first_line); yyerrok;}
    //| NOT error {yyerror("Invalid expression", @2.first_line); yyerrok;}
    //| MINUS error Exp {yyerror("Invalid expression", @2.first_line); yyerrok;}
    //| NOT error Exp {yyerror("Invalid expression NOT error Exp", @2.first_line); yyerrok;}
    //| ID LP error RP {yyerror("Invalid argument(s)", @3.first_line); yyerrok;}
    //| ID LP error SEMI {yyerror("Missing \')\'", @3.first_line); ignore_line = @3.first_line;}
    //| ID LP error {yyerror("Missing \')\'", @3.first_line);}
    //| Exp LB error RB {yyerror("Missing \']\' Exp LB error RB", @3.first_line);}
    //| Exp LB error SEMI {yyerror("Missing \']\' Exp LB error SEMI", @3.first_line); ignore_line = @3.first_line;}
    //| Exp error STAR Exp {yyerror("Invalid expression' Exp error STAR Exp", @3.first_line);}
    ;

Args : Exp COMMA Args {$$ = createNode("Args", Gu, 1, 3, @1.first_line, $1, $2, $3);}
    | Exp {$$ = createNode("Args", Gu, 2, 1, @1.first_line, $1);}
    ;

%%
#include "lex.yy.c"

int yyerror(const char *s, ...)
{
    correct = 0;
    va_list paramList;
    va_start(paramList, s);
    int line_num = va_arg(paramList, int);
    if (s[0] == 's' && s[1] == 'y')
    {
        if(line_num)
            printf("Error type B at Line %d: %s", line_num, s);
        else printf("Error type B at Line %d: %s", yylineno, s);
        syserr++;
    }
    else
    {
        printf(" %s.\n", s);
        defined_err++;
    }
    return 0;
}