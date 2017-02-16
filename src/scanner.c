#include <stdio.h>
#include "scanner.h"

extern int yylex();
extern int yylineno;
extern char* yytext;

int main(int argc, char const *argv[])
{
	printf("\n*******************************************\n"\
			"*Welcome to the Main Loop of my SQL Parser *\n"\
			"*This program was written by Delveri Chick *\n"\
			"*** PEASE TYPE YOUR SQL QUERIES BELOW 		*\n"\
			"********************************************\n"
			);
	int ntoken = yylex();
	while(ntoken){
		printf("%d\t %s\n", ntoken,yytext);
		ntoken =yylex();
	}
	return 0;
}