#include "AST.h"

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
    else throw;
}

int datum::getDataInt() {
    return *(int *)ptr;
}

double datum::getDataDouble() {
    return *(double *)ptr;
}

std::string datum::getDataString() {
    return *(std::string *)ptr;
}