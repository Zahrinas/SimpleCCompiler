#!/bin/sh
cd SimpleCCompiler
lex lex.l > out.txt
yacc yacc.y > out.txt
make all > out.txt
./gen data/Credit.c > out.txt
clang gen.ll -o pr > out.txt
./pr
