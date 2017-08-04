%option noyywrap

%{
    #include <stdio.h>
    #include "../bison/tokens.h"
%}

%%

[0-9]+ { return NUMBER; }
.      { return ERROR; }

%%