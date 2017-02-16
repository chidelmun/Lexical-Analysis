%{
	#include "scanner.h"
%}
%%
"FROM"					return FROM;
"SELECT"				return SELECT;
"DELETE"				return DELETE;
"INSERT"				return INSERT; 
"CREATE"				return CREATE;
;						return SEMICOLON;
"UPDATE"				return UPDATE;
"WHERE"					return WHERE;
"DROP"					return DROP;
"INTO"					return INTO;

[a-zA-Z][_a-zA-Z0-9]*	return IDENTIFIER;
[1-9][0-9]*				return INTEGER;
[ \t\n]					;
.						printf("WRONG SYNTAX\n");
%%

int yywrap(void){
	return 1;
}