#include "base.h"

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
	if (dt == dataType::voidType) this->ptr = nullptr;
	else if (dt == dataType::intType) this->ptr = new int();
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

std::string datum::toLLVM_type() {
	if (type == dataType::voidType) return "void";
	else if (type == dataType::intType) return "i32";
	else if (type == dataType::stringType) {
		std::string s = *(std::string*)ptr;
		int len = s.length();
		return "[" + std::to_string(len) + " x i8]";
	}
	else throw unexpected;
}

std::string datum::toStringExpr() {
	if (type == dataType::intType) return std::to_string(*(int*)ptr);
	else if (type == dataType::doubleType) return std::to_string(*(double*)ptr);
	else if (type == dataType::stringType) return "\"" + *(std::string*)ptr + "\\00\"";
	else throw unexpected;
}

variable::variable(std::string s, datum d) {
	this->name = s;
	this->data = d;
}