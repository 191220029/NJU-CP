#include <stdio.h>
#include "semanteme.h"
//#include "IR.h"
#include "mipGen.h"
#define DEFAULT_DSTPATH "output/output.s"
#define DEFAULT_IR_DSTPATH "output/output.ir"

void perror(const char *__s);
int yyrestart();
int yyparse();
int yydebug;
extern int correct;
extern Node *root;
extern int syserr, defined_err;
extern bool semanticFlag;
extern bool IRFlag;
//void printNode(struct Node *node, int depth);


int main(int argc, char **argv) {
    if (argc <= 1)
        return 1;
    FILE *f = fopen(argv[1], "r");
    if (!f)
    {
        perror(argv[1]);
    }
    //printf("%s:\n", argv[i]);
    else {
        yyrestart(f);
        yydebug = 1;
        //fprintf(stderr, "yyparse started...\n");
        yyparse();
        //fprintf(stderr, "yyparse ended...\n");
        if (correct)
        {
            //printNode(root, 0);
            //fprintf(stderr, "processing...\n");
            initStack();
            initTable();
            initFunDecList();
            smtm_Program(root);
            FunDecList_chk();
            if(semanticFlag){
                init_IR();
                init_Var();
                IR_Program(root);
                //printIRCode(DEFAULT_IR_DSTPATH);
                initMipGen();
                if(argc == 3){
                    char *dst_path = argv[2];
                    //printf("%s\n", dst_path);
                    MipGen(dst_path);
                }
                else MipGen(DEFAULT_DSTPATH);
            }
        }
        else if (syserr > defined_err)
        {
            printf("\n");
        }
    }
    return 0;
}
