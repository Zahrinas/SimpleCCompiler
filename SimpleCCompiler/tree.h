#pragma once

template <typename T>
struct tree {
	T data;
	tree* son;
	tree* brother;

	tree(T data);
	tree insert(T data);
};