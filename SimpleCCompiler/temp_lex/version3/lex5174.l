%{
   #include<string.h>

   int statue;
   char name[20];
   
   int val_int=0;
   double val_double=0;
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
Mui   \*
Dvi   \/
EQU   \=
BIG   \>
SMALL \<
AND   \&
OR    \|
comma \,
semicolon \;

%%
{KEY}   { 
			if (yytext[0]=='i') 
				printf("int ");
			if (yytext[0]== 'd')
				printf("double ");
			if (yytext[0]== 'c')
				printf("char ");
			if (yytext[0]== 'v')
				printf("void ");
		}

{left_paren}	{
			printf("left_paren ");
		}

{right_paren}	{
			printf("right_paren ");
		}

{left_brace}	{
			printf("left_brace ");
		}

{right_brace}	{
			printf("right_brace ");
		}
{left_square}	{
			printf("left_square ");
		}
{right_square}	{
			printf("right_square ");
		}
{comma}	{
			printf("comma ");
		}
{semicolon}	{
			printf("semicolon ");
		}
{Return}   {
			printf("return ");
		}
{IF}   {
			printf("if ");
		}
{ELSE}   {
			printf("else ");
		}
{WHILE}   {
			printf("while ");
		}
{Plus}   {
			printf("plus ");
		}

{Sub}   {
			printf("sub ");
		}
{Mui}   {
			printf("mui ");
		}
{Dvi}   {
			printf("dvi ");
		}
{EQU}   {
			printf("equ ");
		}
{BIG}   {
			printf("big ");
		}
{SMALL}   {
			printf("small ");
		}
{AND}   {
			printf("AND ");
		}
{OR}   {
			printf("OR ");
		}	
{VAR}   {
			strcpy(name,yytext);
			printf("name(%s) ",name);
		}
{IVALUE} {
			sscanf(yytext,"%d",&val_int);
			printf("const(%d) ",val_int);
		}

{DVALUE} {
			sscanf(yytext,"%lf",&val_double);
			printf("const(%lf) ",val_double);
		}
{String} {
	        strcpy(name,yytext);
			printf("string(%s) ", name);
		}
{Include} {

		}
\n		printf("\n");
.

%%

int main(int argc, char **argv)
{
  if (argc>1)
  {
    FILE *file;
	file=fopen(argv[1],"r");
	if(file)
	  yyin=file;
  }
  if (argc>2)
  {
	FILE *file;
	file=fopen(argv[2],"w");
	if(file)
	{
	  yyout=file;
	  freopen(argv[2],"w",stdout);
	 }
  }
  
  yylex();
  yywrap();
}

int yywrap()
{
	return 1;
}
