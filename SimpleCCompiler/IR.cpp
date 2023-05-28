#include <fstream>

#include "AST.h"
#include "IR.h"

Expression::Expression(std::string t, std::string v) : type(t), value(v){
}

int Expression::bits(){
	if(type == "i8") return 8;
	if(type == "i32") return 32;
	if(type == "double") return 64;
	if(type == "i8*") return 64;
	if(type == "i32*") return 64;
	if(type == "double*") return 64;
	throw std::exception();
}

binding::binding(std::string type, std::string name, std::string ptr, std::string IRname)
	: type(type), name(name), ptr(ptr), IRname(IRname) {
}

IR_funct::IR_funct() : instCnt(-1), type("void"), name("") {
}

IR_funct IRdata_LLVM::parseFunct(AST* ast) {
	IR_funct ret;
	ret.type = ast->son(0)->data.toLLVM_type();
	ret.name = ast->son(1)->data.value.getDataString();

	for (AST* ptr = ast->son(3); ptr; ptr = ptr->next) {
		++ret.instCnt;
		ret.args.push_back(ptr->son(0)->data.toLLVM_type() + " %" + std::to_string(ret.instCnt));
	}

	++ret.instCnt;

	int i = 3;
	for (AST* ptr = ast->son(3); ptr; ptr = ptr->next) {
		++ret.instCnt;
		ret.body.push_back("%" + std::to_string(ret.instCnt) + " = alloca " + ptr->son(0)->data.toLLVM_type());
		ret.body.push_back("store " + ptr->son(0)->data.toLLVM_type() + " %" + std::to_string(i - 3)
			+ ", " + ptr->son(0)->data.toLLVM_type() + "* %" + std::to_string(ret.instCnt));
		ret.bind.push_back(binding(ptr->son(0)->data.toLLVM_type(), ptr->son(1)->data.value.getDataString(),
			"%" + std::to_string(ret.instCnt), ""));
		++i;
	}
	
	functs.push_back(ret);
	
	parseSequence(ret, ast->son(2));

	functs.pop_back();
	functs.push_back(ret);
	return ret;
}

Expression IRdata_LLVM::parseSequence(IR_funct& fun, AST* ast) {
	switch (ast->data.type) {
	case dataType::seq_tree: {
		for (AST* ptr = ast->son(0); ptr; ptr = ptr->next) {
			parseSequence(fun, ptr);
		}
		return Expression("void", "");
	}
	case dataType::eseq_tree: {
		Expression ret("void", "");
		for (AST* ptr = ast->son(0); ptr; ptr = ptr->next) {
			ret = parseSequence(fun, ptr);
		}
		return ret;
	}
	case dataType::decl_inst: {
		for (AST* ptr = ast->son(1); ptr; ptr = ptr->next) {
			++fun.instCnt;
			fun.body.push_back("%" + std::to_string(fun.instCnt) + " = alloca " + ast->son(0)->data.toLLVM_type());
			fun.bind.push_back(binding(ast->son(0)->data.toLLVM_type(), ptr->data.value.getDataString(),
				"%" + std::to_string(fun.instCnt) , ""));
		}
		return Expression("void", "");
	}
	case dataType::assign: {
		Expression a = parseSequence(fun, ast->son(0));
		Expression b = parseSequence(fun, ast->son(1));
		if (a.type != b.type) {
			if(a.bits() < b.bits()){
				++fun.instCnt;
				fun.body.push_back("%" + std::to_string(fun.instCnt) + " = trunc " + b.type + " " + b.value + " to " + a.type);
				b.type = a.type, b.value = "%" + std::to_string(fun.instCnt);
			}else if(a.bits() == b.bits()){
				++fun.instCnt;
				fun.body.push_back("%" + std::to_string(fun.instCnt) + " = bitcast " + b.type + " " + b.value + " to " + a.type);
				b.type = a.type, b.value = "%" + std::to_string(fun.instCnt);
			}
		}
		fun.body.push_back("store " + b.type + " " + b.value + ", " + a.type + "* " + fun.alloc[a.value]);
		for (int i = 0; i < fun.bind.size(); ++i) if (fun.bind[i].ptr == fun.alloc[a.value]) fun.bind[i].IRname = "";
		return Expression(a.type, a.value);
	}
	case dataType::plus: {
		Expression a = parseSequence(fun, ast->son(0));
		Expression b = parseSequence(fun, ast->son(1));
		++fun.instCnt;
		if(a.type == "double") fun.body.push_back("%" + std::to_string(fun.instCnt) + " = fadd " + a.type + " " + a.value + ", " + b.value);
		else fun.body.push_back("%" + std::to_string(fun.instCnt) + " = add " + a.type + " " + a.value + ", " + b.value);
		return Expression(a.type, "%" + std::to_string(fun.instCnt));
	}
	case dataType::minus: {
		Expression a = parseSequence(fun, ast->son(0));
		Expression b = parseSequence(fun, ast->son(1));
		++fun.instCnt;
		if(a.type == "double") fun.body.push_back("%" + std::to_string(fun.instCnt) + " = fsub " + a.type + " " + a.value + ", " + b.value);
		else fun.body.push_back("%" + std::to_string(fun.instCnt) + " = sub " + a.type + " " + a.value + ", " + b.value);
		return Expression(a.type, "%" + std::to_string(fun.instCnt));
	}
	case dataType::multiply: {
		Expression a = parseSequence(fun, ast->son(0));
		Expression b = parseSequence(fun, ast->son(1));
		++fun.instCnt;
		if(a.type == "double") fun.body.push_back("%" + std::to_string(fun.instCnt) + " = fmul " + a.type + " " + a.value + ", " + b.value);
		else fun.body.push_back("%" + std::to_string(fun.instCnt) + " = mul " + a.type + " " + a.value + ", " + b.value);
		return Expression(a.type, "%" + std::to_string(fun.instCnt));
	}
	case dataType::divide: {
		Expression a = parseSequence(fun, ast->son(0));
		Expression b = parseSequence(fun, ast->son(1));
		++fun.instCnt;
		if(a.type == "double") fun.body.push_back("%" + std::to_string(fun.instCnt) + " = fdiv " + a.type + " " + a.value + ", " + b.value);
		else fun.body.push_back("%" + std::to_string(fun.instCnt) + " = div " + a.type + " " + a.value + ", " + b.value);
		return Expression(a.type, "%" + std::to_string(fun.instCnt));
	}
	case dataType::less: {
		Expression a = parseSequence(fun, ast->son(0));
		Expression b = parseSequence(fun, ast->son(1));
		++fun.instCnt;
		fun.body.push_back("%" + std::to_string(fun.instCnt) + " = icmp slt " + a.type + " " + a.value + ", " + b.value);
		return Expression("i1", "%" + std::to_string(fun.instCnt));
	}
	case dataType::greater: {
		Expression a = parseSequence(fun, ast->son(0));
		Expression b = parseSequence(fun, ast->son(1));
		++fun.instCnt;
		fun.body.push_back("%" + std::to_string(fun.instCnt) + " = icmp sgt " + a.type + " " + a.value + ", " + b.value);
		return Expression("i1", "%" + std::to_string(fun.instCnt));
	}
	case dataType::less_equal: {
		Expression a = parseSequence(fun, ast->son(0));
		Expression b = parseSequence(fun, ast->son(1));
		++fun.instCnt;
		fun.body.push_back("%" + std::to_string(fun.instCnt) + " = icmp sle " + a.type + " " + a.value + ", " + b.value);
		return Expression("i1", "%" + std::to_string(fun.instCnt));
	}
	case dataType::greater_equal: {
		Expression a = parseSequence(fun, ast->son(0));
		Expression b = parseSequence(fun, ast->son(1));
		++fun.instCnt;
		fun.body.push_back("%" + std::to_string(fun.instCnt) + " = icmp sge " + a.type + " " + a.value + ", " + b.value);
		return Expression("i1", "%" + std::to_string(fun.instCnt));
	}
	case dataType::equal: {
		Expression a = parseSequence(fun, ast->son(0));
		Expression b = parseSequence(fun, ast->son(1));
		++fun.instCnt;
		fun.body.push_back("%" + std::to_string(fun.instCnt) + " = icmp eq " + a.type + " " + a.value + ", " + b.value);
		return Expression("i1", "%" + std::to_string(fun.instCnt));
	}
	case dataType::not_equal: {
		Expression a = parseSequence(fun, ast->son(0));
		Expression b = parseSequence(fun, ast->son(1));
		++fun.instCnt;
		fun.body.push_back("%" + std::to_string(fun.instCnt) + " = icmp ne " + a.type + " " + a.value + ", " + b.value);
		return Expression("i1", "%" + std::to_string(fun.instCnt));
	}
	case dataType::address: {
		Expression a = parseSequence(fun, ast->son(0));
		for (int i = 0; i < fun.bind.size(); ++i) if (fun.bind[i].ptr == fun.alloc[a.value]) fun.bind[i].IRname = "";
		return Expression(a.type + "*", fun.alloc[a.value]);
	}
	case dataType::member: {
		Expression a = parseSequence(fun, ast->son(0));
		++fun.instCnt;
		fun.body.push_back("%" + std::to_string(fun.instCnt)
			+ " = load " + a.type + ", " + a.type + "* " + fun.alloc[a.value]);
		++fun.instCnt;
		fun.body.push_back("%" + std::to_string(fun.instCnt)
			+ " = load " + a.type.substr(0, a.type.length() - 1) + ", " + a.type + " %" + std::to_string(fun.instCnt - 1));
		fun.alloc["%" + std::to_string(fun.instCnt)] = "%" + std::to_string(fun.instCnt - 1);
		return Expression(a.type.substr(0, a.type.length() - 1), "%" + std::to_string(fun.instCnt));
	}
	case dataType::subscript: {
		Expression a = parseSequence(fun, ast->son(0));
		Expression b = parseSequence(fun, ast->son(1));
		++fun.instCnt;
		fun.body.push_back("%" + std::to_string(fun.instCnt) + " = getelementptr inbounds "
			+ a.type.substr(0, a.type.length() - 1) + ", " + a.type + " " + a.value + ", " + b.type + " " + b.value);
		++fun.instCnt;
		fun.body.push_back("%" + std::to_string(fun.instCnt)
			+ " = load " + a.type.substr(0, a.type.length() - 1) + ", " + a.type + " %" + std::to_string(fun.instCnt - 1));
		fun.alloc["%" + std::to_string(fun.instCnt)] = "%" + std::to_string(fun.instCnt - 1);
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
	case dataType::if_inst: {
		Expression a = parseSequence(fun, ast->son(0));
		int labelT = ++fun.instCnt;
		int br = fun.body.size();
		fun.body.push_back("");
		fun.body.push_back(std::to_string(labelT) + ":");
		Expression b = parseSequence(fun, ast->son(1));
		int labelE = ++fun.instCnt;
		fun.body[br] = 
			"br " + a.type + " " + a.value + ", label %" + std::to_string(labelT) + ", label %" + std::to_string(labelE);
		fun.body.push_back("br label %" + std::to_string(labelE));
		fun.body.push_back(std::to_string(labelE) + ":");
		for (int i = 0; i < fun.bind.size(); ++i) fun.bind[i].IRname = "";
		return Expression("void", "");
	}
	case dataType::goto_inst: {
		fun.body.push_back("br label %" + std::to_string(fun.labels[ast->data.value.getDataString()]));
		++fun.instCnt;
		fun.body.push_back(std::to_string(fun.instCnt) + ":");
		for (int i = 0; i < fun.bind.size(); ++i) fun.bind[i].IRname = "";
		return Expression("void", "");
	}
	case dataType::label_decl: {
		fun.labels[ast->data.value.getDataString()] = ++fun.instCnt;
		fun.body.push_back("br label %" + std::to_string(fun.instCnt));
		fun.body.push_back(std::to_string(fun.instCnt) + ":");
		for (int i = 0; i < fun.bind.size(); ++i) fun.bind[i].IRname = "";
		return Expression("void", "");
	}
	case dataType::call_inst: {
		if (ast->son(0)->data.value.getDataString() == "scanf") {
			std::string str= "";
			for (AST* ptr = ast->son(2); ptr; ptr = ptr->next) {
				Expression a = parseSequence(fun, ptr);
				str += ", " + a.type + " " + a.value;
			}
			++fun.instCnt;
			str = "%" + std::to_string(fun.instCnt)
				+ " = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ("
				+ ast->son(1)->data.toLLVM_type() + ", " + ast->son(1)->data.toLLVM_type() + "* "
				+ getVarId(fun, ast->son(1)->data) + ", i64 0, i64 0)" + str + ")";
			fun.body.push_back(str);
			return Expression("i32", "%" + std::to_string(fun.instCnt));
		}
		else if (ast->son(0)->data.value.getDataString() == "printf") {
			std::string str = "";
			for (AST* ptr = ast->son(2); ptr; ptr = ptr->next) {
				Expression a = parseSequence(fun, ptr);
				str += ", " + a.type + " " + a.value;
			}
			++fun.instCnt;
			str = "%" + std::to_string(fun.instCnt)
				+ " = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ("
				+ ast->son(1)->data.toLLVM_type() + ", " + ast->son(1)->data.toLLVM_type() + "* "
				+ getVarId(fun, ast->son(1)->data) + ", i64 0, i64 0)" + str + ")";
			fun.body.push_back(str);
			return Expression("i32", "%" + std::to_string(fun.instCnt));
		}
		else if(ast->son(0)->data.value.getDataString() == "malloc") {
			Expression a = parseSequence(fun, ast->son(1));
			++fun.instCnt;
			std::string str = "%" + std::to_string(fun.instCnt) + " = call i8* (i64) @malloc(i64 "
				+ ast->son(1)->data.toStringExpr() + ")";
			fun.body.push_back(str);
			return Expression("i8*", "%" + std::to_string(fun.instCnt));
		}
		else if(ast->son(0)->data.value.getDataString() == "strchr") {
			Expression a = parseSequence(fun, ast->son(1));
			Expression b = parseSequence(fun, ast->son(2));
			++fun.instCnt;
			std::string str = "%" + std::to_string(fun.instCnt) + " = call i8* (i8*, i32) @strchr( "
				+ a.type + " " + a.value + ", "
				+ b.type + " " + b.value + ")";
			fun.body.push_back(str);
			return Expression("i8*", "%" + std::to_string(fun.instCnt));
		}
		else if(ast->son(0)->data.value.getDataString() == "sscanf") {
			std::string str= "";
			for (AST* ptr = ast->son(3); ptr; ptr = ptr->next) {
				Expression a = parseSequence(fun, ptr);
				str += ", " + a.type + " " + a.value;
			}
			Expression a = parseSequence(fun, ast->son(1));
			++fun.instCnt;
			str = "%" + std::to_string(fun.instCnt)
				+ " = call i32 (i8*, i8*, ...) @sscanf("
				+ a.type + " " + a.value + ", i8* getelementptr inbounds (" 
				+ ast->son(2)->data.toLLVM_type() + ", " + ast->son(2)->data.toLLVM_type() + "* "
				+ getVarId(fun, ast->son(2)->data) + ", i64 0, i64 0)" + str + ")";
			fun.body.push_back(str);
			return Expression("i32", "%" + std::to_string(fun.instCnt));
		}
		else if(ast->son(0)->data.value.getDataString() == "strcmp") {
			Expression a = parseSequence(fun, ast->son(1));
			Expression b = parseSequence(fun, ast->son(2));
			++fun.instCnt;
			std::string str = "%" + std::to_string(fun.instCnt) + " = call i32 (i8*, i8*) @strcmp( "
				+ a.type + " " + a.value + ", "
				+ b.type + " " + b.value + ")";
			fun.body.push_back(str);
			return Expression("i32", "%" + std::to_string(fun.instCnt));
		}
		else if(ast->son(0)->data.value.getDataString() == "memset") {
			Expression a = parseSequence(fun, ast->son(1));
			Expression b = parseSequence(fun, ast->son(2));
			Expression c = parseSequence(fun, ast->son(3));
			std::string str = "call void (i8*, i8, i64) @memset( "
				+ a.type + " " + a.value + ", " + "i8 " + b.value + ", " + "i64 " + c.value + ")";
			fun.body.push_back(str);
			return Expression("void", "");
		}
		else if(ast->son(0)->data.value.getDataString() == "gets") {
			Expression a = parseSequence(fun, ast->son(1));
			++fun.instCnt;
			std::string str = "%" + std::to_string(fun.instCnt) + " = call i32 (...) @gets( "
				+ a.type + " " + a.value + ")";
			fun.body.push_back(str);
			return Expression("i32", "%" + std::to_string(fun.instCnt));
		}
		else {
			std::string str = "", strp = "";
			for (AST* ptr = ast->son(1); ptr; ptr = ptr->next) {
				Expression a = parseSequence(fun, ptr);
				if (ptr != ast->son(1)) strp += ", ";
				strp += a.type + " " + a.value;
			}
			std::string type;
			std::vector<std::string> args;
			for (int i = 0; i < functs.size(); ++i) if(functs[i].name == ast->son(0)->data.value.getDataString()){
				type = functs[i].type;
				args = functs[i].args;
			}
			if(type == "void") str = "call " + type + " (";
			else{
				++fun.instCnt;
				str = "%" + std::to_string(fun.instCnt) + " = call " + type + " (";
			}
			for (int i = 0; i < args.size(); ++i) {
				if (i != 0) str += ", ";
				str += args[i];
			}
			str += ") @" + ast->son(0)->data.value.getDataString() + "(" + strp + ")";
			fun.body.push_back(str);
			if(type == "void") return Expression("void", "");
			else return Expression(type, "%" + std::to_string(fun.instCnt));
		}
	}
	case dataType::return_inst: {
		if(ast->son(0)){
			Expression a = parseSequence(fun, ast->son(0));
			fun.body.push_back("ret " + a.type + " " +a.value);
			return Expression("void", "");
		}else{
			fun.body.push_back("ret void");
			return Expression("void", "");
		}
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
		for (AST* ptr = ast->son(0); ptr; ptr = ptr->next) {
			getGlobalsFrom(ptr);
		}
		break;
	}
	}
}

void IRdata_LLVM::getFunctsFrom(AST* ast) {
	for (AST* ptr = ast->son(0); ptr; ptr = ptr->next) {
		if(ptr->data.type == dataType::func_decl) {
			parseFunct(ptr);
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
		fout << "define " << functs[i].type << " @" << functs[i].name << "(";
		for (int j = 0; j < functs[i].args.size(); ++j) {
			if (j) fout << ", ";
			fout << functs[i].args[j];
		}
		fout<< ") {" << std::endl;
		for (int j = 0; j < functs[i].body.size(); ++j) {
			fout << "  " << functs[i].body[j] << std::endl;
		}
		fout << "}" << std::endl;
	}

	fout << "declare i32 @scanf(i8*, ...)" << std::endl;
	fout << "declare i32 @printf(i8*, ...)" << std::endl;
	fout << "declare i8* @malloc(i64)" << std::endl;
	fout << "declare i8* @strchr(i8*, i32)" << std::endl;
	fout << "declare i32 @sscanf(i8*, i8*, ...)" << std::endl;
	fout << "declare i32 @strcmp(i8*, i8*)" << std::endl;
	fout << "declare void @memset(i8*, i8, i64)" << std::endl;
	fout << "declare i32 @gets(...)" << std::endl;
}
