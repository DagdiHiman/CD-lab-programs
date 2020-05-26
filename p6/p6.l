%{
#include "y.tab.h"
#include<stdio.h>
#include<ctype.h>
#include<stdlib.h>
extern int yylval;
int val;
%}

%%
[a-zA-Z][a-zA-Z0-9]* {printf("\n enter the value of variable %s:",yytext);scanf("%d",&val);yylval=val;return id;}
[0-9]+[.]?[0-9]*     {yylval=atoi(yytext);return num;}
[ \t] 		     ;
\n 		     {return 0;}
. 		     {return yytext[0];}
%%

int yywrap()
{
	return 1;
}
