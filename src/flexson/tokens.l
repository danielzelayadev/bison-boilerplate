%option noyywrap

%{
    #include <stdio.h>
    #include "tokens.h"

    int column = 0;

    void count();
%}

IGNORE [ \n\t\v\f]

%%

[0-9]+   { count(); return NUMBER; }
","      { count(); return ',';    }
{IGNORE} { count(); }
.        { count(); return ERROR;  }

%%

void count() {
    int i;

	for (i = 0; yytext[i]; i++)
		if (yytext[i] == '\n')
			column = 0;
		else if (yytext[i] == '\t')
			column += 8 - (column % 8);
		else
			column++;
}