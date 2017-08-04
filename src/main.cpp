#include <stdio.h>

int yylex();
void yyparse();

int main() {
	printf("Enter text:\n");
	yyparse();
	return 0;
}
