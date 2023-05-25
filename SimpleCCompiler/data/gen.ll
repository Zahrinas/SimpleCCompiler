source_filename = "example.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"
@.0 = constant [4 x i8] c"%d\0A\00"
@.1 = constant [4 x i8] c"%d\0A\00"
define i32 @func(i32 %0) {
  %2 = alloca i32
  store i32 %0, i32* %2
  %3 = load i32, i32* %2
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.0, i64 0, i64 0), i32 %3)
  ret i32 100
}
define i32 @main() {
  %1 = call i32 (i32 %0) @func(i32 50)
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.0, i64 0, i64 0), i32 %1)
  ret i32 0
}
declare i32 @__isoc99_scanf(i8*, ...)
declare i32 @printf(i8*, ...)
declare i8* @malloc(i64)
