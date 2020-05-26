#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int main()
{
	FILE *fp;
	int strcheck=0;
	int i;
	int lineno=0;
	int string=0;
	char line[100];
	int open,close;
	//clrscr();
	fp=fopen("file.txt", "r");
	if(fp==NULL)
	{
		printf("File cant be opened\n");
		exit(0);
	}
	printf("File opened correctly!\n");
	while(fgets(line, sizeof(line), fp)!=NULL)
	{
		lineno++;
		strcheck=0;
		string=0;
		open=close=0;
		for(i=0;i<strlen(line);i++)
		{
			if(line[i]=='"')
			{
				string=1;
				if(open==1&&close==0) close=1;
				else if(open==0&&close==0) open=1;
				else if(open==1&&close==1) close=0;
			}
		}
		if(open==1 &&close==0)
		{
			printf("\n Unterminated string in line %d. String Has to be closed\n", lineno);
			strcheck=1;
		}
		else if(string==1 && strcheck==0)
		{
			printf("\n String usage in line %d is validated!\n",lineno);
		}
	}
	return 0;
}
