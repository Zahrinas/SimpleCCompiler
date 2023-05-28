cd SimpleCCompiler
make all
./gen data/$1
clang gen.ll -o pr
./pr