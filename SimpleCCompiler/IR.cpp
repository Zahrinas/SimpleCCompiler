#include "AST.h"
#include "IR.h"

binding::binding(variable v, int l) : var(v), loc(l) {
}

IR_funct IRdata_LLVM::parseFunct(AST ast) {
	IR_funct ret;
	ret.defined = true;
	ret.returnType = ast.son[0].data.value.type;
	ret.name = ast.son[1].data.value.getDataString();

	parseSequence(ret, ast.son[2]);
}

datum IRdata_LLVM::parseSequence(IR_funct fun, AST ast) {
	switch (ast.data.type) {
	case AST_type::seq_tree: {
		for (int i = 0; i < ast.son.size(); ++i) {
			parseSequence(fun, ast.son[i]);
		}
		return datum();
	}
	case AST_type::eseq_tree: {
		datum ret;
		for (int i = 0; i < ast.son.size(); ++i) {
			ret = parseSequence(fun, ast.son[i]);
		}
		return ret;
	}
	case AST_type::decl_inst: {
		dataType dt = toDataType(ast.son[0].data.type);
		int sent = fun.body.size() + 1;
		for (int i = 1; i < ast.son.size(); ++i) {
			fun.body.push_back("%" + std::to_string(sent) + " = alloca " + getLLVM_type(dt));
			fun.bind.push_back(binding(variable(ast.son[i].data.value.getDataString(), datum(dt)), sent));
		}
		return datum();
	}
	case AST_type::call_inst: {
	}
	case AST_type::return_inst: {

	}
	default: {
		throw unexpected;
	}
	}
}

IRdata_LLVM ast2ir(AST ast) {
	IRdata_LLVM ret;

	ret.source_filename = "example.c";
	ret.datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128";
	ret.triple = "x86_64-pc-linux-gnu";

	ret.parseAST(ast);

	return ret;
}

void IRdata_LLVM::parseAST(AST ast) {
	getGlobalsFrom(ast);
	getFunctsFrom(ast);
}

void IRdata_LLVM::getGlobalsFrom(AST ast) {
	switch (ast.data.type) {
	case AST_type::constant: {
		globals.push_back(ast.data.value);
		break;
	}
	case AST_type::string: {
		globals.push_back(ast.data.value);
		break;
	}
	default: {
		for (int i = 0; i < ast.son.size(); ++i) {
			getGlobalsFrom(ast.son[i]);
		}
		break;
	}
	}
}

void IRdata_LLVM::getFunctsFrom(AST ast) {
	for (auto itr = ast.son.begin(); itr != ast.son.end(); ++itr) {
		if (ast.data.type == AST_type::func_decl) {
			functs.push_back(parseFunct(ast));
		}
	}
}