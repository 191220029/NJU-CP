%{
    #include "syntax.tab.h"
    int yycolumn = 1;
    #define YY_USER_ACTION \
        yylloc.first_line = yylloc.last_line = yylineno; \
        yylloc.first_column = yycolumn; \
        yylloc.last_column = yycolumn + yyleng - 1; \
        yycolumn += yyleng;

    extern int correct;
%}
%option yylineno

DIGIT [0-9]
LETTER [_a-zA-Z]
NLETTER [~`@#$%^|\"\'\\\?:]
RELOP >|<|>=|<=|==|!=
TYPE int|float
WHITESPACE [\t ]+

%%
{WHITESPACE} {}
\n {yycolumn = 1;}
\/\/.* {}
\/\*.*\*\/.*\*\/ {printf("Error type A at Line %d: Invalid comment \'%s\'.\n", yylineno, yytext); correct = 0;}
"/*"(([^\*]|\*+[^\*\/]|{WHITESPACE})*\n?)*\*+\/ {}


([1-9]{DIGIT}*)|0 {yylval.node = createNode("INT", Int, 0, yytext); return INT;}
0[0-7]+ {yylval.node = createNode("OCT", Int, 0, yytext); return INT;}
0{DIGIT}+ {printf("Error type A at Line %d: Invalid octal number \'%s\'.\n", yylineno, yytext); correct = 0; yylval.node = createNode("INT", Int, 0, yytext); return INT;}
0[xX][0-9a-fA-F]+ {yylval.node = createNode("HEX", Int, 0, yytext); return INT;}
0[xX][0-9a-zA-Z]+ {printf("Error type A at Line %d: Invalid heximal number \'%s\'.\n", yylineno, yytext); correct = 0; yylval.node = createNode("INT", Int, 0, yytext); return INT;}
({DIGIT}*\.?{DIGIT}+|{DIGIT}+\.)[eE][+-]?{DIGIT}+ {yylval.node = createNode("FLOAT", Float, 0, yytext); return FLOAT;}
({DIGIT}*\.?{DIGIT}+|{DIGIT}+\.)[eE][+-]?({DIGIT}*\.{DIGIT}*)? {printf("Error type A at Line %d: Invalid float number \'%s\'.\n", yylineno, yytext); correct = 0; yylval.node = createNode("FLOAT", Float, 0, yytext); return FLOAT;}
{DIGIT}+\.{DIGIT}+ {yylval.node = createNode("FLOAT", Float, 0, yytext); return FLOAT;}
\.{DIGIT}+|{DIGIT}+\. {printf("Error type A at Line %d: Invalid float number \'%s\'.\n", yylineno, yytext); correct = 0; yylval.node = createNode("FLOAT", Float, 0, yytext); return FLOAT;}


{TYPE} {yylval.node = createNode("TYPE", Type, 0, yytext); return TYPE;}
struct {yylval.node = createNode("STRUCT", Rkw, 0, yytext); return STRUCT;}
return {yylval.node = createNode("RETURN", Rkw, 0, yytext); return RETURN;}
if {yylval.node = createNode("IF", Rkw, 0, yytext); return IF;}
else {yylval.node = createNode("ELSE", Rkw, 0, yytext); return ELSE;}
while {yylval.node = createNode("WHILE", Rkw, 0, yytext); return WHILE;}

{LETTER}+({DIGIT}|{LETTER})* {yylval.node = createNode("ID", Id, 0, yytext); return ID;}
; {yylval.node = createNode("SEMI", Rkw, 0, yytext); return SEMI;}
, {yylval.node = createNode("COMMA", Rkw, 0, yytext); return COMMA;}
= {yylval.node = createNode("ASSIGNOP", Rkw, 0, yytext); return ASSIGNOP;}
{RELOP} {yylval.node = createNode("RELOP", Relop, 0, yytext); return RELOP;}
\+ {yylval.node = createNode("PLUS", Rkw, 0, yytext); return PLUS;}
- {yylval.node = createNode("MINUS", Rkw, 0, yytext); return MINUS;}
\* {yylval.node = createNode("STAR", Rkw, 0, yytext); return STAR;}
\/ {yylval.node = createNode("DIV", Rkw, 0, yytext); return DIV;}
&& {yylval.node = createNode("AND", Rkw, 0, yytext); return AND;}
\|\| {yylval.node = createNode("OR", Rkw, 0, yytext); return OR;}
\. {yylval.node = createNode("DOT", Rkw, 0, yytext); return DOT;}
! {yylval.node = createNode("NOT", Rkw, 0, yytext); return NOT;}
\( {yylval.node = createNode("LP", Rkw, 0, yytext); return LP;}
\) {yylval.node = createNode("RP", Rkw, 0, yytext); return RP;}
\[ {yylval.node = createNode("LB", Rkw, 0, yytext); return LB;}
\] {yylval.node = createNode("RB", Rkw, 0, yytext); return RB;}
\{ {yylval.node = createNode("LC", Rkw, 0, yytext); return LC;}
\} {yylval.node = createNode("RC", Rkw, 0, yytext); return RC;}





. {printf("Error type A at Line %d: Undefined identifier \'%s\'.\n", yylineno, yytext); correct = 0;}
%%