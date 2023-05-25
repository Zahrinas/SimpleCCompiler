#include "ast.h"

AST_node::AST_node(dataType t, datum v) : type(t), value(v) {
}

std::string AST_node::toLLVM_type() {
	if (type == dataType::int_type) return std::string("i32");
	else if (type == dataType::double_type) return std::string("double");
	else if (type == dataType::void_type) return std::string("void");
	else if (type == dataType::int_pointer) return std::string("i32*");
	else if (type == dataType::double_pointer) return std::string("double*");
	else if (type == dataType::string) {
		std::string s = *(std::string*)value.ptr;
		int len = s.length() + 1;
		return "[" + std::to_string(len) + " x i8]";
	}
	else if (type == dataType::constant) {
		if (value.type == dataType::int_type) return "i32";
		else if (value.type == dataType::double_type) return "double";
		else throw std::unexpected;
	}
	else throw std::unexpected;
}

std::string AST_node::toStringExpr() {
	if (type == dataType::int_type) return std::to_string(*(int*)value.ptr);
	else if (type == dataType::double_type) return std::to_string(*(double*)value.ptr);
	else if (type == dataType::string) return "\"" + *(std::string*)value.ptr + "\\00\"";
	else if (type == dataType::constant) {
		if (value.type == dataType::int_type) return std::to_string(*(int*)value.ptr);
		else if (value.type == dataType::double_type) return std::to_string(*(double*)value.ptr);
		else throw std::unexpected;
	}
	else throw std::unexpected;
}
