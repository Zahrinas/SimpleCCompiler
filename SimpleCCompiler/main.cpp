#include<cmath>
#include<cstdio>
#include<cstdlib>
#include<iostream>
#include<algorithm>
using namespace std;

#include "ast.h"
#include "IR.h"
#include "test.h"

string fileName;
signed main(signed, char**, char**) {
	AST* ast = getExampleAST2();
	IRdata_LLVM ir = ast2ir(ast);
	ir.printIR("data/gen.ll");
}