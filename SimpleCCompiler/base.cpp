#include "base.h"

template <typename T>
tree<T>::tree(T data) {
	this->data = data;
	this->son = this->brother = nullptr;
}

template <typename T>
tree<T> tree<T>::insert(T data) {
	tree that = tree(data);
	for (tree* s = this->son; s->brother; s = s->brother);
	s->brother = that;
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