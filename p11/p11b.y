%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
void yyerror();
int flag=0;
%}

%token ZERO ONE

%%
S: L '.' L| L;
L: L B| B;
B: ZERO | ONE;
%%

void main()
{
	printf("enter the expression for the grammar S-> L.L | L\nL->LB | B\nB->0 | 1\n");
	yyparse();
	printf("valid experession\n");
}

void yyerror(){
	printf("Invalid expression\n");
	exit(1);
}
