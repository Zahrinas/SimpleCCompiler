#include <string>

#include "test.h"
#include "ast.h"

AST* getExampleAST1() {
	AST* nr = new AST(AST_node(dataType::program));

	AST* n0 = nr->insert(AST_node(dataType::func_decl));

	AST* nx1 = n0->insert(AST_node(dataType::int_type));
	AST* nx2 = n0->insert(AST_node(dataType::name, datum("main")));
	AST* n1 = n0->insert(AST_node(dataType::seq_tree));

	AST* n2 = n1->insert(AST_node(dataType::decl_inst));
	AST* n3 = n2->insert(AST_node(dataType::int_type));
	AST* n4 = n2->insert(AST_node(dataType::name, datum("a")));
	AST* n5 = n2->insert(AST_node(dataType::name, datum("b")));

	/*
	AST* nadd1 = n2->insert(AST_node(dataType::name, datum("c")));
	AST* nadd2 = n1->insert(AST_node(dataType::eseq_tree));
	AST* nadd3 = nadd2->insert(AST_node(dataType::assign));
	AST* nadd4 = nadd3->insert(AST_node(dataType::name, datum("c")));
	AST* nadd5 = nadd3->insert(AST_node(dataType::plus));
	AST* nadd6 = nadd5->insert(AST_node(dataType::name, datum("a")));
	AST* nadd7 = nadd5->insert(AST_node(dataType::name, datum("b")));
	*/

	AST* n6 = n1->insert(AST_node(dataType::eseq_tree));
	AST* n7 = n6->insert(AST_node(dataType::call_inst));
	AST* n8 = n7->insert(AST_node(dataType::name, datum("scanf")));
	AST* n9 = n7->insert(AST_node(dataType::string, datum("%d%d")));
	AST* na10 = n7->insert(AST_node(dataType::address));
	AST* na11 = n7->insert(AST_node(dataType::address));
	AST* n10 = na10->insert(AST_node(dataType::name, datum("a")));
	AST* n11 = na11->insert(AST_node(dataType::name, datum("b")));

	AST* n12 = n1->insert(AST_node(dataType::eseq_tree));
	AST* n13 = n12->insert(AST_node(dataType::call_inst));
	AST* n14 = n13->insert(AST_node(dataType::name, datum("printf")));
	AST* n15 = n13->insert(AST_node(dataType::string, datum("%d")));
	AST* n16 = n13->insert(AST_node(dataType::plus));
	AST* n17 = n16->insert(AST_node(dataType::name, datum("a")));
	AST* n18 = n16->insert(AST_node(dataType::name, datum("b")));

	AST* n19 = n1->insert(AST_node(dataType::return_inst));
	AST* n20 = n19->insert(AST_node(dataType::constant, datum(0)));

	return nr;
}

AST* getExampleAST2() {
	AST* n0 = new AST(AST_node(dataType::program));

	AST* n1 = n0->insert(AST_node(dataType::func_decl));
	AST* n2 = n1->insert(AST_node(dataType::int_type));
	AST* n3 = n1->insert(AST_node(dataType::name, datum("main")));
	AST* n4 = n1->insert(AST_node(dataType::seq_tree));

	AST* n5 = n4->insert(AST_node(dataType::decl_inst));
	AST* n6 = n5->insert(AST_node(dataType::int_pointer));
	AST* n7 = n5->insert(AST_node(dataType::name, datum("a")));

	AST* n8 = n4->insert(AST_node(dataType::decl_inst));
	AST* n9 = n8->insert(AST_node(dataType::int_type));
	AST* n10 = n8->insert(AST_node(dataType::name, datum("b")));
	AST* n11 = n8->insert(AST_node(dataType::name, datum("c")));

	AST* nt0 = n4->insert(AST_node(dataType::assign));
	AST* nt1 = nt0->insert(AST_node(dataType::name, datum("b")));
	AST* nt2 = nt0->insert(AST_node(dataType::constant, datum(5)));

	AST* nt3 = n4->insert(AST_node(dataType::assign));
	AST* nt4 = nt3->insert(AST_node(dataType::name, datum("c")));
	AST* nt5 = nt3->insert(AST_node(dataType::constant, datum(10)));

	AST* n12 = n4->insert(AST_node(dataType::assign));
	AST* n13 = n12->insert(AST_node(dataType::name, datum("a")));
	AST* n14 = n12->insert(AST_node(dataType::call_inst));
	AST* n15 = n14->insert(AST_node(dataType::name, datum("malloc")));
	AST* n16 = n14->insert(AST_node(dataType::constant, datum(400000)));

	AST* n17 = n4->insert(AST_node(dataType::assign));
	AST* n18 = n17->insert(AST_node(dataType::subscript));
	AST* n19 = n18->insert(AST_node(dataType::name, datum("a")));
	AST* n20 = n18->insert(AST_node(dataType::name, datum("b")));
	AST* n21 = n17->insert(AST_node(dataType::name, datum("c")));

	AST* n22 = n4->insert(AST_node(dataType::return_inst));
	AST* n23 = n19->insert(AST_node(dataType::constant, datum(0)));
	return n0;
}