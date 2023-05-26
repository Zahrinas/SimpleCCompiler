#include <cstdarg>
#include <fstream>

#include "ast.h"

AST_node::AST_node(dataType t, datum v) : type(t), value(v) {
}

std::string AST_node::toLLVM_type() {
	if (type == dataType::int_type) return std::string("i32");
	else if (type == dataType::char_type) return std::string("i8");
	else if (type == dataType::double_type) return std::string("double");
	else if (type == dataType::void_type) return std::string("void");
	else if (type == dataType::int_pointer) return std::string("i32*");
	else if (type == dataType::char_pointer) return std::string("i8*");
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
	else if (type == dataType::string) {
		std::string s = *(std::string*)value.ptr;
		std::string str = "";
		for (int i = 0; i < s.length(); ++i) {
			if (s[i] == '\n') str += "\\0A";
			else str += s[i];
		}
		return "\"" + str + "\\00\"";
	}
	else if (type == dataType::constant) {
		if (value.type == dataType::int_type) return std::to_string(*(int*)value.ptr);
		else if (value.type == dataType::double_type) return std::to_string(*(double*)value.ptr);
		else if (value.type == dataType::char_type) return std::to_string(*(char*)value.ptr);
		else throw std::unexpected;
	}
	else throw std::unexpected;
}

AST* newNode(dataType type, std::string s, int argc, ...) {
	AST* now = new AST(AST_node(type));

	if (argc == 0) return now;

	va_list vaList;
	va_start(vaList, argc);

	AST* temp = va_arg(vaList, AST*);

	while (temp == nullptr && argc > 1) {
		temp = va_arg(vaList, AST*);
		--argc;
	}

	if (temp != nullptr) {
		now->son.push_back(temp);
		for (int i = 1; i < argc; ++i) {
			AST* next = va_arg(vaList, AST*);
			if (next != nullptr)  now->son.push_back(next);
		}
	}
	va_end(vaList);
	return now;
}

AST* newTerNode(dataType type, std::string s, datum v) {
	return new AST(AST_node(type, v));
}