#include <fstream>

#include "ast.h"
#include "IR.h"

Expression::Expression(std::string t, std::string v) : type(t), value(v){
}

binding::binding(std::string type, std::string name, std::string ptr, std::string IRname)
	: type(type), name(name), ptr(ptr), IRname(IRname) {
}

IR_funct::IR_funct() : instCnt(0), type(dataType::void_type), name("") {
}

std::string IR_funct::toLLVM_type() {
	if (type == dataType::int_type) return "i32";
	else if (type == dataType::double_type) return "double";
	else if (type == dataType::void_type) return "void";
	else throw std::unexpected;
}

IR_funct IRdata_LLVM::parseFunct(AST* ast) {
	IR_funct ret;
	ret.type = ast->son[0]->data.type;
	ret.name = ast->son[1]->data.value.getDataString();

	parseSequence(ret, ast->son[2]);

	return ret;
}

Expression IRdata_LLVM::parseSequence(IR_funct& fun, AST* ast) {
	switch (ast->data.type) {
	case dataType::seq_tree: {
		for (int i = 0; i < ast->son.size(); ++i) {
			parseSequence(fun, ast->son[i]);
		}
		return Expression("void", "");
	}
	case dataType::eseq_tree: {
		Expression ret("void", "");
		for (int i = 0; i < ast->son.size(); ++i) {
			ret = parseSequence(fun, ast->son[i]);
		}
		return ret;
	}
	case dataType::decl_inst: {
		dataType dt = ast->son[0]->data.type;
		for (int i = 1; i < ast->son.size(); ++i) {
			++fun.instCnt;
			fun.body.push_back("%" + std::to_string(fun.instCnt) + " = alloca " + ast->son[0]->data.toLLVM_type());
			fun.bind.push_back(binding(ast->son[0]->data.toLLVM_type(), ast->son[i]->data.value.getDataString(),
				"%" + std::to_string(fun.instCnt) , ""));
		}
		return Expression("void", "");
	}
	case dataType::assign: {
		Expression a = parseSequence(fun, ast->son[0]);
		Expression b = parseSequence(fun, ast->son[1]);
		if (a.type != b.type) {
			++fun.instCnt;
			fun.body.push_back("%" + std::to_string(fun.instCnt) + " = bitcast " + b.type + " " + b.value + " to " + a.type);
			b.type = a.type, b.value = "%" + std::to_string(fun.instCnt);
		}
		fun.body.push_back("store " + b.type + " " + b.value + ", " + a.type + "* " + fun.alloc[a.value]);
		for (int i = 0; i < fun.bind.size(); ++i) if (fun.bind[i].ptr == fun.alloc[a.value]) {
			fun.bind[i].IRname = "";
		}
		return Expression(a.type, a.value);
	}
	case dataType::plus: {
		Expression a = parseSequence(fun, ast->son[0]);
		Expression b = parseSequence(fun, ast->son[1]);
		++fun.instCnt;
		fun.body.push_back("%" + std::to_string(fun.instCnt) + " = add " + a.type + " " + a.value + ", " + b.value);
		return Expression(a.type, "%" + std::to_string(fun.instCnt));
	}
	case dataType::address: {
		Expression a = parseSequence(fun, ast->son[0]);
		for (int i = 0; i < fun.bind.size(); ++i) if (fun.bind[i].ptr == fun.alloc[a.value]) {
			fun.bind[i].IRname = "";
		}
		return Expression(a.type + "*", fun.alloc[a.value]);
	}
	case dataType::subscript: {
		Expression a = parseSequence(fun, ast->son[0]);
		Expression b = parseSequence(fun, ast->son[1]);
		++fun.instCnt;
		fun.body.push_back("%" + std::to_string(fun.instCnt) + " = getelementptr inbounds "
			+ a.type.substr(0, a.type.length() - 1) + ". " + a.type + a.value + ", " + b.type + " " + b.value);
		return Expression(a.type.substr(0, a.type.length() - 1), "%" + std::to_string(fun.instCnt));
	}
	case dataType::constant: {
		return Expression(ast->data.toLLVM_type(), ast->data.toStringExpr());
	}
	case dataType::name: {
		for (int i = 0; i < fun.bind.size(); ++i) {
			if (ast->data.value.getDataString() == fun.bind[i].name) {
				if (fun.bind[i].IRname == "") {
					++fun.instCnt;
					fun.body.push_back("%" + std::to_string(fun.instCnt)
						+ " = load " + fun.bind[i].type + ", " + fun.bind[i].type + "* " + fun.bind[i].ptr);
					fun.alloc["%" + std::to_string(fun.instCnt)] = fun.bind[i].ptr;
					fun.bind[i].IRname = "%" + std::to_string(fun.instCnt);
				}
				return Expression(fun.bind[i].type, fun.bind[i].IRname);
			}
		}
		throw std::unexpected;
	}
	case dataType::call_inst: {
		if (ast->son[0]->data.value.getDataString() == "scanf") {
			std::string str= "";
			for (int i = 2; i < ast->son.size(); ++i) {
				Expression a = parseSequence(fun, ast->son[i]);
				str += ", " + a.type + " " + a.value;
			}
			str += ")";
			++fun.instCnt;
			str = "%" + std::to_string(fun.instCnt)
				+ " = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ("
				+ ast->son[1]->data.toLLVM_type() + ", " + ast->son[1]->data.toLLVM_type() + "* "
				+ getVarId(fun, ast->son[1]->data) + ", i64 0, i64 0)" + str;
			fun.body.push_back(str);
			return Expression("i32", "%" + std::to_string(fun.instCnt));
		}
		else if (ast->son[0]->data.value.getDataString() == "printf") {
			std::string str = "";
			for (int i = 2; i < ast->son.size(); ++i) {
				Expression a = parseSequence(fun, ast->son[i]);
				str += ", " + a.type + " " + a.value;
			}
			str += ")";
			++fun.instCnt;
			str = "%" + std::to_string(fun.instCnt)
				+ " = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ("
				+ ast->son[1]->data.toLLVM_type() + ", " + ast->son[1]->data.toLLVM_type() + "* "
				+ getVarId(fun, ast->son[1]->data) + ", i64 0, i64 0)" + str;
			fun.body.push_back(str);
			return Expression("i32", "%" + std::to_string(fun.instCnt));
		}
		else if(ast->son[0]->data.value.getDataString() == "malloc") {
			Expression a = parseSequence(fun, ast->son[1]);
			++fun.instCnt;
			std::string str = "%" + std::to_string(fun.instCnt) + " = call i8* @malloc("
				+ ast->son[1]->data.toLLVM_type() + " " + ast->son[1]->data.toStringExpr() + ")";
			fun.body.push_back(str);
			return Expression("i8*", "%" + std::to_string(fun.instCnt));
		}
		else {
			//to be editted
		}
	}
	case dataType::return_inst: {
		Expression a = parseSequence(fun, ast->son[0]);
		fun.body.push_back("ret " + a.type + " " +a.value);
		return Expression("void", "");
	}
	default: {
		throw std::unexpected;
	}
	}
}

IRdata_LLVM ast2ir(AST* ast) {
	IRdata_LLVM ret;

	ret.source_filename = "example.c";
	ret.datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128";
	ret.triple = "x86_64-pc-linux-gnu";

	ret.parseAST(ast);

	return ret;
}

void IRdata_LLVM::parseAST(AST* ast) {
	getGlobalsFrom(ast);
	getFunctsFrom(ast);
}

void IRdata_LLVM::getGlobalsFrom(AST* ast) {
	switch (ast->data.type) {
	case dataType::string: {
		constant.push_back(true);
		globals.push_back(ast->data);
		break;
	}
	/*case dataType::constant: {
		constant.push_back(true);
		globals.push_back(ast->data);
		break;
	}*/
	default: {
		for (int i = 0; i < ast->son.size(); ++i) {
			getGlobalsFrom(ast->son[i]);
		}
		break;
	}
	}
}

void IRdata_LLVM::getFunctsFrom(AST* ast) {
	for (int i = 0; i < ast->son.size(); ++i) {
		if(ast->son[i]->data.type == dataType::func_decl) {
			functs.push_back(parseFunct(ast->son[i]));
		}
	}
}

std::string IRdata_LLVM::getVarType(IR_funct& fun, AST_node v) {
	if (v.type == dataType::string) {
		for (int i = 0; i < globals.size(); ++i) {
			if (constant[i] && v.value == globals[i].value) return globals[i].toLLVM_type();
		}
		throw std::unexpected;
	}
	else if (v.type == dataType::name) {
		for (int i = 0; i < fun.bind.size(); ++i) {
			if (v.value.getDataString() == fun.bind[i].name) return fun.bind[i].type;
		}
		throw std::unexpected;
	}
	else throw std::unexpected;
}

std::string IRdata_LLVM::getVarId(IR_funct& fun, AST_node v) {
	if (v.type == dataType::string) {
		for (int i = 0; i < globals.size(); ++i) {
			if (constant[i] && v.value == globals[i].value) return "@." + std::to_string(i);
		}
		throw std::unexpected;
	}
	else if (v.type == dataType::name) {
		for (int i = 0; i < fun.bind.size(); ++i) {
			if (v.value.getDataString() == fun.bind[i].name) return fun.bind[i].IRname;
		}
		throw std::unexpected;
	}
	else throw std::unexpected;
}

void IRdata_LLVM::printIR(std::string filename) {
	std::ofstream fout(filename);

	fout << "source_filename = \"" << source_filename << "\"" << std::endl;
	fout << "target datalayout = \"" << datalayout << "\"" << std::endl;
	fout << "target triple = \"" << triple << "\"" << std::endl;

	for (int i = 0; i < globals.size(); ++i) {
		fout << "@." << i << " = constant " << globals[i].toLLVM_type() << " c" << globals[i].toStringExpr() << std::endl;
	}

	for (int i = 0; i < functs.size(); ++i) {
		fout << "define " << functs[i].toLLVM_type() << " @" << functs[i].name << "() {" << std::endl;
		for (int j = 0; j < functs[i].body.size(); ++j) {
			fout << "  " << functs[i].body[j] << std::endl;
		}
		fout << "}" << std::endl;
	}

	fout << "declare i32 @__isoc99_scanf(i8*, ...)" << std::endl;
	fout << "declare i32 @printf(i8*, ...)" << std::endl;
	fout << "declare i8 * @malloc(i64 noundef)" << std::endl;
}