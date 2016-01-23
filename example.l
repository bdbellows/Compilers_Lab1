%option noyywrap

%{
    int nchar, nword, nline;
%}
%%
\n         { nline++; nchar++; }
[^ \t\n]+  { nword++, nchar += yyleng; }
.          { nchar++; }
%%
int main(int argc, char *argv[]) {
    yyin = fopen(argv[1], "r");
    yylex();
    printf("number of chars = %d\n", nchar);
    printf("number of words = %d\n", nword);
    printf("number of lines = %d\n", nline);
    return 0;
}
