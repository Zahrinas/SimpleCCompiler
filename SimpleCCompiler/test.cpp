#include <string>

#include "test.h"
#include "AST.h"

/*
@1: seq_tree void
	brother: null
	son: @2
@2: decl_inst void
	brother: @6
	son: @3
@3: int_type void
	brother: @4
	son: null
@4: name(a) variable
	brother: @5
	son: null
@5: name(b) variable
	brother: null
	son: null
@6: eseq_tree variable
	brother: @12
	son: @7
@7: call_inst variable
	brother: null
	son: @8
@8: name(scanf) variable
	brother: @9
	son: null
@9: string(%d%d) variable
	brother: @10
	son: null
@10: name(a) variable
	brother: @11
	son: null
@11: name(b) variable
	brother: null
	son: null
@12: eseq_tree variable
	brother: @19
	son: @13
@13: call_inst variable
	brother: null
	son: @14
@14: name(printf) variable
	brother: @15
	son: null
@15: string(%d) variable
	brother: @16
	son: null
@16: plus variable
	brother: null
	son: @17
@17: name(a) variable
	brother: @18
	son: null
@18: name(b) variable
	brother: null
	son: null
@19: return_inst void
	brother: null
	son: @20
@20: constant(0) variable
	brother: null
	son: null
*/
AST getExampleAST() {
	AST n1 = AST(AST_node(AST_type::seq_tree));

	AST n2 = n1.insert(AST_node(AST_type::decl_inst));
	AST n6 = n1.insert(AST_node(AST_type::eseq_tree));
	AST n12 = n1.insert(AST_node(AST_type::eseq_tree));
	AST n19 = n1.insert(AST_node(AST_type::return_inst));

	AST n3 = n2.insert(AST_node(AST_type::int_type));
	AST n4 = n2.insert(AST_node(AST_type::name, datum("a")));
	AST n5 = n2.insert(AST_node(AST_type::name, datum("b")));
	AST n7 = n6.insert(AST_node(AST_type::call_inst));
	AST n13 = n12.insert(AST_node(AST_type::call_inst));
	AST n20 = n19.insert(AST_node(AST_type::constant, datum(0)));

	AST n8 = n7.insert(AST_node(AST_type::name, datum("scanf")));
	AST n9 = n7.insert(AST_node(AST_type::string, datum("%d%d")));
	AST n10 = n7.insert(AST_node(AST_type::name, datum("a")));
	AST n11 = n7.insert(AST_node(AST_type::name, datum("b")));
	AST n14 = n13.insert(AST_node(AST_type::name, datum("printf")));
	AST n15 = n13.insert(AST_node(AST_type::string, datum("%d")));
	AST n16 = n13.insert(AST_node(AST_type::plus));

	AST n17 = n16.insert(AST_node(AST_type::name, datum("a")));
	AST n18 = n16.insert(AST_node(AST_type::name, datum("b")));

	return n1;
}