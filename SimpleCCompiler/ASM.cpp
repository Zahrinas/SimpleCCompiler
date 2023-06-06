#include <iostream>
#include <fstream>

#include "ASM.h"

void ASMdata_RISCV::parseFunct(IR_funct fun, int funcTag){
	ASM_funct ret;
	int occu = 0, stk = 1;
	int op1, op2, op3;
	char buf[100], buf2[100], buf3[100];
	
	ret.name = fun.name;
	
	ret.body.push_back("\taddi\tsp,sp,-16");
	ret.body.push_back("\tsd\tfp,8(sp)");
	ret.body.push_back("\tsd\tra,0(sp)");
	ret.body.push_back("\tmv\tfp,sp");
	
	for(int i = 0; i <= fun.instCnt; ++i) occu += 8, ret.alloc[i] = occu;
	stk += fun.instCnt;
	
	for(int i = 0; i < fun.body.size(); ++i){
		if(strstr(fun.body[i].c_str(), "alloca")){
			sscanf(fun.body[i].c_str(), "%%%d", &op1);
			occu += 8, ret.space[op1] = occu;
			++stk;
		}
	}
	ret.body.push_back("\tli\tt0," + std::to_string(-8 * stk));
	ret.body.push_back("\tadd\tsp,sp,t0");
	
	for(int i = 0; i < fun.args.size(); ++i){
		sscanf(fun.args[i].c_str(), "%s", buf);
		ret.body.push_back("\tli\tt0," + std::to_string(16 + i * 8));
		ret.body.push_back("\tadd\tt0,t0,fp");
		ret.body.push_back("\tld\tt1,0(t0)");
		ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[i]));
		ret.body.push_back("\tadd\tt0,t0,fp");
		ret.body.push_back("\tsd\tt1,0(t0)");
	}
	
	for(int i = 0; i < fun.body.size(); ++i){
		ret.body.push_back("# " + fun.body[i]);
		sscanf(fun.body[i].c_str(), "%s", buf);
		if(buf[strlen(buf) - 1] == ':'){
			ret.body.push_back(std::string(".L") + std::to_string(funcTag) + "_" + buf);
		}
		else if(strcmp(buf, "store") == 0){
			sscanf(fun.body[i].c_str(), "store %s %s , %*s %%%d", buf, buf2, &op2);
			if(buf2[0] == '%'){
				sscanf(fun.body[i].c_str(), "store %*s %%%d , %*s %%%d", &op1, &op2);
				ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op1]));
				ret.body.push_back("\tadd\tt0,t0,fp");
				ret.body.push_back("\tld\tt2,0(t0)");
				ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op2]));
				ret.body.push_back("\tadd\tt0,t0,fp");
				ret.body.push_back("\tld\tt1,0(t0)");
				ret.body.push_back("\tsd\tt2,0(t1)");
			}
			else if(strcmp(buf, "i64") == 0){
				sscanf(fun.body[i].c_str(), "store %*s %d , %*s %%%d", &op1, &op2);
				ret.body.push_back("\tli\tt2," + std::to_string(op1));
				ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op2]));
				ret.body.push_back("\tadd\tt0,t0,fp");
				ret.body.push_back("\tld\tt1,0(t0)");
				ret.body.push_back("\tsd\tt2,0(t1)");
			}
			else if(strcmp(buf, "double") == 0){
				
			}
		}
		else if(strcmp(buf, "br") == 0){
			sscanf(fun.body[i].c_str(), "br %s", buf);
			if(strcmp(buf, "label") == 0){
				sscanf(fun.body[i].c_str(), "br label %%%d", &op1);
				ret.body.push_back("\tj\t.L" + std::to_string(funcTag) + "_" + std::to_string(op1));
			}
		}
		else if(strcmp(buf, "ret") == 0){
			sscanf(fun.body[i].c_str(), "ret %s %%%d", buf, &op2);
			ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op2]));
			ret.body.push_back("\tadd\tt0,t0,fp");
			ret.body.push_back("\tld\ta0,0(t0)");
			ret.body.push_back("\tli\tt0," + std::to_string(8 * stk));
			ret.body.push_back("\tadd\tsp,sp,t0");
			ret.body.push_back("\tld\tra,0(sp)");
			ret.body.push_back("\tld\tfp,8(sp)");
			ret.body.push_back("\tadd\tsp,sp,16");
			ret.body.push_back("\tret");
		}
		else if(strcmp(buf, "call") == 0){
			{
				char* stp = strchr(fun.body[i].c_str(), '(');
				int argCnt = 0;
				while(strchr(stp, '@')){
					++stp;
					++argCnt;
					stp = strchr(stp, ',');
				}
				stp = strchr(fun.body[i].c_str(), '@');
				sscanf(stp, "@%s", buf);
				for(int i = argCnt - 1; i >= 0; --i){
					stp = strchr(stp, '%');
					++stp;
					sscanf(stp, "%d", &op2);
					ret.body.push_back("\taddi\tsp,sp,-8");
					ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op2]));
					ret.body.push_back("\tadd\tt0,t0,fp");
					ret.body.push_back("\tld\tt1,0(t0)");
					ret.body.push_back("\tli\tt0," + std::to_string(-8 * (stk + i + 1)));
					ret.body.push_back("\tadd\tt0,t0,fp");
					ret.body.push_back("\tsd\tt1,0(t0)");
				}
				ret.body.push_back(std::string("\tcall\t") + buf + "@plt");
				ret.body.push_back("\taddi\tsp,sp," + std::to_string(argCnt * 8));
			}
		}
		else{
			sscanf(fun.body[i].c_str(), "%%%d = %s", &op1, buf);
			if(strcmp(buf, "icmp") == 0){
				int label;
				sscanf(fun.body[i].c_str(), "%%%*d = icmp %s %s %%%d , %%%d", buf, buf2, &op2, &op3);
				ret.body.push_back("# " + fun.body[++i]);
				ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op2]));
				ret.body.push_back("\tadd\tt0,t0,fp");
				ret.body.push_back("\tld\tt1,0(t0)");
				ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op3]));
				ret.body.push_back("\tadd\tt0,t0,fp");
				ret.body.push_back("\tld\tt2,0(t0)");
				sscanf(fun.body[i].c_str(), "br i1 %%%*d , label %%%*d , label %%%d", &label);
				if(strcmp(buf, "slt") == 0){
					ret.body.push_back("\tbge\tt1,t2,.L" + std::to_string(funcTag) + "_" + std::to_string(label));
				}
				else if(strcmp(buf, "sgt") == 0){
					ret.body.push_back("\tbge\tt2,t1,.L" + std::to_string(funcTag) + "_" + std::to_string(label));
				}
				else if(strcmp(buf, "sge") == 0){
					ret.body.push_back("\tblt\tt1,t2,.L" + std::to_string(funcTag) + "_" + std::to_string(label));
				}
				else if(strcmp(buf, "sle") == 0){
					ret.body.push_back("\tblt\tt2,t1,.L" + std::to_string(funcTag) + "_" + std::to_string(label));
				}
				else if(strcmp(buf, "eq") == 0){
					ret.body.push_back("\tbne\tt1,t2,.L" + std::to_string(funcTag) + "_" + std::to_string(label));
				}
				else if(strcmp(buf, "ne") == 0){
					ret.body.push_back("\tbeq\tt1,t2,.L" + std::to_string(funcTag) + "_" + std::to_string(label));
				}
			}
			else if(strcmp(buf, "add") == 0){
				sscanf(fun.body[i].c_str(), "%%%*d = add %s %%%d , %%%d", buf, &op2, &op3);
				ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op2]));
				ret.body.push_back("\tadd\tt0,t0,fp");
				ret.body.push_back("\tld\tt1,0(t0)");
				ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op3]));
				ret.body.push_back("\tadd\tt0,t0,fp");
				ret.body.push_back("\tld\tt2,0(t0)");
				ret.body.push_back("\tadd\tt1,t1,t2");
				ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op1]));
				ret.body.push_back("\tadd\tt0,t0,fp");
				ret.body.push_back("\tsd\tt1,0(t0)");
			}
			else if(strcmp(buf, "sub") == 0){
				sscanf(fun.body[i].c_str(), "%%%*d = sub %s %%%d , %%%d", buf, &op2, &op3);
				ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op2]));
				ret.body.push_back("\tadd\tt0,t0,fp");
				ret.body.push_back("\tld\tt1,0(t0)");
				ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op3]));
				ret.body.push_back("\tadd\tt0,t0,fp");
				ret.body.push_back("\tld\tt2,0(t0)");
				ret.body.push_back("\tsub\tt1,t1,t2");
				ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op1]));
				ret.body.push_back("\tadd\tt0,t0,fp");
				ret.body.push_back("\tsd\tt1,0(t0)");
			}
			else if(strcmp(buf, "mul") == 0){
				sscanf(fun.body[i].c_str(), "%%%*d = mul %s %%%d , %%%d", buf, &op2, &op3);
				ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op2]));
				ret.body.push_back("\tadd\tt0,t0,fp");
				ret.body.push_back("\tld\tt1,0(t0)");
				ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op3]));
				ret.body.push_back("\tadd\tt0,t0,fp");
				ret.body.push_back("\tld\tt2,0(t0)");
				ret.body.push_back("\tmul\tt1,t1,t2");
				ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op1]));
				ret.body.push_back("\tadd\tt0,t0,fp");
				ret.body.push_back("\tsd\tt1,0(t0)");
			}
			else if(strcmp(buf, "div") == 0){
				sscanf(fun.body[i].c_str(), "%%%*d = div %s %%%d , %%%d", buf, &op2, &op3);
				ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op2]));
				ret.body.push_back("\tadd\tt0,t0,fp");
				ret.body.push_back("\tld\tt1,0(t0)");
				ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op3]));
				ret.body.push_back("\tadd\tt0,t0,fp");
				ret.body.push_back("\tld\tt2,0(t0)");
				ret.body.push_back("\tdiv\tt1,t1,t2");
				ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op1]));
				ret.body.push_back("\tadd\tt0,t0,fp");
				ret.body.push_back("\tsd\tt1,0(t0)");
			}
			else if(strcmp(buf, "alloca") == 0){
				ret.body.push_back("\tli\tt0," + std::to_string(-ret.space[op1]));
				ret.body.push_back("\tadd\tt1,t0,fp");
				ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op1]));
				ret.body.push_back("\tadd\tt0,t0,fp");
				ret.body.push_back("\tsd\tt1,0(t0)");
			}else if(strcmp(buf, "load") == 0){
				sscanf(fun.body[i].c_str(), "%%%*d = load %s , %*s %%%d", buf, &op2);
				ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op2]));
				ret.body.push_back("\tadd\tt0,t0,fp");
				ret.body.push_back("\tld\tt1,0(t0)");
				ret.body.push_back("\tld\tt1,0(t1)");
				ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op1]));
				ret.body.push_back("\tadd\tt0,t0,fp");
				ret.body.push_back("\tsd\tt1,0(t0)");
			}
			else if(strcmp(buf, "getelementptr") == 0){
				sscanf(fun.body[i].c_str(), "%%%*d = getelementptr inbounds %s", buf);
				if(buf[0] == '['){
					sscanf(fun.body[i].c_str(), "%%%*d = getelementptr inbounds [%*d x i8] , [%*d x i8]* @.%d", &op2);
					ret.body.push_back("\tlla\tt1,.LC" + std::to_string(op2));
					ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op1]));
					ret.body.push_back("\tadd\tt0,t0,fp");
					ret.body.push_back("\tsd\tt1,0(t0)");
				}else{
					sscanf(fun.body[i].c_str(), "%%%*d = getelementptr inbounds %s , %*s %%%d , %s %%%d", buf2, &op2, buf3, &op3);
					ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op2]));
					ret.body.push_back("\tadd\tt0,t0,fp");
					ret.body.push_back("\tld\tt1,0(t0)");
					ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op3]));
					ret.body.push_back("\tadd\tt0,t0,fp");
					ret.body.push_back("\tld\tt2,0(t0)");
					if(getBits(buf2) == 64) ret.body.push_back("\tslli\tt2,t2,3");
					else{
						
					}
					ret.body.push_back("\tadd\tt1,t1,t2");
					ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op1]));
					ret.body.push_back("\tadd\tt0,t0,fp");
					ret.body.push_back("\tsd\tt1,0(t0)");
				}
			}
			else if(strcmp(buf, "bitcast") == 0){
				sscanf(fun.body[i].c_str(), "%%%d = bitcast %*s %%%d to %*s", &op1, &op2);
				ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op2]));
				ret.body.push_back("\tadd\tt0,t0,fp");
				ret.body.push_back("\tld\tt1,0(t0)");
				ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op1]));
				ret.body.push_back("\tadd\tt0,t0,fp");
				ret.body.push_back("\tsd\tt1,0(t0)");
			}
			else if(strcmp(buf, "call") == 0){
				if(fun.body[i].find("scanf") != std::string::npos){
					sscanf(fun.body[i].c_str(), "%%%d = call i64 (i8*, ...) @scanf (%s %%%d , %s %%%d)", &op1, buf2, &op2, buf3, &op3);
					ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op2]));
					ret.body.push_back("\tadd\tt0,t0,fp");
					ret.body.push_back("\tld\ta0,0(t0)");
					ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op3]));
					ret.body.push_back("\tadd\tt0,t0,fp");
					ret.body.push_back("\tld\ta1,0(t0)");
					ret.body.push_back("\tcall\tscanf@plt");
					ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op1]));
					ret.body.push_back("\tadd\tt0,t0,fp");
					ret.body.push_back("\tsd\ta0,0(t0)");
				}
				else if(fun.body[i].find("printf") != std::string::npos){
					int rd = sscanf(fun.body[i].c_str(), "%%%d = call i64 (i8*, ...) @printf (%s %%%d , %s %%%d)", &op1, buf2, &op2, buf3, &op3);
					ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op2]));
					ret.body.push_back("\tadd\tt0,t0,fp");
					ret.body.push_back("\tld\ta0,0(t0)");
					if(rd == 5){
						ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op3]));
						ret.body.push_back("\tadd\tt0,t0,fp");
						ret.body.push_back("\tld\ta1,0(t0)");
					}
					ret.body.push_back("\tcall\tprintf@plt");
					ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op1]));
					ret.body.push_back("\tadd\tt0,t0,fp");
					ret.body.push_back("\tsd\ta0,0(t0)");
				}
				else if(fun.body[i].find("malloc") != std::string::npos){
					sscanf(fun.body[i].c_str(), "%%%d = call i8* (i64) @malloc (i64 %%%d)", &op1, &op2);
					ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op2]));
					ret.body.push_back("\tadd\tt0,t0,fp");
					ret.body.push_back("\tld\ta0,0(t0)");
					ret.body.push_back("\tcall\tmalloc@plt");
					ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op1]));
					ret.body.push_back("\tadd\tt0,t0,fp");
					ret.body.push_back("\tsd\ta0,0(t0)");
				}
				else{
					char* stp = strchr(fun.body[i].c_str(), '(');
					int argCnt = 0;
					while(stp && strchr(stp, '@')){
						++stp;
						++argCnt;
						stp = strchr(stp, ',');
					}
					stp = strchr(fun.body[i].c_str(), '@');
					sscanf(stp, "@%s", buf);
					for(int i = argCnt - 1; i >= 0; --i){
						stp = strchr(stp, '%');
						++stp;
						sscanf(stp, "%d", &op2);
						ret.body.push_back("\taddi\tsp,sp,-8");
						ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op2]));
						ret.body.push_back("\tadd\tt0,t0,fp");
						ret.body.push_back("\tld\tt1,0(t0)");
						ret.body.push_back("\tli\tt0," + std::to_string(-8 * (stk + i + 1)));
						ret.body.push_back("\tadd\tt0,t0,fp");
						ret.body.push_back("\tsd\tt1,0(t0)");
					}
					ret.body.push_back(std::string("\tcall\t") + buf + "@plt");
					ret.body.push_back("\tli\tt0," + std::to_string(-ret.alloc[op1]));
					ret.body.push_back("\tadd\tt0,t0,fp");
					ret.body.push_back("\tsd\ta0,0(t0)");
					ret.body.push_back("\taddi\tsp,sp," + std::to_string(argCnt * 8));
				}
			}
		}
	}
	
	functs.push_back(ret);
}

ASMdata_RISCV::ASMdata_RISCV(){
}

ASMdata_RISCV ir2asm(IRdata_LLVM ir){
	ASMdata_RISCV ret;
	
	for(int i = 0; i < ir.globals.size(); ++i){
		ret.globals.push_back(ir.globals[i].toASMExpr());
	}
	
	for(int i = 0; i < ir.functs.size(); ++i){
		ret.parseFunct(ir.functs[i], i);
	}
	
	return ret;
}

void ASMdata_RISCV::printASM(std::string filename){
	std::ofstream fout(filename);
	
	fout << "\t.file\t\"example.c\"" << std::endl;
	fout << "\t.option\tpic" <<std::endl;
	
	for(int i = 0; i < functs.size(); ++i){
		fout << "\t.text" << std::endl;
		fout << "\t.align\t1" << std::endl;
		fout << "\t.globl\t" << functs[i].name << std::endl;
		fout << "\t.type\t" << functs[i].name << ", @function" << std::endl;
		fout << functs[i].name << ":" << std::endl;
		
		for(int j = 0; j < functs[i].body.size(); ++j){
			fout << functs[i].body[j] << std::endl;
		}
		
		fout << "\t.size\t" << functs[i].name << ", .-" << functs[i].name << std::endl;
	}
	
	fout << "\t.section\t.rodata" << std::endl;
	
	for(int i = 0; i < globals.size(); ++i){
		fout << "\t.align\t3" << std::endl;
		fout << ".LC" << i << ":" << std::endl;
		fout << "\t.string\t\"" << globals[i]  << "\"" << std::endl;
	}
	
	fout << "\t.section\t.note.GNU-stack,\"\",@progbits" << std::endl;
}