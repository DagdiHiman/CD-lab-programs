%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
void yyerror();
int flag=0;
%}

%token type ID

%%
D: T ' ' L;
T: type;
L: L ',' ID| ID;
%%

void main()
{
	printf("enter the expression for the grammar \nD->TL\nT->int | float\nL->L,id | id\n");
	yyparse();
	printf("valid experession\n");
}
void yyerror()
{
	printf("Invalid expression\n");
	exit(1);
}
