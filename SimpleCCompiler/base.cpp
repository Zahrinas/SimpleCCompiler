#include "base.h"

datum::datum(int i) {
	this->type = dataType::int_type;
	this->ptr = new int(i);
}

datum::datum(double d) {
	this->type = dataType::double_type;
	this->ptr = new double(d);
}

datum::datum(std::string s) {
	this->type = dataType::string;
	this->ptr = new std::string(s);
}

datum::datum(dataType dt) {
	this->type = dt;
	if (dt == dataType::void_type) this->ptr = nullptr;
	else if (dt == dataType::int_type) this->ptr = new int();
	else if (dt == dataType::double_type) this->ptr = new double();
	else if (dt == dataType::string) this->ptr = new std::string();
	else throw std::unexpected;
}

bool datum::operator==(datum b) {
	if (type != b.type) return false;
	if (type == dataType::int_type) return *(int*)ptr == *(int*)b.ptr;
	else if (type == dataType::double_type) return *(double*)ptr == *(double*)b.ptr;
	else if (type == dataType::string) return *(std::string*)ptr == *(std::string*)b.ptr;
	else throw std::unexpected;
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