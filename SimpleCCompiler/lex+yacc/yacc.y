%{
    #include "AST.h"
    #include <stdio.h>
    #include <stdlib.h>
    #include <iostream>
    #include <string.h>
    
    int yylex(void);
    void yyrestart(FILE*);
    void yyerror(char *);

    struct node * root;
%}

%union {
    int intval;
    double doubleval;
    char *strval;
    struct node * ast;
}
// Tokens
%token <intval> INTEGER
%token <doubleval> REAL
%token <strval> STRING
%token <strval> ID
%token SEMI COMMA ASSIGNOP
%token EQ GE LE GT LT NE
%token PLUS MINUS STAR DIV BAND BXOR BOR MOD
%token AND OR NOT
%token INT DOUBLE CHAR
%token LP RP LB RB LC RC
%token RETURN IF ELSE WHILE

// non-terminals
%type <ast> Program ExtDefList ExtDef ExtDecList ExtDec // High-level Definitions
%type <ast> Specifier                                   // Specifiers
%type <ast> VarDec FunDec VarList ParamDec              // Declarators
%type <ast> CompSt StmtList Stmt                        // Statements
%type <ast> DefList Def Dec DecList                     // Local Definitions
%type <ast> Exp Args                                    // Expressions

%start Program

// precedence and associativity
%right ASSIGNOP
%left OR
%left AND
%left BOR
%left BXOR
%left BAND
%left EQ NE
%left GE LE GT LT
%left PLUS MINUS
%left STAR DIV MOD
%right NOT UMINUS USTAR UBAND
%left LB RB
%left LP RP
%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE

%%
// High-level Definitions
Program : ExtDefList { 
    $$ = newNode(AST_type::program, "program", 1, $1);
    root = $$;
};   // program is a list of external definitions

ExtDefList : ExtDef ExtDefList { 
    $$ = newNode(AST_type::seq_tree, "seq_tree", 2, $1, $2);
}
    | /* empty */ { $$ = NULL;};

ExtDef : Specifier ExtDecList SEMI {
    $$ = newNode(AST_type::decl_inst, "decl_inst", 2, $1, $2);
}  // global variable declaration, e.g. int a, b, c;
    | Specifier SEMI {
    $$ = newNode(AST_type::decl_inst, "decl_inst", 1, $1);
}    // global variable declaration, e.g. int;
    | Specifier FunDec CompSt {
    $$ = newNode(AST_type::decl_inst, "decl_inst", 3, $1, $2, $3);
};  // function definition, e.g. int main() { ... }

ExtDecList : ExtDec {
    $$ = newNode(AST_type::seq_tree, "seq_tree", 1, $1);
}
    | ExtDec COMMA ExtDecList {
    $$ = newNode(AST_type::seq_tree, "seq_tree", 2, $1, $3);
}; // e.g. a, b, c

ExtDec : VarDec {
    $$ = newNode(AST_type::decl_inst, "decl_inst", 1, $1);
}  // variable definition, e.g. a[10][2]
    | VarDec ASSIGNOP Exp { // ! 要不要加上assign_inst?
    $$ = newNode(AST_type::assign_inst, "assign_inst", 2, $1, $3);
};  // variable definition with initialization, e.g. a[10][2] = 1;

// Specifiers
Specifier : INT {
    $$ = newNode(AST_type::int_type, "int_type", 0);
}
    | DOUBLE {
    $$ = newNode(AST_type::double_type, "double_type", 0);
}
    | CHAR {
    $$ = newNode(AST_type::char_type, "char_type", 0);
};

// Declarators
VarDec : ID {
    $$ = newTerNode(AST_type::name, "name", datum($1));
}
    | VarDec LB INTEGER RB {
    $$ = newNode(AST_type::array, "array", 2, $1, newTerNode(AST_type::constant, "constant", datum($3)));
}; // e.g. a[10]

FunDec : ID LP VarList RP {
    $$ = newNode(AST_type::func_decl, "func_decl", 2, newTerNode(AST_type::name, "name", datum($1)), $3);
}   // e.g. foo(int x, float y[10])
    | ID LP RP {
    $$ = newNode(AST_type::func_decl, "func_decl", 1, newTerNode(AST_type::name, "name", datum($1)));
}; // e.g. foo()

VarList : ParamDec COMMA VarList {
    $$ = newNode(AST_type::seq_tree, "seq_tree", 2, $1, $3);
}
    | ParamDec {
    $$ = newNode(AST_type::seq_tree, "seq_tree", 1, $1);
};

ParamDec : Specifier VarDec {
    $$ = newNode(AST_type::decl_inst, "decl_inst", 2, $1, $2);
};  // e.g. int a[10]

// Statements
CompSt : LC DefList StmtList RC {
    $$ = newNode(AST_type::eseq_tree, "eseq_tree", 2, $2, $3);
};    // compound statement, e.g. { int a; int b; ... }

StmtList : Stmt StmtList {
    $$ = newNode(AST_type::seq_tree, "seq_tree", 2, $1, $2);
}
    | /* empty */ { $$ = NULL; };

Stmt : Exp SEMI {
    $$ = newNode(AST_type::seq_tree, "seq_tree", 1, $1);
} // expression
    | CompSt {
    $$ = newNode(AST_type::seq_tree, "seq_tree", 1, $1);
}    // compound statement inside a compound statement
    | RETURN Exp SEMI {
    $$ = newNode(AST_type::return_inst, "return_inst", 1, $2);
}   // return statement
    | RETURN SEMI {
    $$ = newNode(AST_type::return_inst, "return_inst", 0);
} // return;
    | IF LP Exp RP Stmt %prec LOWER_THAN_ELSE {
    $$ = newNode(AST_type::if_inst, "if_inst", 2, $3, $5);
}   // if statement
    | IF LP Exp RP Stmt ELSE Stmt {
    $$ = newNode(AST_type::if_inst, "if_inst", 3, $3, $5, $7);  // ! 不需要else_inst是吗？
}   // if-else statement
    | WHILE LP Exp RP Stmt {
    $$ = newNode(AST_type::while_inst, "while_inst", 2, $3, $5);
}; // while statement

// Local Definitions
DefList : Def DefList {
    $$ = newNode(AST_type::seq_tree, "seq_tree", 2, $1, $2);
}   // list of local definitions, e.g. int a; double b, c;
    | /* empty */ { $$ = NULL; };

Def : Specifier DecList SEMI {
    $$ = newNode(AST_type::decl_inst, "decl_inst", 2, $1, $2);
};   // local definition, e.g. int a, b, c;

DecList : Dec {
    $$ = newNode(AST_type::seq_tree, "seq_tree", 1, $1);
}
    | Dec COMMA DecList {
    $$ = newNode(AST_type::seq_tree, "seq_tree", 2, $1, $3);
};

Dec : VarDec {
    $$ = newNode(AST_type::decl_inst, "decl_inst", 1, $1);
}
    | VarDec ASSIGNOP Exp { // ! 要不要加上assign节点?
    $$ = newNode(AST_type::assign_inst, "assign_inst", 2, $1, $3);
};

// Expressions
Exp : Exp ASSIGNOP Exp {
    $$ = newNode(AST_type::assign_inst, "assign_inst", 2, $1, $3);
}
    | Exp AND Exp {
    $$ = newNode(AST_type::and_type, "and_type", 2, $1, $3);
}
    | Exp OR Exp {
    $$ = newNode(AST_type::or_type, "or_type", 2, $1, $3);
}
    | Exp EQ Exp {
    $$ = newNode(AST_type::equal, "equal", 2, $1, $3);
}
    | Exp GE Exp {
    $$ = newNode(AST_type::greater_equal, "greater_equal", 2, $1, $3);
}
    | Exp LE Exp {
    $$ = newNode(AST_type::less_equal, "less_equal", 2, $1, $3);
}
    | Exp GT Exp {
    $$ = newNode(AST_type::greater, "greater", 2, $1, $3);
}
    | Exp LT Exp {
    $$ = newNode(AST_type::less, "less", 2, $1, $3);
}
    | Exp NE Exp {
    $$ = newNode(AST_type::not_equal, "not_equal", 2, $1, $3);
}
    | Exp PLUS Exp {
    $$ = newNode(AST_type::plus, "plus", 2, $1, $3);
}
    | Exp MINUS Exp {
    $$ = newNode(AST_type::minus, "minus", 2, $1, $3);
}
    | Exp STAR Exp {
    $$ = newNode(AST_type::multiply, "multiply", 2, $1, $3);
}
    | Exp DIV Exp {
    $$ = newNode(AST_type::divide, "divide", 2, $1, $3);
}
    | Exp MOD Exp {
    $$ = newNode(AST_type::mod, "mod", 2, $1, $3);
}
    | Exp BAND Exp {
    $$ = newNode(AST_type::band, "band", 2, $1, $3);
}
    | Exp BOR Exp {
    $$ = newNode(AST_type::bor, "bor", 2, $1, $3);
}
    | Exp BXOR Exp {
    $$ = newNode(AST_type::bxor, "bxor", 2, $1, $3);
}
    | LP Exp RP {
    $$ = newNode(AST_type::seq_tree, "seq_tree", 1, $2);
}
    | MINUS Exp %prec UMINUS {
    $$ = newNode(AST_type::uminus, "uminus", 1, $2);
}
    | NOT Exp {
    $$ = newNode(AST_type::not_type, "not_type", 1, $2);
}
    | BAND Exp %prec UBAND {
    $$ = newNode(AST_type::uband, "uband", 1, $2);
}
    | STAR Exp %prec USTAR {
    $$ = newNode(AST_type::ustar, "ustar", 1, $2);
}
    | ID LP Args RP {
    $$ = newNode(AST_type::call_inst, "call_inst", 2, newTerNode(AST_type::name, "name", datum($1)), $3);
}
    | ID LP RP {
    $$ = newNode(AST_type::call_inst, "call_inst", 1, newTerNode(AST_type::name, "name", datum($1)));
}
    | Exp LB Exp RB {
    $$ = newNode(AST_type::array, "array", 2, $1, $3);  // ! 这里访问数组内存要怎么表示？
}
    | ID {
    $$ = newTerNode(AST_type::name, "name", datum($1));
}
    | INTEGER {
    $$ = newTerNode(AST_type::constant, "constant", datum($1));
}
    | REAL {
    $$ = newTerNode(AST_type::constant, "constant", datum($1));
}
    | STRING {
    $$ = newTerNode(AST_type::string, "string", datum($1));
};

Args : Exp COMMA Args {
    $$ = newNode(AST_type::seq_tree, "seq_tree", 2, $1, $3);
}
    | Exp {
    $$ = newNode(AST_type::seq_tree, "seq_tree", 1, $1);
};
%%

void yyerror(char *str) {
    fprintf(stderr, "error:%s\n", str);
}

int yywrap() {
    return 1;
}

int main(int argc, char **argv) {
    if (argc <= 1) {
        yyparse();
        printTreeInfo(root, 0);
        return 0;
    }

    FILE *f = fopen(argv[1], "r");
    if (!f) {
        perror(argv[1]);
        return 1;
    }

    yyrestart(f);
    yyparse();
    printTreeInfo(root, 0);

    return 0;
}