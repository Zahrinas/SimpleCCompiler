
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     INTEGER = 258,
     REAL = 259,
     STRING = 260,
     ID = 261,
     SEMI = 262,
     COMMA = 263,
     ASSIGNOP = 264,
     EQ = 265,
     GE = 266,
     LE = 267,
     GT = 268,
     LT = 269,
     NE = 270,
     PLUS = 271,
     MINUS = 272,
     STAR = 273,
     DIV = 274,
     BAND = 275,
     AND = 276,
     OR = 277,
     NOT = 278,
     INT = 279,
     DOUBLE = 280,
     CHAR = 281,
     LP = 282,
     RP = 283,
     LB = 284,
     RB = 285,
     LC = 286,
     RC = 287,
     RETURN = 288,
     IF = 289,
     ELSE = 290,
     WHILE = 291,
     BOR = 292,
     BNOR = 293,
     MOD = 294,
     UBAND = 295,
     USTAR = 296,
     UMINUS = 297,
     LOWER_THAN_ELSE = 298
   };
#endif
/* Tokens.  */
#define INTEGER 258
#define REAL 259
#define STRING 260
#define ID 261
#define SEMI 262
#define COMMA 263
#define ASSIGNOP 264
#define EQ 265
#define GE 266
#define LE 267
#define GT 268
#define LT 269
#define NE 270
#define PLUS 271
#define MINUS 272
#define STAR 273
#define DIV 274
#define BAND 275
#define AND 276
#define OR 277
#define NOT 278
#define INT 279
#define DOUBLE 280
#define CHAR 281
#define LP 282
#define RP 283
#define LB 284
#define RB 285
#define LC 286
#define RC 287
#define RETURN 288
#define IF 289
#define ELSE 290
#define WHILE 291
#define BOR 292
#define BNOR 293
#define MOD 294
#define UBAND 295
#define USTAR 296
#define UMINUS 297
#define LOWER_THAN_ELSE 298




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 10 "yacc.y"

    int intval;
    double doubleval;
    char *strval;



/* Line 1676 of yacc.c  */
#line 146 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


