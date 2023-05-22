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
	program,
	func_decl,
	seq_tree, eseq_tree,
	decl_inst, return_inst,
	call_inst,
	void_type, int_type, double_type, pointer_type,
	name, string, constant,
	plus, minus, multiply, divide,


	label_decl,
	if_inst, for_inst, while_inst,
	goto_inst
};

struct datum {
	dataType type;
	void* ptr;

	datum(int i);
	datum(double d);
	datum(std::string s);
	datum(dataType dt = dataType::void_type);

	bool operator==(datum b);

	int getDataInt();
	double getDataDouble();
	std::string getDataString();
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