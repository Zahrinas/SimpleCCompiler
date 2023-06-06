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
	if(s[0] == '\"') s = std::string(s.substr(1, s.length() - 2));
	std::string str = "";
	bool trtag = 0;
	for (int i = 0; i < s.length(); ++i) {
		if(trtag){
			if(s[i] == 'n') str += '\n';
			trtag = 0;
		}
		else if (s[i] == '\\') trtag = 1;
		else str += s[i];
	}
	this->ptr = new std::string(str);
}

datum::datum(dataType dt) {
	this->type = dt;
	if (dt == dataType::void_type) this->ptr = nullptr;
	else if (dt == dataType::int_type) this->ptr = new int();
	else if (dt == dataType::double_type) this->ptr = new double();
	else if (dt == dataType::string) this->ptr = new std::string();
	else throw std::exception();
}

bool datum::operator==(datum b) {
	if (type != b.type) return false;
	if (type == dataType::int_type) return *(int*)ptr == *(int*)b.ptr;
	else if (type == dataType::double_type) return *(double*)ptr == *(double*)b.ptr;
	else if (type == dataType::string) return *(std::string*)ptr == *(std::string*)b.ptr;
	else throw std::exception();
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

int getBits(std::string s){
	if(s == "i8") return 8;
	if(s == "i64") return 64;
	if(s == "double") return 64;
	if(s[s.length() - 1] == '*') return 64;
	throw std::exception();
}