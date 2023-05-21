#pragma once

#include <string>
#include <vector>

template <typename T>
struct tree {
	T data;
	std::vector<tree*> son;

	tree(T data);
	tree<T>* insert(T data);
};

enum class dataType {
	voidType, intType, doubleType, stringType
};

struct datum {
	dataType type;
	void* ptr;

	datum(int i);
	datum(double d);
	datum(std::string s);
	datum(dataType dt = dataType::voidType);

	int getDataInt();
	double getDataDouble();
	std::string getDataString();
	std::string toLLVM_type();
	std::string toStringExpr();
};

struct variable {
	std::string name;
	datum data;

	variable(std::string s, datum d);
};

template <typename T>
tree<T>::tree(T data) : data(data){
}

template <typename T>
tree<T>* tree<T>::insert(T data) {
	tree<T>* that = new tree<T>(data);
	son.push_back(that);
	return that;
}