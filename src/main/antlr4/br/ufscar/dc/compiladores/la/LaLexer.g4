lexer grammar LaLexer;

// Palavras chave (não podem serem usadas como identificador)
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

// Identificador
IDENT
    : ('a'..'z' | 'A'..'Z' | '_') ('a'..'z' | 'A'..'Z' | '0'..'9' | '_')*
    ;

// Número inteiro
NUM_INT
    : ('0'..'9')+
    ;
// Número real
NUM_REAL
    : ('0'..'9')+ ('.' ('0'..'9')+)?
    ;

// Cadeia de caracteres (string)
CADEIA
    : '"' ( ESC_SEQ | ~('"'|'\\' | '\n') )* '"'
    ;

fragment
ESC_SEQ
    : '\\"'
    ;

// Espaços em branco
WS
    : (' '|'\n'|'\r'|'\t') {skip();}
    ;

// Comentários
COMENTARIO
    : '{' ( ~('\n') )*? '}' {skip();}
    ;

// Operadores relacionais
OP_REL
    : '='
    | '<>'
    | '>='
    | '<='
    | '>'
    | '<'
    ;

// Operadores aritméticos
OP_ARITM
    : '+'
    | '-'
    | '*'
    | '/'
    | '%'
    ;

// Operador de atribuição
OP_ATRIB
    : '<-'
    ;

// Operador de intervalos
OP_INTERV
    : '..'
    ;

// Abre parênteses
ABRE_PAR
    : '('
    ;

// Fecha parênteses
FECHA_PAR
    : ')'
    ;

// Abre colchete
ABRE_COLC
    : '['
    ;

// Fecha colchete
FECHA_COLC
    : ']'
    ;

// Acento circunflexo (endereçamento)
CIRCUMF
    : '^'
    ;

AND
    : '&'
    ;

// Delimitadores
DELIM
    : ':'
    | ','
    | '.'
    ;

// Tokens desconhecidos
DESCONHECIDO
    : .+?
    ;
