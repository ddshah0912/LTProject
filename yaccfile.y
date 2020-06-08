%{
#include<math.h>
#include<stdlib.h>
#include<string.h>
#include<stdio.h>
#include "y.tab.h"
int yylex(void);
void yyerror(char *s);
void hex(int);
void oct(int);
void bin(int);
int num,i,j,r;
%}

%token HEX OCT BIN DEC

%%
program: program S '\n'
	 |
	 ;
S: HEX DEC	{hex($2);}
   |OCT DEC	{oct($2);}
   |BIN DEC	{bin($2);}
   ;
%%

void hex(int n)
{
	num=n;
	char a[20]={0};
	i=0;
	while(num!=0)
	{
		r=num%16;
		if(r<10)
		{
			a[i]=r+48;
			i++;
		}
		else
		{
			a[i]=r+55;
			i++;
		}
		num=num/16;
	}
	printf("Hexadecimal: ");
	for(j=i-1;j>=0;j--)
	{
		printf("%c",a[j]);
	}	
}

void oct(int n)
{
	num=n;
	char b[20]={0};
	i=0;			
	while(num!=0)
	{
		b[i]=num%8;
		num=num/8;
		i++;
	}
	printf("Octal: ");
	for(j=i-1;j>=0;j--)
	{
		printf("%d",b[j]);
	}	
}

void bin(int n)
{
	num=n;
	char c[20]={0};
	i=0;
	while(num>0)
	{
		c[i]=num%2;
		num=num/2;
		i++;
	}
	printf("Binary: ");
	for(j=i-1;j>=0;j--)
	{
		printf("%d",c[j]);
	}
}

void yyerror(char *s){
	fprintf(stderr,"%s\n",s);
}

int main()
{
	yyparse();
	return 0;
}

