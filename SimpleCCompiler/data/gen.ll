source_filename = "example.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"
@.0 = constant [6 x i8] c"%d %d\00"
define i32 @main() {
  %1 = alloca i32*
  %2 = alloca i32
  %3 = alloca i32
  %4 = load i32, i32* %2
  store i32 5, i32* %2
  %5 = load i32, i32* %3
  store i32 10, i32* %3
  %6 = load i32*, i32** %1
  %7 = call i8* @malloc(i64 400000)
  %8 = bitcast i8* %7 to i32*
  store i32* %8, i32** %1
  %9 = load i32*, i32** %1
  %10 = load i32, i32* %2
  %11 = getelementptr inbounds i32, i32*%9, i32 %10
  %12 = load i32, i32* %11
  %13 = load i32, i32* %3
  store i32 %13, i32* %11
  %14 = getelementptr inbounds i32, i32*%9, i32 5
  %15 = load i32, i32* %14
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.0, i64 0, i64 0), i32 %15, i32 1333)
  ret i32 0
}
declare i32 @__isoc99_scanf(i8*, ...)
declare i32 @printf(i8*, ...)
declare i8 * @malloc(i64 noundef)
