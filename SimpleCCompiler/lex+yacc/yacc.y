%{
    #include "AST.h"
    #include "base.h"
    #include <stdio.h>
    #include <stdlib.h>
    #include <iostream>
    #include <string.h>
    
    int yylex(void);
    void yyrestart(FILE*);
    void yyerror(const char *);

    AST * root;
%}

%union {
    int intval;
    double doubleval;
    char *strval;
    char *idval;
    char *labelval;
    AST * ast;
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
%type <ast> CompSt Stmt                                 // Statements
%type <ast> Def Dec DecList                             // Local Definitions
%type <ast> BlockItemList BlockItem
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
    $$ = $1;
    $$->next = $2;
}
    | /* empty */ { $$ = NULL;};

ExtDef : Specifier ExtDecList SEMI {
    $$ = newNode(dataType::decl_inst, "decl_inst", 2, $1, $2);
}  // global variable declaration, e.g. int a, b, c;
    | Specifier SEMI {
    $$ = newNode(dataType::decl_inst, "decl_inst", 1, $1);
}    // global variable declaration, e.g. int;
    | Specifier FunDec CompSt {
    $3->next = $2->next;
    $$ = newNode(dataType::func_decl, "func_decl", 3, $1, $2, $3);
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
    $$ = newNode(dataType::assign, "assign", 2, $1, $3);
};  // variable definition with initialization, e.g. a[10][2] = 1;

// Specifiers
Specifier : INT {
    $$ = newNode(dataType::int_type, "int_type", 0);
}
    | INT STAR %prec USTAR {
    $$ = newNode(AST_type::int_pointer, "int_pointer", 0);
}
    | DOUBLE {
    $$ = newNode(dataType::double_type, "double_type", 0);
}   
    | DOUBLE STAR %prec USTAR {
    $$ = newNode(AST_type::double_pointer, "double_pointer", 0);
}
    | CHAR {
    $$ = newNode(dataType::char_type, "char_type", 0);
}
    | CHAR STAR %prec USTAR {
    $$ = newNode(AST_type::char_pointer, "char_pointer", 0);
}
    | VOID {
    $$ = newNode(dataType::void_type, "void_type", 0);
}   
    | VOID STAR %prec USTAR {
    $$ = newNode(AST_type::void_pointer, "void_pointer", 0);
};

// Declarators
VarDec : ID {
    $$ = newTerNode(dataType::name, "name", datum($1));
}
    /* | STAR ID %prec USTAR {
    $$ = newNode(dataType::member, "member", 1, newTerNode(dataType::name, "name", datum($2)));
} */
    | BAND ID %prec UBAND {
    $$ = newNode(dataType::address, "address", 1, newTerNode(dataType::name, "name", datum($2)));
}
    | VarDec LB INTEGER RB {
    $$ = newNode(dataType::subscript, "subscript", 2, $1, newTerNode(dataType::constant, "constant", datum($3)));
}; // e.g. a[10]

FunDec : ID LP VarList RP {
    $$ = newTerNode(dataType::name, "name", datum($1));
    $$->next = $3;
}   // e.g. foo(int x, float y[10])
    | ID LP RP {
    $$ = newTerNode(dataType::name, "name", datum($1));
}; // e.g. foo()

VarList : ParamDec COMMA VarList {
    $$ = $1;
    $$->next = $3;
}
    | ParamDec {
    $$ = $1;
};

ParamDec : Specifier VarDec {
    $$ = newNode(dataType::decl_inst, "decl_inst", 2, $1, $2);
};  // e.g. int a[10]

// Statements
CompSt : LC BlockItemList RC {
    $$ = newNode(dataType::seq_tree, "seq_tree", 1, $2);
};    // compound statement, e.g. { int a; int b; ... }

BlockItemList: BlockItem BlockItemList {
    $$ = $1;
    $$->next = $2;
}
| /* empty */ { $$ = NULL; };

BlockItem: Def {
    $$ = $1;
} | Stmt {
    $$ = $1;
};

Stmt : Exp SEMI {
    $$ = $1;
} // expression
    | CompSt {
    $$ = $1;
}    // compound statement inside a compound statement
    | RETURN Exp SEMI {
    if ($2->child == NULL) {
        $$ = newNode(dataType::return_inst, "return_inst", 1, $2);
    } else {
        $$ = newNode(dataType::return_inst, "return_inst", 1, newNode(dataType::eseq_tree, "eseq_tree", 1, $2));
    }
}   // return statement
    | RETURN SEMI {
    $$ = newNode(dataType::return_inst, "return_inst", 0);
} // return;
    | IF LP Exp RP Stmt %prec LOWER_THAN_ELSE {
    if ($3->child == NULL) {
        $$ = newNode(dataType::if_inst, "if_inst", 2, $3, $5);
    } else {
        $$ = newNode(dataType::if_inst, "if_inst", 2, newNode(dataType::eseq_tree, "eseq_tree", 1, $3), $5);
    }
}   // if statement
    | IF LP Exp RP Stmt ELSE Stmt {
    if ($3->child == NULL) {
        $$ = newNode(dataType::if_inst, "if_inst", 3, $3, $5, $7);
    } else {
        $$ = newNode(dataType::if_inst, "if_inst", 3, newNode(dataType::eseq_tree, "eseq_tree", 1, $3), $5, $7);
    }
}   // if-else statement
    | WHILE LP Exp RP Stmt {
    if ($3->child == NULL) {
        $$ = newNode(dataType::while_inst, "while_inst", 2, $3, $5);
    } else {
        $$ = newNode(dataType::while_inst, "while_inst", 2, newNode(dataType::eseq_tree, "eseq_tree", 1, $3), $5);
    }
}   // while statement
    | GOTO LABEL SEMI {
    $$ = newTerNode(dataType::goto_inst, "goto_inst", datum($2));
}   // goto statement
    | LABEL COLON {
    $$ = newTerNode(dataType::label_decl, "label_decl", datum($1));
};

// Local Definitions
Def : Specifier DecList SEMI {
    $$ = newNode(dataType::decl_inst, "decl_inst", 2, $1, $2);
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
        $$ = newNode(dataType::assign, "assign", 2, $1, $3);
    } else {
        $$ = newNode(dataType::assign, "assign", 2, $1, newNode(dataType::eseq_tree, "eseq_tree", 1, $3));
    }
};

// Expressions
Exp : Exp ASSIGNOP Exp {
    AST * temp1 = $1->child == NULL ? $1 : newNode(dataType::eseq_tree, "eseq_tree", 1, $1);
    AST * temp2 = $3->child == NULL ? $3 : newNode(dataType::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(dataType::assign, "assign", 2, temp1, temp2);
}
    | Exp AND Exp {
    AST * temp1 = $1->child == NULL ? $1 : newNode(dataType::eseq_tree, "eseq_tree", 1, $1);
    AST * temp2 = $3->child == NULL ? $3 : newNode(dataType::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(dataType::and_type, "and_type", 2, temp1, temp2);
}
    | Exp OR Exp {
    AST * temp1 = $1->child == NULL ? $1 : newNode(dataType::eseq_tree, "eseq_tree", 1, $1);
    AST * temp2 = $3->child == NULL ? $3 : newNode(dataType::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(dataType::or_type, "or_type", 2, temp1, temp2);
}
    | Exp EQ Exp {
    AST * temp1 = $1->child == NULL ? $1 : newNode(dataType::eseq_tree, "eseq_tree", 1, $1);
    AST * temp2 = $3->child == NULL ? $3 : newNode(dataType::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(dataType::equal, "equal", 2, temp1, temp2);
}
    | Exp GE Exp {
    AST * temp1 = $1->child == NULL ? $1 : newNode(dataType::eseq_tree, "eseq_tree", 1, $1);
    AST * temp2 = $3->child == NULL ? $3 : newNode(dataType::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(dataType::greater_equal, "greater_equal", 2, temp1, temp2);
}
    | Exp LE Exp {
    AST * temp1 = $1->child == NULL ? $1 : newNode(dataType::eseq_tree, "eseq_tree", 1, $1);
    AST * temp2 = $3->child == NULL ? $3 : newNode(dataType::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(dataType::less_equal, "less_equal", 2, temp1, temp2);
}
    | Exp GT Exp {
    AST * temp1 = $1->child == NULL ? $1 : newNode(dataType::eseq_tree, "eseq_tree", 1, $1);
    AST * temp2 = $3->child == NULL ? $3 : newNode(dataType::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(dataType::greater, "greater", 2, temp1, temp2);
}
    | Exp LT Exp {
    AST * temp1 = $1->child == NULL ? $1 : newNode(dataType::eseq_tree, "eseq_tree", 1, $1);
    AST * temp2 = $3->child == NULL ? $3 : newNode(dataType::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(dataType::less, "less", 2, temp1, temp2);
}
    | Exp NE Exp {
    AST * temp1 = $1->child == NULL ? $1 : newNode(dataType::eseq_tree, "eseq_tree", 1, $1);
    AST * temp2 = $3->child == NULL ? $3 : newNode(dataType::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(dataType::not_equal, "not_equal", 2, temp1, temp2);
}
    | Exp PLUS Exp {
    AST * temp1 = $1->child == NULL ? $1 : newNode(dataType::eseq_tree, "eseq_tree", 1, $1);
    AST * temp2 = $3->child == NULL ? $3 : newNode(dataType::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(dataType::plus, "plus", 2, temp1, temp2);
}
    | Exp MINUS Exp {
    AST * temp1 = $1->child == NULL ? $1 : newNode(dataType::eseq_tree, "eseq_tree", 1, $1);
    AST * temp2 = $3->child == NULL ? $3 : newNode(dataType::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(dataType::minus, "minus", 2, temp1, temp2);
}
    | Exp STAR Exp {
    AST * temp1 = $1->child == NULL ? $1 : newNode(dataType::eseq_tree, "eseq_tree", 1, $1);
    AST * temp2 = $3->child == NULL ? $3 : newNode(dataType::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(dataType::multiply, "multiply", 2, temp1, temp2);
}
    | Exp DIV Exp {
    AST * temp1 = $1->child == NULL ? $1 : newNode(dataType::eseq_tree, "eseq_tree", 1, $1);
    AST * temp2 = $3->child == NULL ? $3 : newNode(dataType::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(dataType::divide, "divide", 2, temp1, temp2);
}
    | Exp MOD Exp {
    AST * temp1 = $1->child == NULL ? $1 : newNode(dataType::eseq_tree, "eseq_tree", 1, $1);
    AST * temp2 = $3->child == NULL ? $3 : newNode(dataType::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(dataType::mod, "mod", 2, temp1, temp2);
}
    | Exp BAND Exp {
    AST * temp1 = $1->child == NULL ? $1 : newNode(dataType::eseq_tree, "eseq_tree", 1, $1);
    AST * temp2 = $3->child == NULL ? $3 : newNode(dataType::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(dataType::band, "band", 2, temp1, temp2);
}
    | Exp BOR Exp {
    AST * temp1 = $1->child == NULL ? $1 : newNode(dataType::eseq_tree, "eseq_tree", 1, $1);
    AST * temp2 = $3->child == NULL ? $3 : newNode(dataType::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(dataType::bor, "bor", 2, temp1, temp2);
}
    | Exp BXOR Exp {
    AST * temp1 = $1->child == NULL ? $1 : newNode(dataType::eseq_tree, "eseq_tree", 1, $1);
    AST * temp2 = $3->child == NULL ? $3 : newNode(dataType::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(dataType::bxor, "bxor", 2, temp1, temp2);
}
    | LP Exp RP {
    $$ = $2;
}
    | MINUS Exp %prec UMINUS {
    if ($2->child == NULL) {
        $$ = newNode(dataType::uminus, "uminus", 1, $2);
    } else {
        $$ = newNode(dataType::uminus, "uminus", 1, newNode(dataType::eseq_tree, "eseq_tree", 1, $2));
    }
}
    | NOT Exp {
    if ($2->child == NULL) {
        $$ = newNode(dataType::not_type, "not_type", 1, $2);
    } else {
        $$ = newNode(dataType::not_type, "not_type", 1, newNode(dataType::eseq_tree, "eseq_tree", 1, $2));
    }
}
    | BAND Exp %prec UBAND {
    if ($2->child == NULL) {
        $$ = newNode(dataType::address, "address", 1, $2);
    } else {
        $$ = newNode(dataType::address, "address", 1, newNode(dataType::eseq_tree, "eseq_tree", 1, $2));
    }
}
    | STAR Exp %prec USTAR {
    if ($2->child == NULL) {
        $$ = newNode(dataType::member, "member", 1, $2);
    } else {
        $$ = newNode(dataType::member, "member", 1, newNode(dataType::eseq_tree, "eseq_tree", 1, $2));
    }
}
    | ID LP Args RP {
    $$ = newNode(dataType::call_inst, "call_inst", 2, newTerNode(dataType::name, "name", datum($1)), $3);
}
    | ID LP RP {
    $$ = newNode(dataType::call_inst, "call_inst", 1, newTerNode(dataType::name, "name", datum($1)));
}
    | Exp LB Exp RB {
    AST * temp1 = $1->child == NULL ? $1 : newNode(dataType::eseq_tree, "eseq_tree", 1, $1);
    AST * temp2 = $3->child == NULL ? $3 : newNode(dataType::eseq_tree, "eseq_tree", 1, $3);
    $$ = newNode(dataType::subscript, "subscript", 2, temp1, temp2);
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
    $$ = $1;
    $$->next = $3;
}
    | Exp {
    $$ = $1;
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