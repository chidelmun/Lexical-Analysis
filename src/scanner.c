#include <stdio.h>
#include "scanner.h"

extern int yylex();
extern int yylineno;
extern char* yytext;

int main(int argc, char const *argv[])
{
	int ntoken = yylex();
	while(ntoken){
		printf("%d\t %s\n", ntoken,yytext);
		ntoken =yylex();
	}
	return 0;
}