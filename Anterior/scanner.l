%{
enum yytokentype {
	CONSTANT =1,
	KEYWORD =2,
	OPERATION=3,
	IDENTIFICATOR=4,
	STRING = 5,
	SYMBOL =6,
	SALTO = 7,
	BLANCO=8,
	EOL = 9,
	ERROR = 10,
	GREATEREQUAL = 11,
	LESSEQUAL = 12,
	LESSTHAN = 13,
	GREATERTHAN = 14,
	LEFTBRACKET = 15,
	RIGHTBRACKET = 16,
	DOLLAR = 17,
	MODULE = 18,
	AMPERSAND = 19,
	UNDERSCORE = 20,
	AND = 21,
	NUM = 22,
	BACKSLASH = 23,
};
int yylval;
FILE* beamerFile;
int totalKeyword;
int totalOperation;
int totalSymbol;
int totalConstant;
int totalIdentificator;
int totalTokens;
int totalError;
%}

%%

"auto" {return KEYWORD;}
"break" {return KEYWORD;}
"case" {return KEYWORD;}
"char" {return KEYWORD;}
"const" {return KEYWORD;}
"continue" {return KEYWORD;}
"default" {return KEYWORD;}
"do"  {return KEYWORD;}
"double" {return KEYWORD;}
"enum" {return KEYWORD;}
"else" {return KEYWORD;}
"extern" {return KEYWORD;}
"float" {return KEYWORD;}
"for"  {return KEYWORD;}
"goto" {return KEYWORD;}
"if"  {return KEYWORD;}
"int"  {return KEYWORD;}
"long" {return KEYWORD;}
"register" {return KEYWORD;}
"return" {return KEYWORD;}
"short" {return KEYWORD;}
"signed" {return KEYWORD;}
"sizeof" {return KEYWORD;}
"static" {return KEYWORD;}
"struct"  {return KEYWORD;}
"switch" {return KEYWORD;}
"typedef" {return KEYWORD;}
"union" {return KEYWORD;}
"unsigned" {return KEYWORD;}
"void" {return KEYWORD;}
"volatile" {return KEYWORD;}
"while"    {return KEYWORD;}
"_Packed"	{return KEYWORD;}
"main"	    {return KEYWORD;}
"printf"	{return KEYWORD;}
"fprintf"	{return KEYWORD;}
"scanf"	{return KEYWORD;}
"system"	{return KEYWORD;}

"+" { return OPERATION; }
"++" { return OPERATION; }
"-" { return OPERATION; }
"--" { return OPERATION; }
"*" { return OPERATION; }
"/" { return OPERATION; }
"%" { return MODULE; }
"<" { return LESSTHAN; }
">" { return GREATERTHAN; }
"=" { return OPERATION; }
"==" { return OPERATION; }
"!=" { return OPERATION; }
"<=" { return LESSEQUAL; }
">=" { return GREATEREQUAL; }
"&"	 { return AMPERSAND; }
"&&" { return AND; }
"||" { return OPERATION;}
"|" { return OPERATION; }
"?:"	{ return OPERATION; }

"(" { return SYMBOL; }
")" { return SYMBOL; }
"[" { return SYMBOL; }
"]" { return SYMBOL; }
";" { return SYMBOL; }
"," { return SYMBOL; }
"." { return SYMBOL; }
"{"	{ return LEFTBRACKET; }
"}"	{ return RIGHTBRACKET; }
"!" { return SYMBOL; }
":" { return SYMBOL; }
"'"	{ return SYMBOL; }
"$"	{ return DOLLAR; }
"\\"	{ return BACKSLASH; }
"\""	{ return SYMBOL; }
"_"	{ return UNDERSCORE; }
"#" { return NUM;}


[0-9]+ { yylval = atoi(yytext); return CONSTANT; }

[a-zA-Z][_a-zA-Z0-9]* {return IDENTIFICATOR;}

\n { return SALTO; }

[ \t] { return BLANCO; }

<<EOF>> { return EOL;}

. { return ERROR;}

%%

void startBeamer(){
	beamerFile = fopen( "beamer.tex", "w+" );
	fprintf(beamerFile,"\\documentclass{beamer} \n");
	fprintf(beamerFile, "\\usetheme[]{Feather} \n" );
	fprintf(beamerFile, "\\usecolortheme{beaver} \n" );
	fprintf(beamerFile, "\\usepackage{color} \n" );
	fprintf(beamerFile, "\\usepackage[T1]{fontenc} \n" );
	fprintf(beamerFile, "\\usepackage[utf8]{inputenc} \n" );
	fprintf(beamerFile, "\\let\\Tiny=\\tiny \n" );
	fprintf(beamerFile, "\\usepackage{pgfplots}\n" );
	fprintf(beamerFile,"\\pgfplotsset{compat=newest,compat/show suggested version=false} \n");
	fprintf(beamerFile, "\\usepackage{pgf-pie}\n" );
	fprintf(beamerFile, "\\usepackage{tikz}\n" );
	fprintf(beamerFile, "\\usepackage{hyperref}\n" );
	fprintf(beamerFile, "\\usepackage{graphicx}\n" );
fprintf(beamerFile, "\\graphicspath{ {Feathergraphics//} }\n" );



fprintf(beamerFile, "\\newcommand{\\chref}[2]{ \\href{#1}{{\\usebeamercolor[bg]{Feather}#2}}} \n" );
fprintf(beamerFile, "\\title[] {       \\textbf{Proyecto 1 - Analizador Léxico}}\\subtitle[Analizador Léxico]{\\textbf{Compiladores e Intérpretes}}\\author[Luis Rojas - Ariel Montero - Bryan Jiménez]{      Luis Rojas - Ariel Montero - Bryan Jiménez \\\\{\\ttfamily IS 2017}}\\institute[]{Instituto Tecnológico de Costa Rica\\\\}\\date{\\today} \n" );



	
	fprintf(beamerFile,"\\begin{document} \n");


fprintf(beamerFile, " {\\1 \\begin{frame}[plain,noframenumbering] \\titlepage \\end{frame}} \\begin{frame}{Contenido}{} \\tableofcontents \\end{frame} \n");


	fprintf(beamerFile,"\\section{Explicación General}");
	fprintf(beamerFile,"\\subsection{Datos Generales}");

	fprintf(beamerFile,"\\begin{frame}[allowframebreaks] \n");
	fprintf(beamerFile,"\\frametitle{Datos Generales} \n \n");
fprintf(beamerFile,"\\begin{block}{\\textbf{Definiciones}} \n");


	fprintf(beamerFile,"\\textbf{Token}: Familia de lexemas, es una categoría donde se clasifican los lexemas.\\newline \n");
	fprintf(beamerFile,"\\textbf{Lexema}: Ejemplo particular de la variable.\\newline \n");

	fprintf(beamerFile,"\\textbf{Hilera}: Cadenas de texto generalmente marcadas entre comillas. \\newline \n");
	fprintf(beamerFile,"\\textbf{Constante}: Valor que no cambia, ya esta definido. \\newline \n");
	fprintf(beamerFile,"\\textbf{Identificadores}: Conjunto de caracteres alfanuméricos que sirven para identificar las entidades del programa  \\newline \n");

fprintf(beamerFile,"\\end{block}\n");
fprintf(beamerFile,"\\begin{block}{\\textbf{Definiciones}} \n");


	fprintf(beamerFile,"\\textbf{Palabras reservadas}: Palabras que son usadas por el lenguaje y no pueden modificarse ni su función. \\newline \n");
	fprintf(beamerFile,"\\textbf{Símbolos especiales}: Símbolos con significado especial en el lenguaje por lo que no se pueden usar para  otro proposito.\\newline \n");
	fprintf(beamerFile,"\\textbf{Operadores}: Símbolos utilizados para realixar operaciones lógicas y matemáticas. \\newline \n");
	
	
fprintf(beamerFile,"\\end{block}\n");
	fprintf(beamerFile,"\\end{frame} \n");



	fprintf(beamerFile,"\\subsection{Scanning}");

fprintf(beamerFile,"\\begin{frame} \n");
fprintf(beamerFile,"\\frametitle{Scanning} \n \n");
fprintf(beamerFile,"\\includegraphics[width=\\textwidth]{scan}");
fprintf(beamerFile,"\\end{frame} \n");


	fprintf(beamerFile,"\\begin{frame}[allowframebreaks] \n");
	fprintf(beamerFile,"\\frametitle{Scanning} \n \n");
	fprintf(beamerFile,"Un analizador léxico o scanner es la primera fase de un compilador y consistente en un programa que recibe como entrada el código fuente de otro programa (secuencia de caracteres) y produce una salida compuesta de tokens (componentes léxicos) o símbolos. Estos tokens sirven para una posterior etapa del proceso de traducción, siendo la entrada para el analizador sintáctico o parser. La especificación de un lenguaje de programación suele incluir un conjunto de reglas que definen el léxico. Estas reglas consisten comúnmente en expresiones regulares que indican el conjunto de posibles secuencias de caracteres que definen un token o leóxema.");
	fprintf(beamerFile,"\\end{frame} \n");




	fprintf(beamerFile,"\\subsection{Flex}");


fprintf(beamerFile,"\\begin{frame} \n");
fprintf(beamerFile,"\\frametitle{Flex} \n \n");
fprintf(beamerFile,"\\includegraphics[width=\\textwidth]{flex}");
fprintf(beamerFile,"\\end{frame} \n");


	fprintf(beamerFile,"\\begin{frame}[allowframebreaks] \n");
	fprintf(beamerFile,"\\frametitle{Flex} \n \n");
	fprintf(beamerFile,"Flex es una heramienta para generar scanners, flex lee las entradas para tener una descripción del scanner que debe generar. La descripción se realiza en pares de expresiones regulares y cóodigo en C, que se llaman reglas. Genera una salida en un archivo en C 'lex.yy.c' que define a una rutima 'yylex()'. Este archivo es compilado y unido con la librería '-lfl' para generar el ejecutable. Cuando se llama al ejecutable este analiza la entrada por ocurrencias de las expresiones regulares, cuando encuentra una ejecuta el código correspondiente en C.");

	fprintf(beamerFile,"\\end{frame} \n");




	fprintf(beamerFile,"\\section{Programa Fuente}");
	fprintf(beamerFile,"\\begin{frame}[allowframebreaks] \n");
	fprintf(beamerFile,"\\frametitle{Programa Fuente} \n");
}


void endBeamer(){


fprintf(beamerFile,"{\\1\\begin{frame}[plain,noframenumbering] \\finalpage{\\textbf{MUCHAS GRACIAS}}\\end{frame}} \n");

  fprintf(beamerFile,"\\end{document} \n");
  fclose(beamerFile);
  system("pdflatex beamer.tex");
  remove("tmp.c");
  remove("listo.c");
  system("evince --fullscreen beamer.pdf");
}

void writeBeamer(char *_color, char *_word){
  fprintf(beamerFile, "\\textcolor{%s}{ %s } \n", _color, _word);
}

void createHistogram(){
  fprintf(beamerFile,"\\section{Diagramas}");
  fprintf(beamerFile,"\\subsection{Histograma}");
  fprintf(beamerFile,"\\end{frame} \n");
  fprintf(beamerFile,"\\begin{frame} \n");
  fprintf(beamerFile,"\\frametitle{Histograma} \n");
  fprintf(beamerFile,"\\begin{tikzpicture} \n");
  fprintf(beamerFile,"\\begin{axis}[");
  fprintf(beamerFile,"ybar,enlargelimits=0.15,");
  fprintf(beamerFile,"legend style={at={(0.5,-0.2)}, anchor=north,legend columns=-1}, ylabel={Cant. Lexemas},");
  fprintf(beamerFile,"symbolic x coords={Palabra Clave,Operadores,Símbolos,Constantes,Identificadores,Errores},");
  fprintf(beamerFile,"xtick=data,nodes near coords,nodes near coords align={vertical},");
  fprintf(beamerFile,"x tick label style={rotate=45,anchor=east},] \n");
  fprintf(beamerFile,"\\addplot[ybar,fill=orange] coordinates {(Palabra Clave,%i) (Operadores,%i)",totalKeyword,totalOperation);
  fprintf(beamerFile,"(Símbolos,%i) (Constantes,%i) (Identificadores,%i) (Errores,%i)}; \n",totalSymbol,totalConstant,totalIdentificator,totalError);
  fprintf(beamerFile,"\\end{axis} \n");
  fprintf(beamerFile,"\\end{tikzpicture} \n");
  fprintf(beamerFile,"\\end{frame} \n");
}


void createPastel(int _symbol,int _keyword,int _operation,int _constant,int _identificator,int _error){


fprintf(beamerFile,"\\subsection{Diagrama Pastel}");
fprintf(beamerFile,"\\begin{frame}{Diagrama Pastel} \n");
fprintf(beamerFile,"\\def\\angle{0}");
fprintf(beamerFile,"\\def\\radius{2}");
fprintf(beamerFile,"\\def\\labelradius{3}");
fprintf(beamerFile,"\\def\\cyclelist{{\"green\",\"purple\",\"red\",\"blue\",\"orange\",\"olive\"}}");
fprintf(beamerFile,"\\centering");
fprintf(beamerFile,"\\newcount\\cyclecount \\cyclecount=-1");
fprintf(beamerFile,"\\newcount\\ind \\ind=-1");
fprintf(beamerFile,"\\begin{tikzpicture}");
fprintf(beamerFile,"\\foreach \\percent/\\name in {");
fprintf(beamerFile,"%i/P.Clave.,",_keyword);
fprintf(beamerFile,"%i/Opera.,",_operation);
fprintf(beamerFile,"%i/Símb.,",_symbol);
fprintf(beamerFile,"%i/Const.,",_constant);
fprintf(beamerFile,"%i/Ident.,",_identificator);
fprintf(beamerFile,"%i/Error",_error);
fprintf(beamerFile,"} {\\ifx\\percent\\empty\\else");
fprintf(beamerFile,"\\global\\advance\\cyclecount by 1");
fprintf(beamerFile,"\\global\\advance\\ind by 1");
fprintf(beamerFile,"\\ifnum6<\\cyclecount");
fprintf(beamerFile,"\\global\\cyclecount=0");
fprintf(beamerFile,"\\global\\ind=0");
fprintf(beamerFile,"\\fi");
fprintf(beamerFile,"\\pgfmathparse{\\cyclelist[\\the\\ind]}");
fprintf(beamerFile,"\\edef\\color{\\pgfmathresult}");
fprintf(beamerFile,"\\draw[fill={\\color!50},draw={\\color}] (0,0) -- (\\angle:\\radius) arc (\\angle:\\angle+\\percent*3.7:\\radius) -- cycle;");
fprintf(beamerFile,"\\draw[draw=gray, shorten >=2pt] (\\angle+0.5*\\percent*3.7:\\labelradius) node {\\name~[\\percent\\%%]} edge (\\angle+0.5*\\percent*3.7:\\radius);");
fprintf(beamerFile,"\\pgfmathparse{\\angle+\\percent*3.7}");
fprintf(beamerFile,"\\xdef\\angle{\\pgfmathresult}");
fprintf(beamerFile,"\\fi};");
fprintf(beamerFile,"\\end{tikzpicture}");
fprintf(beamerFile,"\\end{frame} \n");
}

void getPorcentage(){
	int symbol = (totalSymbol * 100)/ totalTokens;
	int keyword= (totalKeyword * 100)/ totalTokens;
	int operation= (totalOperation * 100)/ totalTokens;
	int constant= (totalConstant * 100)/ totalTokens;
	int identificator= (totalIdentificator * 100)/ totalTokens;
	int error = (totalError * 100)/ totalTokens;

	createPastel(symbol,keyword,operation,constant,identificator,error);
}

void main(int argc, char **argv)
{
	int tok;
	yyin = fopen ("listo.c","r+");
  	startBeamer();
	tok = yylex();

	while(tok!=EOL){

		switch (tok){
			case CONSTANT:
				writeBeamer("blue", yytext);
        		totalConstant++;
				totalTokens++;
				break;
			case KEYWORD:
				writeBeamer("purple", yytext);
        		totalKeyword++;
				totalTokens++;
				break;
			case OPERATION:
        		writeBeamer("green", yytext);
        		totalOperation++;
				totalTokens++;
        		break;
			case GREATEREQUAL:
				fprintf(beamerFile, "\\textcolor{%s}{%s} \n", "green","$>=$");
				totalOperation++;
				totalTokens++;
				break;
			case GREATERTHAN:
				fprintf(beamerFile, "\\textcolor{%s}{\\textgreater} \n", "green");
				totalOperation++;
				totalTokens++;
				break;
			case LESSEQUAL:
				fprintf(beamerFile, "\\textcolor{%s}{%s} \n", "green","$<=$");
				totalOperation++;
				totalTokens++;
				break;
			case LESSTHAN:
				fprintf(beamerFile, "\\textcolor{%s}{\\textless} \n", "green");
				totalOperation++;
				totalTokens++;
				break;
			case MODULE:
				fprintf(beamerFile, "\\textcolor{%s}{\\%%} \n", "green");
				totalOperation++;
				totalTokens++;
				break;
			case AMPERSAND:
				fprintf(beamerFile, "\\textcolor{%s}{\\&} \n", "green");
				totalOperation++;
				totalTokens++;
				break;
			case AND:
				fprintf(beamerFile, "\\textcolor{%s}{\\&\\&} \n", "green");
				totalOperation++;
				totalTokens++;
				break;
			case SALTO:
        		fprintf(beamerFile,"\\newline \n");
				break;
			case IDENTIFICATOR:
        		writeBeamer("orange", yytext);
        		totalIdentificator++;
				totalTokens++;
        		break;
			case SYMBOL:
		        writeBeamer("olive", yytext);
		        totalSymbol++;
				totalTokens++;
        		break;
        	case BACKSLASH:
				fprintf(beamerFile, "\\textcolor{%s}{\\textbackslash} \n", "olive");
				totalSymbol++;
				totalTokens++;
				break;
			case UNDERSCORE:
				fprintf(beamerFile, "\\textcolor{%s}{\\_ } \n", "olive");
				totalSymbol++;
				totalTokens++;
				break;
			case NUM:
				fprintf(beamerFile, "\\textcolor{%s}{\\# } \n", "olive");
				totalSymbol++;
				totalTokens++;
				break;
			case DOLLAR:
			    fprintf(beamerFile, "\\textcolor{%s}{\\$ } \n", "olive");
			    totalSymbol++;
				totalTokens++;
	      		break;
			case RIGHTBRACKET:
	      		fprintf(beamerFile, "\\textcolor{%s}{\\} } \n", "olive");
	      		totalSymbol++;
				totalTokens++;
	      		break;
			case LEFTBRACKET:
				fprintf(beamerFile, "\\textcolor{%s}{ \\{ } \n", "olive");
		    	totalSymbol++;
				totalTokens++;
		    	break;
			case ERROR:
				writeBeamer("red", "Symbol not identified");
				totalError++;
				break;
			default:
				break;
		}
		tok = yylex();
	}
  	createHistogram();
	getPorcentage();
  	endBeamer();
}
