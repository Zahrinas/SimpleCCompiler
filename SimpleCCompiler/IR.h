#pragma once
#include <string>
#include <vector>

#include "base.h"
#include "AST.h"

struct binding {
    variable var;
    int loc;

    binding(variable v, int l);
};

struct IR_funct {
    bool defined;
    dataType returnType;
    std::string name;
    std::vector<binding> bind;
    std::vector<std::string> body;
};

struct IRdata_LLVM {
    std::string source_filename;
    std::string datalayout;
    std::string triple;

    std::vector<datum> globals;
    std::vector<IR_funct> functs;

    void parseAST(AST ast);
    void getGlobalsFrom(AST ast);
    void getFunctsFrom(AST ast);

    IR_funct parseFunct(AST ast);
    datum parseSequence(IR_funct &fun, AST ast);

    void printIR(std::string filename);
};

IRdata_LLVM ast2ir(AST ast);