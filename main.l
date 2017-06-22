%{
x = 0;
%}

%%
[a]  {x++; printf("id %d",x); }
%%

int main(void)
{
    yylex();
    return 0;
}