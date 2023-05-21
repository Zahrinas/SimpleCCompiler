#pragma once

#include "base.h"

enum class AST_type {
    seq_tree, eseq_tree,
    decl_inst, return_inst,
    call_inst,
    int_type,
    name, string, constant,
    plus, minus, multiply, divide, and, or , not, mod, assign, equal, not_equal, greater, less, greater_equal, less_equal, band, bor, bxor,

    array, // 暂时用array表示

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

<<<<<< < HEAD
    typedef tree<AST_node> AST;
====== =
typedef tree<AST_node> AST;

dataType toDataType(AST_type t) {
    if (t == AST_type::int_type) return dataType::intType;
    else throw unexpected;
}