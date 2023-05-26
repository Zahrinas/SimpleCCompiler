/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

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

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_YACC_TAB_H_INCLUDED
# define YY_YY_YACC_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    INTEGER = 258,
    REAL = 259,
    STRING = 260,
    ID = 261,
    LABEL = 262,
    SEMI = 263,
    COMMA = 264,
    ASSIGNOP = 265,
    COLON = 266,
    EQ = 267,
    GE = 268,
    LE = 269,
    GT = 270,
    LT = 271,
    NE = 272,
    PLUS = 273,
    MINUS = 274,
    STAR = 275,
    DIV = 276,
    BAND = 277,
    BXOR = 278,
    BOR = 279,
    MOD = 280,
    AND = 281,
    OR = 282,
    NOT = 283,
    INT = 284,
    DOUBLE = 285,
    CHAR = 286,
    VOID = 287,
    GOTO = 288,
    LP = 289,
    RP = 290,
    LB = 291,
    RB = 292,
    LC = 293,
    RC = 294,
    RETURN = 295,
    IF = 296,
    ELSE = 297,
    WHILE = 298,
    UMINUS = 299,
    USTAR = 300,
    UBAND = 301,
    LOWER_THAN_ELSE = 302
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 15 "yacc.y"

    int intval;
    double doubleval;
    char *strval;
    char *idval;
    char *labelval;
    struct node * ast;

#line 114 "yacc.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_YACC_TAB_H_INCLUDED  */
