source_filename = "example.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"
@.0 = constant [5 x i8] c"%d%d\00"
@.1 = constant [3 x i8] c"%d\00"
define i32 @main() {
  %1 = alloca i32
  %2 = alloca i32
  %3 = load i32, i32* %1
  %4 = load i32, i32* %2
  %5 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.0, i64 0, i64 0), i32* %1, i32* %2)
  %6 = load i32, i32* %1
  %7 = load i32, i32* %2
  %8 = add i32 %6, %7
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.1, i64 0, i64 0), i32 %8)
  ret i32 0
}
declare i32 @__isoc99_scanf(i8*, ...)
declare i32 @printf(i8*, ...)
