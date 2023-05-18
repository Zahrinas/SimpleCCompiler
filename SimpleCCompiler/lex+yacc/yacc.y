%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <iostream>
    #include <string>
    #include "../AST.h"
    int yylex(void);
    void yyerror(char *);

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
%token PLUS MINUS STAR DIV BAND
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
Program : ExtDefList { $$ = $1; root = $$; };   // program is a list of external definitions

ExtDefList : ExtDef ExtDefList { $$ = new AST(); $$->son = $1; $$->brother = $2; }
    | /* empty */ { $$ = nullptr;};

ExtDef : Specifier ExtDecList SEMI { 
    $$ = new AST(new AST_node(AST_type::decl_inst));
    $$->son = $1;
    $$->son->brother = $2;
}  // global variable declaration, e.g. int a, b, c;
    | Specifier SEMI {
    $$ = new AST(new AST_node(AST_type::decl_inst));
    $$->son = $1;
}    // global variable declaration, e.g. int;
    | Specifier FunDec CompSt {
    $$ = new AST(new AST_node(AST_type::decl_inst));
    $$->son = $1;
    $$->son->brother = $2;
    $$->son->brother->brother = $3;
};  // function definition, e.g. int main() { ... }

ExtDecList : ExtDec {
    $$ = new AST(new AST_node(AST_type::seq_tree));
    $$->son = $1;
}
    | ExtDec COMMA ExtDecList {
    $$ = new AST(new AST_node(AST_type::seq_tree));
    $$->son = $1;
    $$->son->brother = $3;
}; // e.g. a, b, c

ExtDec : VarDec {
    $$ = new AST(new AST_node(AST_type::decl_inst));
    $$->son = $1;
}  // variable definition, e.g. a[10][2]
    | VarDec ASSIGNOP Exp { // ! 要不要加上assign节点?
    $$ = new AST(new AST_node(AST_type::decl_inst));
    $$->son = $1;
    $$->son->brother = $3;
};  // variable definition with initialization, e.g. a[10][2] = 1;

// Specifiers
Specifier : INT {
    $$ = new AST(new AST_node(AST_type::int_type));
}
    | DOUBLE {
    $$ = new AST(new AST_node(AST_type::double_type));
}
    | CHAR; // ! TODO: char type

// Declarators
VarDec : ID {
    $$ = new AST(new AST_node(AST_type::name, new std::string($1)));    // ! 应该是这样写的吧
}
    | VarDec LB INTEGER RB {
    $$ = new AST(new AST_node(AST_type::array));    // ! 数组要怎么表示？
    $$->son = $1;
    $$->son->brother = new AST(new AST_node(AST_type::constant, new int($3)));
}; // e.g. a[10]

FunDec : ID LP VarList RP {
    $$ = new AST(new AST_node(AST_type::func_decl));
    $$->son = new AST(new AST_node(AST_type::name, new std::string($1)));
    $$->son->brother = $3;
}   // e.g. foo(int x, float y[10])
    | ID LP RP {
    $$ = new AST(new AST_node(AST_type::func_decl));
    $$->son = new AST(new AST_node(AST_type::name, new std::string($1)));
}; // e.g. foo()

VarList : ParamDec COMMA VarList {
    $$ = new AST(new AST_node(AST_type::seq_tree));
    $$->son = $1;
    $$->son->brother = $3;
}
    | ParamDec {
    $$ = new AST(new AST_node(AST_type::seq_tree));
    $$->son = $1;
};

ParamDec : Specifier VarDec {
    $$ = new AST(new AST_node(AST_type::decl_inst));
    $$->son = $1;
    $$->son->brother = $2;
};  // e.g. int a[10]

// Statements
CompSt : LC DefList StmtList RC {
    $$ = new AST(new AST_node(AST_type::eseq_tree));
    $$->son = $2;
    $$->son->brother = $3;
};    // compound statement, e.g. { int a; int b; ... }

StmtList : Stmt StmtList {
    $$ = new AST(new AST_node(AST_type::seq_tree));
    $$->son = $1;
    $$->son->brother = $2;
}
    | /* empty */ { $$ = nullptr; };

Stmt : Exp SEMI {
    $$ = new AST(new AST_node(AST_type::seq_tree));
    $$->son = $1;
} // expression
    | CompSt {
    $$ = $1;
}    // compound statement inside a compound statement
    | RETURN Exp SEMI {
    $$ = new AST(new AST_node(AST_type::return_inst));
    $$->son = $2;
}   // return statement
    | RETURN SEMI {
    $$ = new AST(new AST_node(AST_type::return_inst));
} // return;
    | IF LP Exp RP Stmt %prec LOWER_THAN_ELSE {
    $$ = new AST(new AST_node(AST_type::if_inst));
    $$->son = $3;
    $$->son->brother = $5;
}   // if statement
    | IF LP Exp RP Stmt ELSE Stmt {
    $$ = new AST(new AST_node(AST_type::if_inst));
    $$->son = $3;
    $$->son->brother = $5;
    $$->son->brother->brother = $7; // ! 不需要else_inst是吗？
}   // if-else statement
    | WHILE LP Exp RP Stmt {
    $$ = new AST(new AST_node(AST_type::while_inst));
    $$->son = $3;
    $$->son->brother = $5;
}; // while statement

// Local Definitions
DefList : Def DefList {
    $$ = new AST(new AST_node(AST_type::seq_tree));
    $$->son = $1;
    $$->son->brother = $2;
}   // list of local definitions, e.g. int a; double b, c;
    | /* empty */ { $$ = nullptr; };

Def : Specifier DecList SEMI {
    $$ = new AST(new AST_node(AST_type::decl_inst));
    $$->son = $1;
    $$->son->brother = $2;
};   // local definition, e.g. int a, b, c;

DecList : Dec {
    $$ = new AST(new AST_node(AST_type::seq_tree));
    $$->son = $1;
}
    | Dec COMMA DecList {
    $$ = new AST(new AST_node(AST_type::seq_tree));
    $$->son = $1;
    $$->son->brother = $3;
};

Dec : VarDec {
    $$ = new AST(new AST_node(AST_type::decl_inst));
    $$->son = $1;
}
    | VarDec ASSIGNOP Exp { // ! 要不要加上assign节点?
    $$ = new AST(new AST_node(AST_type::decl_inst));
    $$->son = $1;
    $$->son->brother = $3;
};

// Expressions
Exp : Exp ASSIGNOP Exp {
    $$ = new AST(new AST_node(AST_type::assign));
    $$->son = $1;
    $$->son->brother = $3;
}
    | Exp AND Exp {
    $$ = new AST(new AST_node(AST_type::and));
    $$->son = $1;
    $$->son->brother = $3;
}
    | Exp OR Exp {
    $$ = new AST(new AST_node(AST_type::or));
    $$->son = $1;
    $$->son->brother = $3;
}
    | Exp EQ Exp {
    $$ = new AST(new AST_node(AST_type::equal));
    $$->son = $1;
    $$->son->brother = $3;
}
    | Exp GE Exp {
    $$ = new AST(new AST_node(AST_type::greater_equal));
    $$->son = $1;
    $$->son->brother = $3;
}
    | Exp LE Exp {
    $$ = new AST(new AST_node(AST_type::less_equal));
    $$->son = $1;
    $$->son->brother = $3;
}
    | Exp GT Exp {
    $$ = new AST(new AST_node(AST_type::greater));
    $$->son = $1;
    $$->son->brother = $3;
}
    | Exp LT Exp {
    $$ = new AST(new AST_node(AST_type::less));
    $$->son = $1;
    $$->son->brother = $3;
}
    | Exp NE Exp {
    $$ = new AST(new AST_node(AST_type::not_equal));
    $$->son = $1;
    $$->son->brother = $3;
}
    | Exp PLUS Exp {
    $$ = new AST(new AST_node(AST_type::plus));
    $$->son = $1;
    $$->son->brother = $3;
}
    | Exp MINUS Exp {
    $$ = new AST(new AST_node(AST_type::minus));
    $$->son = $1;
    $$->son->brother = $3;
}
    | Exp STAR Exp {
    $$ = new AST(new AST_node(AST_type::multiply));
    $$->son = $1;
    $$->son->brother = $3;
}
    | Exp DIV Exp {
    $$ = new AST(new AST_node(AST_type::divide));
    $$->son = $1;
    $$->son->brother = $3;
}
    | Exp MOD Exp {
    $$ = new AST(new AST_node(AST_type::mod));
    $$->son = $1;
    $$->son->brother = $3;
}
    | Exp BAND Exp {
    $$ = new AST(new AST_node(AST_type::band));
    $$->son = $1;
    $$->son->brother = $3;
}
    | Exp BOR Exp {
    $$ = new AST(new AST_node(AST_type::bor));
    $$->son = $1;
    $$->son->brother = $3;
}
    | Exp BXOR Exp {
    $$ = new AST(new AST_node(AST_type::bxor));
    $$->son = $1;
    $$->son->brother = $3;
}
    | LP Exp RP {
    $$ = $2;
}
    | MINUS Exp %prec UMINUS {
    $$ = new AST(new AST_node(AST_type::minus));
    $$->son = $2;
}
    | NOT Exp {
    $$ = new AST(new AST_node(AST_type::not));
    $$->son = $2;
}
    | BAND Exp %prec UBAND {
    $$ = new AST(new AST_node(AST_type::band));
    $$->son = $2;
}
    | STAR Exp %prec USTAR {
    $$ = new AST(new AST_node(AST_type::multiply));
    $$->son = $2;
}
    | ID LP Args RP {
    $$ = new AST(new AST_node(AST_type::call_inst));
    $$->son = new AST(new AST_node(AST_type::name, new std::string($1)));
    $$->son->brother = $3;
}
    | ID LP RP {
    $$ = new AST(new AST_node(AST_type::call_inst));
    $$->son = new AST(new AST_node(AST_type::name, new std::string($1)));
}
    | Exp LB Exp RB {
    $$ = new AST(new AST_node(AST_type::array)); // ! 这里访问数组内存要用什么节点？
    $$->son = $1;
    $$->son->brother = $3;
}
    | ID {
    $$ = new AST(new AST_node(AST_type::name, new std::string($1)));
}
    | INTEGER {
    $$ = new AST(new AST_node(AST_type::constant, new int($1)));
}
    | REAL {
    $$ = new AST(new AST_node(AST_type::constant, new double($1)));
}
    | STRING {
    $$ = new AST(new AST_node(AST_type::string, new std::string($1)));
};

Args : Exp COMMA Args {
    $$ = new AST(new AST_node(AST_type::seq_tree));
    $$->son = $1;
    $$->son->brother = $3;
}
    | Exp {
    $$ = new AST(new AST_node(AST_type::seq_tree));
    $$->son = $1;
};
%%

void yyerror(char *str) {
    fprintf(stderr, "error:%s\n", str);
}

int yywrap() {
    return 1;
}
 
int main() {
    yyparse();
}