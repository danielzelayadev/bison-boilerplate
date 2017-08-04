%option noyywrap

%{
    #include <stdio.h>
    #include "tokens.h"
%}

%%

[0-9]+ { return NUMBER; }
.      { return ERROR; }

%%