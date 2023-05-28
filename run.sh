cd SimpleCCompiler
make all
./gen data/Credit.c
clang gen.ll -o pr
./pr
