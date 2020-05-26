%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
void yyerror();
%}

%token ID

%%
exp:exp exp '*'
exp:exp exp '+'
exp:ID
%%

void main()
{
	printf("enter the expression for the grammar \n S-->SS+ | SS* | a\n");
	yyparse();
	printf("valid experession\n");
}
void yyerror()
{
	printf("Invalid expression\n");
	exit(1);
}
