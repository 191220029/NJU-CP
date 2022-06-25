#pragma once
/* A Bison parser, made by GNU Bison 3.0.4.  */



/* Bison implementation for Yacc-like parsers in C



   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.



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



      /* C LALR(1) parser skeleton written by Richard Stallman, by

         simplifying the original so-called "semantic" parser.  */



         /* All symbols defined below should begin with yy or YY, to avoid

            infringing on user name space.  This should be done even for local

            variables, as they might otherwise be expanded by user macros.

            There are some unavoidable exceptions within include files to

            define necessary library symbols; they are noted "INFRINGES ON

            USER NAME SPACE" below.  */



            /* Identify Bison output.  */

#define YYBISON 1



/* Bison version.  */

#define YYBISON_VERSION "3.0.4"



/* Skeleton name.  */

#define YYSKELETON_NAME "yacc.c"



/* Pure parsers.  */

#define YYPURE 0



/* Push parsers.  */

#define YYPUSH 0



/* Pull parsers.  */

#define YYPULL 1









/* Copy the first part of user declarations.  */

#line 3 "syntax.y" /* yacc.c:339  */



#include "tree.h"

int yylex();

int yyerror(const char* s, ...);



typedef unsigned char uint8_t;



int correct = 1;



int syserr = 0;

int defined_err = 0;

int ignore_line = 0;





#line 81 "syntax.tab.c" /* yacc.c:339  */



# ifndef YY_NULLPTR

#  if defined __cplusplus && 201103L <= __cplusplus

#   define YY_NULLPTR nullptr

#  else

#   define YY_NULLPTR 0

#  endif

# endif



/* Enabling verbose error messages.  */

#ifdef YYERROR_VERBOSE

# undef YYERROR_VERBOSE

# define YYERROR_VERBOSE 1

#else

# define YYERROR_VERBOSE 1

#endif



/* In a future release of Bison, this section will be replaced

   by #include "syntax.tab.h".  */

#ifndef YY_YY_SYNTAX_TAB_H_INCLUDED

# define YY_YY_SYNTAX_TAB_H_INCLUDED

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

    ASSIGNOP = 258,

    OR = 259,

    AND = 260,

    RELOP = 261,

    PLUS = 262,

    MINUS = 263,

    STAR = 264,

    DIV = 265,

    NOT = 266,

    LP = 267,

    RP = 268,

    LB = 269,

    RB = 270,

    DOT = 271,

    INT = 272,

    FLOAT = 273,

    TYPE = 274,

    STRUCT = 275,

    RETURN = 276,

    IF = 277,

    ELSE = 278,

    WHILE = 279,

    ID = 280,

    SEMI = 281,

    COMMA = 282,

    LC = 283,

    RC = 284,

    LOWER_THAN_ELSE = 285

};

#endif



/* Value type.  */

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED



union YYSTYPE

{

#line 19 "syntax.y" /* yacc.c:355  */



    Node* node;



#line 156 "syntax.tab.c" /* yacc.c:355  */

};



typedef union YYSTYPE YYSTYPE;

# define YYSTYPE_IS_TRIVIAL 1

# define YYSTYPE_IS_DECLARED 1

#endif



/* Location type.  */

#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED

typedef struct YYLTYPE YYLTYPE;

struct YYLTYPE

{

    int first_line;

    int first_column;

    int last_line;

    int last_column;

};

# define YYLTYPE_IS_DECLARED 1

# define YYLTYPE_IS_TRIVIAL 1

#endif





extern YYSTYPE yylval;

extern YYLTYPE yylloc;

int yyparse(void);



#endif /* !YY_YY_SYNTAX_TAB_H_INCLUDED  */



/* Copy the second part of user declarations.  */



#line 187 "syntax.tab.c" /* yacc.c:358  */



#ifdef short

# undef short

#endif



#ifdef YYTYPE_UINT8

typedef YYTYPE_UINT8 yytype_uint8;

#else

typedef unsigned char yytype_uint8;

#endif



#ifdef YYTYPE_INT8

typedef YYTYPE_INT8 yytype_int8;

#else

typedef signed char yytype_int8;

#endif



#ifdef YYTYPE_UINT16

typedef YYTYPE_UINT16 yytype_uint16;

#else

typedef unsigned short int yytype_uint16;

#endif



#ifdef YYTYPE_INT16

typedef YYTYPE_INT16 yytype_int16;

#else

typedef short int yytype_int16;

#endif



#ifndef YYSIZE_T

# ifdef __SIZE_TYPE__

#  define YYSIZE_T __SIZE_TYPE__

# elif defined size_t

#  define YYSIZE_T size_t

# elif ! defined YYSIZE_T

#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */

#  define YYSIZE_T size_t

# else

#  define YYSIZE_T unsigned int

# endif

#endif



#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)



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



#ifndef YY_ATTRIBUTE

# if (defined __GNUC__                                               \
&& (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
    || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif



#ifndef YY_ATTRIBUTE_PURE

# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))

#endif



#ifndef YY_ATTRIBUTE_UNUSED

# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))

#endif



#if !defined _Noreturn \
&& (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)

# if defined _MSC_VER && 1200 <= _MSC_VER

#  define _Noreturn __declspec (noreturn)

# else

#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))

# endif

#endif



    /* Suppress unused-variable warnings by "using" E.  */

#if ! defined lint || defined __GNUC__

# define YYUSE(E) ((void) (E))

#else

# define YYUSE(E) /* empty */

#endif



#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */

# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \

_Pragma("GCC diagnostic push") \

_Pragma("GCC diagnostic ignored \"-Wuninitialized\"")\

_Pragma("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")

# define YY_IGNORE_MAYBE_UNINITIALIZED_END \

_Pragma("GCC diagnostic pop")

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





#if ! defined yyoverflow || YYERROR_VERBOSE



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
    && !((defined YYMALLOC || defined malloc) \
        && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif

#  ifndef YYMALLOC

#   define YYMALLOC malloc

#   if ! defined malloc && ! defined EXIT_SUCCESS

    void* malloc(YYSIZE_T); /* INFRINGES ON USER NAME SPACE */

#   endif

#  endif

#  ifndef YYFREE

#   define YYFREE free

#   if ! defined free && ! defined EXIT_SUCCESS

void free(void*); /* INFRINGES ON USER NAME SPACE */

#   endif

#  endif

# endif

#endif /* ! defined yyoverflow || YYERROR_VERBOSE */





#if (! defined yyoverflow \
&& (!defined __cplusplus \
    || (defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL \
        && defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))



    /* A type that is properly aligned for any stack member.  */

    union yyalloc

{

    yytype_int16 yyss_alloc;

    YYSTYPE yyvs_alloc;

    YYLTYPE yyls_alloc;

};



/* The size of the maximum gap between one aligned stack and the next.  */

# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)



/* The size of an array large to enough to hold all stacks, each with

   N elements.  */

# define YYSTACK_BYTES(N) \
((N)* (sizeof(yytype_int16) + sizeof(YYSTYPE) + sizeof(YYLTYPE)) \
    + 2 * YYSTACK_GAP_MAXIMUM)



# define YYCOPY_NEEDED 1



    /* Relocate STACK from its old location to the new one.  The

       local variables YYSIZE and YYSTACKSIZE give the old and new number of

       elements in the stack, and YYPTR gives the new location of the

       stack.  Advance YYPTR to a properly aligned location for the next

       stack.  */

# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
    {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY(&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof(*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof(*yyptr);                          \
    }                                                                 \
        while (0)


#endif



#if defined YYCOPY_NEEDED && YYCOPY_NEEDED

            /* Copy COUNT objects from SRC to DST.  The source and destination do

               not overlap.  */

# ifndef YYCOPY

#  if defined __GNUC__ && 1 < __GNUC__

#   define YYCOPY(Dst, Src, Count) \

            __builtin_memcpy(Dst, Src, (Count) * sizeof(*(Src)))

#  else

#   define YYCOPY(Dst, Src, Count)              \
            do                                        \
            {                                       \
                YYSIZE_T yyi;                         \
               for (yyi = 0; yyi < (Count); yyi++)   \
                    (Dst)[yyi] = (Src)[yyi];            \
            }                                       \
                while (0)
#  endif

# endif

#endif /* !YYCOPY_NEEDED */



                    /* YYFINAL -- State number of the termination state.  */

#define YYFINAL  11

/* YYLAST -- Last index in YYTABLE.  */

#define YYLAST   900



/* YYNTOKENS -- Number of terminals.  */

#define YYNTOKENS  31

/* YYNNTS -- Number of nonterminals.  */

#define YYNNTS  22

/* YYNRULES -- Number of rules.  */

#define YYNRULES  96

/* YYNSTATES -- Number of states.  */

#define YYNSTATES  173



/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned

   by yylex, with out-of-bounds checking.  */

#define YYUNDEFTOK  2

#define YYMAXUTOK   285



#define YYTRANSLATE(YYX)                                                \
                    ((unsigned int)(YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)



                    /* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM

                       as returned by yylex, without out-of-bounds checking.  */

                    static const yytype_uint8 yytranslate[] =

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

                      25,    26,    27,    28,    29,    30

                };



#if YYDEBUG

/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */

static const yytype_uint8 yyrline[] =

{

       0,    41,    41,    45,    46,    49,    50,    51,    54,    58,

      59,    60,    61,    65,    66,    69,    70,    71,    74,    75,

      78,    83,    84,    86,    91,    92,    95,    97,   101,   102,

     106,   111,   113,   116,   117,   122,   123,   124,   126,   127,

     128,   129,   130,   132,   134,   135,   138,   139,   143,   144,

     146,   147,   151,   152,   156,   157,   158,   162,   163,   164,

     165,   168,   169,   170,   171,   172,   173,   174,   175,   176,

     177,   178,   179,   180,   181,   182,   183,   184,   185,   186,

     187,   188,   189,   190,   192,   193,   194,   195,   196,   197,

     198,   199,   200,   201,   202,   205,   206

};

#endif



#if YYDEBUG || YYERROR_VERBOSE || 1

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.

   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */

static const char* const yytname[] =

{

  "$end", "error", "$undefined", "ASSIGNOP", "OR", "AND", "RELOP", "PLUS",

  "MINUS", "STAR", "DIV", "NOT", "LP", "RP", "LB", "RB", "DOT", "INT",

  "FLOAT", "TYPE", "STRUCT", "RETURN", "IF", "ELSE", "WHILE", "ID", "SEMI",

  "COMMA", "LC", "RC", "LOWER_THAN_ELSE", "$accept", "Program",

  "ExtDefList", "ExtDef", "ExtDecList", "Specifier", "StructSpecifier",

  "OptTag", "Tag", "VarDec", "FunDec", "VarList", "ParamDec", "CompSt",

  "StmtList", "Stmt", "DefList", "Def", "DecList", "Dec", "Exp", "Args", YY_NULLPTR

};

#endif



# ifdef YYPRINT

/* YYTOKNUM[NUM] -- (External) token number corresponding to the

   (internal) symbol number NUM (which must be that of a token).  */

static const yytype_uint16 yytoknum[] =

{

       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,

     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,

     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,

     285

};

# endif



#define YYPACT_NINF -110



#define yypact_value_is_default(Yystate) \
(!!((Yystate) == (-110)))



#define YYTABLE_NINF -97



#define yytable_value_is_error(Yytable_value) \
0



/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing

   STATE-NUM.  */

    static const yytype_int16 yypact[] =
{
     102,  -110,    -8,    20,  -110,   102,    21,  -110,    24,    26,
    -110,  -110,  -110,    51,    36,  -110,    57,    43,    56,    30,
     102,  -110,    55,  -110,    -9,     9,    61,    80,  -110,    58,
       5,    65,   102,    61,  -110,    84,   101,  -110,   105,  -110,
      61,  -110,   111,   128,  -110,   115,    95,  -110,   121,    75,
     145,   127,  -110,  -110,   158,   102,  -110,  -110,  -110,  -110,
    -110,  -110,   149,   677,   679,   697,  -110,  -110,   699,   170,
     187,   188,  -110,   174,    95,   627,  -110,   717,  -110,    61,

    -110,  -110,   815,   124,   815,   152,   197,   840,   201,   653,

     815,   815,    54,  -110,  -110,     6,   719,   737,   739,   757,

     759,   777,   779,   797,   799,   203,   219,  -110,   667,  -110,

     586,  -110,   180,   229,   817,   208,  -110,  -110,  -110,   229,

    -110,   854,   542,    -2,  -110,   613,   242,   815,  -110,  -110,

     236,  -110,   264,  -110,   292,  -110,   320,  -110,   348,   815,

     516,  -110,   376,   815,   404,    67,   868,  -110,   815,  -110,

    -110,   432,   560,    64,   560,  -110,  -110,  -110,   815,  -110,

     460,   488,  -110,  -110,  -110,   884,   233,  -110,  -110,   560,

     560,  -110,  -110
};



/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.

   Performed when YYTABLE does not specify something else to do.  Zero

   means the default is an error.  */

static const yytype_uint8 yydefact[] =

{

       3,    13,    19,     0,     2,     3,     0,    14,    20,     0,

      16,     1,     4,     0,    21,     6,     0,     0,     0,     0,

       0,     8,     0,     5,     0,     0,     0,     0,     7,     0,

       0,     0,    49,     0,    27,    29,     0,    25,     0,    21,

       0,    12,     0,     0,    10,     0,     0,    17,     0,    54,

       0,    52,    15,    48,    30,     0,    26,    24,    11,    23,

      22,    32,     0,     0,     0,     0,    73,    74,     0,     0,

       0,    72,    36,     0,     0,     0,    51,     0,    50,     0,

      28,    43,    85,     0,    86,     0,     0,     0,     0,     0,

       0,     0,     0,    31,    33,     0,     0,     0,     0,     0,

       0,     0,     0,     0,     0,     0,     0,    35,     0,    56,

       0,    53,     0,     0,     0,     0,    84,    65,    47,    46,

      37,     0,     0,    91,    69,     0,     0,     0,    45,    76,

       0,    78,     0,    77,     0,    79,     0,    80,     0,    81,

       0,    82,     0,    83,     0,     0,     0,    71,     0,    44,

      81,     0,     0,     0,     0,    41,    89,    90,     0,    68,

       0,     0,    92,    93,    70,     0,    38,    40,    95,     0,

       0,    42,    39

};



/* YYPGOTO[NTERM-NUM].  */

static const yytype_int16 yypgoto[] =

{

    -110,  -110,   254,  -110,   575,     3,  -110,  -110,  -110,   -26,

    -110,   -13,  -110,   248,   209,  -109,    83,  -110,   205,  -110,

     -63,   129

};



/* YYDEFGOTO[NTERM-NUM].  */

static const yytype_int8 yydefgoto[] =

{

      -1,     3,     4,     5,    16,    30,     7,     9,    10,    17,

      18,    34,    35,    72,    73,    74,    31,    32,    50,    51,

      75,   126

};



/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If

   positive, shift that token.  If negative, reduce the rule whose

   number is the opposite.  If YYTABLE_NINF, syntax error.  */

static const yytype_int16 yytable[] =

{

      83,    85,    87,     6,    49,    89,    48,    54,     6,    38,

      42,   156,   108,   155,   110,   127,    39,     8,    40,   112,

      11,   115,    13,    33,   157,    33,    43,   121,   122,   125,

      39,    29,   128,   130,   132,   134,   136,   138,   140,   142,

     144,   146,    80,   166,    24,   167,    14,    15,    22,     1,

       2,   151,   -18,    49,    19,   123,    36,    25,    33,   -49,

     171,   172,    63,    20,   160,    64,    65,   124,    37,    -9,

      26,    66,    67,   127,     1,     2,   112,    21,    77,    71,

     161,    45,   162,    23,    27,   165,    39,    47,   -49,    25,

      81,   -49,   -49,   163,    52,   125,    62,   -49,   -49,     1,

       2,   -49,   -49,    63,   -49,   -49,    64,    65,   -49,   -49,

      46,    55,    66,    67,    56,    53,    68,    69,    57,    70,

      71,     1,     2,    27,   -34,   113,    59,   -66,   -66,   -66,

     -66,   -66,   -66,   -66,   -66,   -66,   -66,   -66,   104,   -66,

     105,   -66,   -66,    60,    61,   -66,   -66,    76,   -66,   -66,

     -66,   -66,   -66,   113,    79,   -67,   -67,   -67,   -67,   -67,

     -67,   -67,   -67,   -67,   -67,   -67,   104,   -67,   105,   -67,

     -67,    78,    25,   -67,   -67,    81,   -67,   -67,   -67,   -67,

     -67,   113,    90,    96,    97,    98,    99,   100,   114,   102,

     103,   -87,   -87,   -87,   104,   -87,   105,   -87,   -87,    91,

      92,   -87,   -87,    93,   -87,   -87,   -87,   -87,   -87,   113,

     116,    96,    97,    98,    99,   100,   114,   102,   103,   -88,

     -88,   -88,   104,   -88,   105,   -88,   -88,   118,   147,   -88,

     -88,   148,   -88,   -88,   -88,   -88,   -88,   113,   127,    96,

      97,    98,    99,   100,   114,   102,   103,   -57,   -57,   -57,

     104,   -57,   105,   -57,   -57,   159,   170,   -57,   -57,    12,

     -57,   -57,   -57,   -57,   -57,   113,    28,   -59,   -59,    98,

      99,   100,   114,   102,   103,   -59,   -59,   -59,   104,   -59,

     105,   -59,   -59,    94,   111,   -59,   -59,   168,   -59,   -59,

     -59,   -59,   -59,   113,     0,   -58,   -58,   -58,    99,   100,

     114,   102,   103,   -58,   -58,   -58,   104,   -58,   105,   -58,

     -58,     0,     0,   -58,   -58,     0,   -58,   -58,   -58,   -58,

     -58,   113,     0,   -60,   -60,   -60,   -60,   100,   114,   102,

     103,   -60,   -60,   -60,   104,   -60,   105,   -60,   -60,     0,

       0,   -60,   -60,     0,   -60,   -60,   -60,   -60,   -60,   113,

       0,   -61,   -61,   -61,   -61,   -61,   -61,   102,   103,   -61,

     -61,   -61,   104,   -61,   105,   -61,   -61,     0,     0,   -61,

     -61,     0,   -61,   -61,   -61,   -61,   -61,   113,     0,   -63,

     -63,   -63,   -63,   -63,   -63,   -63,   -63,   -63,   -63,   -63,

     104,   -63,   105,   -63,   -63,     0,     0,   -63,   -63,     0,

     -63,   -63,   -63,   -63,   -63,   113,     0,   -64,   -64,   -64,

     -64,   -64,   -64,   -64,   -64,   -64,   -64,   -64,   104,   -64,

     105,   -64,   -64,     0,     0,   -64,   -64,     0,   -64,   -64,

     -64,   -64,   -64,   113,     0,   -62,   -62,   -62,   -62,   -62,

     -62,   102,   103,   -62,   -62,   -62,   104,   -62,   105,   -62,

     -62,     0,     0,   -62,   -62,     0,   -62,   -62,   -62,   -62,

     -62,   113,     0,   -94,   -94,   -94,   -94,   -94,   -94,   -94,

     -94,   -94,   -94,   -94,   104,   -94,   105,   -94,   -94,     0,

       0,   -94,   -94,     0,   -94,   -94,   -94,   -94,   -94,   113,

       0,    96,    97,    98,    99,   100,   114,   102,   103,   -75,

     -75,   -75,   104,   -75,   105,   -75,   -75,     0,     0,   -75,

     -75,     0,   -75,   -75,   -75,   -75,   -75,   113,     0,   -62,

     -62,   -62,   -62,   -62,   -62,   -66,   -66,   -62,   -62,   -62,

     104,     0,   105,   -62,   -62,     0,     0,   -62,   -62,     0,

     -62,   -62,   -62,   153,   -62,    96,    97,    98,    99,   100,

     101,   102,   103,    64,    65,   154,   104,     0,   105,    66,

      67,    62,     0,    68,    69,     0,    70,    71,    63,     0,

      27,    64,    65,     0,     0,     0,     0,    66,    67,     0,

       0,    68,    69,     0,    70,    71,     0,   113,    27,    96,

      97,    98,    99,   100,   114,   102,   103,     0,     0,    41,

     104,    44,   105,     0,     0,     0,     0,     0,     0,     0,

       0,     0,   -55,   -55,   113,    58,    96,    97,    98,    99,

     100,   114,   102,   103,     0,     0,   -96,   104,    95,   105,

      96,    97,    98,    99,   100,   101,   102,   103,    64,    65,

     158,   104,     0,   105,    66,    67,     0,     0,     0,     0,

       0,   106,    71,   107,   119,     0,    96,    97,    98,    99,

     100,   114,   102,   103,     0,     0,     0,   104,   113,   105,

      96,    97,    98,    99,   100,   114,   102,   103,    82,   120,

      84,   104,     0,   105,     0,    63,     0,    63,    64,    65,

      64,    65,     0,   149,    66,    67,    66,    67,    86,     0,

      88,     0,    71,     0,    71,    63,     0,    63,    64,    65,

      64,    65,     0,     0,    66,    67,    66,    67,   109,     0,

     129,     0,    71,     0,    71,    63,     0,    63,    64,    65,

      64,    65,     0,     0,    66,    67,    66,    67,   131,     0,

     133,     0,    71,     0,    71,    63,     0,    63,    64,    65,

      64,    65,     0,     0,    66,    67,    66,    67,   135,     0,

     137,     0,    71,     0,    71,    63,     0,    63,    64,    65,

      64,    65,     0,     0,    66,    67,    66,    67,   139,     0,

     141,     0,    71,     0,    71,    63,     0,    63,    64,    65,

      64,    65,     0,     0,    66,    67,    66,    67,   143,     0,

     145,     0,    71,     0,    71,    63,     0,    63,    64,    65,

      64,    65,     0,     0,    66,    67,    66,    67,   150,     0,

       0,     0,    71,    63,    71,    63,    64,    65,    64,    65,

       0,     0,    66,    67,    66,    67,     0,     0,     0,     0,

      71,   113,    71,    96,    97,    98,    99,   100,   114,   102,

     103,     0,     0,   117,   104,   113,   105,    96,    97,    98,

      99,   100,   114,   102,   103,     0,     0,   152,   104,   113,

     105,    96,    97,    98,    99,   100,   114,   102,   103,     0,

       0,     0,   104,   164,   105,   113,     0,    96,    97,    98,

      99,   100,   114,   102,   103,     0,     0,   169,   104,     0,

     105

};



static const yytype_int16 yycheck[] =

{

      63,    64,    65,     0,    30,    68,     1,    33,     5,    22,

       1,    13,    75,   122,    77,     9,    25,    25,    27,    82,

       0,    84,     1,    20,    26,    22,    17,    90,    91,    92,

      25,     1,    26,    96,    97,    98,    99,   100,   101,   102,

     103,   104,    55,   152,     1,   154,    25,    26,    12,    19,

      20,   114,    28,    79,    28,     1,     1,    14,    55,    29,

     169,   170,     8,    12,   127,    11,    12,    13,    13,    26,

      27,    17,    18,     9,    19,    20,   139,    26,     3,    25,

     143,     1,    15,    26,    28,   148,    25,    29,     8,    14,

      26,    11,    12,    26,    29,   158,     1,    17,    18,    19,

      20,    21,    22,     8,    24,    25,    11,    12,    28,    29,

      27,    27,    17,    18,    13,    32,    21,    22,    13,    24,

      25,    19,    20,    28,    29,     1,    15,     3,     4,     5,

       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,

      16,    17,    18,    15,    29,    21,    22,    26,    24,    25,

      26,    27,    28,     1,    27,     3,     4,     5,     6,     7,

       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,

      18,    26,    14,    21,    22,    26,    24,    25,    26,    27,

      28,     1,    12,     3,     4,     5,     6,     7,     8,     9,

      10,    11,    12,    13,    14,    15,    16,    17,    18,    12,

      12,    21,    22,    29,    24,    25,    26,    27,    28,     1,

      13,     3,     4,     5,     6,     7,     8,     9,    10,    11,

      12,    13,    14,    15,    16,    17,    18,    26,    25,    21,

      22,    12,    24,    25,    26,    27,    28,     1,     9,     3,

       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,

      14,    15,    16,    17,    18,    13,    23,    21,    22,     5,

      24,    25,    26,    27,    28,     1,    18,     3,     4,     5,

       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,

      16,    17,    18,    74,    79,    21,    22,   158,    24,    25,

      26,    27,    28,     1,    -1,     3,     4,     5,     6,     7,

       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,

      18,    -1,    -1,    21,    22,    -1,    24,    25,    26,    27,

      28,     1,    -1,     3,     4,     5,     6,     7,     8,     9,

      10,    11,    12,    13,    14,    15,    16,    17,    18,    -1,

      -1,    21,    22,    -1,    24,    25,    26,    27,    28,     1,

      -1,     3,     4,     5,     6,     7,     8,     9,    10,    11,

      12,    13,    14,    15,    16,    17,    18,    -1,    -1,    21,

      22,    -1,    24,    25,    26,    27,    28,     1,    -1,     3,

       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,

      14,    15,    16,    17,    18,    -1,    -1,    21,    22,    -1,

      24,    25,    26,    27,    28,     1,    -1,     3,     4,     5,

       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,

      16,    17,    18,    -1,    -1,    21,    22,    -1,    24,    25,

      26,    27,    28,     1,    -1,     3,     4,     5,     6,     7,

       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,

      18,    -1,    -1,    21,    22,    -1,    24,    25,    26,    27,

      28,     1,    -1,     3,     4,     5,     6,     7,     8,     9,

      10,    11,    12,    13,    14,    15,    16,    17,    18,    -1,

      -1,    21,    22,    -1,    24,    25,    26,    27,    28,     1,

      -1,     3,     4,     5,     6,     7,     8,     9,    10,    11,

      12,    13,    14,    15,    16,    17,    18,    -1,    -1,    21,

      22,    -1,    24,    25,    26,    27,    28,     1,    -1,     3,

       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,

      14,    -1,    16,    17,    18,    -1,    -1,    21,    22,    -1,

      24,    25,    26,     1,    28,     3,     4,     5,     6,     7,

       8,     9,    10,    11,    12,    13,    14,    -1,    16,    17,

      18,     1,    -1,    21,    22,    -1,    24,    25,     8,    -1,

      28,    11,    12,    -1,    -1,    -1,    -1,    17,    18,    -1,

      -1,    21,    22,    -1,    24,    25,    -1,     1,    28,     3,

       4,     5,     6,     7,     8,     9,    10,    -1,    -1,    24,

      14,    26,    16,    -1,    -1,    -1,    -1,    -1,    -1,    -1,

      -1,    -1,    26,    27,     1,    40,     3,     4,     5,     6,

       7,     8,     9,    10,    -1,    -1,    13,    14,     1,    16,

       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,

      27,    14,    -1,    16,    17,    18,    -1,    -1,    -1,    -1,

      -1,    24,    25,    26,     1,    -1,     3,     4,     5,     6,

       7,     8,     9,    10,    -1,    -1,    -1,    14,     1,    16,

       3,     4,     5,     6,     7,     8,     9,    10,     1,    26,

       1,    14,    -1,    16,    -1,     8,    -1,     8,    11,    12,

      11,    12,    -1,    26,    17,    18,    17,    18,     1,    -1,

       1,    -1,    25,    -1,    25,     8,    -1,     8,    11,    12,

      11,    12,    -1,    -1,    17,    18,    17,    18,     1,    -1,

       1,    -1,    25,    -1,    25,     8,    -1,     8,    11,    12,

      11,    12,    -1,    -1,    17,    18,    17,    18,     1,    -1,

       1,    -1,    25,    -1,    25,     8,    -1,     8,    11,    12,

      11,    12,    -1,    -1,    17,    18,    17,    18,     1,    -1,

       1,    -1,    25,    -1,    25,     8,    -1,     8,    11,    12,

      11,    12,    -1,    -1,    17,    18,    17,    18,     1,    -1,

       1,    -1,    25,    -1,    25,     8,    -1,     8,    11,    12,

      11,    12,    -1,    -1,    17,    18,    17,    18,     1,    -1,

       1,    -1,    25,    -1,    25,     8,    -1,     8,    11,    12,

      11,    12,    -1,    -1,    17,    18,    17,    18,     1,    -1,

      -1,    -1,    25,     8,    25,     8,    11,    12,    11,    12,

      -1,    -1,    17,    18,    17,    18,    -1,    -1,    -1,    -1,

      25,     1,    25,     3,     4,     5,     6,     7,     8,     9,

      10,    -1,    -1,    13,    14,     1,    16,     3,     4,     5,

       6,     7,     8,     9,    10,    -1,    -1,    13,    14,     1,

      16,     3,     4,     5,     6,     7,     8,     9,    10,    -1,

      -1,    -1,    14,    15,    16,     1,    -1,     3,     4,     5,

       6,     7,     8,     9,    10,    -1,    -1,    13,    14,    -1,

      16

};



/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing

   symbol of state STATE-NUM.  */

static const yytype_uint8 yystos[] =

{

       0,    19,    20,    32,    33,    34,    36,    37,    25,    38,

      39,     0,    33,     1,    25,    26,    35,    40,    41,    28,

      12,    26,    12,    26,     1,    14,    27,    28,    44,     1,

      36,    47,    48,    36,    42,    43,     1,    13,    42,    25,

      27,    35,     1,    17,    35,     1,    47,    29,     1,    40,

      49,    50,    29,    47,    40,    27,    13,    13,    35,    15,

      15,    29,     1,     8,    11,    12,    17,    18,    21,    22,

      24,    25,    44,    45,    46,    51,    26,     3,    26,    27,

      42,    26,     1,    51,     1,    51,     1,    51,     1,    51,

      12,    12,    12,    29,    45,     1,     3,     4,     5,     6,

       7,     8,     9,    10,    14,    16,    24,    26,    51,     1,

      51,    49,    51,     1,     8,    51,    13,    13,    26,     1,

      26,    51,    51,     1,    13,    51,    52,     9,    26,     1,

      51,     1,    51,     1,    51,     1,    51,     1,    51,     1,

      51,     1,    51,     1,    51,     1,    51,    25,    12,    26,

       1,    51,    13,     1,    13,    46,    13,    26,    27,    13,

      51,    51,    15,    26,    15,    51,    46,    46,    52,    13,

      23,    46,    46

};



/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */

static const yytype_uint8 yyr1[] =

{

       0,    31,    32,    33,    33,    34,    34,    34,    34,    35,

      35,    35,    35,    36,    36,    37,    37,    37,    38,    38,

      39,    40,    40,    40,    41,    41,    41,    41,    42,    42,

      43,    44,    44,    45,    45,    46,    46,    46,    46,    46,

      46,    46,    46,    46,    46,    46,    46,    46,    47,    47,

      48,    48,    49,    49,    50,    50,    50,    51,    51,    51,

      51,    51,    51,    51,    51,    51,    51,    51,    51,    51,

      51,    51,    51,    51,    51,    51,    51,    51,    51,    51,

      51,    51,    51,    51,    51,    51,    51,    51,    51,    51,

      51,    51,    51,    51,    51,    52,    52

};



/* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */

static const yytype_uint8 yyr2[] =

{

       0,     2,     1,     0,     2,     3,     2,     3,     3,     1,

       3,     4,     3,     1,     1,     5,     2,     5,     1,     0,

       1,     1,     4,     4,     4,     3,     4,     3,     3,     1,

       2,     4,     3,     2,     0,     2,     1,     3,     5,     7,

       5,     4,     6,     2,     3,     3,     3,     3,     2,     0,

       3,     3,     1,     3,     1,     3,     3,     3,     3,     3,

       3,     3,     3,     3,     3,     3,     2,     2,     4,     3,

       4,     3,     1,     1,     1,     4,     3,     3,     3,     3,

       3,     3,     3,     3,     3,     2,     2,     3,     3,     4,

       4,     3,     4,     4,     4,     3,     1

};





#define yyerrok         (yyerrstatus = 0)

#define yyclearin       (yychar = YYEMPTY)

#define YYEMPTY         (-2)

#define YYEOF           0



#define YYACCEPT        goto yyacceptlab

#define YYABORT         goto yyabortlab

#define YYERROR         goto yyerrorlab





#define YYRECOVERING()  (!!yyerrstatus)



#define YYBACKUP(Token, Value)                                  \
do                                                              \
if (yychar == YYEMPTY)                                        \
{                                                           \
yychar = (Token);                                         \
yylval = (Value);                                         \
YYPOPSTACK(yylen);                                       \
yystate = *yyssp;                                         \
goto yybackup;                                            \
}                                                           \
else                                                          \
{                                                           \
yyerror(YY_("syntax error: cannot back up")); \
YYERROR;                                                  \
}                                                           \
while (0)



/* Error token number */

#define YYTERROR        1

#define YYERRCODE       256





/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].

   If N is 0, then set CURRENT to the empty location which ends

   the previous symbol: RHS[0] (always defined).  */



#ifndef YYLLOC_DEFAULT

# define YYLLOC_DEFAULT(Current, Rhs, N)                                \
    do                                                                  \
        if (N)                                                            \
        {                                                               \
            (Current).first_line = YYRHSLOC(Rhs, 1).first_line;        \
            (Current).first_column = YYRHSLOC(Rhs, 1).first_column;      \
            (Current).last_line = YYRHSLOC(Rhs, N).last_line;         \
            (Current).last_column = YYRHSLOC(Rhs, N).last_column;       \
        }                                                               \
        else                                                              \
       {                                                               \
            (Current).first_line = (Current).last_line = \
            YYRHSLOC(Rhs, 0).last_line;                                \
            (Current).first_column = (Current).last_column = \
            YYRHSLOC(Rhs, 0).last_column;                              \
        }                                                               \
            while (0)

#endif



#define YYRHSLOC(Rhs, K) ((Rhs)[K])





                /* Enable debugging if requested.  */

#if YYDEBUG



# ifndef YYFPRINTF

#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */

#  define YYFPRINTF fprintf

# endif



# define YYDPRINTF(Args)                        \

                do {
                    \

                        if (yydebug)                                  \

                            YYFPRINTF Args;                             \

                } while (0)





                            /* YY_LOCATION_PRINT -- Print the location on the stream.

                               This macro was not mandated originally: define only if we know

                               we won't break user code: when these are the locations we know.  */



#ifndef YY_LOCATION_PRINT

# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL



                               /* Print *YYLOCP on YYO.  Private, do not rely on its existence. */



                            YY_ATTRIBUTE_UNUSED

                            static unsigned

                            yy_location_print_(FILE * yyo, YYLTYPE const* const yylocp)

                        {

                            unsigned res = 0;

                            int end_col = 0 != yylocp->last_column ? yylocp->last_column - 1 : 0;

                            if (0 <= yylocp->first_line)

                            {

                                res += YYFPRINTF(yyo, "%d", yylocp->first_line);

                                if (0 <= yylocp->first_column)

                                    res += YYFPRINTF(yyo, ".%d", yylocp->first_column);

                            }

                            if (0 <= yylocp->last_line)

                            {

                                if (yylocp->first_line < yylocp->last_line)

                                {

                                    res += YYFPRINTF(yyo, "-%d", yylocp->last_line);

                                    if (0 <= end_col)

                                        res += YYFPRINTF(yyo, ".%d", end_col);

                                }

                                else if (0 <= end_col && yylocp->first_column < end_col)

                                    res += YYFPRINTF(yyo, "-%d", end_col);

                            }

                            return res;

                        }



#  define YY_LOCATION_PRINT(File, Loc)          \

                    yy_location_print_(File, &(Loc))



# else

#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)

# endif

#endif





# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \

                            do {
                                \

                                    if (yydebug)                                                            \

                                    {                                                                     \

                                        YYFPRINTF(stderr, "%s ", Title);                                   \

                                        yy_symbol_print(stderr, \

                                            Type, Value, Location); \

                                        YYFPRINTF(stderr, "\n");                                           \

                                    }                                                                     \

                            } while (0)





                                        /*----------------------------------------.

                                        | Print this symbol's value on YYOUTPUT.  |

                                        `----------------------------------------*/



                                        static void

                                        yy_symbol_value_print(FILE * yyoutput, int yytype, YYSTYPE const* const yyvaluep, YYLTYPE const* const yylocationp)

                                    {

                                        FILE* yyo = yyoutput;

                                        YYUSE(yyo);

                                        YYUSE(yylocationp);

                                        if (!yyvaluep)

                                            return;

# ifdef YYPRINT

                                        if (yytype < YYNTOKENS)

                                            YYPRINT(yyoutput, yytoknum[yytype], *yyvaluep);

# endif

                                        YYUSE(yytype);

                                    }





                                /*--------------------------------.

                                | Print this symbol on YYOUTPUT.  |

                                `--------------------------------*/



                                static void

                                    yy_symbol_print(FILE * yyoutput, int yytype, YYSTYPE const* const yyvaluep, YYLTYPE const* const yylocationp)

                                {

                                    YYFPRINTF(yyoutput, "%s %s (",

                                        yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);



                                    YY_LOCATION_PRINT(yyoutput, *yylocationp);

                                    YYFPRINTF(yyoutput, ": ");

                                    yy_symbol_value_print(yyoutput, yytype, yyvaluep, yylocationp);

                                    YYFPRINTF(yyoutput, ")");

                                }



                                /*------------------------------------------------------------------.

                                | yy_stack_print -- Print the state stack from its BOTTOM up to its |

                                | TOP (included).                                                   |

                                `------------------------------------------------------------------*/



                                static void

                                    yy_stack_print(yytype_int16 * yybottom, yytype_int16 * yytop)

                                {

                                    YYFPRINTF(stderr, "Stack now");

                                    for (; yybottom <= yytop; yybottom++)

                                    {

                                        int yybot = *yybottom;

                                        YYFPRINTF(stderr, " %d", yybot);

                                    }

                                    YYFPRINTF(stderr, "\n");

                                }



# define YY_STACK_PRINT(Bottom, Top)                            \

                                do {
                                    \

                                        if (yydebug)                                                  \

                                            yy_stack_print((Bottom), (Top));                           \

                                } while (0)





                                            /*------------------------------------------------.

                                            | Report that the YYRULE is going to be reduced.  |

                                            `------------------------------------------------*/



                                            static void

                                            yy_reduce_print(yytype_int16 * yyssp, YYSTYPE * yyvsp, YYLTYPE * yylsp, int yyrule)

                                        {

                                            unsigned long int yylno = yyrline[yyrule];

                                            int yynrhs = yyr2[yyrule];

                                            int yyi;

                                            YYFPRINTF(stderr, "Reducing stack by rule %d (line %lu):\n",

                                                yyrule - 1, yylno);

                                            /* The symbols being reduced.  */

                                            for (yyi = 0; yyi < yynrhs; yyi++)

                                            {

                                                YYFPRINTF(stderr, "   $%d = ", yyi + 1);

                                                yy_symbol_print(stderr,

                                                    yystos[yyssp[yyi + 1 - yynrhs]],

                                                    &(yyvsp[(yyi + 1) - (yynrhs)])

                                                    , &(yylsp[(yyi + 1) - (yynrhs)]));

                                                YYFPRINTF(stderr, "\n");

                                            }

                                        }



# define YY_REDUCE_PRINT(Rule)          \

                                    do {
                                        \

                                            if (yydebug)                          \

                                                yy_reduce_print(yyssp, yyvsp, yylsp, Rule); \

                                    } while (0)



                                                /* Nonzero means print parse trace.  It is left uninitialized so that

                                                   multiple parsers can coexist.  */

                                                int yydebug;

#else /* !YYDEBUG */

# define YYDPRINTF(Args)

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)

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





#if YYERROR_VERBOSE



# ifndef yystrlen

#  if defined __GLIBC__ && defined _STRING_H

#   define yystrlen strlen

#  else

   /* Return the length of YYSTR.  */

                static YYSIZE_T

                yystrlen(const char* yystr)

            {

                YYSIZE_T yylen;

                for (yylen = 0; yystr[yylen]; yylen++)

                    continue;

                return yylen;

            }

#  endif

# endif



# ifndef yystpcpy

#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE

#   define yystpcpy stpcpy

#  else

/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in

   YYDEST.  */

static char*

yystpcpy(char* yydest, const char* yysrc)

{

    char* yyd = yydest;

    const char* yys = yysrc;



    while ((*yyd++ = *yys++) != '\0')

        continue;



    return yyd - 1;

}

#  endif

# endif



# ifndef yytnamerr

/* Copy to YYRES the contents of YYSTR after stripping away unnecessary

   quotes and backslashes, so that it's suitable for yyerror.  The

   heuristic is that double-quoting is unnecessary unless the string

   contains an apostrophe, a comma, or backslash (other than

   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is

   null, do not copy; instead, return the length of what the result

   would have been.  */

static YYSIZE_T

yytnamerr(char* yyres, const char* yystr)

{

    if (*yystr == '"')

    {

        YYSIZE_T yyn = 0;

        char const* yyp = yystr;



        for (;;)

            switch (*++yyp)

            {

            case '\'':

            case ',':

                goto do_not_strip_quotes;



            case '\\':

                if (*++yyp != '\\')

                    goto do_not_strip_quotes;

                /* Fall through.  */

            default:

                if (yyres)

                    yyres[yyn] = *yyp;

                yyn++;

                break;



            case '"':

                if (yyres)

                    yyres[yyn] = '\0';

                return yyn;

            }

    do_not_strip_quotes:;

    }



    if (!yyres)

        return yystrlen(yystr);



    return yystpcpy(yyres, yystr) - yyres;

}

# endif



/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message

   about the unexpected token YYTOKEN for the state stack whose top is

   YYSSP.



   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is

   not large enough to hold the message.  In that case, also set

   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the

   required number of bytes is too large to store.  */

static int

yysyntax_error(YYSIZE_T * yymsg_alloc, char** yymsg,

    yytype_int16 * yyssp, int yytoken)

{

    YYSIZE_T yysize0 = yytnamerr(YY_NULLPTR, yytname[yytoken]);

    YYSIZE_T yysize = yysize0;

    enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };

    /* Internationalized format string. */

    const char* yyformat = YY_NULLPTR;

    /* Arguments of yyformat. */

    char const* yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];

    /* Number of reported tokens (one for the "unexpected", one per

       "expected"). */

    int yycount = 0;



    /* There are many possibilities here to consider:

       - If this state is a consistent state with a default action, then

         the only way this function was invoked is if the default action

         is an error action.  In that case, don't check for expected

         tokens because there are none.

       - The only way there can be no lookahead present (in yychar) is if

         this state is a consistent state with a default action.  Thus,

         detecting the absence of a lookahead is sufficient to determine

         that there is no unexpected or expected token to report.  In that

         case, just report a simple "syntax error".

       - Don't assume there isn't a lookahead just because this state is a

         consistent state with a default action.  There might have been a

         previous inconsistent state, consistent state with a non-default

         action, or user semantic action that manipulated yychar.

       - Of course, the expected token list depends on states to have

         correct lookahead information, and it depends on the parser not

         to perform extra reductions after fetching a lookahead from the

         scanner and before detecting a syntax error.  Thus, state merging

         (from LALR or IELR) and default reductions corrupt the expected

         token list.  However, the list is correct for canonical LR with

         one exception: it will still contain any token that will not be

         accepted due to an error action in a later state.

    */

    if (yytoken != YYEMPTY)

    {

        int yyn = yypact[*yyssp];

        yyarg[yycount++] = yytname[yytoken];

        if (!yypact_value_is_default(yyn))

        {

            /* Start YYX at -YYN if negative to avoid negative indexes in

               YYCHECK.  In other words, skip the first -YYN actions for

               this state because they are default actions.  */

            int yyxbegin = yyn < 0 ? -yyn : 0;

            /* Stay within bounds of both yycheck and yytname.  */

            int yychecklim = YYLAST - yyn + 1;

            int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;

            int yyx;



            for (yyx = yyxbegin; yyx < yyxend; ++yyx)

                if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR

                    && !yytable_value_is_error(yytable[yyx + yyn]))

                {

                    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)

                    {

                        yycount = 1;

                        yysize = yysize0;

                        break;

                    }

                    yyarg[yycount++] = yytname[yyx];

                    {

                        YYSIZE_T yysize1 = yysize + yytnamerr(YY_NULLPTR, yytname[yyx]);

                        if (!(yysize <= yysize1

                            && yysize1 <= YYSTACK_ALLOC_MAXIMUM))

                            return 2;

                        yysize = yysize1;

                    }

                }

        }

    }



    switch (yycount)

    {

# define YYCASE_(N, S)                      \

    case N:                               \

        yyformat = S;                       \

        break

        YYCASE_(0, YY_("syntax error"));

        YYCASE_(1, YY_("syntax error, unexpected %s"));

        YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));

        YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));

        YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));

        YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));

# undef YYCASE_

    }



    {

        YYSIZE_T yysize1 = yysize + yystrlen(yyformat);

        if (!(yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))

            return 2;

        yysize = yysize1;

    }



    if (*yymsg_alloc < yysize)

    {

        *yymsg_alloc = 2 * yysize;

        if (!(yysize <= *yymsg_alloc

            && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))

            *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;

        return 1;

    }



    /* Avoid sprintf, as that infringes on the user's name space.

       Don't have undefined behavior even if the translation

       produced a string with the wrong number of "%s"s.  */

    {

        char* yyp = *yymsg;

        int yyi = 0;

        while ((*yyp = *yyformat) != '\0')

            if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)

            {

                yyp += yytnamerr(yyp, yyarg[yyi++]);

                yyformat += 2;

            }

            else

            {

                yyp++;

                yyformat++;

            }

    }

    return 0;

}

#endif /* YYERROR_VERBOSE */



/*-----------------------------------------------.

| Release the memory associated to this symbol.  |

`-----------------------------------------------*/



static void

yydestruct(const char* yymsg, int yytype, YYSTYPE * yyvaluep, YYLTYPE * yylocationp)

{

    YYUSE(yyvaluep);

    YYUSE(yylocationp);

    if (!yymsg)

        yymsg = "Deleting";

    YY_SYMBOL_PRINT(yymsg, yytype, yyvaluep, yylocationp);



    YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN

        YYUSE(yytype);

    YY_IGNORE_MAYBE_UNINITIALIZED_END

}









/* The lookahead symbol.  */

int yychar;



/* The semantic value of the lookahead symbol.  */

YYSTYPE yylval;

/* Location data for the lookahead symbol.  */

YYLTYPE yylloc

# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL

= { 1, 1, 1, 1 }

# endif

;

/* Number of syntax errors so far.  */

int yynerrs;





/*----------.

| yyparse.  |

`----------*/



int

yyparse(void)

{

    int yystate;

    /* Number of tokens to shift before error messages enabled.  */

    int yyerrstatus;



    /* The stacks and their tools:

       'yyss': related to states.

       'yyvs': related to semantic values.

       'yyls': related to locations.



       Refer to the stacks through separate pointers, to allow yyoverflow

       to reallocate them elsewhere.  */



       /* The state stack.  */

    yytype_int16 yyssa[YYINITDEPTH];

    yytype_int16* yyss;

    yytype_int16* yyssp;



    /* The semantic value stack.  */

    YYSTYPE yyvsa[YYINITDEPTH];

    YYSTYPE* yyvs;

    YYSTYPE* yyvsp;



    /* The location stack.  */

    YYLTYPE yylsa[YYINITDEPTH];

    YYLTYPE* yyls;

    YYLTYPE* yylsp;



    /* The locations where the error started and ended.  */

    YYLTYPE yyerror_range[3];



    YYSIZE_T yystacksize;



    int yyn;

    int yyresult;

    /* Lookahead token as an internal (translated) token number.  */

    int yytoken = 0;

    /* The variables used to return semantic value and location from the

       action routines.  */

    YYSTYPE yyval;

    YYLTYPE yyloc;



#if YYERROR_VERBOSE

    /* Buffer for error messages, and its allocated size.  */

    char yymsgbuf[128];

    char* yymsg = yymsgbuf;

    YYSIZE_T yymsg_alloc = sizeof yymsgbuf;

#endif



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N), yylsp -= (N))



    /* The number of symbols on the RHS of the reduced rule.

       Keep to zero when no symbol should be popped.  */

    int yylen = 0;



    yyssp = yyss = yyssa;

    yyvsp = yyvs = yyvsa;

    yylsp = yyls = yylsa;

    yystacksize = YYINITDEPTH;



    YYDPRINTF((stderr, "Starting parse\n"));



    yystate = 0;

    yyerrstatus = 0;

    yynerrs = 0;

    yychar = YYEMPTY; /* Cause a token to be read.  */

    yylsp[0] = yylloc;

    goto yysetstate;



    /*------------------------------------------------------------.

    | yynewstate -- Push a new state, which is found in yystate.  |

    `------------------------------------------------------------*/

yynewstate:

    /* In all cases, when you get here, the value and location stacks

       have just been pushed.  So pushing a state here evens the stacks.  */

    yyssp++;



yysetstate:

    *yyssp = yystate;



    if (yyss + yystacksize - 1 <= yyssp)

    {

        /* Get the current used size of the three stacks, in elements.  */

        YYSIZE_T yysize = yyssp - yyss + 1;



#ifdef yyoverflow

        {

            /* Give user a chance to reallocate the stack.  Use copies of

               these so that the &'s don't force the real ones into

               memory.  */

            YYSTYPE* yyvs1 = yyvs;

            yytype_int16* yyss1 = yyss;

            YYLTYPE* yyls1 = yyls;



            /* Each stack pointer address is followed by the size of the

               data in use in that stack, in bytes.  This used to be a

               conditional around just the two extra args, but that might

               be undefined if yyoverflow is a macro.  */

            yyoverflow(YY_("memory exhausted"),

                &yyss1, yysize * sizeof(*yyssp),

                &yyvs1, yysize * sizeof(*yyvsp),

                &yyls1, yysize * sizeof(*yylsp),

                &yystacksize);



            yyls = yyls1;

            yyss = yyss1;

            yyvs = yyvs1;

        }

#else /* no yyoverflow */

# ifndef YYSTACK_RELOCATE

        goto yyexhaustedlab;

# else

        /* Extend the stack our own way.  */

        if (YYMAXDEPTH <= yystacksize)

            goto yyexhaustedlab;

        yystacksize *= 2;

        if (YYMAXDEPTH < yystacksize)

            yystacksize = YYMAXDEPTH;



        {

            yytype_int16* yyss1 = yyss;

            union yyalloc* yyptr =

                (union yyalloc*)YYSTACK_ALLOC(YYSTACK_BYTES(yystacksize));

            if (!yyptr)

                goto yyexhaustedlab;

            YYSTACK_RELOCATE(yyss_alloc, yyss);

            YYSTACK_RELOCATE(yyvs_alloc, yyvs);

            YYSTACK_RELOCATE(yyls_alloc, yyls);

#  undef YYSTACK_RELOCATE

            if (yyss1 != yyssa)

                YYSTACK_FREE(yyss1);

        }

# endif

#endif /* no yyoverflow */



        yyssp = yyss + yysize - 1;

        yyvsp = yyvs + yysize - 1;

        yylsp = yyls + yysize - 1;



        YYDPRINTF((stderr, "Stack size increased to %lu\n",

            (unsigned long int) yystacksize));



        if (yyss + yystacksize - 1 <= yyssp)

            YYABORT;

    }



    YYDPRINTF((stderr, "Entering state %d\n", yystate));



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

    if (yypact_value_is_default(yyn))

        goto yydefault;



    /* Not known => get a lookahead token if don't already have one.  */



    /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */

    if (yychar == YYEMPTY)

    {

        YYDPRINTF((stderr, "Reading a token: "));

        yychar = yylex();

    }



    if (yychar <= YYEOF)

    {

        yychar = yytoken = YYEOF;

        YYDPRINTF((stderr, "Now at end of input.\n"));

    }

    else

    {

        yytoken = YYTRANSLATE(yychar);

        YY_SYMBOL_PRINT("Next token is", yytoken, &yylval, &yylloc);

    }



    /* If the proper action on seeing token YYTOKEN is to reduce or to

       detect an error, take that action.  */

    yyn += yytoken;

    if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)

        goto yydefault;

    yyn = yytable[yyn];

    if (yyn <= 0)

    {

        if (yytable_value_is_error(yyn))

            goto yyerrlab;

        yyn = -yyn;

        goto yyreduce;

    }



    /* Count tokens shifted since error; after three, turn off error

       status.  */

    if (yyerrstatus)

        yyerrstatus--;



    /* Shift the lookahead token.  */

    YY_SYMBOL_PRINT("Shifting", yytoken, &yylval, &yylloc);



    /* Discard the shifted token.  */

    yychar = YYEMPTY;



    yystate = yyn;

    YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN

        * ++yyvsp = yylval;

    YY_IGNORE_MAYBE_UNINITIALIZED_END

        * ++yylsp = yylloc;

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

    | yyreduce -- Do a reduction.  |

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

    yyval = yyvsp[1 - yylen];



    /* Default location.  */

    YYLLOC_DEFAULT(yyloc, (yylsp - yylen), yylen);

    YY_REDUCE_PRINT(yyn);

    switch (yyn)

    {

    case 2:

#line 41 "syntax.y" /* yacc.c:1646  */

    {root = createNode("Program", Gu, 1, (yylsp[0]).first_line, (yyvsp[0].node)); }

#line 1620 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 3:

#line 45 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("ExtDefList", Null, 1); }

#line 1626 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 4:

#line 46 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("ExtDefList", Gu, 2, 2, (yylsp[-1]).first_line, (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1632 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 5:

#line 49 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("ExtDef", Gu, 1, 3, (yylsp[-2]).first_line, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1638 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 6:

#line 50 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("ExtDef", Gu, 2, 2, (yylsp[-1]).first_line, (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1644 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 7:

#line 51 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("ExtDef", Gu, 3, 3, (yylsp[-2]).first_line, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1650 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 8:

#line 54 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid Definition. Specifier error SEMI", (yylsp[-1]).first_line); yyerrok; }

#line 1656 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 9:

#line 58 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("ExtDecList", Gu, 1, 1, (yylsp[0]).first_line, (yyvsp[0].node)); }

#line 1662 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 10:

#line 59 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("ExtDecList", Gu, 2, 3, (yylsp[-2]).first_line, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1668 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 11:

#line 60 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid varbose' VarDec error ExtDecList", (yylsp[-2]).first_line); yyerrok; }

#line 1674 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 12:

#line 61 "syntax.y" /* yacc.c:1646  */

    {yyerror("Missing \',\' VarDec error ExtDecList", (yylsp[-1]).first_line); yyerrok; }

#line 1680 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 13:

#line 65 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Specifier", Gu, 1, 1, (yylsp[0]).first_line, (yyvsp[0].node)); }

#line 1686 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 14:

#line 66 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Specifier", Gu, 1, 1, (yylsp[0]).first_line, (yyvsp[0].node)); }

#line 1692 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 15:

#line 69 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("StructSpecifier", Gu, 1, 5, (yylsp[-4]).first_line, (yyvsp[-4].node), (yyvsp[-3].node), (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1698 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 16:

#line 70 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("StructSpecifier", Gu, 2, 2, (yylsp[-1]).first_line, (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1704 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 17:

#line 71 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid struct define", (yylsp[-3]).first_line); yyerrok; }

#line 1710 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 18:

#line 74 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("OptTag", Gu, 1, 1, (yylsp[0]).first_line, (yyvsp[0].node)); }

#line 1716 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 19:

#line 75 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("OptTag", Null, 2); }

#line 1722 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 20:

#line 78 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Tag", Gu, 1, 1, (yylsp[0]).first_line, (yyvsp[0].node)); }

#line 1728 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 21:

#line 83 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("VarDec", Gu, 1, 1, (yylsp[0]).first_line, (yyvsp[0].node)); }

#line 1734 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 22:

#line 84 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("VarDec", Gu, 2, 4, (yylsp[-3]).first_line, (yyvsp[-3].node), (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1740 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 23:

#line 86 "syntax.y" /* yacc.c:1646  */

    {yyerror("Missing INT VarDec LB error RB", (yylsp[-1]).first_line); yyerrok; }

#line 1746 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 24:

#line 91 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("FunDec", Gu, 1, 4, (yylsp[-3]).first_line, (yyvsp[-3].node), (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1752 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 25:

#line 92 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("FunDec", Gu, 2, 3, (yylsp[-2]).first_line, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1758 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 26:

#line 95 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid argument(s)", (yylsp[-1]).first_line); yyerrok; }

#line 1764 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 27:

#line 97 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid function name", (yylsp[-2]).first_line); yyerrok; }

#line 1770 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 28:

#line 101 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("VarList", Gu, 1, 3, (yylsp[-2]).first_line, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1776 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 29:

#line 102 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("VarList", Gu, 2, 1, (yylsp[0]).first_line, (yyvsp[0].node)); }

#line 1782 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 30:

#line 106 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("ParamDec", Gu, 1, 2, (yylsp[-1]).first_line, (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1788 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 31:

#line 111 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("CompSt", Gu, 1, 4, (yylsp[-3]).first_line, (yyvsp[-3].node), (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1794 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 32:

#line 113 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid statement(s)", (yylsp[-2]).first_line); yyerrok; }

#line 1800 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 33:

#line 116 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("StmtList", Gu, 1, 2, (yylsp[-1]).first_line, (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1806 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 34:

#line 117 "syntax.y" /* yacc.c:1646  */

    { {(yyval.node) = createNode("StmtList", Null, 2); }}

#line 1812 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 35:

#line 122 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Stmt", Gu, 1, 2, (yylsp[-1]).first_line, (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1818 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 36:

#line 123 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Stmt", Gu, 2, 1, (yylsp[0]).first_line, (yyvsp[0].node)); }

#line 1824 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 37:

#line 124 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Stmt", Gu, 3, 3, (yylsp[-2]).first_line, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1830 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 38:

#line 126 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Stmt", Gu, 4, 5, (yylsp[-4]).first_line, (yyvsp[-4].node), (yyvsp[-3].node), (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1836 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 39:

#line 127 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Stmt", Gu, 5, 7, (yylsp[-6]).first_line, (yyvsp[-6].node), (yyvsp[-5].node), (yyvsp[-4].node), (yyvsp[-3].node), (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1842 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 40:

#line 128 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Stmt", Gu, 6, 5, (yylsp[-4]).first_line, (yyvsp[-4].node), (yyvsp[-3].node), (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1848 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 41:

#line 129 "syntax.y" /* yacc.c:1646  */

    {yyerror("syntex error", (yylsp[-1]).first_line); yyerror("Missing \')\'", (yylsp[-1]).last_line); yyerrok; }

#line 1854 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 42:

#line 130 "syntax.y" /* yacc.c:1646  */

    {yyerror("syntex error", (yylsp[-5]).last_line); yyerror("Missing \';\' Exp WHILE LP Exp RP Stmt"); yyerrok; }

#line 1860 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 43:

#line 132 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid expression or Definition after statement error SEMI", (yylsp[-1]).first_line); yyerrok; }

#line 1866 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 44:

#line 134 "syntax.y" /* yacc.c:1646  */

    {yyerror("syntax error", (yylsp[-2]).first_line); yyerror("Invalid statement Exp error SEMI", (yylsp[-2]).first_line); yyerrok; }

#line 1872 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 45:

#line 135 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid statement Exp error SEMI", (yylsp[-2]).first_line); yyerrok; }

#line 1878 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 46:

#line 138 "syntax.y" /* yacc.c:1646  */

    {yyerror("Missing \';\' RETURN Exp error", (yylsp[0]).first_line); yyerrok; }

#line 1884 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 47:

#line 139 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid return value", (yylsp[-1]).first_line); }

#line 1890 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 48:

#line 143 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("DefList", Gu, 1, 2, (yylsp[-1]).first_line, (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1896 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 49:

#line 144 "syntax.y" /* yacc.c:1646  */

    { {(yyval.node) = createNode("DefList", Null, 2); }}

#line 1902 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 50:

#line 146 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Def", Gu, 1, 3, (yylsp[-2]).first_line, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1908 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 51:

#line 147 "syntax.y" /* yacc.c:1646  */

    {yyerror("Missing ID", (yylsp[-1]).first_line); }

#line 1914 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 52:

#line 151 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("DecList", Gu, 1, 1, (yylsp[0]).first_line, (yyvsp[0].node)); }

#line 1920 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 53:

#line 152 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("DecList", Gu, 2, 3, (yylsp[-2]).first_line, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1926 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 54:

#line 156 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Dec", Gu, 1, 1, (yylsp[0]).first_line, (yyvsp[0].node)); }

#line 1932 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 55:

#line 157 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Dec", Gu, 2, 3, (yylsp[-2]).first_line, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1938 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 56:

#line 158 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid expression", (yylsp[0]).first_line); yyerrok; }

#line 1944 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 57:

#line 162 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Exp", Gu, 1, 3, (yylsp[-2]).first_line, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1950 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 58:

#line 163 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Exp", Gu, 2, 3, (yylsp[-2]).first_line, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1956 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 59:

#line 164 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Exp", Gu, 3, 3, (yylsp[-2]).first_line, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1962 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 60:

#line 165 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Exp", Gu, 4, 3, (yylsp[-2]).first_line, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1968 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 61:

#line 168 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Exp", Gu, 5, 3, (yylsp[-2]).first_line, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1974 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 62:

#line 169 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Exp", Gu, 6, 3, (yylsp[-2]).first_line, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1980 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 63:

#line 170 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Exp", Gu, 7, 3, (yylsp[-2]).first_line, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1986 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 64:

#line 171 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Exp", Gu, 8, 3, (yylsp[-2]).first_line, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1992 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 65:

#line 172 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Exp", Gu, 9, 3, (yylsp[-2]).first_line, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 1998 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 66:

#line 173 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Exp", Gu, 10, 2, (yylsp[-1]).first_line, (yyvsp[-1].node), (yyvsp[0].node)); }

#line 2004 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 67:

#line 174 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Exp", Gu, 11, 2, (yylsp[-1]).first_line, (yyvsp[-1].node), (yyvsp[0].node)); }

#line 2010 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 68:

#line 175 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Exp", Gu, 12, 4, (yylsp[-3]).first_line, (yyvsp[-3].node), (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 2016 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 69:

#line 176 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Exp", Gu, 13, 3, (yylsp[-2]).first_line, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 2022 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 70:

#line 177 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Exp", Gu, 14, 4, (yylsp[-3]).first_line, (yyvsp[-3].node), (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 2028 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 71:

#line 178 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Exp", Gu, 15, 3, (yylsp[-2]).first_line, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 2034 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 72:

#line 179 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Exp", Gu, 16, 1, (yylsp[0]).first_line, (yyvsp[0].node)); }

#line 2040 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 73:

#line 180 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Exp", Gu, 17, 1, (yylsp[0]).first_line, (yyvsp[0].node)); }

#line 2046 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 74:

#line 181 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Exp", Gu, 18, 1, (yylsp[0]).first_line, (yyvsp[0].node)); }

#line 2052 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 75:

#line 182 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid expression", (yylsp[-1]).first_line); yyerrok; }

#line 2058 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 76:

#line 183 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid expression", (yylsp[0]).first_line); yyerrok; }

#line 2064 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 77:

#line 184 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid expression", (yylsp[0]).first_line); yyerrok; }

#line 2070 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 78:

#line 185 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid expression", (yylsp[0]).first_line); yyerrok; }

#line 2076 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 79:

#line 186 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid expression Exp RELOP error", (yylsp[0]).first_line); yyerrok; }

#line 2082 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 80:

#line 187 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid expression Exp PLUS error", (yylsp[0]).first_line); yyerrok; }

#line 2088 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 81:

#line 188 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid expression", (yylsp[0]).first_line); yyerrok; }

#line 2094 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 82:

#line 189 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid expression", (yylsp[0]).first_line); yyerrok; }

#line 2100 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 83:

#line 190 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid expression", (yylsp[0]).first_line); yyerrok; }

#line 2106 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 84:

#line 192 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid expression", (yylsp[-1]).first_line); }

#line 2112 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 85:

#line 193 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid expression", (yylsp[0]).first_line); yyerrok; }

#line 2118 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 86:

#line 194 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid expression", (yylsp[0]).first_line); yyerrok; }

#line 2124 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 87:

#line 195 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid expression", (yylsp[-1]).first_line); yyerrok; }

#line 2130 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 88:

#line 196 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid expression NOT error Exp", (yylsp[-1]).first_line); yyerrok; }

#line 2136 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 89:

#line 197 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid argument(s)", (yylsp[-1]).first_line); yyerrok; }

#line 2142 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 90:

#line 198 "syntax.y" /* yacc.c:1646  */

    {yyerror("Missing \')\'", (yylsp[-1]).first_line); ignore_line = (yylsp[-1]).first_line; }

#line 2148 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 91:

#line 199 "syntax.y" /* yacc.c:1646  */

    {yyerror("Missing \')\'", (yylsp[0]).first_line); }

#line 2154 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 92:

#line 200 "syntax.y" /* yacc.c:1646  */

    {yyerror("Missing \']\' Exp LB error RB", (yylsp[-1]).first_line); }

#line 2160 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 93:

#line 201 "syntax.y" /* yacc.c:1646  */

    {yyerror("Missing \']\' Exp LB error SEMI", (yylsp[-1]).first_line); ignore_line = (yylsp[-1]).first_line; }

#line 2166 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 94:

#line 202 "syntax.y" /* yacc.c:1646  */

    {yyerror("Invalid expression' Exp error STAR Exp", (yylsp[-1]).first_line); }

#line 2172 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 95:

#line 205 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Args", Gu, 1, 3, (yylsp[-2]).first_line, (yyvsp[-2].node), (yyvsp[-1].node), (yyvsp[0].node)); }

#line 2178 "syntax.tab.c" /* yacc.c:1646  */

    break;



    case 96:

#line 206 "syntax.y" /* yacc.c:1646  */

    {(yyval.node) = createNode("Args", Gu, 2, 1, (yylsp[0]).first_line, (yyvsp[0].node)); }

#line 2184 "syntax.tab.c" /* yacc.c:1646  */

    break;





#line 2188 "syntax.tab.c" /* yacc.c:1646  */

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

    YY_SYMBOL_PRINT("-> $$ =", yyr1[yyn], &yyval, &yyloc);



    YYPOPSTACK(yylen);

    yylen = 0;

    YY_STACK_PRINT(yyss, yyssp);



    *++yyvsp = yyval;

    *++yylsp = yyloc;



    /* Now 'shift' the result of the reduction.  Determine what state

       that goes to, based on the state we popped back to and the rule

       number reduced by.  */



    yyn = yyr1[yyn];



    yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;

    if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)

        yystate = yytable[yystate];

    else

        yystate = yydefgoto[yyn - YYNTOKENS];



    goto yynewstate;





    /*--------------------------------------.

    | yyerrlab -- here on detecting error.  |

    `--------------------------------------*/

yyerrlab:

    /* Make sure we have latest lookahead translation.  See comments at

       user semantic actions for why this is necessary.  */

    yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE(yychar);



    /* If not already recovering from an error, report this error.  */

    if (!yyerrstatus)

    {

        ++yynerrs;

#if ! YYERROR_VERBOSE

        yyerror(YY_("syntax error"));

#else

# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
        yyssp, yytoken)
        {
            char const* yymsgp = YY_("syntax error");

            int yysyntax_error_status;

            yysyntax_error_status = YYSYNTAX_ERROR;

            if (yysyntax_error_status == 0)

                yymsgp = yymsg;

            else if (yysyntax_error_status == 1)

            {

                if (yymsg != yymsgbuf)

                    YYSTACK_FREE(yymsg);

                yymsg = (char*)YYSTACK_ALLOC(yymsg_alloc);

                if (!yymsg)

                {

                    yymsg = yymsgbuf;

                    yymsg_alloc = sizeof yymsgbuf;

                    yysyntax_error_status = 2;

                }

                else

                {

                    yysyntax_error_status = YYSYNTAX_ERROR;

                    yymsgp = yymsg;

                }

            }

            yyerror(yymsgp);

            if (yysyntax_error_status == 2)

                goto yyexhaustedlab;

        }

# undef YYSYNTAX_ERROR

#endif

    }



    yyerror_range[1] = yylloc;



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

            yydestruct("Error: discarding",

                yytoken, &yylval, &yylloc);

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



    /* Pacify compilers like GCC when the user code never invokes

       YYERROR and the label yyerrorlab therefore never appears in user

       code.  */

    if (/*CONSTCOND*/ 0)

        goto yyerrorlab;



    yyerror_range[1] = yylsp[1 - yylen];

    /* Do not reclaim the symbols of the rule whose action triggered

       this YYERROR.  */

    YYPOPSTACK(yylen);

    yylen = 0;

    YY_STACK_PRINT(yyss, yyssp);

    yystate = *yyssp;

    goto yyerrlab1;





    /*-------------------------------------------------------------.

    | yyerrlab1 -- common code for both syntax error and YYERROR.  |

    `-------------------------------------------------------------*/

yyerrlab1:

    yyerrstatus = 3;      /* Each real token shifted decrements this.  */



    for (;;)

    {

        yyn = yypact[yystate];

        if (!yypact_value_is_default(yyn))

        {

            yyn += YYTERROR;

            if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)

            {

                yyn = yytable[yyn];

                if (0 < yyn)

                    break;

            }

        }



        /* Pop the current state because it cannot handle the error token.  */

        if (yyssp == yyss)

            YYABORT;



        yyerror_range[1] = *yylsp;

        yydestruct("Error: popping",

            yystos[yystate], yyvsp, yylsp);

        YYPOPSTACK(1);

        yystate = *yyssp;

        YY_STACK_PRINT(yyss, yyssp);

    }



    YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN

        * ++yyvsp = yylval;

    YY_IGNORE_MAYBE_UNINITIALIZED_END



        yyerror_range[2] = yylloc;

    /* Using YYLLOC is tempting, but would change the location of

       the lookahead.  YYLOC is available though.  */

    YYLLOC_DEFAULT(yyloc, yyerror_range, 2);

    *++yylsp = yyloc;



    /* Shift the error token.  */

    YY_SYMBOL_PRINT("Shifting", yystos[yyn], yyvsp, yylsp);



    yystate = yyn;

    goto yynewstate;





    /*-------------------------------------.

    | yyacceptlab -- YYACCEPT comes here.  |

    `-------------------------------------*/

yyacceptlab:

    yyresult = 0;

    goto yyreturn;



    /*-----------------------------------.

    | yyabortlab -- YYABORT comes here.  |

    `-----------------------------------*/

yyabortlab:

    yyresult = 1;

    goto yyreturn;



#if !defined yyoverflow || YYERROR_VERBOSE

    /*-------------------------------------------------.

    | yyexhaustedlab -- memory exhaustion comes here.  |

    `-------------------------------------------------*/

yyexhaustedlab:

    yyerror(YY_("memory exhausted"));

    yyresult = 2;

    /* Fall through.  */

#endif



yyreturn:

    if (yychar != YYEMPTY)

    {

        /* Make sure we have latest lookahead translation.  See comments at

           user semantic actions for why this is necessary.  */

        yytoken = YYTRANSLATE(yychar);

        yydestruct("Cleanup: discarding lookahead",

            yytoken, &yylval, &yylloc);

    }

    /* Do not reclaim the symbols of the rule whose action triggered

       this YYABORT or YYACCEPT.  */

    YYPOPSTACK(yylen);

    YY_STACK_PRINT(yyss, yyssp);

    while (yyssp != yyss)

    {

        yydestruct("Cleanup: popping",

            yystos[*yyssp], yyvsp, yylsp);

        YYPOPSTACK(1);

    }

#ifndef yyoverflow

    if (yyss != yyssa)

        YYSTACK_FREE(yyss);

#endif

#if YYERROR_VERBOSE

    if (yymsg != yymsgbuf)

        YYSTACK_FREE(yymsg);

#endif

    return yyresult;

}

#line 209 "syntax.y" /* yacc.c:1906  */



#include "lex.yy.c"



int yyerror(const char* s, ...)

{

    correct = 0;

    va_list paramList;

    va_start(paramList, s);

    int line_num = va_arg(paramList, int);

    if (s[0] == 's' && s[1] == 'y')

    {

        if (line_num)

            printf("Error type B at Line %d: %s", line_num, s);

        else printf("Error type B at Line %d: %s", yylineno, s);

        syserr++;

    }

    else

    {

        printf(" %s.\n", s);

        defined_err++;

    }

    return 0;

}
