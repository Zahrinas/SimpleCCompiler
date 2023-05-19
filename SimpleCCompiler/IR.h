#pragma once
#include <string>
#include <vector>

#include "base.h"

struct IRdata_funct {

};

struct IRdata_LLVM {
    std::string source_filename;
    std::string datalayout;
    std::string triple;

    std::vector<string> string_globals;
    std::vector<int> int_globals;
    std::vector<double> double_globals;


};