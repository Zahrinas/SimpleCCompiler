%{
    #include <string.h>
    #include <malloc.h>
    //#include "y.tab.h"
    //char* name = (char *)malloc(sizeof(20));//这个不行，C的全局变量只支持常量赋值
    //char* name =  "111111111111111111111111111111111";//这个也不行，可能是因为name指向常量区
    //char* name;//这个显然不行，空间没有分配
    char name[20];//目前就这个能跑
    int val_int = 0;
    double val_double = 0;
    int Thelen = 0;
    //如果要是识别label可以复制： LABEL  label+[a-zA-Z0-9_]*
    //{LABEL}   {
			//strcpy(name, yytext);
			//printf("label(%s) ",name);
		//}
%}

ALPHA [a-zA-Z]
VAR   {ALPHA}+[a-zA-Z0-9_]*
KEY   int|double|char|void|int\*|double\*|char\*|void\*|goto
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
            strcpy(name, yytext);
            Thelen = strlen(name);
			if (yytext[0]=='i') {
                if(Thelen == 3){
                    printf("int ");
                    //return INT;
                }
                if(Thelen == 4){
                    printf("intP ");
                    //return INTP;
                }
            }
			if (yytext[0]== 'd') {
                if(Thelen == 6){
                    printf("double ");
                    //return DOUBLE;
                }
                if(Thelen == 7){
                    printf("doubleP ");
                    //return DOUBLEP;
                }
            }
			if (yytext[0]== 'c') {
                if(Thelen == 4){
                    printf("char ");
                    //return CHAR;
                }
                if(Thelen == 5){
                    printf("charP ");
                    //return CHARP;
                }
                
            }
			if (yytext[0]== 'v') {
                if(Thelen == 4){
                    printf("void ");
                }
                if(Thelen == 5){
                    printf("voidP ");
                }
            }
       if (yytext[0]== 'g') {
                printf("goto ");
            }
		}




{left_paren}	{
			printf("left_paren ");
            //return LP;
		}

{right_paren}	{
			printf("right_paren ");
            //return RP;
		}

{left_brace}	{
			printf("left_brace ");
            //return LC;
		}

{right_brace}	{
			printf("right_brace ");
            //return RC;
		}
{left_square}	{
			printf("left_square ");
            //return LB;
		}
{right_square}	{
			printf("right_square ");
            //return RB;
		}
{comma}	{
			printf("comma ");
            //return COMMA;
		}
{semicolon}	{
			printf("semicolon ");
            //return SEMI;
		}
{Return}   {
			printf("return ");
            //return RETURN;
		}
{IF}   {
			printf("if ");
            //return IF;
		}
{ELSE}   {
			printf("else ");
            //return ELSE;
		}
{WHILE}   {
			printf("while ");
            //return WHILE;
		}
{Plus}   {
			printf("plus ");
            //return PLUS;
		}

{Sub}   {
			printf("sub ");
            //return MINUS;
		}
{Mul}   {
			printf("mul ");
            //return STAR;
		}
{Div}   {
			printf("div ");
            //return DIV;
		}
{Mod}   {
            printf("mod ");
            //return MOD;
        }
{EQ}   {
			printf("eq ");
            //return EQ;
		}
{Assign}   {
            printf("assign ");
            //return ASSIGNOP;
        }
{GT}   {
			printf("gt ");
            //return GT;
		}
{LT}   {
			printf("lt ");
            //return LT;
		}
{LE}   {
            printf("le ");
            //return LE;
        }
{GE}   {
            printf("ge ");
            //return GE;
        }
{NE}   {
            printf("ne ");
            //return NE;
        }
{AND}   {
			printf("AND ");
            //return AND;
		}
{BAND}   {
            printf("ADD_AND ");
            //return BAND;
        }
{BNOR}   {
            printf("BNOR ");
            //return BNOR;
        }
{BOR}   {
            printf("BOR ");
            //return BOR;
        }
{OR}   {
			printf("OR ");
            //return OR;
		}
{NOT}   {
            printf("NOT ");
            //return NOT;
        }
{VAR}   {
			strcpy(name, yytext);
			printf("name(%s) ",name);
            //yylval.strval = name;
            //return ID;
		}
{IVALUE} {
			sscanf(yytext, "%d", &val_int);
			printf("const(%d) ", val_int);
            //yylval.intval = val_int;
            //return INTEGER;
		}
{DVALUE} {
			sscanf(yytext, "%lf", &val_double);
			printf("const(%lf) ", val_double);
            //yylval.doubleval = val_double;
            //return REAL;
		}
{String} {
	        strcpy(name, yytext);
			printf("string(%s) ", name);
            //yylval.strval = name;
            //return STRING;
		}
{Include} {

		}
\n		printf("\n");
.

%%

 int main(int argc, char **argv) {
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
} 

int yywrap() {
	return 1;
}
