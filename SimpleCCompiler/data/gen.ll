source_filename = "example.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"
@.0 = constant [7 x i8] c"loop 1\00"
define i32 @main() {
  %1 = alloca i32
  %2 = load i32, i32* %1
  store i32 0, i32* %1
  br label %3
  3:
  %4 = load i32, i32* %1
  %5 = icmp slt i32 %4, 5
  br i1 %5, label %6, label %10
  6:
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.0, i64 0, i64 0))
  %8 = add i32 %4, 1
  store i32 %8, i32* %1
  br label %3
  9:
  br label %10
  10:
  ret i32 0
}
declare i32 @__isoc99_scanf(i8*, ...)
declare i32 @printf(i8*, ...)
declare i8 * @malloc(i64 noundef)
