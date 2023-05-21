#pragma once

#include "base.h"

enum class AST_type {
	func_decl,
	seq_tree, eseq_tree,
	decl_inst, return_inst,
	call_inst,
	int_type,
	name, string, constant,
	plus, minus, multiply, divide,


	label_decl,
	void_type, float_type,
	if_inst, for_inst, while_inst,
	goto_inst

};

struct AST_node {
	AST_type type;
	datum value;

	AST_node(AST_type t, datum v = datum());
};

typedef tree<AST_node> AST;

dataType toDataType(AST_type t);