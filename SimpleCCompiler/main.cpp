#include<cmath>
#include<cstdio>
#include<cstdlib>
#include<iostream>
#include<algorithm>
using namespace std;

#include "IR.h"
#include "AST.h"

string fileName;
signed main(signed argc, char** argv, char** env) {
	if(argc > 1){
	    freopen(argv[1], "r", stdin);
		AST* ast = getAST();
		IRdata_LLVM ir = ast2ir(ast);
		ir.printIR("gen.ll");
	}
}
