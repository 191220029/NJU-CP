testFiles := $(shell ls ../Test/)
testFPaths := $(foreach file, $(testFiles),  ../Test/$(file))

parser:
	flex lexcial.l
	bison -d -v syntax.y
	gcc -c syntax.tab.c
	gcc -std=c99   -c -o semanteme.o semanteme.c
	gcc -std=c99   -c -o tree.o tree.c
	gcc -std=c99   -c -o IR.o IR.c
	gcc -std=c99   -c -o main.o main.c
	gcc -o parser semanteme.o tree.o IR.o main.o  syntax.tab.o -lfl -ly
	
.PHONY: test clean
test: parser	
	./parser $(testFPaths)
clean:
	rm -f parser lex.yy.c syntax.tab.c syntax.tab.h syntax.output *.o *.gch
