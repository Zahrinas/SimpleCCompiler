#include "test.h"

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

}