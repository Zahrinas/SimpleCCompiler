#pragma once

#include "base.h"
#include "test.h"

enum class AST_type {
    seq_tree, eseq_tree,
    decl_inst, return_inst,
    call_inst,
    int_type,
    name, string, constant,
    plus, minus, multiply, divide,


    func_decl, label_decl,
    void_type, float_type,
    if_inst, for_inst, while_inst,
    goto_inst
};

struct AST_node {
    AST_type type;
    datum data;

    AST_node(AST_type t, datum d = datum());
};

typedef tree<AST_node> AST;