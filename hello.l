
%{
#include <iostream>
%}
%%
[ \t] ;

[0-9]+\.[0-9]+ { yylval.fval = atof(yytext); return FLOAT; }
[0-9]+  { yylval.ival = atoi(yytext); return INT; }
[a-zA-Z0-9]+ {
	// we have to copy because we can't rely on yytext not changing underneath us:
	char *res = new char[strlen(yytext) + 1];
	strcpy(res, yytext);
	yylval.sval = res;
	return STRING;
}

. ;
%%