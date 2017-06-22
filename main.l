/*
This is a sample scanner build using lex Language
Author : Delveri Chick
Date   : 2017
*/




/*Start of definitions*/



%%


[a-zA-Z0-9_]*	printf("IDENTIFIER : %s\t %d", yytext, yyleng);


%%
