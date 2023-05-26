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
    char *idval;
    char *labelval;
    struct node * ast;
}
// Tokens
%token <intval> INTEGER
%token <doubleval> REAL
%token <strval> STRING
%token <idval> ID
%token <labelval> LABEL
%token SEMI COMMA ASSIGNOP COLON
%token EQ GE LE GT LT NE
%token PLUS MINUS STAR DIV BAND BXOR BOR MOD
%token AND OR NOT
%token INT DOUBLE CHAR VOID GOTO
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
    $$ = $1;
    $$->next = $2;
}
    | /* empty */ { $$ = NULL;};

ExtDef : Specifier ExtDecList SEMI {
    $$ = newNode(AST_type::decl_inst, "decl_inst", 2, $1, $2);
}  // global variable declaration, e.g. int a, b, c;
    | Specifier SEMI {
    $$ = newNode(AST_type::decl_inst, "decl_inst", 1, $1);
}    // global variable declaration, e.g. int;
    | Specifier FunDec CompSt {
    $3->next = $2->next;
    $$ = newNode(AST_type::func_decl, "func_decl", 3, $1, $2, $3);
};  // function definition, e.g. int main() { ... }

ExtDecList : ExtDec {
    $$ = $1;
}
    | ExtDec COMMA ExtDecList {
    $$ = $1;
    $$->next = $3;
}; // e.g. a, b, c

ExtDec : VarDec {
    $$ = $1;
}  // variable definition, e.g. a[10][2]
    | VarDec ASSIGNOP Exp { // 先留着
    $$ = newNode(AST_type::assign_inst, "assign", 2, $1, $3);
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
}
    | VOID {
    $$ = newNode(AST_type::void_type, "void_type", 0);
};

// Declarators
VarDec : ID {
    $$ = newTerNode(AST_type::name, "name", datum($1));
}
    | STAR ID %prec USTAR {
    $$ = newNode(AST_type::ustar, "member", 1, newTerNode(AST_type::name, "name", datum($2)));
}
    | BAND ID %prec UBAND {
    $$ = newNode(AST_type::uband, "address", 1, newTerNode(AST_type::name, "name", datum($2)));
}
    | VarDec LB INTEGER RB {
    $$ = newNode(AST_type::array, "subscript", 2, $1, newTerNode(AST_type::constant, "constant", datum($3)));
}; // e.g. a[10]

FunDec : ID LP VarList RP {
    $$ = newTerNode(AST_type::name, "name", datum($1));
    $$->next = $3;
}   // e.g. foo(int x, float y[10])
    | ID LP RP {
    $$ = newTerNode(AST_type::name, "name", datum($1));
}; // e.g. foo()

VarList : ParamDec COMMA VarList {
    $$ = $1;
    $$->next = $3;
}
    | ParamDec {
    $$ = $1;
};

ParamDec : Specifier VarDec {
    $$ = newNode(AST_type::decl_inst, "decl_inst", 2, $1, $2);
};  // e.g. int a[10]

// Statements
CompSt : LC DefList StmtList RC {
    if ($2 == NULL) {
        $$ = newNode(AST_type::seq_tree, "seq_tree", 1, $3);
    } else {
        $$ = newNode(AST_type::seq_tree, "seq_tree", 2, newNode(AST_type::deflist, "deflist", 1, $2), $3);
    }
};    // compound statement, e.g. { int a; int b; ... }

StmtList : Stmt StmtList {
    $$ = $1;
    $$->next = $2;
}
    | /* empty */ { $$ = NULL; };

Stmt : Exp SEMI {
    $$ = $1;
} // expression
    | CompSt {
    $$ = $1;
}    // compound statement inside a compound statement
    | RETURN Exp SEMI {
    if ($2->child == NULL) {
        $$ = newNode(AST_type::return_inst, "return_inst", 1, $2);
    } else {
        $$ = newNode(AST_type::return_inst, "return_inst", 1, newNode(AST_type::eseq_tree, "eseq_tree", 1, $2));
    }
}   // return statement
    | RETURN SEMI {
    $$ = newNode(AST_type::return_inst, "return_inst", 0);
} // return;
    | IF LP Exp RP Stmt %prec LOWER_THAN_ELSE {
    if ($3->child == NULL) {
        $$ = newNode(AST_type::if_inst, "if_inst", 2, $3, $5);
    } else {
        $$ = newNode(AST_type::if_inst, "if_inst", 2, newNode(AST_type::eseq_tree, "eseq_tree", 1, $3), $5);
    }
}   // if statement
    | IF LP Exp RP Stmt ELSE Stmt {
    if ($3->child == NULL) {
        $$ = newNode(AST_type::if_inst, "if_inst", 3, $3, $5, $7);
    } else {
        $$ = newNode(AST_type::if_inst, "if_inst", 3, newNode(AST_type::eseq_tree, "eseq_tree", 1, $3), $5, $7);
    }
}   // if-else statement
    | WHILE LP Exp RP Stmt {
    if ($3->child == NULL) {
        $$ = newNode(AST_type::while_inst, "while_inst", 2, $3, $5);
    } else {
        $$ = newNode(AST_type::while_inst, "while_inst", 2, newNode(AST_type::eseq_tree, "eseq_tree", 1, $3), $5);
    }
}   // while statement
    | GOTO LABEL SEMI {
    $$ = newTerNode(AST_type::goto_inst, "goto_inst", datum($2));
}   // goto statement
    | LABEL COLON {
    $$ = newTerNode(AST_type::label_decl, "label_decl", datum($1));
};

// Local Definitions
DefList : Def DefList {
    $$ = $1;
    $$->next = $2;
}   // list of local definitions, e.g. int a; double b, c;
    | /* empty */ { $$ = NULL; };

Def : Specifier DecList SEMI {
    $$ = newNode(AST_type::decl_inst, "decl_inst", 2, $1, $2);
};   // local definition, e.g. int a, b, c;

DecList : Dec {
    $$ = $1;
}
    | Dec COMMA DecList {
    $$ = $1;
    $$->next = $3;
};

Dec : VarDec {
    $$ = $1;
}
    | VarDec ASSIGNOP Exp {
    if ($3->child == NULL) {
        $$ = newNode(AST_type::assign_inst, "assign", 2, $1, $3);
    } else {
        $$ = newNode(AST_type::assign_inst, "assign", 2, $1, newNode(AST_type::eseq_tree, "eseq_tree", 1, $3));
    }
};

// Expressions
Exp : Exp ASSIGNOP Exp {
    struct node * temp1 = $1->child == NULL ? $1 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $1);
    struct node * temp2 = $3->child == NULL ? $3 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(AST_type::assign_inst, "assign", 2, temp1, temp2);
}
    | Exp AND Exp {
    struct node * temp1 = $1->child == NULL ? $1 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $1);
    struct node * temp2 = $3->child == NULL ? $3 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(AST_type::and_type, "and_type", 2, temp1, temp2);
}
    | Exp OR Exp {
    struct node * temp1 = $1->child == NULL ? $1 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $1);
    struct node * temp2 = $3->child == NULL ? $3 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(AST_type::or_type, "or_type", 2, temp1, temp2);
}
    | Exp EQ Exp {
    struct node * temp1 = $1->child == NULL ? $1 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $1);
    struct node * temp2 = $3->child == NULL ? $3 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(AST_type::equal, "equal", 2, temp1, temp2);
}
    | Exp GE Exp {
    struct node * temp1 = $1->child == NULL ? $1 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $1);
    struct node * temp2 = $3->child == NULL ? $3 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(AST_type::greater_equal, "greater_equal", 2, temp1, temp2);
}
    | Exp LE Exp {
    struct node * temp1 = $1->child == NULL ? $1 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $1);
    struct node * temp2 = $3->child == NULL ? $3 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(AST_type::less_equal, "less_equal", 2, temp1, temp2);
}
    | Exp GT Exp {
    struct node * temp1 = $1->child == NULL ? $1 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $1);
    struct node * temp2 = $3->child == NULL ? $3 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(AST_type::greater, "greater", 2, temp1, temp2);
}
    | Exp LT Exp {
    struct node * temp1 = $1->child == NULL ? $1 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $1);
    struct node * temp2 = $3->child == NULL ? $3 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(AST_type::less, "less", 2, temp1, temp2);
}
    | Exp NE Exp {
    struct node * temp1 = $1->child == NULL ? $1 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $1);
    struct node * temp2 = $3->child == NULL ? $3 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(AST_type::not_equal, "not_equal", 2, temp1, temp2);
}
    | Exp PLUS Exp {
    struct node * temp1 = $1->child == NULL ? $1 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $1);
    struct node * temp2 = $3->child == NULL ? $3 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(AST_type::plus, "plus", 2, temp1, temp2);
}
    | Exp MINUS Exp {
    struct node * temp1 = $1->child == NULL ? $1 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $1);
    struct node * temp2 = $3->child == NULL ? $3 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(AST_type::minus, "minus", 2, temp1, temp2);
}
    | Exp STAR Exp {
    struct node * temp1 = $1->child == NULL ? $1 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $1);
    struct node * temp2 = $3->child == NULL ? $3 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(AST_type::multiply, "multiply", 2, temp1, temp2);
}
    | Exp DIV Exp {
    struct node * temp1 = $1->child == NULL ? $1 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $1);
    struct node * temp2 = $3->child == NULL ? $3 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(AST_type::divide, "divide", 2, temp1, temp2);
}
    | Exp MOD Exp {
    struct node * temp1 = $1->child == NULL ? $1 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $1);
    struct node * temp2 = $3->child == NULL ? $3 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(AST_type::mod, "mod", 2, temp1, temp2);
}
    | Exp BAND Exp {
    struct node * temp1 = $1->child == NULL ? $1 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $1);
    struct node * temp2 = $3->child == NULL ? $3 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(AST_type::band, "band", 2, temp1, temp2);
}
    | Exp BOR Exp {
    struct node * temp1 = $1->child == NULL ? $1 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $1);
    struct node * temp2 = $3->child == NULL ? $3 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(AST_type::bor, "bor", 2, temp1, temp2);
}
    | Exp BXOR Exp {
    struct node * temp1 = $1->child == NULL ? $1 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $1);
    struct node * temp2 = $3->child == NULL ? $3 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(AST_type::bxor, "bxor", 2, temp1, temp2);
}
    | LP Exp RP {
    $$ = $2;
}
    | MINUS Exp %prec UMINUS {
    if ($2->child == NULL) {
        $$ = newNode(AST_type::uminus, "uminus", 1, $2);
    } else {
        $$ = newNode(AST_type::uminus, "uminus", 1, newNode(AST_type::eseq_tree, "eseq_tree", 1, $2));
    }
}
    | NOT Exp {
    if ($2->child == NULL) {
        $$ = newNode(AST_type::not_type, "not_type", 1, $2);
    } else {
        $$ = newNode(AST_type::not_type, "not_type", 1, newNode(AST_type::eseq_tree, "eseq_tree", 1, $2));
    }
}
    | BAND Exp %prec UBAND {
    if ($2->child == NULL) {
        $$ = newNode(AST_type::uband, "address", 1, $2);
    } else {
        $$ = newNode(AST_type::uband, "address", 1, newNode(AST_type::eseq_tree, "eseq_tree", 1, $2));
    }
}
    | STAR Exp %prec USTAR {
    if ($2->child == NULL) {
        $$ = newNode(AST_type::ustar, "member", 1, $2);
    } else {
        $$ = newNode(AST_type::ustar, "member", 1, newNode(AST_type::eseq_tree, "eseq_tree", 1, $2));
    }
}
    | ID LP Args RP {
    $$ = newNode(AST_type::call_inst, "call_inst", 2, newTerNode(AST_type::name, "name", datum($1)), $3);
}
    | ID LP RP {
    $$ = newNode(AST_type::call_inst, "call_inst", 1, newTerNode(AST_type::name, "name", datum($1)));
}
    | Exp LB Exp RB {
    struct node * temp1 = $1->child == NULL ? $1 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $1);
    struct node * temp2 = $3->child == NULL ? $3 : newNode(AST_type::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(AST_type::array, "subscript", 2, temp1, temp2);
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
    $$ = $1;
    $$->next = $3;
}
    | Exp {
    $$ = $1;
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