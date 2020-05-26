#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int main()
{
	FILE *fp;
	int commentcheck=0;
	int i;
	int lineno=0;
	int comment=0;
	char line[100];
	int open=0,close=0,openlineno,closelineno;
	//clrscr();
	fp=fopen("file2.txt", "r");
	if(fp==NULL)
	{
		printf("File cant be opened\n");
		exit(0);
	}
	printf("File opened correctly!\n");
	while(fgets(line, sizeof(line), fp)!=NULL)
	{
		lineno++;
		//getch();
		commentcheck=0;
		comment=0;
		if(open==1&&close==0)
			printf("\n%s",line);
		if(strstr(line,"/*")&&open==0)
		{
			open=1;close=0;comment=1;
			openlineno=lineno;
			printf("\n%s",line);
		}
		if(strstr(line,"*/")&&close==0&&open==1)
		{
			closelineno=lineno;
			if(open==1&&close==0)
			{
				close=1;
				open=0;
				printf("\n Comment is displayed above!\nComment opened in line no %d and closed in line no %d \n",openlineno,closelineno);
			}
		}
	}
	if(open==1 &&close==0)
	{
		printf("\n Unterminated comment in begin in line no %d. It Has to be closed\n", openlineno);
		commentcheck=1;
	}
	else if(comment==1 && commentcheck==0){
		printf("\n Comment usage in line %d is validated!\n",lineno);
	}
	return 0;
}
