%{
	#include <stdio.h>

	#define YYERROR_VERBOSE 1

	extern int yylineno, column;

	int yylex();

	void yyerror(const char *msg) {
		printf("[%d:%d] %s\n", yylineno, column, msg);
	}
%}

%token NUMBER "number"
%token ERROR  "error"

%%

input: number_list
	   | %empty
;

number_list: number_list ',' NUMBER
           | NUMBER
;

%%