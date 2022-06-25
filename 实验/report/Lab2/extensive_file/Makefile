testFiles := $(shell ls ../Test/)
testFPaths := $(foreach file, $(testFiles),  ../Test/$(file))

parser:
	flex lexcial.l
	bison -d -v syntax.y
	gcc -c syntax.tab.c
	gcc -std=c99   -c -o semanteme.o semanteme.c
	gcc -std=c99   -c -o tree.o tree.c
	gcc -std=c99   -c -o main.o main.c
	gcc -o parser semanteme.o main.o tree.o syntax.tab.o -lfl -ly

.PHONY: test clean
test: parser	
	./parser $(testFPaths)
	#$(foreach file, $(testFPaths),  $(shell ./parser $(file)))
	#../extensive_file/parser $(testFiles)
clean:
	rm -f parser lex.yy.c syntax.tab.c syntax.tab.h syntax.output *.o *.gch
