#include "AST.h"

AST_node::AST_node(AST_type t, void* p = nullptr) {
	this->type = t;
	this->ptr = p;
}