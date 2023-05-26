source_filename = "example.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"
@.0 = constant [3 x i8] c"%d\00"
@.1 = constant [3 x i8] c"%d\00"
@.2 = constant [4 x i8] c"%d\0A\00"
define void @Quicksort(i32* %0, i32 %1, i32 %2) {
  %4 = alloca i32*
  store i32* %0, i32** %4
  %5 = alloca i32
  store i32 %1, i32* %5
  %6 = alloca i32
  store i32 %2, i32* %6
  %7 = load i32, i32* %5
  %8 = load i32, i32* %6
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %80
  10:
  %11 = alloca i32
  %12 = load i32, i32* %11
  %13 = load i32*, i32** %4
  %14 = getelementptr inbounds i32, i32* %13, i32 %7
  %15 = load i32, i32* %14
  store i32 %15, i32* %11
  %16 = alloca i32
  %17 = load i32, i32* %16
  store i32 %7, i32* %16
  %18 = alloca i32
  %19 = load i32, i32* %18
  store i32 %8, i32* %18
  br label %20
  20:
  %21 = load i32, i32* %16
  %22 = load i32, i32* %18
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %70
  24:
  br label %25
  25:
  %26 = load i32, i32* %16
  %27 = load i32, i32* %18
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %39
  29:
  %30 = load i32*, i32** %4
  %31 = getelementptr inbounds i32, i32* %30, i32 %27
  %32 = load i32, i32* %31
  %33 = load i32, i32* %11
  %34 = icmp sge i32 %32, %33
  br i1 %34, label %35, label %38
  35:
  %36 = sub i32 %27, 1
  store i32 %36, i32* %18
  br label %25
  37:
  br label %38
  38:
  br label %39
  39:
  %40 = load i32*, i32** %4
  %41 = load i32, i32* %16
  %42 = getelementptr inbounds i32, i32* %40, i32 %41
  %43 = load i32, i32* %42
  %44 = load i32, i32* %18
  %45 = getelementptr inbounds i32, i32* %40, i32 %44
  %46 = load i32, i32* %45
  store i32 %46, i32* %42
  br label %47
  47:
  %48 = load i32, i32* %16
  %49 = load i32, i32* %18
  %50 = icmp slt i32 %48, %49
  br i1 %50, label %51, label %61
  51:
  %52 = load i32*, i32** %4
  %53 = getelementptr inbounds i32, i32* %52, i32 %48
  %54 = load i32, i32* %53
  %55 = load i32, i32* %11
  %56 = icmp sle i32 %54, %55
  br i1 %56, label %57, label %60
  57:
  %58 = add i32 %48, 1
  store i32 %58, i32* %16
  br label %47
  59:
  br label %60
  60:
  br label %61
  61:
  %62 = load i32*, i32** %4
  %63 = load i32, i32* %18
  %64 = getelementptr inbounds i32, i32* %62, i32 %63
  %65 = load i32, i32* %64
  %66 = load i32, i32* %16
  %67 = getelementptr inbounds i32, i32* %62, i32 %66
  %68 = load i32, i32* %67
  store i32 %68, i32* %64
  br label %20
  69:
  br label %70
  70:
  %71 = load i32*, i32** %4
  %72 = load i32, i32* %16
  %73 = getelementptr inbounds i32, i32* %71, i32 %72
  %74 = load i32, i32* %73
  %75 = load i32, i32* %11
  store i32 %75, i32* %73
  %76 = load i32, i32* %5
  %77 = sub i32 %72, 1
  call void (i32* %0, i32 %1, i32 %2) @Quicksort(i32* %71, i32 %76, i32 %77)
  %78 = add i32 %72, 1
  %79 = load i32, i32* %6
  call void (i32* %0, i32 %1, i32 %2) @Quicksort(i32* %71, i32 %78, i32 %79)
  br label %80
  80:
  ret void
}
define i32 @main() {
  %1 = alloca i32
  %2 = alloca i32
  %3 = load i32, i32* %1
  %4 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.0, i64 0, i64 0), i32* %1)
  %5 = alloca i32*
  %6 = load i32*, i32** %5
  %7 = call i8* @malloc(i64 400000)
  %8 = bitcast i8* %7 to i32*
  store i32* %8, i32** %5
  %9 = load i32, i32* %2
  store i32 0, i32* %2
  br label %10
  10:
  %11 = load i32, i32* %2
  %12 = load i32, i32* %1
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %21
  14:
  %15 = load i32*, i32** %5
  %16 = getelementptr inbounds i32, i32* %15, i32 %11
  %17 = load i32, i32* %16
  %18 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.0, i64 0, i64 0), i32* %16)
  %19 = add i32 %11, 1
  store i32 %19, i32* %2
  br label %10
  20:
  br label %21
  21:
  %22 = load i32*, i32** %5
  %23 = load i32, i32* %1
  %24 = sub i32 %23, 1
  call void (i32* %0, i32 %1, i32 %2) @Quicksort(i32* %22, i32 0, i32 %24)
  %25 = load i32, i32* %2
  store i32 0, i32* %2
  br label %26
  26:
  %27 = load i32, i32* %2
  %28 = load i32, i32* %1
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %37
  30:
  %31 = load i32*, i32** %5
  %32 = getelementptr inbounds i32, i32* %31, i32 %27
  %33 = load i32, i32* %32
  %34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.2, i64 0, i64 0), i32 %33)
  %35 = add i32 %27, 1
  store i32 %35, i32* %2
  br label %26
  36:
  br label %37
  37:
  ret i32 0
}
declare i32 @scanf(i8*, ...)
declare i32 @printf(i8*, ...)
declare i8* @malloc(i64)
