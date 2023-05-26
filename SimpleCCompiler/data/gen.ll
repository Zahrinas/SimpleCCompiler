source_filename = "example.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"
@.0 = constant [7 x i8] c""%d\n"\00"
@.1 = constant [7 x i8] c""%d\n"\00"
declare i32 @__isoc99_scanf(i8*, ...)
declare i32 @printf(i8*, ...)
declare i8* @malloc(i64)
