%{
#include 
%}

// define the token types I can have:
%token INT FLOAT STRING
%token SNAZZLE TYPE
%token END ENDL
// since there's a different C datatype for each of the token type, yacc needs a
// union for the lex return value:
%union {
	int ival;
	float fval;
	char *sval;
}
// and then you just associate one of the defined token types with one of
// the union fields and we're happy:
%token  INT
%token  FLOAT
%token  STRING
%%
// the first rule defined is the highest-level rule, which in our 
// case is just the concept of a whole "snazzle file":
snazzle:
header template body_section footer { cout << "done with a snazzle file!" << endl; }
	;
header:
	SNAZZLE FLOAT ENDL { cout << "reading a snazzle file version " << $2 << endl; }
	;
template:
	typelines
	;
typelines:
	typelines typeline 
	| typeline
	;
typeline:
	TYPE STRING ENDL { cout << "new defined snazzle type: " << $2 << endl; }
	;
body_section:
	body_lines
	;
body_lines:
	body_lines body_line
	| body_line
	;
body_line:
	INT INT INT INT STRING ENDL { cout << "new snazzle: " << $1 << $2 << $3 << $4 << $5 << endl; }
	;
footer:
	END ENDL
	;
%%
#include 

// stuff from lex that yacc needs to know about:
extern int yylex();
extern int yyparse();
extern FILE *yyin;

main() {
	// open a file handle to a particular file:
	//FILE *myfile = fopen("a.snazzle.file", "r");
	FILE *myfile = fopen("in.snazzle", "r");
	// make sure it's valid:
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