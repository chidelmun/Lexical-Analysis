%{
	#include "tokens.h"
%}

%%
"SELECT"	printf("SELECT QUERY EXECUTED");
"IF"		{
				return "IF";
				
			};

.			exit(0);

"FROM"					return FROM;
"DELETE"				return DELETE;
"INSERT"				return INSERT; 
"CREATE"				return CREATE;
"UPDATE"				return UPDATE;
"WHERE"					return WHERE;
"DROP"					return DROP;
"INTO"					return INTO;

[a-zA-Z][_a-zA-Z0-9]*	return IDENTIFIER;
[1-9][0-9]*				return INTEGER;
[ \t\n]					;
%%