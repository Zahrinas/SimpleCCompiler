%{
   #include<string.h>

   int statue;
   char name[20];
   
   int val_int=0;
   double val_double=0;
%}

ALPHA [a-zA-Z]
VAR   {ALPHA}+[a-zA-Z0-9_]*
KEY   int|double
DIGIT [0-9]
VALUE [1-9]+{DIGIT}*|{DIGIT}+\.{DIGIT}+

%%
{KEY}   { 
			if (yytext[0]=='i') 
				statue=1; 
			else 
				statue=2;
		}
{VAR}   strcpy(name,yytext);
{VALUE} {
			if (statue==1)
				sscanf(yytext,"%d",&val_int);
			else if (statue==2)
				sscanf(yytext,"%lf",&val_double);
		}
;		{
			if (statue==1)
				printf("<%s,int,%d>",name,val_int);
			else if (statue==2)
				printf("<%s,double,%lf>",name,val_double);
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
