#include <stdio.h>
int yylex();
extern int yytext;

int main(int argc, char const *argv[])
{
	int ntokens = yylex();
	while(ntokens != 0){
		ntokens = yylex();
		printf("%s\n", yytext);
	}
	return 0;
}