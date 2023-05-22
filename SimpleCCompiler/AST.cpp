#include "AST.h"

AST_node::AST_node(dataType t, datum v) : type(t), value(v) {
}

std::string AST_node::toLLVM_type() {
	if (type == dataType::int_type) return "i32";
	else if (type == dataType::double_type) return "f64";
	else if (type == dataType::void_type) return "void";
	else if (type == dataType::string) {
		std::string s = *(std::string*)value.ptr;
		int len = s.length();
		return "[" + std::to_string(len) + " x i8]";
	}
	else if (type == dataType::name) {

	}
	else throw std::unexpected;
}

std::string AST_node::toStringExpr() {
	if (type == dataType::int_type) return std::to_string(*(int*)value.ptr);
	else if (type == dataType::double_type) return std::to_string(*(double*)value.ptr);
	else if (type == dataType::string) return "\"" + *(std::string*)value.ptr + "\\00\"";
	else throw std::unexpected;
}