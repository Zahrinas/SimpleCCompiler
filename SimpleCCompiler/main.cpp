#include<cmath>
#include<cstdio>
#include<cstdlib>
#include<iostream>
#include<algorithm>
using namespace std;

#include "ir.h"
#include "ast.h"
#include "test.h"

string fileName;
signed main(signed, char**, char**) {
	AST* ast = getAST();
	IRdata_LLVM ir = ast2ir(ast);
	ir.printIR("data/gen.ll");
}