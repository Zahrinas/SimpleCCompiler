#include "tree.h"

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