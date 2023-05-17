#pragma once

#include "tree.h"
#include "test.h"

enum class AST_type {
	seq_tree, eseq_tree,
	decl_inst, return_inst,
	call_inst,
	int_type,
	name, string, constant,


	func_decl, label_decl,
	void_type, float_type,
	return_seq, if_seq, for_word, while_word,
	goto_word
};

class AST_node {
	AST_type type;

};

typedef tree<TOKEN> AST;