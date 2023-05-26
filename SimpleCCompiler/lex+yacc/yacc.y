%{
    #include "AST.h"
    #include "base.h"
    #include <cstdio>
    #include <cstdlib>
    #include <iostream>
    #include <cstring>
    
    int yylex(void);
    void yyrestart(FILE*);
    void yyerror(const char *);

    AST* root;
%}

%union {
    int intval;
    double doubleval;
    char *strval;
    AST* ast;
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
%token INT DOUBLE CHARx-special/nautilus-clipboard
copy
file:///tmp/VMwareDnD/zLeU4p/AST.cpp
file:///tmp/VMwareDnD/zLeU4p/AST.h
file:///tmp/VMwareDnD/zLeU4p/base.cpp
file:///tmp/VMwareDnD/zLeU4p/base.h

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
    $$ = newNode(dataType::program, "program", 1, $1);
    root = $$;
};   // program is a list of external definitions

ExtDefList : ExtDef ExtDefList { 
    $$ = newNode(dataType::seq_tree, "seq_tree", 2, $1, $2);
}
    | /* empty */ { $$ = NULL;};

ExtDef : Specifier ExtDecList SEMI {
    $$ = newNode(dataType::decl_inst, "decl_inst", 2, $1, $2);
}  // global variable declaration, e.g. int a, b, c;
    | Specifier SEMI {
    $$ = newNode(dataType::decl_inst, "decl_inst", 1, $1);
}    // global variable declaration, e.g. int;
    | Specifier FunDec CompSt {
    $$ = newNode(dataType::decl_inst, "decl_inst", 3, $1, $2, $3);
};  // function definition, e.g. int main() { ... }

ExtDecList : ExtDec {
    $$ = newNode(dataType::seq_tree, "seq_tree", 1, $1);
}
    | ExtDec COMMA ExtDecList {
    $$ = newNode(dataType::seq_tree, "seq_tree", 2, $1, $3);
}; // e.g. a, b, c

ExtDec : VarDec {
    $$ = newNode(dataType::decl_inst, "decl_inst", 1, $1);
}  // variable definition, e.g. a[10][2]
    | VarDec ASSIGNOP Exp { // ! 要不要加上assign_inst?
    $$ = newNode(dataType::assign_inst, "assign_inst", 2, $1, $3);
};  // variable definition with initialization, e.g. a[10][2] = 1;

// Specifiers
Specifier : INT {
    $$ = newNode(dataType::int_type, "int_type", 0);
}
    | DOUBLE {
    $$ = newNode(dataType::double_type, "double_type", 0);
}
    | CHAR {
    $$ = newNode(dataType::char_type, "char_type", 0);
};

// Declarators
VarDec : ID {
    $$ = newTerNode(dataType::name, "name", datum($1));
}
    | VarDec LB INTEGER RB {
    $$ = newNode(dataType::array, "array", 2, $1, newTerNode(dataType::constant, "constant", datum($3)));
}; // e.g. a[10]

FunDec : ID LP VarList RP {
    $$ = newNode(dataType::func_decl, "func_decl", 2, newTerNode(dataType::name, "name", datum($1)), $3);
}   // e.g. foo(int x, float y[10])
    | ID LP RP {
    $$ = newNode(dataType::func_decl, "func_decl", 1, newTerNode(dataType::name, "name", datum($1)));
}; // e.g. foo()

VarList : ParamDec COMMA VarList {
    $$ = newNode(dataType::seq_tree, "seq_tree", 2, $1, $3);
}
    | ParamDec {
    $$ = newNode(dataType::seq_tree, "seq_tree", 1, $1);
};

ParamDec : Specifier VarDec {
    $$ = newNode(dataType::decl_inst, "decl_inst", 2, $1, $2);
};  // e.g. int a[10]

// Statements
CompSt : LC DefList StmtList RC {
    $$ = newNode(dataType::eseq_tree, "eseq_tree", 2, $2, $3);
};    // compound statement, e.g. { int a; int b; ... }

StmtList : Stmt StmtList {
    $$ = newNode(dataType::seq_tree, "seq_tree", 2, $1, $2);
}
    | /* empty */ { $$ = NULL; };

Stmt : Exp SEMI {
    $$ = newNode(dataType::seq_tree, "seq_tree", 1, $1);
} // expression
    | CompSt {
    $$ = newNode(dataType::seq_tree, "seq_tree", 1, $1);
}    // compound statement inside a compound statement
    | RETURN Exp SEMI {
    $$ = newNode(dataType::return_inst, "return_inst", 1, $2);
}   // return statement
    | RETURN SEMI {
    $$ = newNode(dataType::return_inst, "return_inst", 0);
} // return;
    | IF LP Exp RP Stmt %prec LOWER_THAN_ELSE {
    $$ = newNode(dataType::if_inst, "if_inst", 2, $3, $5);
}   // if statement
    | IF LP Exp RP Stmt ELSE Stmt {
    $$ = newNode(dataType::if_inst, "if_inst", 3, $3, $5, $7);  // ! 不需要else_inst是吗？
}   // if-else statement
    | WHILE LP Exp RP Stmt {
    $$ = newNode(dataType::while_inst, "while_inst", 2, $3, $5);
}; // while statement

// Local Definitions
DefList : Def DefList {
    $$ = newNode(dataType::seq_tree, "seq_tree", 2, $1, $2);
}   // list of local definitions, e.g. int a; double b, c;
    | /* empty */ { $$ = NULL; };

Def : Specifier DecList SEMI {
    $$ = newNode(dataType::decl_inst, "decl_inst", 2, $1, $2);
};   // local definition, e.g. int a, b, c;

DecList : Dec {
    $$ = newNode(dataType::seq_tree, "seq_tree", 1, $1);
}
    | Dec COMMA DecList {
    $$ = newNode(dataType::seq_tree, "seq_tree", 2, $1, $3);
};

Dec : VarDec {
    $$ = newNode(dataType::decl_inst, "decl_inst", 1, $1);
}
    | VarDec ASSIGNOP Exp { // ! 要不要加上assign节点?
    $$ = newNode(dataType::assign_inst, "assign_inst", 2, $1, $3);
};

// Expressions
Exp : Exp ASSIGNOP Exp {
    $$ = newNode(dataType::assign_inst, "assign_inst", 2, $1, $3);
}
    | Exp AND Exp {
    $$ = newNode(dataType::and_type, "and_type", 2, $1, $3);
}
    | Exp OR Exp {
    $$ = newNode(dataType::or_type, "or_type", 2, $1, $3);
}
    | Exp EQ Exp {
    $$ = newNode(dataType::equal, "equal", 2, $1, $3);
}
    | Exp GE Exp {
    $$ = newNode(dataType::greater_equal, "greater_equal", 2, $1, $3);
}
    | Exp LE Exp {
    $$ = newNode(dataType::less_equal, "less_equal", 2, $1, $3);
}
    | Exp GT Exp {
    $$ = newNode(dataType::greater, "greater", 2, $1, $3);
}
    | Exp LT Exp {
    $$ = newNode(dataType::less, "less", 2, $1, $3);
}
    | Exp NE Exp {
    $$ = newNode(dataType::not_equal, "not_equal", 2, $1, $3);
}
    | Exp PLUS Exp {
    $$ = newNode(dataType::plus, "plus", 2, $1, $3);
}
    | Exp MINUS Exp {
    $$ = newNode(dataType::minus, "minus", 2, $1, $3);
}
    | Exp STAR Exp {
    $$ = newNode(dataType::multiply, "multiply", 2, $1, $3);
}
    | Exp DIV Exp {
    $$ = newNode(dataType::divide, "divide", 2, $1, $3);
}
    | Exp MOD Exp {
    $$ = newNode(dataType::mod, "mod", 2, $1, $3);
}
    | Exp BAND Exp {
    $$ = newNode(dataType::band, "band", 2, $1, $3);
}
    | Exp BOR Exp {
    $$ = newNode(dataType::bor, "bor", 2, $1, $3);
}
    | Exp BXOR Exp {
    $$ = newNode(dataType::bxor, "bxor", 2, $1, $3);
}
    | LP Exp RP {
    $$ = newNode(dataType::seq_tree, "seq_tree", 1, $2);
}
    | MINUS Exp %prec UMINUS {
    $$ = newNode(dataType::uminus, "uminus", 1, $2);
}
    | NOT Exp {
    $$ = newNode(dataType::not_type, "not_type", 1, $2);
}
    | BAND Exp %prec UBAND {
    $$ = newNode(dataType::uband, "uband", 1, $2);
}
    | STAR Exp %prec USTAR {
    $$ = newNode(dataType::ustar, "ustar", 1, $2);
}
    | ID LP Args RP {
    $$ = newNode(dataType::call_inst, "call_inst", 2, newTerNode(dataType::name, "name", datum($1)), $3);
}
    | ID LP RP {
    $$ = newNode(dataType::call_inst, "call_inst", 1, newTerNode(dataType::name, "name", datum($1)));
}
    | Exp LB Exp RB {
    $$ = newNode(dataType::array, "array", 2, $1, $3);  // ! 这里访问数组内存要怎么表示？
}
    | ID {
    $$ = newTerNode(dataType::name, "name", datum($1));
}
    | INTEGER {
    $$ = newTerNode(dataType::constant, "constant", datum($1));
}
    | REAL {
    $$ = newTerNode(dataType::constant, "constant", datum($1));
}
    | STRING {
    $$ = newTerNode(dataType::string, "string", datum($1));
};

Args : Exp COMMA Args {
    $$ = newNode(dataType::seq_tree, "seq_tree", 2, $1, $3);
}
    | Exp {
    $$ = newNode(dataType::seq_tree, "seq_tree", 1, $1);
};
%%

void yyerror(const char *str) {
    fprintf(stderr, "error:%s\n", str);
}

int yywrap() {
    return 1;
}

AST* getAST() {
    freopen("data/example.c", "r", stdin);
    yyparse();
    return root;
}
