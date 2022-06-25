#include <stdio.h>
#include "semanteme.h"

void perror(const char *__s);
int yyrestart();
int yyparse();
int yydebug;
extern int correct;
extern Node *root;
extern int syserr, defined_err;
//void printNode(struct Node *node, int depth);


int main(int argc, char **argv) {
    if (argc <= 1)
        return 1;
    for(int i = 1; i < argc; i++){
        FILE *f = fopen(argv[i], "r");
        if (!f)
        {
            perror(argv[1]);
            continue;
        }
        //printf("%s:\n", argv[i]);
        yyrestart(f);
        yydebug = 1;
        //fprintf(stderr, "yyparse started...\n");
        yyparse();
        //fprintf(stderr, "yyparse ended...\n");
        if (correct)
        {
            //printNode(root, 0);
            //fprintf(stderr, "processing...\n");
            initTable();
            initStack();
            initFunDecList();
            smtm_Program(root);
            FunDecList_chk();
        }
        else if (syserr > defined_err)
        {
            printf("\n");
        }
    }
    
    return 0;
}
