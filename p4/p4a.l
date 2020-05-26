%{
#include<stdio.h>
int c=0;
%}

number [0-9]+(".")?[0-9]*
invalid [0-9]+(".")[0-9]*((".")[0-9]*)+

%%
\n {c++;}
{number} {printf("\nValid number in line number %d : ",c+1);ECHO;printf("\n");}
{number}[a-zA-Z0-9_]+ {printf("\nInvalid number in line number %d: Number followed with alphabets is invalid",c+1);ECHO;printf("\n");}
{invalid} {printf("\nInvalid number in line number %d: Number with more than one decimal point sis invalid",c+1);ECHO;printf("\n");}
. ;
%%

void main()
{
	yyin = fopen("source.txt","r");
	yylex();
	fclose(yyin);
}
