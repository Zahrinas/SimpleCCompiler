#pragma once

#include <string>
#include <vector>

template <typename T>
struct tree {
	T data;
	tree<T>* next;
	tree<T>* child;
	std::string name;

	tree(T data);
	tree<T>* insert(T data);
	tree<T>* son(int id);
};

enum class dataType {
	program,
	func_decl,
	seq_tree, eseq_tree,

	decl_inst,
	return_inst, call_inst,

	void_type, int_type, double_type, char_type,
	int_pointer, double_pointer, char_pointer,

	name, string, constant,

	plus, minus, multiply, divide, mod,
	and_type, or_type, not_type,
	equal, not_equal, greater, less, greater_equal, less_equal,
	band, bor, bxor, uminus,

	assign_inst,
	address, member, subscript,

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

template <typename T>
tree<T>::tree(T data) : data(data), child(nullptr), next(nullptr){
}

template <typename T>
tree<T>* tree<T>::son(int id){
	tree<T>* now = child;
	for(int i = 0; i < id; ++i){
		now = now->next;
	}
	return now;
}