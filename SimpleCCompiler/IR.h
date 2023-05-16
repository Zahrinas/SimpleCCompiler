#pragma once

#include "tree.h"

struct IRTOKEN {
	int type;
};

typedef tree<IRTOKEN> IR;