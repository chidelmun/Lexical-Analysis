#include <stdio.h>
#include "scanner.h"

extern int yylex();
extern int yylineno;
extern char* yytext;

int main(int argc, char const *argv[])
{
	printf("\n********************************************\n"\
			"*Welcome to the Main Loop of my SQL Parser *\n"\
			"*This program was written by Delveri Chick *\n"\
			"*** PEASE TYPE YOUR SQL QUERIES BELOW 	   *\n"\
			"********************************************\n"
			);
	int ntoken = yylex();
	while(ntoken){
		switch(ntoken){
			case SELECT:
			case CREATE:
			case DROP:
				{
					if (yylex()!= IDENTIFIER)
					{
						printf("You have an error in your SQL syntax at %d\n", yylineno);
					}
				}
				break;
			case INSERT:
				{
					if (yylex()!=INTO)
					{
						printf("You have an error in your SQL syntax at %d\n expected INTO but got %s\n", yylineno,yytext);
					}
					if (yylex() != IDENTIFIER)
					{
					printf("You have an error in your SQL syntax at %d\n expected an IDENTIFIER but got %s\n", yylineno,yytext);	
					}

				}
		}
		// printf("%d\t %s\n", ntoken,yytext);
		ntoken =yylex();
	}
	return 0;
}