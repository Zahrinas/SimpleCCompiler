#include<cmath>
#include<cstdio>
#include<cstdlib>
#include<iostream>
#include<algorithm>
using namespace std;

#include "IR.h"
#include "AST.h"

string fileName;
signed main(signed, char**, char**) {
    freopen("data/Credit.c", "r", stdin);
	AST* ast = getAST();
	IRdata_LLVM ir = ast2ir(ast);
	ir.printIR("data/gen.ll");
}
