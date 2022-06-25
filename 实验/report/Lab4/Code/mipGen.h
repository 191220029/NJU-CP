#include "IR.h"

typedef enum _RELOPTYPE RELOPTYPE;

void initMipGen();
void MipGen(const char* dstFilePath);

int funcStackSpace(InterCodes *IRCodes);
int opStackSpace(Operand* op, int base);
int findOffset(Operand* op);
int relopType(const char* s);

void warnHandle(const char* s);
