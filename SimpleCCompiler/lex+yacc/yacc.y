%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "AST.h"
    int yylex(void);
    void yyerror(char *);
%}

%union {
    int intval;
    double doubleval;
    char *strval;
}
// Tokens
%token <intval> INTEGER
%token <doubleval> REAL
%token <strval> STRING
%token <strval> ID
%token SEMI COMMA ASSIGNOP
%token EQ GE LE GT LT NE
%token PLUS MINUS STAR DIV ADD_AND
%token AND OR NOT
%token INT DOUBLE CHAR
%token LP RP LB RB LC RC
%token RETURN IF ELSE WHILE

// non-terminals
%type <> Program ExtDefList ExtDef ExtDecList   // High-level Definitions
%type <> Specifier                              // Specifiers
%type <> VarDec FunDec VarList ParamDec         // Declarators
%type <> CompSt StmtList Stmt                   // Statements
%type <> DefList Def Dec DecList                // Local Definitions
%type <> Exp Args                               // Expressions

%start Program

// precedence and associativity
%right ASSIGNOP
%left OR
%left AND
%left EQ GE LE GT LT NE
%left PLUS MINUS
%left STAR DIV
%right NOT
%left LB RB
%left LP RP
%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE

%%
// High-level Definitions
Program : ExtDefList;   // program is a list of external definitions

ExtDefList : ExtDef ExtDefList
    | /* empty */;

ExtDef : Specifier ExtDecList SEMI  // global variable declaration, e.g. int a, b, c;
    | Specifier SEMI    // global variable declaration, e.g. int;
    | Specifier FunDec CompSt;  // function definition, e.g. int main() { ... }

ExtDecList : VarDec // variable definition, e.g. a[10][2]
    | VarDec COMMA ExtDecList; // e.g. a, b, c

// Specifiers
Specifier : INT
    | DOUBLE
    | CHAR;

// Declarators
VarDec : ID 
    | VarDec LB INTEGER RB; // e.g. a[10]

FunDec : ID LP VarList RP   // e.g. foo(int x, float y[10])
    | ID LP RP; // e.g. foo()

VarList : ParamDec COMMA VarList
    | ParamDec;

ParamDec : Specifier VarDec;

// Statements
CompSt : LC DefList StmtList RC;    // compound statement, e.g. { int a; int b; ... }

StmtList : Stmt StmtList
    | /* empty */;

Stmt : Exp SEMI // expression
    | CompSt    // compound statement inside a compound statement
    | RETURN Exp SEMI   // return statement
    | RETURN SEMI // return;
    | IF LP Exp RP Stmt %prec LOWER_THAN_ELSE   // if statement
    | IF LP Exp RP Stmt ELSE Stmt   // if-else statement
    | WHILE LP Exp RP Stmt; // while statement

// Local Definitions
DefList : Def DefList   // list of local definitions, e.g. int a; double b, c;
    | /* empty */;

Def : Specifier DecList SEMI;

DecList : Dec
    | Dec COMMA DecList;

Dec : VarDec
    | VarDec ASSIGNOP Exp;

// Expressions
Exp : Exp ASSIGNOP Exp
    | Exp AND Exp
    | Exp OR Exp
    | Exp EQ Exp
    | Exp GE Exp
    | Exp LE Exp
    | Exp GT Exp
    | Exp LT Exp
    | Exp NE Exp
    | Exp PLUS Exp
    | Exp MINUS Exp
    | Exp STAR Exp
    | Exp DIV Exp
    | LP Exp RP
    | MINUS Exp
    | NOT Exp
    | ADD_AND Exp
    | ID LP Args RP
    | ID LP RP
    | Exp LB Exp RB
    | ID
    | INTEGER
    | REAL
    | STRING;

Args : Exp COMMA Args
    | Exp