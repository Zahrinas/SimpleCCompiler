cd SimpleCCompiler
lex lex.l
yacc yacc.y
make all
./gen data/$1
clang gen.ll -o pr
./pr
