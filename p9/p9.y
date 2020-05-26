%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
void yyerror();
int flag=1;
%}

%token id num

%%
stmt: expression { printf("\n valid logical exprn : evaluated result is %d",$1);}
;
expression : '(' expression ')' { $$=$2;printf("\n value : %d",$$);}
| '(' expression {printf("\n Syntax error: Missing right paranthesis");exit(0);}
| expression '&''&' expression {printf("\nlogical and recog!");$$=(($1)&&($4));printf("\n %d",$$);}
| expression '&''&' {printf("Syntax error: Right operand is missing ");exit(0);}
| expression '|''|' expression {printf("\nlogical or recog!");$$=($1||$4);printf("\n %d",$$);}
| expression '|''|' {printf("Syntax error: Right operand is missing ");exit(0);}
| '!' expression {printf("\nlogical not recog!");$$=!($2);printf("\n %d",$$);}
| '!' {printf("Syntax error: Right operand is missing ");exit(0);}| expression '<' expression {printf("\nless than 	recog!");$$=($1<$3);printf("\n %d",$$);}
| expression '<' { printf ("\n Syntax error: Right operand is missing ");exit(0);}
| expression '>' expression {printf("\ngreater than recog!");$$=($1>$3);printf("\n %d",$$);}
| expression '>' { printf ("\n Syntax error: Right operand is missing ");exit(0);}
| expression '<''=' expression {printf("\nless than or equal recog!");$$=($1<=$4);printf("\n %d",$$);}
| expression '<''=' { printf ("\n Syntax error: Right operand is missing ");exit(0);}
| expression '>''=' expression {printf("\ngreater than or equal!");$$=($1>=$4);printf("\n %d",$$);}
| expression '>''=' { printf ("\n Syntax error: Right operand is missing ");exit(0);}
| expression '!''=' expression {printf("\nNot equal recog!");$$=($1!=$4);printf("\n %d",$$);}
| expression '!''=' { printf ("\n Syntax error: Right operand is missing ");exit(0);}
| expression '=''=' expression {printf("\ndouble equal recog!");$$=($1==$4);printf("\n %d",$$);}
| expression '=''=' { printf ("\n Syntax error: Right operand is missing ");exit(0);}
| id
| num
;
;
%%

void main()
{
	printf(" Enter logical expression\n");
	yyparse();
}
void yyerror()
{
	printf(" Invalid logical expression\n");
	exit(1);
}
