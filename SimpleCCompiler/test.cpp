#include <string>

#include "test.h"
#include "ast.h"

//a + b
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

//array
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

	AST* nex0 = n4->insert(AST_node(dataType::call_inst));
	AST* nexx1 = nex0->insert(AST_node(dataType::name, datum("printf")));
	AST* nex1 = nex0->insert(AST_node(dataType::string, datum("%d %d")));
	AST* nex3 = nex0->insert(AST_node(dataType::subscript));
	AST* nex4 = nex3->insert(AST_node(dataType::name, datum("a")));
	AST* nex5 = nex3->insert(AST_node(dataType::constant, datum(5)));
	AST* nex6 = nex0->insert(AST_node(dataType::constant, datum(1333)));

	AST* n22 = n4->insert(AST_node(dataType::return_inst));
	AST* n23 = n22->insert(AST_node(dataType::constant, datum(0)));
	return n0;
}

//if branch
AST* getExampleAST3() {
	AST* n0 = new AST(AST_node(dataType::program));

	AST* n1 = n0->insert(AST_node(dataType::func_decl));
	AST* n2 = n1->insert(AST_node(dataType::int_type));
	AST* n3 = n1->insert(AST_node(dataType::name, datum("main")));
	AST* n4 = n1->insert(AST_node(dataType::seq_tree));

	AST* n5 = n4->insert(AST_node(dataType::decl_inst));
	AST* n6 = n5->insert(AST_node(dataType::int_type));
	AST* n7 = n5->insert(AST_node(dataType::name, datum("N")));
	AST* n8 = n5->insert(AST_node(dataType::name, datum("i")));

	AST* n9 = n4->insert(AST_node(dataType::assign));
	AST* n10 = n9->insert(AST_node(dataType::name, datum("N")));
	AST* n11 = n9->insert(AST_node(dataType::constant, datum(10)));

	AST* n12 = n4->insert(AST_node(dataType::assign));
	AST* n13 = n12->insert(AST_node(dataType::name, datum("i")));
	AST* n14 = n12->insert(AST_node(dataType::constant, datum(0)));

	AST* n15 = n4->insert(AST_node(dataType::if_inst));
	AST* n16 = n15->insert(AST_node(dataType::less));
	AST* n17 = n16->insert(AST_node(dataType::name, datum("i")));
	AST* n18 = n16->insert(AST_node(dataType::name, datum("N")));
	AST* n19 = n15->insert(AST_node(dataType::seq_tree));
	AST* n20 = n19->insert(AST_node(dataType::call_inst));
	AST* n21 = n20->insert(AST_node(dataType::name, datum("printf")));
	AST* n22 = n20->insert(AST_node(dataType::string, datum("If 1 checked")));

	AST* n23 = n4->insert(AST_node(dataType::assign));
	AST* n24 = n23->insert(AST_node(dataType::name, datum("i")));
	AST* n25 = n23->insert(AST_node(dataType::name, datum("N")));

	AST* n26 = n4->insert(AST_node(dataType::if_inst));
	AST* n27 = n26->insert(AST_node(dataType::less));
	AST* n28 = n27->insert(AST_node(dataType::name, datum("i")));
	AST* n29 = n27->insert(AST_node(dataType::name, datum("N")));
	AST* n30 = n26->insert(AST_node(dataType::seq_tree));
	AST* n31 = n30->insert(AST_node(dataType::call_inst));
	AST* n32 = n31->insert(AST_node(dataType::name, datum("printf")));
	AST* n33 = n31->insert(AST_node(dataType::string, datum("If 2 checked")));

	AST* n34 = n4->insert(AST_node(dataType::return_inst));
	AST* n35 = n34->insert(AST_node(dataType::constant, datum(0)));
	return n0;
}

//if branch + goto loop
AST* getExampleAST4() {
	AST* n0 = new AST(AST_node(dataType::program));

	AST* n1 = n0->insert(AST_node(dataType::func_decl));
	AST* n2 = n1->insert(AST_node(dataType::int_type));
	AST* n3 = n1->insert(AST_node(dataType::name, datum("main")));
	AST* n4 = n1->insert(AST_node(dataType::seq_tree));

	AST* n5 = n4->insert(AST_node(dataType::decl_inst));
	AST* n6 = n5->insert(AST_node(dataType::int_type));
	AST* n7 = n5->insert(AST_node(dataType::name, datum("i")));

	AST* nx1 = n4->insert(AST_node(dataType::assign));
	AST* nx2 = nx1->insert(AST_node(dataType::name, datum("i")));
	AST* nx3 = nx1->insert(AST_node(dataType::constant, datum(0)));

	AST* n7p5 = n4->insert(AST_node(dataType::label_decl, datum("label1")));

	AST* n8 = n4->insert(AST_node(dataType::if_inst));
	AST* n9 = n8->insert(AST_node(dataType::less));
	AST* n10 = n9->insert(AST_node(dataType::name, datum("i")));
	AST* n11 = n9->insert(AST_node(dataType::constant, datum(5)));
	AST* n12 = n8->insert(AST_node(dataType::seq_tree));

	AST* n13 = n12->insert(AST_node(dataType::call_inst));
	AST* n14 = n13->insert(AST_node(dataType::name, datum("printf")));
	AST* n15 = n13->insert(AST_node(dataType::string, datum("loop 1")));
	AST* n16 = n12->insert(AST_node(dataType::assign));
	AST* n17 = n16->insert(AST_node(dataType::name, datum("i")));
	AST* n18 = n16->insert(AST_node(dataType::plus));
	AST* n19 = n18->insert(AST_node(dataType::name, datum("i")));
	AST* n20 = n18->insert(AST_node(dataType::constant, datum(1)));
	AST* n21 = n12->insert(AST_node(dataType::goto_inst, datum("label1")));

	AST* n22 = n4->insert(AST_node(dataType::return_inst));
	AST* n23 = n22->insert(AST_node(dataType::constant, datum(0)));
	return n0;
}

//func call
AST* getExampleAST5() {
	AST* n0 = new AST(AST_node(dataType::program));

	AST* n1 = n0->insert(AST_node(dataType::func_decl));
	AST* n2 = n1->insert(AST_node(dataType::int_type));
	AST* n3 = n1->insert(AST_node(dataType::name, datum("func")));
	AST* n4 = n1->insert(AST_node(dataType::seq_tree));
	AST* n5 = n1->insert(AST_node(dataType::decl_inst));
	AST* n6 = n5->insert(AST_node(dataType::int_type));
	AST* n7 = n5->insert(AST_node(dataType::name, datum("a")));

	AST* n8 = n4->insert(AST_node(dataType::call_inst));
	AST* n9 = n8->insert(AST_node(dataType::name, datum("printf")));
	AST* n10 = n8->insert(AST_node(dataType::string, datum("%d\n")));
	AST* n11 = n8->insert(AST_node(dataType::name, datum("a")));

	AST* n12 = n4->insert(AST_node(dataType::return_inst));
	AST* n13 = n12->insert(AST_node(dataType::constant, datum(100)));

	AST* n14 = n0->insert(AST_node(dataType::func_decl));
	AST* n15 = n14->insert(AST_node(dataType::int_type));
	AST* n16 = n14->insert(AST_node(dataType::name, datum("main")));
	AST* n17 = n14->insert(AST_node(dataType::seq_tree));

	AST* n18 = n17->insert(AST_node(dataType::call_inst));
	AST* n19 = n18->insert(AST_node(dataType::name, datum("printf")));
	AST* n20 = n18->insert(AST_node(dataType::string, datum("%d\n")));
	AST* n21 = n18->insert(AST_node(dataType::call_inst));
	AST* n22 = n21->insert(AST_node(dataType::name, datum("func")));
	AST* n23 = n21->insert(AST_node(dataType::constant, datum(50)));

	AST* n24 = n17->insert(AST_node(dataType::return_inst));
	AST* n25 = n24->insert(AST_node(dataType::constant, datum(0)));
	return n0;
}