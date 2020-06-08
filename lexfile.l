%{
#include<math.h>
#include<stdlib.h>
#include<string.h>
#include<stdio.h>
#include "y.tab.h"
extern int yylval;
%}

DIGIT [0-9]
CHAR [a-z]*[A-Z]*

%%
HEX	{yylval=16; return HEX;}
OCT	{yylval=8; return OCT;}
BIN	{yylval=2; return BIN;}
{DIGIT}+	{yylval=atoi(yytext); return DEC;}

%%

int yywrap(){
	return 1;
}

