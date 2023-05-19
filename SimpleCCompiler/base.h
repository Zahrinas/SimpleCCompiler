#pragma once

#include <string>

template <typename T>
struct tree {
	T data;
	tree* son;
	tree* brother;

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
};