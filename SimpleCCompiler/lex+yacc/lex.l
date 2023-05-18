%{
    #include <string.h>
    #include "y.tab.h"

    char name[20];
    int val_int = 0;
    double val_double = 0;
%}

ALPHA [a-zA-Z]
VAR   {ALPHA}+[a-zA-Z0-9_]*
KEY   int|double|char|void
Return return 
IF    if
ELSE  else
WHILE while
DIGIT [0-9]
IVALUE [0-9]+{DIGIT}*
DVALUE {DIGIT}+\.{DIGIT}+
String \"[^"]*\"
left_paren \(
right_paren \)
left_brace \{
right_brace \}
left_square \[
right_square \]
Include #include\<[^"]*\>
Plus  \+
Sub   \-
Mul   \*
Div   \/
Mod   \%
EQ    \==
Assign \=
GT    \>
LT    \<
LE    \<\=
GE    \>\=
NE    \!\=
AND   \&\&
BAND  \&
BNOR  \^
BOR   \|
OR    \|\|
NOT   \!
comma \,
semicolon \;

%%
{KEY}   { 
			if (yytext[0]=='i') {
                printf("int ");
                return INT;
            }
			if (yytext[0]== 'd') {
                printf("double ");
                return DOUBLE;
            }
			if (yytext[0]== 'c') {
                printf("char ");
                return CHAR;
            }
			if (yytext[0]== 'v') {
                printf("void ");
            }
		}

{left_paren}	{
			printf("left_paren ");
            return LP;
		}

{right_paren}	{
			printf("right_paren ");
            return RP;
		}

{left_brace}	{
			printf("left_brace ");
            return LC;
		}

{right_brace}	{
			printf("right_brace ");
            return RC;
		}
{left_square}	{
			printf("left_square ");
            return LB;
		}
{right_square}	{
			printf("right_square ");
            return RB;
		}
{comma}	{
			printf("comma ");
            return COMMA;
		}
{semicolon}	{
			printf("semicolon ");
            return SEMI;
		}
{Return}   {
			printf("return ");
            return RETURN;
		}
{IF}   {
			printf("if ");
            return IF;
		}
{ELSE}   {
			printf("else ");
            return ELSE;
		}
{WHILE}   {
			printf("while ");
            return WHILE;
		}
{Plus}   {
			printf("plus ");
            return PLUS;
		}

{Sub}   {
			printf("sub ");
            return MINUS;
		}
{Mul}   {
			printf("mul ");
            return STAR;
		}
{Div}   {
			printf("div ");
            return DIV;
		}
{Mod}   {
            printf("mod ");
            return MOD;
        }
{EQ}   {
			printf("eq ");
            return EQ;
		}
{Assign}   {
            printf("assign ");
            return ASSIGNOP;
        }
{GT}   {
			printf("gt ");
            return GT;
		}
{LT}   {
			printf("lt ");
            return LT;
		}
{LE}   {
            printf("le ");
            return LE;
        }
{GE}   {
            printf("ge ");
            return GE;
        }
{NE}   {
            printf("ne ");
            return NE;
        }
{AND}   {
			printf("AND ");
            return AND;
		}
{BAND}   {
            printf("ADD_AND ");
            return BAND;
        }
{BNOR}   {
            printf("BNOR ");
            return BNOR;
        }
{BOR}   {
            printf("BOR ");
            return BOR;
        }
{OR}   {
			printf("OR ");
            return OR;
		}
{NOT}   {
            printf("NOT ");
            return NOT;
        }
{VAR}   {
			strcpy(name, yytext);
			printf("name(%s) ",name);
            yylval.strval = name;
            return ID;
		}
{IVALUE} {
			sscanf(yytext, "%d", &val_int);
			printf("const(%d) ", val_int);
            yylval.intval = val_int;
            return INTEGER;
		}
{DVALUE} {
			sscanf(yytext, "%lf", &val_double);
			printf("const(%lf) ", val_double);
            yylval.doubleval = val_double;
            return REAL;
		}
{String} {
	        strcpy(name, yytext);
			printf("string(%s) ", name);
            yylval.strval = name;
            return STRING;
		}
{Include} {

		}
\n		printf("\n");
.

%%

/* int main(int argc, char **argv) {
  if (argc > 1) {
    FILE *file;
	file = fopen(argv[1], "r");
	if(file)
	  yyin = file;
  }
  if (argc > 2) {
	FILE *file;
	file = fopen(argv[2], "w");
	if(file) {
	  yyout = file;
	  freopen(argv[2], "w", stdout);
	 }
  }
  
  yylex();
  yywrap();
} */

int yywrap() {
	return 1;
}
