#pragma once

#include "base.h"

struct AST_node {
	dataType type;
	datum value;

	AST_node(dataType t, datum v = datum());
	std::string toLLVM_type();
	std::string toStringExpr();
};

typedef tree<AST_node> AST;

AST* getAST();
AST* newNode(dataType type, std::string s, int argc, ...);
AST* newTerNode(dataType type, std::string s, datum v);
void printTreeInfo(AST* curNode, int height);