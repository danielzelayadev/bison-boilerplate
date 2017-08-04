%{
	#include <stdio.h>

	#define YYERROR_VERBOSE 1

	extern int yylineno;

	int yylex();

	void yyerror(const char *msg) {
		fprintf(stderr, "Line %d: %s\n", yylineno, msg);
	}
%}

%token NUMBER
%token ERROR

%%

input: input NUMBER
	 | input
	 |
;

%%