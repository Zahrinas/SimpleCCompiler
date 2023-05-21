#pragma once

#include <string>
#include <vector>

template <typename T>
struct tree {
	T data;
	std::vector<tree> son;

	tree(T data);
	tree insert(T data);
};

enum class dataType {
	voidType, intType, doubleType, stringType
};

struct datum {
	dataType type;
	void* ptr;

	datum();
	datum(int i);
	datum(double d);
	datum(std::string s);
	datum(dataType dt);

	int getDataInt();
	double getDataDouble();
	std::string getDataString();
};

struct variable {
	std::string name;
	datum data;

	variable(std::string s, datum d);
};

std::string getLLVM_type(dataType dt);