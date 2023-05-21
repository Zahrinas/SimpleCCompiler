#include "base.h"

template <typename T>
tree<T>::tree(T data) {
	this->data = data;
}

template <typename T>
tree<T> tree<T>::insert(T data) {
	tree that = tree(data);
	tree.son.insert(that);
	return that;
}

datum::datum() {
	this->type = dataType::voidType;
	this->ptr = nullptr;
}

datum::datum(int i) {
	this->type = dataType::intType;
	this->ptr = new int(i);
}

datum::datum(double d) {
	this->type = dataType::doubleType;
	this->ptr = new double(d);
}

datum::datum(std::string s) {
	this->type = dataType::stringType;
	this->ptr = new std::string(s);
}

datum::datum(dataType dt) {
	this->type = dt;
	if (dt == dataType::intType) this->ptr = new int();
	else if (dt == dataType::doubleType) this->ptr = new double();
	else if (dt == dataType::stringType) this->ptr = new std::string();
	else throw unexpected;
}

int datum::getDataInt() {
	return *(int*)ptr;
}

double datum::getDataDouble() {
	return *(double*)ptr;
}

std::string datum::getDataString() {
	return *(std::string*)ptr;
}

variable::variable(std::string s, datum d) {
	this->name = s;
	this->data = d;
}

std::string getLLVM_type(dataType dt) {
	if (dt == dataType::intType) return "i32";
	else throw unexpected;
}