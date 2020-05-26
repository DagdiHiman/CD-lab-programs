%{
#include<stdio.h>
int c=0;
%}

%s DECLARE VAR
identifier [a-zA-Z][a-zA-Z0-9-]*
number [0-9]+[.]?[0-9]*
string ("\"")([a-zA-Z0-9]+)("\"")

%%
\n {c++;}
"int "|"float " {BEGIN DECLARE;}
<DECLARE>{identifier}("="{number})? {BEGIN VAR;}
<DECLARE>{identifier}("="{string}) {BEGIN VAR; printf("\n Invalid variable declaration in line no %d; string can't be assigned to integer or float variable:",c+1);ECHO;printf("\n");}
<VAR>";" {BEGIN 0;}
<VAR>{identifier}("="{number})? {}
<VAR>{identifier}("="{string}) {printf("\n Invalid variable declaration in line no %d; string can't be assigned to integer or float variable:",c+1);ECHO;printf("\n");}
<VAR>\n {BEGIN 0; c++;}
<VAR>"," {BEGIN DECLARE;}
<VAR>[,][,]+ {printf("\n Invalid usage of more than one comma in declaration in line no %d",c+1);BEGIN DECLARE;ECHO;printf("\n");}
. ;
%%

void main()
{
	yyin = fopen("source2.txt","r");
	yylex();fclose(yyin);
}
