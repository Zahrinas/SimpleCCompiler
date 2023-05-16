#include<cmath>
#include<cstdio>
#include<cstdlib>
#include<iostream>
#include<algorithm>
using namespace std;

#include "AST.h"
#include "IR.h"

string fileName;
signed main(signed, char**, char**) {
	cin >> fileName;

	AST ast;
	//AST ast = file2ast(fileName);

	IR ir = ast2ir(ast);
}