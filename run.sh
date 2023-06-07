#!/bin/sh
cd SimpleCCompiler
lex lex.l > out.txt
yacc yacc.y > out.txt
make all > out.txt
./gen data/Credit.c > out.txt
riscv64-linux-gnu-gcc gen.s -o pro > out.txt
./pro
