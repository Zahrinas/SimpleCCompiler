#include "AST.h"

AST_node::AST_node(AST_type t, datum v) : type(t), value(v) {
}

dataType toDataType(AST_type t) {
	if (t == AST_type::int_type) return dataType::intType;
	else throw unexpected;
}