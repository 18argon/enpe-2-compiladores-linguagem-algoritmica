lexer grammar LaLexer;

PALAVRA_CHAVE
    : 'algoritmo'
    | 'fim_algoritmo'
    | 'declare'
    | 'constante'
    | 'tipo'
    | 'literal'
    | 'inteiro'
    | 'real'
    | 'logico'
    | 'verdadeiro'
    | 'falso'
    | 'registro'
    | 'fim_registro'
    | 'procedimento'
    | 'fim_procedimento'
    | 'funcao'
    | 'fim_funcao'
    | 'var'
    | 'leia'
    | 'escreva'
    | 'se'
    | 'entao'
    | 'senao'
    | 'fim_se'
    | 'caso'
    | 'seja'
    | 'fim_caso'
    | 'para'
    | 'ate'
    | 'faca'
    | 'fim_para'
    | 'enquanto'
    | 'fim_enquanto'
    | 'retorne'
    | 'nao'
    | 'ou'
    | 'e'
    ;

IDENT
    : ('a'..'z' | 'A'..'Z' | '_') ('a'..'z' | 'A'..'Z' | '0'..'9' | '_')*
    ;


NUM_INT
    : ('+' | '-')? ('0'..'9')+
    ;

NUM_REAL
    : ('+' | '-')? ('0'..'9')+ ('.' ('0'..'9')+)?
    ;


CADEIA
    : '"' ( ESC_SEQ | ~('"'|'\\' | '\n') )* '"'
    ;

fragment
ESC_SEQ
    : '\\"'
    ;

WS
    : (' '|'\n'|'\r'|'\t') {skip();}
    ;

COMENTARIO
    : '{' ( ~('\n') )*? '}' {skip();}
    ;

OP_REL
    : '='
    | '<>'
    | '>='
    | '<='
    | '>'
    | '<'
    ;

OP_ARITM
    : '+'
    | '-'
    | '*'
    | '/'
    | '%'
    ;

OP_ATRIB
    : '<-'
    ;

OP_INTERV
    : '..'
    ;

ABRE_PAR
    : '('
    ;

FECHA_PAR
    : ')'
    ;

ABRE_COLC
    : '['
    ;

FECHA_COLC
    : ']'
    ;

CIRCUMF
    : '^'
    ;

AND
    : '&'
    ;

DELIM
    : ':'
    | ','
    | '.'
    ;
