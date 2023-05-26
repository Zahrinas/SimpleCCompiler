/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
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
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "yacc.y"

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

#line 86 "y.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif


/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    INTEGER = 258,                 /* INTEGER  */
    REAL = 259,                    /* REAL  */
    STRING = 260,                  /* STRING  */
    ID = 261,                      /* ID  */
    LABEL = 262,                   /* LABEL  */
    SEMI = 263,                    /* SEMI  */
    COMMA = 264,                   /* COMMA  */
    ASSIGNOP = 265,                /* ASSIGNOP  */
    COLON = 266,                   /* COLON  */
    EQ = 267,                      /* EQ  */
    GE = 268,                      /* GE  */
    LE = 269,                      /* LE  */
    GT = 270,                      /* GT  */
    LT = 271,                      /* LT  */
    NE = 272,                      /* NE  */
    PLUS = 273,                    /* PLUS  */
    MINUS = 274,                   /* MINUS  */
    STAR = 275,                    /* STAR  */
    DIV = 276,                     /* DIV  */
    BAND = 277,                    /* BAND  */
    BXOR = 278,                    /* BXOR  */
    BOR = 279,                     /* BOR  */
    MOD = 280,                     /* MOD  */
    AND = 281,                     /* AND  */
    OR = 282,                      /* OR  */
    NOT = 283,                     /* NOT  */
    INT = 284,                     /* INT  */
    DOUBLE = 285,                  /* DOUBLE  */
    CHAR = 286,                    /* CHAR  */
    VOID = 287,                    /* VOID  */
    GOTO = 288,                    /* GOTO  */
    LP = 289,                      /* LP  */
    RP = 290,                      /* RP  */
    LB = 291,                      /* LB  */
    RB = 292,                      /* RB  */
    LC = 293,                      /* LC  */
    RC = 294,                      /* RC  */
    RETURN = 295,                  /* RETURN  */
    IF = 296,                      /* IF  */
    ELSE = 297,                    /* ELSE  */
    WHILE = 298,                   /* WHILE  */
    UMINUS = 299,                  /* UMINUS  */
    USTAR = 300,                   /* USTAR  */
    UBAND = 301,                   /* UBAND  */
    LOWER_THAN_ELSE = 302          /* LOWER_THAN_ELSE  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define INTEGER 258
#define REAL 259
#define STRING 260
#define ID 261
#define LABEL 262
#define SEMI 263
#define COMMA 264
#define ASSIGNOP 265
#define COLON 266
#define EQ 267
#define GE 268
#define LE 269
#define GT 270
#define LT 271
#define NE 272
#define PLUS 273
#define MINUS 274
#define STAR 275
#define DIV 276
#define BAND 277
#define BXOR 278
#define BOR 279
#define MOD 280
#define AND 281
#define OR 282
#define NOT 283
#define INT 284
#define DOUBLE 285
#define CHAR 286
#define VOID 287
#define GOTO 288
#define LP 289
#define RP 290
#define LB 291
#define RB 292
#define LC 293
#define RC 294
#define RETURN 295
#define IF 296
#define ELSE 297
#define WHILE 298
#define UMINUS 299
#define USTAR 300
#define UBAND 301
#define LOWER_THAN_ELSE 302

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 16 "yacc.y"

    int intval;
    double doubleval;
    char *strval;
    char *idval;
    char *labelval;
    AST * ast;

#line 239 "y.tab.c"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);



/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_INTEGER = 3,                    /* INTEGER  */
  YYSYMBOL_REAL = 4,                       /* REAL  */
  YYSYMBOL_STRING = 5,                     /* STRING  */
  YYSYMBOL_ID = 6,                         /* ID  */
  YYSYMBOL_LABEL = 7,                      /* LABEL  */
  YYSYMBOL_SEMI = 8,                       /* SEMI  */
  YYSYMBOL_COMMA = 9,                      /* COMMA  */
  YYSYMBOL_ASSIGNOP = 10,                  /* ASSIGNOP  */
  YYSYMBOL_COLON = 11,                     /* COLON  */
  YYSYMBOL_EQ = 12,                        /* EQ  */
  YYSYMBOL_GE = 13,                        /* GE  */
  YYSYMBOL_LE = 14,                        /* LE  */
  YYSYMBOL_GT = 15,                        /* GT  */
  YYSYMBOL_LT = 16,                        /* LT  */
  YYSYMBOL_NE = 17,                        /* NE  */
  YYSYMBOL_PLUS = 18,                      /* PLUS  */
  YYSYMBOL_MINUS = 19,                     /* MINUS  */
  YYSYMBOL_STAR = 20,                      /* STAR  */
  YYSYMBOL_DIV = 21,                       /* DIV  */
  YYSYMBOL_BAND = 22,                      /* BAND  */
  YYSYMBOL_BXOR = 23,                      /* BXOR  */
  YYSYMBOL_BOR = 24,                       /* BOR  */
  YYSYMBOL_MOD = 25,                       /* MOD  */
  YYSYMBOL_AND = 26,                       /* AND  */
  YYSYMBOL_OR = 27,                        /* OR  */
  YYSYMBOL_NOT = 28,                       /* NOT  */
  YYSYMBOL_INT = 29,                       /* INT  */
  YYSYMBOL_DOUBLE = 30,                    /* DOUBLE  */
  YYSYMBOL_CHAR = 31,                      /* CHAR  */
  YYSYMBOL_VOID = 32,                      /* VOID  */
  YYSYMBOL_GOTO = 33,                      /* GOTO  */
  YYSYMBOL_LP = 34,                        /* LP  */
  YYSYMBOL_RP = 35,                        /* RP  */
  YYSYMBOL_LB = 36,                        /* LB  */
  YYSYMBOL_RB = 37,                        /* RB  */
  YYSYMBOL_LC = 38,                        /* LC  */
  YYSYMBOL_RC = 39,                        /* RC  */
  YYSYMBOL_RETURN = 40,                    /* RETURN  */
  YYSYMBOL_IF = 41,                        /* IF  */
  YYSYMBOL_ELSE = 42,                      /* ELSE  */
  YYSYMBOL_WHILE = 43,                     /* WHILE  */
  YYSYMBOL_UMINUS = 44,                    /* UMINUS  */
  YYSYMBOL_USTAR = 45,                     /* USTAR  */
  YYSYMBOL_UBAND = 46,                     /* UBAND  */
  YYSYMBOL_LOWER_THAN_ELSE = 47,           /* LOWER_THAN_ELSE  */
  YYSYMBOL_YYACCEPT = 48,                  /* $accept  */
  YYSYMBOL_Program = 49,                   /* Program  */
  YYSYMBOL_ExtDefList = 50,                /* ExtDefList  */
  YYSYMBOL_ExtDef = 51,                    /* ExtDef  */
  YYSYMBOL_ExtDecList = 52,                /* ExtDecList  */
  YYSYMBOL_ExtDec = 53,                    /* ExtDec  */
  YYSYMBOL_Specifier = 54,                 /* Specifier  */
  YYSYMBOL_VarDec = 55,                    /* VarDec  */
  YYSYMBOL_FunDec = 56,                    /* FunDec  */
  YYSYMBOL_VarList = 57,                   /* VarList  */
  YYSYMBOL_ParamDec = 58,                  /* ParamDec  */
  YYSYMBOL_CompSt = 59,                    /* CompSt  */
  YYSYMBOL_BlockItemList = 60,             /* BlockItemList  */
  YYSYMBOL_BlockItem = 61,                 /* BlockItem  */
  YYSYMBOL_Stmt = 62,                      /* Stmt  */
  YYSYMBOL_Def = 63,                       /* Def  */
  YYSYMBOL_DecList = 64,                   /* DecList  */
  YYSYMBOL_Dec = 65,                       /* Dec  */
  YYSYMBOL_Exp = 66,                       /* Exp  */
  YYSYMBOL_Args = 67                       /* Args  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  9
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   511

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  48
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  20
/* YYNRULES -- Number of rules.  */
#define YYNRULES  74
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  139

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   302


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    68,    68,    73,    77,    79,    82,    85,    90,    93,
      98,   101,   106,   109,   112,   115,   120,   123,   126,   129,
     133,   137,   141,   145,   149,   154,   163,   167,   169,   171,
     175,   178,   181,   188,   191,   198,   205,   212,   215,   220,
     224,   227,   232,   235,   244,   249,   254,   259,   264,   269,
     274,   279,   284,   289,   294,   299,   304,   309,   314,   319,
     324,   329,   332,   339,   346,   353,   360,   363,   366,   371,
     374,   377,   380,   384,   388
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "INTEGER", "REAL",
  "STRING", "ID", "LABEL", "SEMI", "COMMA", "ASSIGNOP", "COLON", "EQ",
  "GE", "LE", "GT", "LT", "NE", "PLUS", "MINUS", "STAR", "DIV", "BAND",
  "BXOR", "BOR", "MOD", "AND", "OR", "NOT", "INT", "DOUBLE", "CHAR",
  "VOID", "GOTO", "LP", "RP", "LB", "RB", "LC", "RC", "RETURN", "IF",
  "ELSE", "WHILE", "UMINUS", "USTAR", "UBAND", "LOWER_THAN_ELSE",
  "$accept", "Program", "ExtDefList", "ExtDef", "ExtDecList", "ExtDec",
  "Specifier", "VarDec", "FunDec", "VarList", "ParamDec", "CompSt",
  "BlockItemList", "BlockItem", "Stmt", "Def", "DecList", "Dec", "Exp",
  "Args", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-127)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-1)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
      61,  -127,  -127,  -127,  -127,    10,  -127,    61,    13,  -127,
    -127,   -22,  -127,    14,    25,    24,    28,    -8,     0,   112,
    -127,  -127,  -127,    54,   166,    36,    77,  -127,  -127,    54,
      27,    31,  -127,  -127,  -127,  -127,  -127,    29,   166,   166,
     166,   166,   166,   373,    32,    53,    68,   159,    34,    43,
      54,  -127,    39,    77,  -127,  -127,   189,    49,  -127,    61,
      67,    52,    52,    52,    52,   292,   166,   166,   166,   166,
     166,   166,   166,   166,   166,   166,   166,   166,   166,   166,
     166,   166,   166,   166,  -127,  -127,    71,  -127,   214,   166,
     166,    -7,    86,    95,  -127,  -127,  -127,  -127,  -127,   239,
      78,  -127,   373,   475,   -12,   -12,   -12,   -12,   475,     5,
       5,    52,    52,   462,   114,   448,    52,   423,   398,   264,
    -127,  -127,   319,   346,   166,  -127,    54,   166,  -127,  -127,
     118,   118,   373,  -127,  -127,    70,  -127,   118,  -127
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       4,    12,    13,    14,    15,     0,     2,     4,     0,     1,
       3,    16,     6,     0,     0,     0,     8,    10,     0,     0,
      17,    18,     5,     0,     0,     0,    27,     7,    21,     0,
       0,    23,    16,     9,    70,    71,    72,    69,     0,     0,
       0,     0,     0,    11,     0,     0,     0,     0,     0,     0,
       0,    31,     0,    27,    29,    28,     0,    24,    20,     0,
       0,    62,    65,    64,    63,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    19,    38,     0,    33,     0,     0,
       0,    42,     0,    40,    25,    26,    30,    22,    67,    74,
       0,    61,    44,    47,    48,    49,    50,    51,    52,    53,
      54,    55,    56,    58,    60,    59,    57,    45,    46,     0,
      37,    32,     0,     0,     0,    39,     0,     0,    66,    68,
       0,     0,    43,    41,    73,    34,    36,     0,    35
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
    -127,  -127,   107,  -127,    93,  -127,     8,   -28,  -127,    60,
    -127,   127,    96,  -127,  -126,  -127,    22,  -127,   -24,    26
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
       0,     5,     6,     7,    15,    16,     8,    17,    18,    30,
      31,    51,    52,    53,    54,    55,    92,    93,    56,   100
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_uint8 yytable[] =
{
      43,    57,    24,   124,   135,   136,    73,    74,    75,    76,
       9,   138,    19,    80,    61,    62,    63,    64,    65,    11,
      20,    12,    91,    88,    83,    75,    76,    29,    25,    25,
      80,    21,    22,    13,    50,    14,    99,    23,    26,    44,
      59,    83,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
      32,    50,    58,    60,    85,   122,   123,    29,    89,    84,
      34,    35,    36,    37,    13,    86,    14,    90,    94,   120,
      34,    35,    36,    37,    45,    25,    38,    39,    83,    40,
       1,     2,     3,     4,   125,    41,    38,    39,    91,    40,
     132,    42,    98,    99,   126,    41,     1,     2,     3,     4,
      46,    42,   137,   128,    10,    26,    33,    47,    48,    97,
      49,    34,    35,    36,    37,    45,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    38,    39,    80,
      40,     1,     2,     3,     4,    27,    41,    28,   133,    95,
      83,    46,    42,   134,     0,     0,    26,     0,    47,    48,
       0,    49,    34,    35,    36,    37,     0,    87,     0,    34,
      35,    36,    37,     0,     0,     0,     0,     0,    38,    39,
       0,    40,     0,     0,     0,    38,    39,    41,    40,     0,
       0,     0,     0,    42,    41,     0,     0,    96,     0,    66,
      42,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,     0,     0,     0,
       0,     0,   121,     0,    66,    83,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    79,    80,
      81,    82,     0,     0,     0,     0,     0,     0,   127,    66,
      83,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,     0,     0,     0,
       0,     0,     0,     0,    66,    83,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    79,    80,
      81,    82,     0,     0,     0,     0,     0,     0,     0,     0,
      83,   129,    66,     0,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,    78,    79,    80,    81,    82,
       0,     0,     0,     0,     0,     0,     0,   101,    83,    66,
       0,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,     0,     0,     0,
       0,     0,     0,     0,   130,    83,    66,     0,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,     0,     0,     0,     0,     0,     0,
       0,   131,    83,    66,     0,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    79,    80,    81,
      82,     0,     0,     0,     0,     0,     0,     0,     0,    83,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,    80,    81,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    83,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    79,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    83,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,     0,    80,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    83,     0,     0,    80,    68,    69,
      70,    71,     0,    73,    74,    75,    76,     0,    83,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    83
};

static const yytype_int16 yycheck[] =
{
      24,    29,    10,    10,   130,   131,    18,    19,    20,    21,
       0,   137,    34,    25,    38,    39,    40,    41,    42,     6,
       6,     8,    50,    47,    36,    20,    21,    19,    36,    36,
      25,     6,     8,    20,    26,    22,    60,     9,    38,     3,
       9,    36,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,    83,
       6,    53,    35,    34,    11,    89,    90,    59,    34,    37,
       3,     4,     5,     6,    20,     7,    22,    34,    39,     8,
       3,     4,     5,     6,     7,    36,    19,    20,    36,    22,
      29,    30,    31,    32,     8,    28,    19,    20,   126,    22,
     124,    34,    35,   127,     9,    28,    29,    30,    31,    32,
      33,    34,    42,    35,     7,    38,    23,    40,    41,    59,
      43,     3,     4,     5,     6,     7,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    19,    20,    25,
      22,    29,    30,    31,    32,    18,    28,    35,   126,    53,
      36,    33,    34,   127,    -1,    -1,    38,    -1,    40,    41,
      -1,    43,     3,     4,     5,     6,    -1,     8,    -1,     3,
       4,     5,     6,    -1,    -1,    -1,    -1,    -1,    19,    20,
      -1,    22,    -1,    -1,    -1,    19,    20,    28,    22,    -1,
      -1,    -1,    -1,    34,    28,    -1,    -1,     8,    -1,    10,
      34,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    -1,    -1,    -1,
      -1,    -1,     8,    -1,    10,    36,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    -1,    -1,    -1,    -1,    -1,    -1,     9,    10,
      36,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    10,    36,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      36,    37,    10,    -1,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    35,    36,    10,
      -1,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    35,    36,    10,    -1,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    35,    36,    10,    -1,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    36,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    36,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    36,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    -1,    25,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    36,    -1,    -1,    25,    13,    14,
      15,    16,    -1,    18,    19,    20,    21,    -1,    36,    -1,
      25,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    36
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,    29,    30,    31,    32,    49,    50,    51,    54,     0,
      50,     6,     8,    20,    22,    52,    53,    55,    56,    34,
       6,     6,     8,     9,    10,    36,    38,    59,    35,    54,
      57,    58,     6,    52,     3,     4,     5,     6,    19,    20,
      22,    28,    34,    66,     3,     7,    33,    40,    41,    43,
      54,    59,    60,    61,    62,    63,    66,    55,    35,     9,
      34,    66,    66,    66,    66,    66,    10,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    36,    37,    11,     7,     8,    66,    34,
      34,    55,    64,    65,    39,    60,     8,    57,    35,    66,
      67,    35,    66,    66,    66,    66,    66,    66,    66,    66,
      66,    66,    66,    66,    66,    66,    66,    66,    66,    66,
       8,     8,    66,    66,    10,     8,     9,     9,    35,    37,
      35,    35,    66,    64,    67,    62,    62,    42,    62
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    48,    49,    50,    50,    51,    51,    51,    52,    52,
      53,    53,    54,    54,    54,    54,    55,    55,    55,    55,
      56,    56,    57,    57,    58,    59,    60,    60,    61,    61,
      62,    62,    62,    62,    62,    62,    62,    62,    62,    63,
      64,    64,    65,    65,    66,    66,    66,    66,    66,    66,
      66,    66,    66,    66,    66,    66,    66,    66,    66,    66,
      66,    66,    66,    66,    66,    66,    66,    66,    66,    66,
      66,    66,    66,    67,    67
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     2,     0,     3,     2,     3,     1,     3,
       1,     3,     1,     1,     1,     1,     1,     2,     2,     4,
       4,     3,     3,     1,     2,     3,     2,     0,     1,     1,
       2,     1,     3,     2,     5,     7,     5,     3,     2,     3,
       1,     3,     1,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     2,     2,     2,     2,     4,     3,     4,     1,
       1,     1,     1,     3,     1
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* Program: ExtDefList  */
#line 68 "yacc.y"
                     { 
    (yyval.ast) = newNode(dataType::program, "program", 1, (yyvsp[0].ast));
    root = (yyval.ast);
}
#line 1451 "y.tab.c"
    break;

  case 3: /* ExtDefList: ExtDef ExtDefList  */
#line 73 "yacc.y"
                               {
    (yyval.ast) = (yyvsp[-1].ast);
    (yyval.ast)->next = (yyvsp[0].ast);
}
#line 1460 "y.tab.c"
    break;

  case 4: /* ExtDefList: %empty  */
#line 77 "yacc.y"
                  { (yyval.ast) = NULL;}
#line 1466 "y.tab.c"
    break;

  case 5: /* ExtDef: Specifier ExtDecList SEMI  */
#line 79 "yacc.y"
                                   {
    (yyval.ast) = newNode(dataType::decl_inst, "decl_inst", 2, (yyvsp[-2].ast), (yyvsp[-1].ast));
}
#line 1474 "y.tab.c"
    break;

  case 6: /* ExtDef: Specifier SEMI  */
#line 82 "yacc.y"
                     {
    (yyval.ast) = newNode(dataType::decl_inst, "decl_inst", 1, (yyvsp[-1].ast));
}
#line 1482 "y.tab.c"
    break;

  case 7: /* ExtDef: Specifier FunDec CompSt  */
#line 85 "yacc.y"
                              {
    (yyvsp[0].ast)->next = (yyvsp[-1].ast)->next;
    (yyval.ast) = newNode(dataType::func_decl, "func_decl", 3, (yyvsp[-2].ast), (yyvsp[-1].ast), (yyvsp[0].ast));
}
#line 1491 "y.tab.c"
    break;

  case 8: /* ExtDecList: ExtDec  */
#line 90 "yacc.y"
                    {
    (yyval.ast) = (yyvsp[0].ast);
}
#line 1499 "y.tab.c"
    break;

  case 9: /* ExtDecList: ExtDec COMMA ExtDecList  */
#line 93 "yacc.y"
                              {
    (yyval.ast) = (yyvsp[-2].ast);
    (yyval.ast)->next = (yyvsp[0].ast);
}
#line 1508 "y.tab.c"
    break;

  case 10: /* ExtDec: VarDec  */
#line 98 "yacc.y"
                {
    (yyval.ast) = (yyvsp[0].ast);
}
#line 1516 "y.tab.c"
    break;

  case 11: /* ExtDec: VarDec ASSIGNOP Exp  */
#line 101 "yacc.y"
                          { // ÏÈÁô×Å
    (yyval.ast) = newNode(dataType::assign_inst, "assign", 2, (yyvsp[-2].ast), (yyvsp[0].ast));
}
#line 1524 "y.tab.c"
    break;

  case 12: /* Specifier: INT  */
#line 106 "yacc.y"
                {
    (yyval.ast) = newNode(dataType::int_type, "int_type", 0);
}
#line 1532 "y.tab.c"
    break;

  case 13: /* Specifier: DOUBLE  */
#line 109 "yacc.y"
             {
    (yyval.ast) = newNode(dataType::double_type, "double_type", 0);
}
#line 1540 "y.tab.c"
    break;

  case 14: /* Specifier: CHAR  */
#line 112 "yacc.y"
           {
    (yyval.ast) = newNode(dataType::char_type, "char_type", 0);
}
#line 1548 "y.tab.c"
    break;

  case 15: /* Specifier: VOID  */
#line 115 "yacc.y"
           {
    (yyval.ast) = newNode(dataType::void_type, "void_type", 0);
}
#line 1556 "y.tab.c"
    break;

  case 16: /* VarDec: ID  */
#line 120 "yacc.y"
            {
    (yyval.ast) = newTerNode(dataType::name, "name", datum((yyvsp[0].idval)));
}
#line 1564 "y.tab.c"
    break;

  case 17: /* VarDec: STAR ID  */
#line 123 "yacc.y"
                          {
    (yyval.ast) = newNode(dataType::member, "member", 1, newTerNode(dataType::name, "name", datum((yyvsp[0].idval))));
}
#line 1572 "y.tab.c"
    break;

  case 18: /* VarDec: BAND ID  */
#line 126 "yacc.y"
                          {
    (yyval.ast) = newNode(dataType::address, "address", 1, newTerNode(dataType::name, "name", datum((yyvsp[0].idval))));
}
#line 1580 "y.tab.c"
    break;

  case 19: /* VarDec: VarDec LB INTEGER RB  */
#line 129 "yacc.y"
                           {
    (yyval.ast) = newNode(dataType::subscript, "subscript", 2, (yyvsp[-3].ast), newTerNode(dataType::constant, "constant", datum((yyvsp[-1].intval))));
}
#line 1588 "y.tab.c"
    break;

  case 20: /* FunDec: ID LP VarList RP  */
#line 133 "yacc.y"
                          {
    (yyval.ast) = newTerNode(dataType::name, "name", datum((yyvsp[-3].idval)));
    (yyval.ast)->next = (yyvsp[-1].ast);
}
#line 1597 "y.tab.c"
    break;

  case 21: /* FunDec: ID LP RP  */
#line 137 "yacc.y"
               {
    (yyval.ast) = newTerNode(dataType::name, "name", datum((yyvsp[-2].idval)));
}
#line 1605 "y.tab.c"
    break;

  case 22: /* VarList: ParamDec COMMA VarList  */
#line 141 "yacc.y"
                                 {
    (yyval.ast) = (yyvsp[-2].ast);
    (yyval.ast)->next = (yyvsp[0].ast);
}
#line 1614 "y.tab.c"
    break;

  case 23: /* VarList: ParamDec  */
#line 145 "yacc.y"
               {
    (yyval.ast) = (yyvsp[0].ast);
}
#line 1622 "y.tab.c"
    break;

  case 24: /* ParamDec: Specifier VarDec  */
#line 149 "yacc.y"
                            {
    (yyval.ast) = newNode(dataType::decl_inst, "decl_inst", 2, (yyvsp[-1].ast), (yyvsp[0].ast));
}
#line 1630 "y.tab.c"
    break;

  case 25: /* CompSt: LC BlockItemList RC  */
#line 154 "yacc.y"
                             {
    (yyval.ast) = newNode(dataType::seq_tree, "seq_tree", 1, (yyvsp[-1].ast));
    // if ($2 == NULL) {
    //     $$ = newNode(dataType::seq_tree, "seq_tree", 1, $3);
    // } else {
    //     $$ = newNode(dataType::seq_tree, "seq_tree", 2, newNode(dataType::deflist, "deflist", 1, $2), $3);
    // }
}
#line 1643 "y.tab.c"
    break;

  case 26: /* BlockItemList: BlockItem BlockItemList  */
#line 163 "yacc.y"
                                       {
    (yyval.ast) = (yyvsp[-1].ast);
    (yyval.ast)->next = (yyvsp[0].ast);
}
#line 1652 "y.tab.c"
    break;

  case 27: /* BlockItemList: %empty  */
#line 167 "yacc.y"
              { (yyval.ast) = NULL; }
#line 1658 "y.tab.c"
    break;

  case 28: /* BlockItem: Def  */
#line 169 "yacc.y"
               {
    (yyval.ast) = (yyvsp[0].ast);
}
#line 1666 "y.tab.c"
    break;

  case 29: /* BlockItem: Stmt  */
#line 171 "yacc.y"
         {
    (yyval.ast) = (yyvsp[0].ast);
}
#line 1674 "y.tab.c"
    break;

  case 30: /* Stmt: Exp SEMI  */
#line 175 "yacc.y"
                {
    (yyval.ast) = (yyvsp[-1].ast);
}
#line 1682 "y.tab.c"
    break;

  case 31: /* Stmt: CompSt  */
#line 178 "yacc.y"
             {
    (yyval.ast) = (yyvsp[0].ast);
}
#line 1690 "y.tab.c"
    break;

  case 32: /* Stmt: RETURN Exp SEMI  */
#line 181 "yacc.y"
                      {
    if ((yyvsp[-1].ast)->child == NULL) {
        (yyval.ast) = newNode(dataType::return_inst, "return_inst", 1, (yyvsp[-1].ast));
    } else {
        (yyval.ast) = newNode(dataType::return_inst, "return_inst", 1, newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[-1].ast)));
    }
}
#line 1702 "y.tab.c"
    break;

  case 33: /* Stmt: RETURN SEMI  */
#line 188 "yacc.y"
                  {
    (yyval.ast) = newNode(dataType::return_inst, "return_inst", 0);
}
#line 1710 "y.tab.c"
    break;

  case 34: /* Stmt: IF LP Exp RP Stmt  */
#line 191 "yacc.y"
                                              {
    if ((yyvsp[-2].ast)->child == NULL) {
        (yyval.ast) = newNode(dataType::if_inst, "if_inst", 2, (yyvsp[-2].ast), (yyvsp[0].ast));
    } else {
        (yyval.ast) = newNode(dataType::if_inst, "if_inst", 2, newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[-2].ast)), (yyvsp[0].ast));
    }
}
#line 1722 "y.tab.c"
    break;

  case 35: /* Stmt: IF LP Exp RP Stmt ELSE Stmt  */
#line 198 "yacc.y"
                                  {
    if ((yyvsp[-4].ast)->child == NULL) {
        (yyval.ast) = newNode(dataType::if_inst, "if_inst", 3, (yyvsp[-4].ast), (yyvsp[-2].ast), (yyvsp[0].ast));
    } else {
        (yyval.ast) = newNode(dataType::if_inst, "if_inst", 3, newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[-4].ast)), (yyvsp[-2].ast), (yyvsp[0].ast));
    }
}
#line 1734 "y.tab.c"
    break;

  case 36: /* Stmt: WHILE LP Exp RP Stmt  */
#line 205 "yacc.y"
                           {
    if ((yyvsp[-2].ast)->child == NULL) {
        (yyval.ast) = newNode(dataType::while_inst, "while_inst", 2, (yyvsp[-2].ast), (yyvsp[0].ast));
    } else {
        (yyval.ast) = newNode(dataType::while_inst, "while_inst", 2, newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[-2].ast)), (yyvsp[0].ast));
    }
}
#line 1746 "y.tab.c"
    break;

  case 37: /* Stmt: GOTO LABEL SEMI  */
#line 212 "yacc.y"
                      {
    (yyval.ast) = newTerNode(dataType::goto_inst, "goto_inst", datum((yyvsp[-1].labelval)));
}
#line 1754 "y.tab.c"
    break;

  case 38: /* Stmt: LABEL COLON  */
#line 215 "yacc.y"
                  {
    (yyval.ast) = newTerNode(dataType::label_decl, "label_decl", datum((yyvsp[-1].labelval)));
}
#line 1762 "y.tab.c"
    break;

  case 39: /* Def: Specifier DecList SEMI  */
#line 220 "yacc.y"
                             {
    (yyval.ast) = newNode(dataType::decl_inst, "decl_inst", 2, (yyvsp[-2].ast), (yyvsp[-1].ast));
}
#line 1770 "y.tab.c"
    break;

  case 40: /* DecList: Dec  */
#line 224 "yacc.y"
              {
    (yyval.ast) = (yyvsp[0].ast);
}
#line 1778 "y.tab.c"
    break;

  case 41: /* DecList: Dec COMMA DecList  */
#line 227 "yacc.y"
                        {
    (yyval.ast) = (yyvsp[-2].ast);
    (yyval.ast)->next = (yyvsp[0].ast);
}
#line 1787 "y.tab.c"
    break;

  case 42: /* Dec: VarDec  */
#line 232 "yacc.y"
             {
    (yyval.ast) = (yyvsp[0].ast);
}
#line 1795 "y.tab.c"
    break;

  case 43: /* Dec: VarDec ASSIGNOP Exp  */
#line 235 "yacc.y"
                          {
    if ((yyvsp[0].ast)->child == NULL) {
        (yyval.ast) = newNode(dataType::assign_inst, "assign", 2, (yyvsp[-2].ast), (yyvsp[0].ast));
    } else {
        (yyval.ast) = newNode(dataType::assign_inst, "assign", 2, (yyvsp[-2].ast), newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[0].ast)));
    }
}
#line 1807 "y.tab.c"
    break;

  case 44: /* Exp: Exp ASSIGNOP Exp  */
#line 244 "yacc.y"
                       {
    AST * temp1 = (yyvsp[-2].ast)->child == NULL ? (yyvsp[-2].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[-2].ast));
    AST * temp2 = (yyvsp[0].ast)->child == NULL ? (yyvsp[0].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[0].ast));
    (yyval.ast) = newNode(dataType::assign_inst, "assign", 2, temp1, temp2);
}
#line 1817 "y.tab.c"
    break;

  case 45: /* Exp: Exp AND Exp  */
#line 249 "yacc.y"
                  {
    AST * temp1 = (yyvsp[-2].ast)->child == NULL ? (yyvsp[-2].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[-2].ast));
    AST * temp2 = (yyvsp[0].ast)->child == NULL ? (yyvsp[0].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[0].ast));
    (yyval.ast) = newNode(dataType::and_type, "and_type", 2, temp1, temp2);
}
#line 1827 "y.tab.c"
    break;

  case 46: /* Exp: Exp OR Exp  */
#line 254 "yacc.y"
                 {
    AST * temp1 = (yyvsp[-2].ast)->child == NULL ? (yyvsp[-2].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[-2].ast));
    AST * temp2 = (yyvsp[0].ast)->child == NULL ? (yyvsp[0].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[0].ast));
    (yyval.ast) = newNode(dataType::or_type, "or_type", 2, temp1, temp2);
}
#line 1837 "y.tab.c"
    break;

  case 47: /* Exp: Exp EQ Exp  */
#line 259 "yacc.y"
                 {
    AST * temp1 = (yyvsp[-2].ast)->child == NULL ? (yyvsp[-2].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[-2].ast));
    AST * temp2 = (yyvsp[0].ast)->child == NULL ? (yyvsp[0].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[0].ast));
    (yyval.ast) = newNode(dataType::equal, "equal", 2, temp1, temp2);
}
#line 1847 "y.tab.c"
    break;

  case 48: /* Exp: Exp GE Exp  */
#line 264 "yacc.y"
                 {
    AST * temp1 = (yyvsp[-2].ast)->child == NULL ? (yyvsp[-2].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[-2].ast));
    AST * temp2 = (yyvsp[0].ast)->child == NULL ? (yyvsp[0].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[0].ast));
    (yyval.ast) = newNode(dataType::greater_equal, "greater_equal", 2, temp1, temp2);
}
#line 1857 "y.tab.c"
    break;

  case 49: /* Exp: Exp LE Exp  */
#line 269 "yacc.y"
                 {
    AST * temp1 = (yyvsp[-2].ast)->child == NULL ? (yyvsp[-2].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[-2].ast));
    AST * temp2 = (yyvsp[0].ast)->child == NULL ? (yyvsp[0].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[0].ast));
    (yyval.ast) = newNode(dataType::less_equal, "less_equal", 2, temp1, temp2);
}
#line 1867 "y.tab.c"
    break;

  case 50: /* Exp: Exp GT Exp  */
#line 274 "yacc.y"
                 {
    AST * temp1 = (yyvsp[-2].ast)->child == NULL ? (yyvsp[-2].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[-2].ast));
    AST * temp2 = (yyvsp[0].ast)->child == NULL ? (yyvsp[0].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[0].ast));
    (yyval.ast) = newNode(dataType::greater, "greater", 2, temp1, temp2);
}
#line 1877 "y.tab.c"
    break;

  case 51: /* Exp: Exp LT Exp  */
#line 279 "yacc.y"
                 {
    AST * temp1 = (yyvsp[-2].ast)->child == NULL ? (yyvsp[-2].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[-2].ast));
    AST * temp2 = (yyvsp[0].ast)->child == NULL ? (yyvsp[0].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[0].ast));
    (yyval.ast) = newNode(dataType::less, "less", 2, temp1, temp2);
}
#line 1887 "y.tab.c"
    break;

  case 52: /* Exp: Exp NE Exp  */
#line 284 "yacc.y"
                 {
    AST * temp1 = (yyvsp[-2].ast)->child == NULL ? (yyvsp[-2].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[-2].ast));
    AST * temp2 = (yyvsp[0].ast)->child == NULL ? (yyvsp[0].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[0].ast));
    (yyval.ast) = newNode(dataType::not_equal, "not_equal", 2, temp1, temp2);
}
#line 1897 "y.tab.c"
    break;

  case 53: /* Exp: Exp PLUS Exp  */
#line 289 "yacc.y"
                   {
    AST * temp1 = (yyvsp[-2].ast)->child == NULL ? (yyvsp[-2].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[-2].ast));
    AST * temp2 = (yyvsp[0].ast)->child == NULL ? (yyvsp[0].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[0].ast));
    (yyval.ast) = newNode(dataType::plus, "plus", 2, temp1, temp2);
}
#line 1907 "y.tab.c"
    break;

  case 54: /* Exp: Exp MINUS Exp  */
#line 294 "yacc.y"
                    {
    AST * temp1 = (yyvsp[-2].ast)->child == NULL ? (yyvsp[-2].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[-2].ast));
    AST * temp2 = (yyvsp[0].ast)->child == NULL ? (yyvsp[0].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[0].ast));
    (yyval.ast) = newNode(dataType::minus, "minus", 2, temp1, temp2);
}
#line 1917 "y.tab.c"
    break;

  case 55: /* Exp: Exp STAR Exp  */
#line 299 "yacc.y"
                   {
    AST * temp1 = (yyvsp[-2].ast)->child == NULL ? (yyvsp[-2].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[-2].ast));
    AST * temp2 = (yyvsp[0].ast)->child == NULL ? (yyvsp[0].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[0].ast));
    (yyval.ast) = newNode(dataType::multiply, "multiply", 2, temp1, temp2);
}
#line 1927 "y.tab.c"
    break;

  case 56: /* Exp: Exp DIV Exp  */
#line 304 "yacc.y"
                  {
    AST * temp1 = (yyvsp[-2].ast)->child == NULL ? (yyvsp[-2].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[-2].ast));
    AST * temp2 = (yyvsp[0].ast)->child == NULL ? (yyvsp[0].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[0].ast));
    (yyval.ast) = newNode(dataType::divide, "divide", 2, temp1, temp2);
}
#line 1937 "y.tab.c"
    break;

  case 57: /* Exp: Exp MOD Exp  */
#line 309 "yacc.y"
                  {
    AST * temp1 = (yyvsp[-2].ast)->child == NULL ? (yyvsp[-2].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[-2].ast));
    AST * temp2 = (yyvsp[0].ast)->child == NULL ? (yyvsp[0].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[0].ast));
    (yyval.ast) = newNode(dataType::mod, "mod", 2, temp1, temp2);
}
#line 1947 "y.tab.c"
    break;

  case 58: /* Exp: Exp BAND Exp  */
#line 314 "yacc.y"
                   {
    AST * temp1 = (yyvsp[-2].ast)->child == NULL ? (yyvsp[-2].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[-2].ast));
    AST * temp2 = (yyvsp[0].ast)->child == NULL ? (yyvsp[0].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[0].ast));
    (yyval.ast) = newNode(dataType::band, "band", 2, temp1, temp2);
}
#line 1957 "y.tab.c"
    break;

  case 59: /* Exp: Exp BOR Exp  */
#line 319 "yacc.y"
                  {
    AST * temp1 = (yyvsp[-2].ast)->child == NULL ? (yyvsp[-2].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[-2].ast));
    AST * temp2 = (yyvsp[0].ast)->child == NULL ? (yyvsp[0].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[0].ast));
    (yyval.ast) = newNode(dataType::bor, "bor", 2, temp1, temp2);
}
#line 1967 "y.tab.c"
    break;

  case 60: /* Exp: Exp BXOR Exp  */
#line 324 "yacc.y"
                   {
    AST * temp1 = (yyvsp[-2].ast)->child == NULL ? (yyvsp[-2].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[-2].ast));
    AST * temp2 = (yyvsp[0].ast)->child == NULL ? (yyvsp[0].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[0].ast));
    (yyval.ast) = newNode(dataType::bxor, "bxor", 2, temp1, temp2);
}
#line 1977 "y.tab.c"
    break;

  case 61: /* Exp: LP Exp RP  */
#line 329 "yacc.y"
                {
    (yyval.ast) = (yyvsp[-1].ast);
}
#line 1985 "y.tab.c"
    break;

  case 62: /* Exp: MINUS Exp  */
#line 332 "yacc.y"
                             {
    if ((yyvsp[0].ast)->child == NULL) {
        (yyval.ast) = newNode(dataType::uminus, "uminus", 1, (yyvsp[0].ast));
    } else {
        (yyval.ast) = newNode(dataType::uminus, "uminus", 1, newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[0].ast)));
    }
}
#line 1997 "y.tab.c"
    break;

  case 63: /* Exp: NOT Exp  */
#line 339 "yacc.y"
              {
    if ((yyvsp[0].ast)->child == NULL) {
        (yyval.ast) = newNode(dataType::not_type, "not_type", 1, (yyvsp[0].ast));
    } else {
        (yyval.ast) = newNode(dataType::not_type, "not_type", 1, newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[0].ast)));
    }
}
#line 2009 "y.tab.c"
    break;

  case 64: /* Exp: BAND Exp  */
#line 346 "yacc.y"
                           {
    if ((yyvsp[0].ast)->child == NULL) {
        (yyval.ast) = newNode(dataType::address, "address", 1, (yyvsp[0].ast));
    } else {
        (yyval.ast) = newNode(dataType::address, "address", 1, newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[0].ast)));
    }
}
#line 2021 "y.tab.c"
    break;

  case 65: /* Exp: STAR Exp  */
#line 353 "yacc.y"
                           {
    if ((yyvsp[0].ast)->child == NULL) {
        (yyval.ast) = newNode(dataType::member, "member", 1, (yyvsp[0].ast));
    } else {
        (yyval.ast) = newNode(dataType::member, "member", 1, newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[0].ast)));
    }
}
#line 2033 "y.tab.c"
    break;

  case 66: /* Exp: ID LP Args RP  */
#line 360 "yacc.y"
                    {
    (yyval.ast) = newNode(dataType::call_inst, "call_inst", 2, newTerNode(dataType::name, "name", datum((yyvsp[-3].idval))), (yyvsp[-1].ast));
}
#line 2041 "y.tab.c"
    break;

  case 67: /* Exp: ID LP RP  */
#line 363 "yacc.y"
               {
    (yyval.ast) = newNode(dataType::call_inst, "call_inst", 1, newTerNode(dataType::name, "name", datum((yyvsp[-2].idval))));
}
#line 2049 "y.tab.c"
    break;

  case 68: /* Exp: Exp LB Exp RB  */
#line 366 "yacc.y"
                    {
    AST * temp1 = (yyvsp[-3].ast)->child == NULL ? (yyvsp[-3].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[-3].ast));
    AST * temp2 = (yyvsp[-1].ast)->child == NULL ? (yyvsp[-1].ast) : newNode(dataType::eseq_tree, "eseq_tree", 1, (yyvsp[-1].ast));
    (yyval.ast) = newNode(dataType::subscript, "subscript", 2, temp1, temp2);
}
#line 2059 "y.tab.c"
    break;

  case 69: /* Exp: ID  */
#line 371 "yacc.y"
         {
    (yyval.ast) = newTerNode(dataType::name, "name", datum((yyvsp[0].idval)));
}
#line 2067 "y.tab.c"
    break;

  case 70: /* Exp: INTEGER  */
#line 374 "yacc.y"
              {
    (yyval.ast) = newTerNode(dataType::constant, "constant", datum((yyvsp[0].intval)));
}
#line 2075 "y.tab.c"
    break;

  case 71: /* Exp: REAL  */
#line 377 "yacc.y"
           {
    (yyval.ast) = newTerNode(dataType::constant, "constant", datum((yyvsp[0].doubleval)));
}
#line 2083 "y.tab.c"
    break;

  case 72: /* Exp: STRING  */
#line 380 "yacc.y"
             {
    (yyval.ast) = newTerNode(dataType::string, "string", datum((yyvsp[0].strval)));
}
#line 2091 "y.tab.c"
    break;

  case 73: /* Args: Exp COMMA Args  */
#line 384 "yacc.y"
                      {
    (yyval.ast) = (yyvsp[-2].ast);
    (yyval.ast)->next = (yyvsp[0].ast);
}
#line 2100 "y.tab.c"
    break;

  case 74: /* Args: Exp  */
#line 388 "yacc.y"
          {
    (yyval.ast) = (yyvsp[0].ast);
}
#line 2108 "y.tab.c"
    break;


#line 2112 "y.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 391 "yacc.y"


void yyerror(const char *str) {
    fprintf(stderr, "error:%s\n", str);
}

int yywrap() {
    return 1;
}

AST* getAST() {
    yyparse();
    printTreeInfo(root, 0);
    return root;
}

/*int main(int argc, char **argv) {
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
    freopen("out.txt", "w", stdout);
    yyrestart(f);
    yyparse();
    printTreeInfo(root, 0);

    return 0;
}*/