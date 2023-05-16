#pragma once

template <typename T>
struct tree {
	T data;
	tree* son;
	tree* brother;

	tree(T data) {
		this->data = data;
		this->son = this->brother = nullptr;
	}

	void insert(T data) {
		tree that = tree(data);
		that->brother = this->son;
		this->son = that;
	}
};