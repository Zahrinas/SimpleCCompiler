#pragma once
#include <string>
#include <vector>

#include "base.h"
#include "AST.h"

struct binding {
	AST_node v;
	std::string name;

	binding(AST_node v, std::string n);
};

struct IR_funct {
	dataType type;
	std::string name;
	std::vector<binding> bind;
	std::vector<std::string> body;

	std::string toLLVM_type();
};

struct IRdata_LLVM {
	std::string source_filename;
	std::string datalayout;
	std::string triple;

	std::vector<bool> constant;
	std::vector<AST_node> globals;
	std::vector<IR_funct> functs;

	void parseAST(AST ast);
	void getGlobalsFrom(AST ast);
	void getFunctsFrom(AST ast);

	IR_funct parseFunct(AST ast);
	datum parseSequence(IR_funct& fun, AST ast);

	std::string getVarType(IR_funct& fun, AST_node v);
	std::string getVarId(IR_funct& fun, AST_node v);
	void printIR(std::string filename);
};

IRdata_LLVM ast2ir(AST ast);