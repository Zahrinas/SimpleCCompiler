#include <fstream>

#include "AST.h"
#include "IR.h"

binding::binding(AST_node v, std::string n) : v(v), name(n) {
}

std::string IR_funct::toLLVM_type() {
	if (type == dataType::int_type) return "i32";
	else if (type == dataType::double_type) return "f64";
	else if (type == dataType::void_type) return "void";
	else throw std::unexpected;
}

IR_funct IRdata_LLVM::parseFunct(AST ast) {
	IR_funct ret;
	ret.type = ast.son[0]->data.type;
	ret.name = ast.son[1]->data.value.getDataString();

	parseSequence(ret, *ast.son[2]);

	return ret;
}

datum IRdata_LLVM::parseSequence(IR_funct& fun, AST ast) {
	switch (ast.data.type) {
	case dataType::seq_tree: {
		for (int i = 0; i < ast.son.size(); ++i) {
			parseSequence(fun, *ast.son[i]);
		}
		return datum();
	}
	case dataType::eseq_tree: {
		datum ret;
		for (int i = 0; i < ast.son.size(); ++i) {
			ret = parseSequence(fun, *ast.son[i]);
		}
		return ret;
	}
	case dataType::decl_inst: {
		dataType dt = ast.son[0]->data.type;
		for (int i = 1; i < ast.son.size(); ++i) {
			int sent = fun.body.size() + 1;
			fun.body.push_back("%" + std::to_string(sent) + " = alloca " + ast.son[0]->data.toLLVM_type());
			fun.body.push_back("%" + std::to_string(sent + 1) + " = load " + ast.son[0]->data.toLLVM_type()
				+ ", " + ast.son[0]->data.toLLVM_type() + "* %" + std::to_string(sent));
			fun.bind.push_back(binding(variable(ast.son[i]->data.value.getDataString(), datum(dataType::pointer_type)), 
				"%" + std::to_string(sent)));
			fun.bind.push_back(binding(variable(ast.son[i]->data.value.getDataString(), datum(dt)), 
				"%" + std::to_string(sent + 1)));
		}
		return datum();
	}
	case dataType::call_inst: {
		if (ast.son[0]->data.value.getDataString() == "scanf") {
			int sent = fun.body.size() + 1;
			std::string str = "%" + std::to_string(sent)
				+ " = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ("
				+ ast.son[1]->data.toLLVM_type() + ", " + ast.son[1]->data.toLLVM_type() + "* "
				+ getVarId(fun, ast.son[1]->data) + ", i64 0, i64 0)";
			for (int i = 2; i < ast.son.size(); ++i) {
				str += ", " + getVarType(fun, ast.son[i]->data) + "* " + getVarId(fun, ast.son[i]->data);
			}
			str += ")";
			fun.body.push_back(str);
		}
		else if (ast.son[0]->data.value.getDataString() == "printf") {
			int sent = fun.body.size() + 1;
			std::string str = "%" + std::to_string(sent)
				+ " = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ("
				+ ast.son[1]->data.toLLVM_type() + ", " + ast.son[1]->data.toLLVM_type() + "* "
				+ getVarId(fun, ast.son[1]->data) + ", i64 0, i64 0)";
			for (int i = 2; i < ast.son.size(); ++i) {
				str += ", " + ast.son[i]->data.toLLVM_type() + " " + getVarId(fun, ast.son[i]->data);
			}
			str += ")";
			fun.body.push_back(str);
		}
		else {
			//to be editted
		}
	}
	case dataType::return_inst: {
		if (ast.son[0]->data.type == dataType::constant) {
			fun.body.push_back("ret " + ast.son[0]->data.toLLVM_type() + " " + ast.son[0]->data.toStringExpr());
		}
		else if (ast.son[0]->data.type == dataType::name) {
			//to be editted
		}
		else throw std::unexpected;
		break;
	}
	default: {
		throw std::unexpected;
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
	case dataType::constant: {
		constant.push_back(true);
		globals.push_back(ast.data);
		break;
	}
	case dataType::string: {
		constant.push_back(true);
		globals.push_back(ast.data);
		break;
	}
	default: {
		for (int i = 0; i < ast.son.size(); ++i) {
			getGlobalsFrom(*ast.son[i]);
		}
		break;
	}
	}
}

void IRdata_LLVM::getFunctsFrom(AST ast) {
	for (int i = 0; i < ast.son.size(); ++i) {
		if(ast.son[i]->data.type == dataType::func_decl) {
			functs.push_back(parseFunct(*ast.son[i]));
		}
	}
}

std::string IRdata_LLVM::getVarType(IR_funct& fun, AST_node v) {
	if (v.type == dataType::constant || v.type == dataType::string) {
		for (int i = 0; i < globals.size(); ++i) {
			if (constant[i] && v.value == globals[i].value) return globals[i].toLLVM_type();
		}
		throw std::unexpected;
	}
	else if (v.type == dataType::name) {
		for (int i = 0; i < fun.bind.size(); ++i) {
			if (fun.bind[i].var.data.type != dataType::pointer_type
				&& v.value.getDataString() == fun.bind[i].var.name) return fun.bind[i];
		}
		throw std::unexpected;
	}
	else throw std::unexpected;
}

std::string IRdata_LLVM::getVarId(IR_funct& fun, AST_node v) {
	if (v.type == dataType::constant || v.type == dataType::string) {
		for (int i = 0; i < globals.size(); ++i) {
			if (constant[i] && v.value == globals[i].value) return "@." + std::to_string(i);
		}
		throw std::unexpected;
	}
	else if (v.type == dataType::name) {
		for (int i = 0; i < fun.bind.size(); ++i) {
			if (fun.bind[i].var.data.type != dataType::pointer_type 
				&& v.value.getDataString() == fun.bind[i].var.name) return fun.bind[i].name;
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
		fout << "@." << i << " = constant " << globals[i].toLLVM_type() << " " << globals[i].toStringExpr() << std::endl;
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
}