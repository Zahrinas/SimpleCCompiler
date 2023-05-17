%{
   #include<string.h>

   int statue;
   char name[20];
   
   int val_int=0;
   double val_double=0;
%}

ALPHA [a-zA-Z]
VAR   {ALPHA}+[a-zA-Z0-9_]*
KEY   int|double|char
DIGIT [0-9]
IVALUE [0-9]+{DIGIT}*
DVALUE {DIGIT}+\.{DIGIT}+
String \"[^"]*\"
left_paren \(
right_paren \)
left_brace \{
right_brace \}
Plus  \+
Sub   \-
Mui   \*
Dvi   \/
comma \,
semicolon \;
Return return 

%%
{KEY}   { 
			if (yytext[0]=='i') 
				printf("int ");
			if (yytext[0]== 'd')
				printf("double ");
			if (yytext[0]== 'c')
				printf("char ");
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
{comma}	{
			printf("comma ");
		}
{semicolon}	{
			printf("semicolon ");
		}
{Return}   {
			printf("return ");
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
