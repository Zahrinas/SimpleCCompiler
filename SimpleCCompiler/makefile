CPP      = clang++
CC       = clang
OBJ      = AST.o base.o IR.o main.o lex.yy.o yacc.tab.o
LINKOBJ  = AST.o base.o IR.o main.o lex.yy.o yacc.tab.o
BIN      = gen
CXXFLAGS = $(CXXINCS) -m64 -Wall -g3
CFLAGS   = $(INCS) -m64 -Wall -g3
RM       = rm

.PHONY: all all-before all-after clean clean-custom

all: all-before $(BIN) all-after

clean: clean-custom
	${RM} $(OBJ) $(BIN)

$(BIN): $(OBJ)
	$(CPP) $(LINKOBJ) -o $(BIN) $(LIBS)

AST.o: AST.cpp
	$(CPP) -c AST.cpp -o AST.o $(CXXFLAGS)

base.o: base.cpp
	$(CPP) -c base.cpp -o base.o $(CXXFLAGS)

IR.o: IR.cpp
	$(CPP) -c IR.cpp -o IR.o $(CXXFLAGS)

main.o: main.cpp
	$(CPP) -c main.cpp -o main.o $(CXXFLAGS)

lex.yy.o: lex.yy.c
	$(CPP) -c lex.yy.c -o lex.yy.o $(CXXFLAGS)

yacc.tab.o: yacc.tab.c
	$(CPP) -c yacc.tab.c -o yacc.tab.o $(CXXFLAGS)