%option noyywrap
%option yylineno

KEYWORDS        break|continue|else|for|if|return|struct|while
TYPES           int|char|long|short|void
OPERATORS       \+|\-|\*|\/|%|\|\||&&|==|!=|<=|>=|>|<|!
ATRIBUTION      =
DIGIT           [0-9]+
CHAR_CONST      \'[a-zA-Z0-9!@#\$%\^&*()\-=\+\\]\' 
STR_CONST       \"[a-zA-Z0-9!@#\$%\^&*()\-=\+\\]*\"
IDENTIFIER      [a-zA-Z_][a-zA-Z0-9_]*
DELIMITERS      [(){}\[\];,]
INVALID_ID      {DIGIT}+{IDENTIFIER}

%%

{KEYWORDS} {
    printf("Palavra-chave encontrada: %s\n", yytext);
}

{TYPES} {
    printf("Tipo encontrado: %s\n", yytext);
}

{OPERATORS} {
    printf("Operador encontrado: %s\n", yytext);
}

{ATRIBUTION} {
    printf("Atribuição encontrada: %s\n", yytext);
}

{DIGIT} {
    printf("Número inteiro encontrado: %s\n", yytext);
}

{CHAR_CONST} {
    printf("Caractere constante encontrado: %s\n", yytext);
}

{STR_CONST} {
    printf("String encontrada: %s\n", yytext);
}

{IDENTIFIER} {
    printf("Identificador encontrado: %s\n", yytext);
}

{DELIMITERS} {
    printf("Delimitador encontrado: %s\n", yytext);
}

{INVALID_ID} {
    printf("Identificador inválido encontrado: %s\n", yytext);
}

[ \t\r]+            ; // ignora espaços e tabulações

\n                  ; // ignora quebra de linha, pois yylineno já conta

. {
    printf("Erro na linha %d: lexema inválido \"%s\"\n", yylineno, yytext);
}

%%

int main() {
    yylex();
    return 0;
}
