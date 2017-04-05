all: Preprocesador Scanner

Preprocesador: preprocesador.c
	gcc preprocesador.c -o pre
	./pre prueba.txt

Scanner: scanner.l
	flex scanner.l
	gcc -o scan lex.yy.c -lfl
	./scan
