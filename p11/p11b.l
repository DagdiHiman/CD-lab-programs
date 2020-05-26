%{
#include<stdio.h>
#include"y.tab.h"
int yylval;
%}

%%
[0] {return ZERO;}
[1] {return ONE;}
[\t]
. {return yytext[0];}
[\n] {return 0;}
[ ] {return 0;}
%%

int yywrap()
{
	return 1;
}
