#pragma once

#include "IR.h"

struct ASM_funct{
	std::string name;
	
	std::map<int, int> alloc;
	std::map<int, int> space;
	std::vector<std::string> body;
};

struct ASMdata_RISCV{
	
	std::vector<std::string> globals;
	std::vector<ASM_funct> functs;
	
	ASMdata_RISCV();
	
	void parseFunct(IR_funct fun, int funcTag);
	void printASM(std::string filename);
};

ASMdata_RISCV ir2asm(IRdata_LLVM ir);