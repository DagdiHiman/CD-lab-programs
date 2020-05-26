%{
#include "y.tab.h"
#include<stdio.h>
int yylval;
%}

%%
"int"[ ]+ {return KEY;}
"float"[ ]+ {return KEY;}
"char"[ ]+ {return KEY;}
"double"[ ]+ {return KEY;}
"short"[ ]+ {return KEY;}
"long int"[ ]+ {return KEY;}
[a-zA_Z][a-zA-Z]*[0-9]* {return ID;}
[0-9]+ {return NUM;}
[ \t] ;
[;] {return COLON;}
\n {return 0;}
. {return yytext[0];}
%%

int yywrap()
{
	return 1;
}
