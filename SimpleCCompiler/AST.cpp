#include "AST.h"

AST_node::AST_node(AST_type t, datum d) {
	this->type = t;
	this->data = d;
}