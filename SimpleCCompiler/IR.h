#pragma once
#include <string>
#include <vector>
#include <map>

#include "base.h"
#include "ast.h"

enum class ExpType {
	constant, variable, voidtype
};

struct Expression {
	std::string type;
	std::string value;

	Expression(std::string t, std::string v);
	int bits();
};

struct binding {
	std::string type;
	std::string name;
	std::string ptr;
	std::string IRname;

	binding(std::string type, std::string name, std::string ptr, std::string IRname);
};

struct IR_funct {
	int instCnt;
	std::string type;
	std::string name;
	std::vector<std::string> args;
	std::vector<binding> bind;
	std::map<std::string, int> labels;
	std::map<std::string, std::string> alloc;
	std::vector<std::string> body;

	IR_funct();
};

struct IRdata_LLVM {
	std::string source_filename;
	std::string datalayout;
	std::string triple;

	std::vector<bool> constant;
	std::vector<AST_node> globals;
	std::vector<IR_funct> functs;

	void parseAST(AST* ast);
	void getGlobalsFrom(AST* ast);
	void getFunctsFrom(AST* ast);

	IR_funct parseFunct(AST* ast);
	Expression parseSequence(IR_funct& fun, AST* ast);

	std::string getVarType(IR_funct& fun, AST_node v);
	std::string getVarId(IR_funct& fun, AST_node v);
	void printIR(std::string filename);
};

IRdata_LLVM ast2ir(AST* ast);