all: cmm

cmm: analisador.lex
	flex analisador.lex
	g++ lex.yy.c -o cmm

run: cmm teste.cmm
	./cmm < teste.cmm

clean:
	rm -f cmm lex.yy.c
