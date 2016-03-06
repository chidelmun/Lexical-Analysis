
snazzle.y:
%{
#include <iostream>
%}

// define the "terminal symbol" token types I'm going to use, which
// are in CAPS only because it's a convention:
%token INT FLOAT STRING

// yacc fundamentally works by asking lex to get the next token, which it returns as
// an object of type "yystype".  But
// the next token could be of an arbitrary data type, so you can define a C union to
// hold each of the types of tokens that lex could return, and yacc will typedef
// "yystype" as the union instead of its default (int):
%union {
	int ival;
	float fval;
	char *sval;
}

// and then you just associate each of the defined token types with one of
// the union fields and we're happy:
%token <ival> INT
%token <fval> FLOAT
%token <sval> STRING

%%
// this is the actual grammar that yacc will parse, but for right now it's just
// something silly to echo to the screen what yacc gets from lex.  We'll
// make a real one shortly:
snazzle:
	INT snazzle { cout << "yacc found an int: " << $1 << endl; }
	| FLOAT snazzle { cout << "yacc found a float: " << $1 << endl; }
	| STRING snazzle { cout << "yacc found a string: " << $1 << endl; }
	| INT { cout << "yacc found an int: " << $1 << endl; }
	| FLOAT { cout << "yacc found a float: " << $1 << endl; }
	| STRING { cout << "yacc found a string: " << $1 << endl; }
	;
%%
#include <stdio.h>

// stuff from lex that yacc needs to know about:
extern int yylex();
extern int yyparse();
extern FILE *yyin;

main() {
	// open a file handle to a particular file:
	FILE *myfile = fopen("a.snazzle.file", "r");
	// make sure it is valid:
	if (!myfile) {
		cout << "I can't open a.snazzle.file!" << endl;
		return -1;
	}
	// set lex to read from it instead of defaulting to STDIN:
	yyin = myfile;
	
	// parse through the input until there is no more:
	do {
		yyparse();
	} while (!feof(yyin));
	
}

void yyerror(char *s) {
	cout << "EEK, parse error!  Message: " << s << endl;
	// might as well halt now:
	exit(-1);
}