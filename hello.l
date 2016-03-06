%{
#include <iostream>
%}
%%
[ \t] ;
[0-9]+\.[0-9]+ { cout << "Found a floating-point number:" << yytext << endl; }
[0-9]+  { cout << "Found an integer:" << yytext << endl; }
[a-zA-Z0-9]+ { cout << "Found a string: " << yytext << endl; }
%%
main() {
	// lex through the input:
	yylex();
}