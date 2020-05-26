%{
#include<stdio.h>
int c=0;
FILE *fp;
%}
operator [-+*/]
identifier [a-zA-Z][a-zA-Z0-9-]*
number [0-9]+
expression ({identifier}|{number}){operator}({identifier}|{number})

%%
\n { c++; }
^"#".+ ;
^("int "|"float "|"char ").+ ;
"void main()" ;

{identifier}"="({expression}+";") { printf("Valid expression in line no : %d\t",c+1);ECHO;printf("\n");}

{identifier}"="({number}|{identifier}";") { printf("Valid expression in line no : %d\t",c+1);ECHO;printf("\n");}

({number}|([0-9]*[a-zA-Z0-9-]+))"="{expression}+ { printf("InValid expression in line no : %d; L-value should satisfy the identifier rules\n",c+1);ECHO;printf("\n");}

{identifier}"=;" { printf("InValid expression in line no : %d; R-value required; Expression is needed at right hand side of assignment operation\n",c+1);ECHO;printf("\n");}

{operator}{operator}+ {printf(" Invalid expression in line no: %d;More than one operator can't be used in expression consequetively",c+1);ECHO;printf("\n");}

.|\n ;
%%

void main()
{
	yyin=fopen("source2.txt","r");
	yylex();
	fclose(yyin);
}
