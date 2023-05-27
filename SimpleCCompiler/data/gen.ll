source_filename = "example.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"
@.0 = constant [3 x i8] c"%d\00"
@.1 = constant [12 x i8] c"GPA: %.1lf\0A\00"
@.2 = constant [21 x i8] c"Hours Attempted: %d\0A\00"
@.3 = constant [21 x i8] c"Hours Completed: %d\0A\00"
@.4 = constant [23 x i8] c"Credits Remaining: %d\0A\00"
@.5 = constant [32 x i8] c"\0APossible Courses to Take Next\0A\00"
@.6 = constant [6 x i8] c"  %s\0A\00"
@.7 = constant [6 x i8] c"  %s\0A\00"
@.8 = constant [27 x i8] c"  None - Congratulations!\0A\00"
define void @mergeOrList(i32 %0, i32 %1, i32* %2, i32* %3, i32* %4) {
  %6 = alloca i32
  store i32 %0, i32* %6
  %7 = alloca i32
  store i32 %1, i32* %7
  %8 = alloca i32*
  store i32* %2, i32** %8
  %9 = alloca i32*
  store i32* %3, i32** %9
  %10 = alloca i32*
  store i32* %4, i32** %10
  %11 = load i32*, i32** %8
  %12 = load i32*, i32** %8
  %13 = load i32, i32* %12
  %14 = load i32*, i32** %8
  %15 = load i32, i32* %14
  %16 = add i32 %15, 1
  store i32 %16, i32* %12
  %17 = load i32*, i32** %9
  %18 = load i32*, i32** %8
  %19 = load i32, i32* %18
  %20 = getelementptr inbounds i32, i32* %17, i32 %19
  %21 = load i32, i32* %20
  %22 = load i32, i32* %7
  store i32 %22, i32* %20
  br label %23
  23:
  %24 = load i32*, i32** %10
  %25 = load i32, i32* %6
  %26 = getelementptr inbounds i32, i32* %24, i32 %25
  %27 = load i32, i32* %26
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %33
  29:
  %30 = getelementptr inbounds i32, i32* %24, i32 %25
  %31 = load i32, i32* %30
  store i32 %31, i32* %6
  br label %23
  32:
  br label %33
  33:
  %34 = load i32*, i32** %10
  %35 = load i32, i32* %6
  %36 = getelementptr inbounds i32, i32* %34, i32 %35
  %37 = load i32, i32* %36
  %38 = load i32*, i32** %8
  %39 = load i32*, i32** %8
  %40 = load i32, i32* %39
  store i32 %40, i32* %36
  ret void
}
define void @mergeAndList(i32 %0, i32 %1, i32* %2, i32* %3, i32* %4) {
  %6 = alloca i32
  store i32 %0, i32* %6
  %7 = alloca i32
  store i32 %1, i32* %7
  %8 = alloca i32*
  store i32* %2, i32** %8
  %9 = alloca i32*
  store i32* %3, i32** %9
  %10 = alloca i32*
  store i32* %4, i32** %10
  %11 = load i32*, i32** %8
  %12 = load i32*, i32** %8
  %13 = load i32, i32* %12
  %14 = load i32*, i32** %8
  %15 = load i32, i32* %14
  %16 = add i32 %15, 1
  store i32 %16, i32* %12
  %17 = load i32*, i32** %9
  %18 = load i32*, i32** %8
  %19 = load i32, i32* %18
  %20 = getelementptr inbounds i32, i32* %17, i32 %19
  %21 = load i32, i32* %20
  %22 = load i32, i32* %7
  store i32 %22, i32* %20
  br label %23
  23:
  %24 = load i32*, i32** %10
  %25 = load i32, i32* %6
  %26 = getelementptr inbounds i32, i32* %24, i32 %25
  %27 = load i32, i32* %26
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %33
  29:
  %30 = getelementptr inbounds i32, i32* %24, i32 %25
  %31 = load i32, i32* %30
  store i32 %31, i32* %6
  br label %23
  32:
  br label %33
  33:
  %34 = load i32*, i32** %10
  %35 = load i32, i32* %6
  %36 = getelementptr inbounds i32, i32* %34, i32 %35
  %37 = load i32, i32* %36
  %38 = load i32*, i32** %8
  %39 = load i32*, i32** %8
  %40 = load i32, i32* %39
  store i32 %40, i32* %36
  ret void
}
define i32 @store(i8* %0, i8* %1) {
  %3 = alloca i8*
  store i8* %0, i8** %3
  %4 = alloca i8*
  store i8* %1, i8** %4
  %5 = alloca i32
  %6 = load i32, i32* %5
  store i32 0, i32* %5
  br label %7
  7:
  %8 = load i8*, i8** %4
  %9 = load i32, i32* %5
  %10 = getelementptr inbounds i8, i8* %8, i32 %9
  %11 = load i8, i8* %10
  %12 = icmp ne i8 %11, 124
  br i1 %12, label %13, label %31
  13:
  %14 = getelementptr inbounds i8, i8* %8, i32 %9
  %15 = load i8, i8* %14
  %16 = icmp ne i8 %15, 44
  br i1 %16, label %17, label %30
  17:
  %18 = getelementptr inbounds i8, i8* %8, i32 %9
  %19 = load i8, i8* %18
  %20 = icmp ne i8 %19, 59
  br i1 %20, label %21, label %29
  21:
  %22 = load i8*, i8** %3
  %23 = getelementptr inbounds i8, i8* %22, i32 %9
  %24 = load i8, i8* %23
  %25 = getelementptr inbounds i8, i8* %8, i32 %9
  %26 = load i8, i8* %25
  store i8 %26, i8* %23
  %27 = add i32 %9, 1
  store i32 %27, i32* %5
  br label %7
  28:
  br label %29
  29:
  br label %30
  30:
  br label %31
  31:
  %32 = load i8*, i8** %3
  %33 = load i32, i32* %5
  %34 = getelementptr inbounds i8, i8* %32, i32 %33
  %35 = load i8, i8* %34
  %36 = trunc i32 0 to i8
  store i8 %36, i8* %34
  ret i32 %33
}
define i32 @storeOrSeq(i8* %0, i32* %1, i8* %2, i32* %3, i32* %4, i32* %5, i32* %6, i32* %7, i32* %8) {
  %10 = alloca i8*
  store i8* %0, i8** %10
  %11 = alloca i32*
  store i32* %1, i32** %11
  %12 = alloca i8*
  store i8* %2, i8** %12
  %13 = alloca i32*
  store i32* %3, i32** %13
  %14 = alloca i32*
  store i32* %4, i32** %14
  %15 = alloca i32*
  store i32* %5, i32** %15
  %16 = alloca i32*
  store i32* %6, i32** %16
  %17 = alloca i32*
  store i32* %7, i32** %17
  %18 = alloca i32*
  store i32* %8, i32** %18
  %19 = alloca i32
  %20 = alloca i32
  %21 = alloca i32
  %22 = alloca i32
  %23 = alloca i32
  %24 = alloca i8*
  %25 = load i8*, i8** %24
  %26 = call i8* @malloc(i64 20)
  store i8* %26, i8** %24
  %27 = load i32*, i32** %14
  %28 = load i32*, i32** %14
  %29 = load i32, i32* %28
  %30 = load i32*, i32** %14
  %31 = load i32, i32* %30
  %32 = add i32 %31, 1
  store i32 %32, i32* %28
  %33 = load i32, i32* %20
  %34 = load i32*, i32** %14
  %35 = load i32, i32* %34
  store i32 %35, i32* %20
  %36 = load i32, i32* %21
  store i32 1, i32* %21
  %37 = load i32, i32* %22
  store i32 1, i32* %22
  %38 = load i32, i32* %23
  store i32 1, i32* %23
  br label %39
  39:
  %40 = load i32, i32* %23
  %41 = icmp eq i32 %40, 1
  br i1 %41, label %42, label %148
  42:
  %43 = load i8*, i8** %10
  %44 = getelementptr inbounds i8, i8* %43, i32 0
  %45 = load i8, i8* %44
  %46 = icmp eq i8 %45, 59
  br i1 %46, label %47, label %49
  47:
  %48 = load i32, i32* %22
  store i32 1, i32* %22
  br label %49
  49:
  %50 = load i8*, i8** %10
  %51 = getelementptr inbounds i8, i8* %50, i32 0
  %52 = load i8, i8* %51
  %53 = icmp eq i8 %52, 124
  br i1 %53, label %54, label %69
  54:
  %55 = load i32, i32* %21
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %57, label %60
  57:
  %58 = load i32, i32* %23
  store i32 0, i32* %23
  br label %39
  59:
  br label %60
  60:
  %61 = load i8*, i8** %10
  %62 = getelementptr inbounds i8, i8* %61, i32 1
  %63 = load i8, i8* %62
  %64 = icmp eq i8 %63, 124
  br i1 %64, label %65, label %68
  65:
  %66 = load i32, i32* %23
  store i32 0, i32* %23
  br label %39
  67:
  br label %68
  68:
  br label %69
  69:
  %70 = load i8*, i8** %10
  %71 = add i8* %70, 1
  store i8* %71, i8** %10
  %72 = load i8*, i8** %10
  %73 = load i8*, i8** %24
  %74 = call i32 (i8* %0, i8* %1) @store(i8* %73, i8* %72)
  %75 = add i8* %72, %74
  store i8* %75, i8** %10
  %76 = alloca i32
  %77 = alloca i32
  %78 = load i32, i32* %77
  store i32 1, i32* %77
  br label %79
  79:
  %80 = load i32, i32* %77
  %81 = load i32*, i32** %11
  %82 = load i32*, i32** %11
  %83 = load i32, i32* %82
  %84 = icmp sle i32 %80, %83
  br i1 %84, label %85, label %99
  85:
  %86 = load i8*, i8** %24
  %87 = load i8*, i8** %12
  %88 = mul i32 %80, 10
  %89 = add i8* %87, %88
  %90 = call  () @strcmp(i8* %86, i8* %89)
  %91 = icmp eq  %90, 0
  br i1 %91, label %92, label %95
  92:
  %93 = load i32, i32* %76
  store i32 %80, i32* %76
  br label %0
  94:
  br label %95
  95:
  %96 = load i32, i32* %77
  %97 = add i32 %96, 1
  store i32 %97, i32* %77
  br label %79
  98:
  br label %99
  99:
  br label %100
  100:
  %101 = load i32, i32* %22
  %102 = icmp ne i32 %101, 0
  br i1 %102, label %103, label %135
  103:
  %104 = load i32*, i32** %13
  %105 = load i32*, i32** %13
  %106 = load i32, i32* %105
  %107 = load i32*, i32** %13
  %108 = load i32, i32* %107
  %109 = add i32 %108, 1
  store i32 %109, i32* %105
  %110 = load i32, i32* %19
  %111 = load i32*, i32** %13
  %112 = load i32, i32* %111
  store i32 %112, i32* %19
  %113 = load i32*, i32** %15
  %114 = load i32, i32* %19
  %115 = getelementptr inbounds i32, i32* %113, i32 %114
  %116 = load i32, i32* %115
  %117 = load i32, i32* %76
  store i32 %117, i32* %115
  %118 = load i32, i32* %21
  %119 = icmp ne i32 %118, 0
  br i1 %119, label %120, label %125
  120:
  %121 = load i32*, i32** %16
  %122 = load i32, i32* %20
  %123 = getelementptr inbounds i32, i32* %121, i32 %122
  %124 = load i32, i32* %123
  store i32 %114, i32* %123
  br label %125
  125:
  %126 = load i32, i32* %21
  %127 = icmp eq i32 %126, 0
  br i1 %127, label %128, label %134
  128:
  %129 = load i32, i32* %20
  %130 = load i32, i32* %19
  %131 = load i32*, i32** %14
  %132 = load i32*, i32** %16
  %133 = load i32*, i32** %18
  call void (i32 %0, i32 %1, i32* %2, i32* %3, i32* %4) @mergeOrList(i32 %129, i32 %130, i32* %131, i32* %132, i32* %133)
  br label %134
  134:
  br label %135
  135:
  %136 = load i32, i32* %22
  %137 = icmp eq i32 %136, 0
  br i1 %137, label %138, label %144
  138:
  %139 = load i32, i32* %19
  %140 = load i32, i32* %76
  %141 = load i32*, i32** %13
  %142 = load i32*, i32** %15
  %143 = load i32*, i32** %17
  call void (i32 %0, i32 %1, i32* %2, i32* %3, i32* %4) @mergeAndList(i32 %139, i32 %140, i32* %141, i32* %142, i32* %143)
  br label %144
  144:
  %145 = load i32, i32* %21
  store i32 0, i32* %21
  %146 = load i32, i32* %22
  store i32 0, i32* %22
  br label %39
  147:
  br label %148
  148:
  %149 = load i32, i32* %20
  ret i32 %149
}
define double @getGPA(i32* %0, i8* %1, i32* %2) {
  %4 = alloca i32*
  store i32* %0, i32** %4
  %5 = alloca i8*
  store i8* %1, i8** %5
  %6 = alloca i32*
  store i32* %2, i32** %6
  %7 = alloca double
  %8 = alloca i32
  %9 = alloca i32
  %10 = load i32, i32* %8
  store i32 0, i32* %8
  %11 = load double, double* %7
  store i32 0, double* %7
  %12 = load i32, i32* %9
  store i32 1, i32* %9
  br label %13
  13:
  %14 = load i32, i32* %9
  %15 = load i32*, i32** %4
  %16 = load i32*, i32** %4
  %17 = load i32, i32* %16
  %18 = icmp sle i32 %14, %17
  br i1 %18, label %19, label %85
  19:
  %20 = load i8*, i8** %5
  %21 = getelementptr inbounds i8, i8* %20, i32 %14
  %22 = load i8, i8* %21
  br i8 %22, label %23, label %29
  23:
  %24 = load i32, i32* %8
  %25 = load i32*, i32** %6
  %26 = getelementptr inbounds i32, i32* %25, i32 %14
  %27 = load i32, i32* %26
  %28 = add i32 %24, %27
  store i32 %28, i32* %8
  br label %29
  29:
  %30 = load i8*, i8** %5
  %31 = load i32, i32* %9
  %32 = getelementptr inbounds i8, i8* %30, i32 %31
  %33 = load i8, i8* %32
  %34 = icmp eq i8 %33, 65
  br i1 %34, label %35, label %42
  35:
  %36 = load double, double* %7
  %37 = load i32*, i32** %6
  %38 = getelementptr inbounds i32, i32* %37, i32 %31
  %39 = load i32, i32* %38
  %40 = mul i32 %39, 4
  %41 = add double %36, %40
  store double %41, double* %7
  br label %42
  42:
  %43 = load i8*, i8** %5
  %44 = load i32, i32* %9
  %45 = getelementptr inbounds i8, i8* %43, i32 %44
  %46 = load i8, i8* %45
  %47 = icmp eq i8 %46, 66
  br i1 %47, label %48, label %55
  48:
  %49 = load double, double* %7
  %50 = load i32*, i32** %6
  %51 = getelementptr inbounds i32, i32* %50, i32 %44
  %52 = load i32, i32* %51
  %53 = mul i32 %52, 3
  %54 = add double %49, %53
  store double %54, double* %7
  br label %55
  55:
  %56 = load i8*, i8** %5
  %57 = load i32, i32* %9
  %58 = getelementptr inbounds i8, i8* %56, i32 %57
  %59 = load i8, i8* %58
  %60 = icmp eq i8 %59, 67
  br i1 %60, label %61, label %68
  61:
  %62 = load double, double* %7
  %63 = load i32*, i32** %6
  %64 = getelementptr inbounds i32, i32* %63, i32 %57
  %65 = load i32, i32* %64
  %66 = mul i32 %65, 2
  %67 = add double %62, %66
  store double %67, double* %7
  br label %68
  68:
  %69 = load i8*, i8** %5
  %70 = load i32, i32* %9
  %71 = getelementptr inbounds i8, i8* %69, i32 %70
  %72 = load i8, i8* %71
  %73 = icmp eq i8 %72, 68
  br i1 %73, label %74, label %81
  74:
  %75 = load double, double* %7
  %76 = load i32*, i32** %6
  %77 = getelementptr inbounds i32, i32* %76, i32 %70
  %78 = load i32, i32* %77
  %79 = mul i32 %78, 1
  %80 = add double %75, %79
  store double %80, double* %7
  br label %81
  81:
  %82 = load i32, i32* %9
  %83 = add i32 %82, 1
  store i32 %83, i32* %9
  br label %13
  84:
  br label %85
  85:
  %86 = load double, double* %7
  %87 = load i32, i32* %8
  %88 = div double %86, %87
  store double %88, double* %7
  %89 = icmp eq i32 %87, 0
  br i1 %89, label %90, label %92
  90:
  %91 = load double, double* %7
  store double 0.000000, double* %7
  br label %92
  92:
  %93 = load double, double* %7
  ret double %93
}
define i32 @getAttempted(i32* %0, i8* %1, i32* %2) {
  %4 = alloca i32*
  store i32* %0, i32** %4
  %5 = alloca i8*
  store i8* %1, i8** %5
  %6 = alloca i32*
  store i32* %2, i32** %6
  %7 = alloca i32
  %8 = alloca i32
  %9 = load i32, i32* %7
  store i32 0, i32* %7
  %10 = load i32, i32* %8
  store i32 1, i32* %8
  br label %11
  11:
  %12 = load i32, i32* %8
  %13 = load i32*, i32** %4
  %14 = load i32*, i32** %4
  %15 = load i32, i32* %14
  %16 = icmp sle i32 %12, %15
  br i1 %16, label %17, label %31
  17:
  %18 = load i8*, i8** %5
  %19 = getelementptr inbounds i8, i8* %18, i32 %12
  %20 = load i8, i8* %19
  br i8 %20, label %21, label %27
  21:
  %22 = load i32, i32* %7
  %23 = load i32*, i32** %6
  %24 = getelementptr inbounds i32, i32* %23, i32 %12
  %25 = load i32, i32* %24
  %26 = add i32 %22, %25
  store i32 %26, i32* %7
  br label %27
  27:
  %28 = load i32, i32* %8
  %29 = add i32 %28, 1
  store i32 %29, i32* %8
  br label %11
  30:
  br label %31
  31:
  %32 = load i32, i32* %7
  ret i32 %32
}
define i32 @getCompleted(i32* %0, i8* %1, i32* %2) {
  %4 = alloca i32*
  store i32* %0, i32** %4
  %5 = alloca i8*
  store i8* %1, i8** %5
  %6 = alloca i32*
  store i32* %2, i32** %6
  %7 = alloca i32
  %8 = alloca i32
  %9 = load i32, i32* %7
  store i32 0, i32* %7
  %10 = load i32, i32* %8
  store i32 1, i32* %8
  br label %11
  11:
  %12 = load i32, i32* %8
  %13 = load i32*, i32** %4
  %14 = load i32*, i32** %4
  %15 = load i32, i32* %14
  %16 = icmp sle i32 %12, %15
  br i1 %16, label %17, label %37
  17:
  %18 = load i8*, i8** %5
  %19 = getelementptr inbounds i8, i8* %18, i32 %12
  %20 = load i8, i8* %19
  %21 = icmp ne i8 %20, 0
  br i1 %21, label %22, label %33
  22:
  %23 = getelementptr inbounds i8, i8* %18, i32 %12
  %24 = load i8, i8* %23
  %25 = icmp ne i8 %24, 70
  br i1 %25, label %26, label %32
  26:
  %27 = load i32, i32* %7
  %28 = load i32*, i32** %6
  %29 = getelementptr inbounds i32, i32* %28, i32 %12
  %30 = load i32, i32* %29
  %31 = add i32 %27, %30
  store i32 %31, i32* %7
  br label %32
  32:
  br label %33
  33:
  %34 = load i32, i32* %8
  %35 = add i32 %34, 1
  store i32 %35, i32* %8
  br label %11
  36:
  br label %37
  37:
  %38 = load i32, i32* %7
  ret i32 %38
}
define i32 @getRemaining(i32* %0, i8* %1, i32* %2) {
  %4 = alloca i32*
  store i32* %0, i32** %4
  %5 = alloca i8*
  store i8* %1, i8** %5
  %6 = alloca i32*
  store i32* %2, i32** %6
  %7 = alloca i32
  %8 = alloca i32
  %9 = load i32, i32* %7
  store i32 0, i32* %7
  %10 = load i32, i32* %8
  store i32 1, i32* %8
  br label %11
  11:
  %12 = load i32, i32* %8
  %13 = load i32*, i32** %4
  %14 = load i32*, i32** %4
  %15 = load i32, i32* %14
  %16 = icmp sle i32 %12, %15
  br i1 %16, label %17, label %44
  17:
  %18 = load i8*, i8** %5
  %19 = getelementptr inbounds i8, i8* %18, i32 %12
  %20 = load i8, i8* %19
  %21 = icmp eq i8 %20, 0
  br i1 %21, label %22, label %28
  22:
  %23 = load i32, i32* %7
  %24 = load i32*, i32** %6
  %25 = getelementptr inbounds i32, i32* %24, i32 %12
  %26 = load i32, i32* %25
  %27 = add i32 %23, %26
  store i32 %27, i32* %7
  br label %28
  28:
  %29 = load i8*, i8** %5
  %30 = load i32, i32* %8
  %31 = getelementptr inbounds i8, i8* %29, i32 %30
  %32 = load i8, i8* %31
  %33 = icmp eq i8 %32, 70
  br i1 %33, label %34, label %40
  34:
  %35 = load i32, i32* %7
  %36 = load i32*, i32** %6
  %37 = getelementptr inbounds i32, i32* %36, i32 %30
  %38 = load i32, i32* %37
  %39 = add i32 %35, %38
  store i32 %39, i32* %7
  br label %40
  40:
  %41 = load i32, i32* %8
  %42 = add i32 %41, 1
  store i32 %42, i32* %8
  br label %11
  43:
  br label %44
  44:
  %45 = load i32, i32* %7
  ret i32 %45
}
define i32 @SatisfiedAnd(i32 %0, i32* %1, i32* %2, i8* %3) {
  %5 = alloca i32
  store i32 %0, i32* %5
  %6 = alloca i32*
  store i32* %1, i32** %6
  %7 = alloca i32*
  store i32* %2, i32** %7
  %8 = alloca i8*
  store i8* %3, i8** %8
  %9 = alloca i32
  %10 = alloca i32
  %11 = load i32, i32* %10
  store i32 1, i32* %10
  %12 = load i32, i32* %9
  %13 = load i32*, i32** %6
  %14 = load i32, i32* %5
  %15 = getelementptr inbounds i32, i32* %13, i32 %14
  %16 = load i32, i32* %15
  store i32 %16, i32* %9
  br label %17
  17:
  %18 = load i32, i32* %5
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %47
  20:
  %21 = load i8*, i8** %8
  %22 = load i32, i32* %9
  %23 = getelementptr inbounds i8, i8* %21, i32 %22
  %24 = load i8, i8* %23
  %25 = icmp eq i8 %24, 0
  br i1 %25, label %26, label %28
  26:
  %27 = load i32, i32* %10
  store i32 0, i32* %10
  br label %28
  28:
  %29 = load i8*, i8** %8
  %30 = load i32, i32* %9
  %31 = getelementptr inbounds i8, i8* %29, i32 %30
  %32 = load i8, i8* %31
  %33 = icmp eq i8 %32, 70
  br i1 %33, label %34, label %36
  34:
  %35 = load i32, i32* %10
  store i32 0, i32* %10
  br label %36
  36:
  %37 = load i32, i32* %5
  %38 = load i32*, i32** %7
  %39 = getelementptr inbounds i32, i32* %38, i32 %37
  %40 = load i32, i32* %39
  store i32 %40, i32* %5
  %41 = load i32, i32* %9
  %42 = load i32*, i32** %6
  %43 = load i32, i32* %5
  %44 = getelementptr inbounds i32, i32* %42, i32 %43
  %45 = load i32, i32* %44
  store i32 %45, i32* %9
  br label %17
  46:
  br label %47
  47:
  %48 = load i32, i32* %10
  ret i32 %48
}
define i32 @Satisfied(i32 %0, i32* %1, i32* %2, i32* %3, i32* %4, i8* %5) {
  %7 = alloca i32
  store i32 %0, i32* %7
  %8 = alloca i32*
  store i32* %1, i32** %8
  %9 = alloca i32*
  store i32* %2, i32** %9
  %10 = alloca i32*
  store i32* %3, i32** %10
  %11 = alloca i32*
  store i32* %4, i32** %11
  %12 = alloca i8*
  store i8* %5, i8** %12
  %13 = alloca i32
  %14 = alloca i32
  %15 = load i32, i32* %14
  store i32 0, i32* %14
  %16 = load i32, i32* %13
  %17 = load i32*, i32** %8
  %18 = load i32, i32* %7
  %19 = getelementptr inbounds i32, i32* %17, i32 %18
  %20 = load i32, i32* %19
  store i32 %20, i32* %13
  br label %21
  21:
  %22 = load i32, i32* %7
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %44
  24:
  %25 = load i32, i32* %13
  %26 = load i32*, i32** %10
  %27 = load i32*, i32** %11
  %28 = load i8*, i8** %12
  %29 = call i32 (i32 %0, i32* %1, i32* %2, i8* %3) @SatisfiedAnd(i32 %25, i32* %26, i32* %27, i8* %28)
  %30 = icmp eq i32 %29, 1
  br i1 %30, label %31, label %33
  31:
  %32 = load i32, i32* %14
  store i32 1, i32* %14
  br label %33
  33:
  %34 = load i32, i32* %7
  %35 = load i32*, i32** %9
  %36 = getelementptr inbounds i32, i32* %35, i32 %34
  %37 = load i32, i32* %36
  store i32 %37, i32* %7
  %38 = load i32, i32* %13
  %39 = load i32*, i32** %8
  %40 = load i32, i32* %7
  %41 = getelementptr inbounds i32, i32* %39, i32 %40
  %42 = load i32, i32* %41
  store i32 %42, i32* %13
  br label %21
  43:
  br label %44
  44:
  %45 = load i32, i32* %14
  ret i32 %45
}
define i32 @main() {
  %1 = alloca i32*
  %2 = alloca i32*
  %3 = alloca i32*
  %4 = alloca i32*
  %5 = alloca i32*
  %6 = alloca i32*
  %7 = alloca i32
  %8 = alloca i32
  %9 = alloca i32
  %10 = alloca i32
  %11 = alloca i32
  %12 = alloca i8*
  %13 = alloca i8*
  %14 = alloca i8*
  %15 = alloca i8*
  %16 = load i32*, i32** %1
  %17 = call i8* @malloc(i64 5000)
  %18 = bitcast i8* %17 to i32*
  store i32* %18, i32** %1
  %19 = load i32*, i32** %1
  %20 = call  () @memset(i32* %19, i32 0, i32 5000)
  %21 = load i32*, i32** %2
  %22 = call i8* @malloc(i64 5000)
  %23 = bitcast i8* %22 to i32*
  store i32* %23, i32** %2
  %24 = load i32*, i32** %2
  %25 = call  () @memset(i32* %24, i32 0, i32 5000)
  %26 = load i32*, i32** %3
  %27 = call i8* @malloc(i64 50000)
  %28 = bitcast i8* %27 to i32*
  store i32* %28, i32** %3
  %29 = load i32*, i32** %3
  %30 = call  () @memset(i32* %29, i32 0, i32 5000)
  %31 = load i32*, i32** %4
  %32 = call i8* @malloc(i64 50000)
  %33 = bitcast i8* %32 to i32*
  store i32* %33, i32** %4
  %34 = load i32*, i32** %4
  %35 = call  () @memset(i32* %34, i32 0, i32 5000)
  %36 = load i32*, i32** %5
  %37 = call i8* @malloc(i64 500)
  %38 = bitcast i8* %37 to i32*
  store i32* %38, i32** %5
  %39 = load i32*, i32** %6
  %40 = call i8* @malloc(i64 500)
  %41 = bitcast i8* %40 to i32*
  store i32* %41, i32** %6
  %42 = load i8*, i8** %12
  %43 = call i8* @malloc(i64 200)
  store i8* %43, i8** %12
  %44 = load i8*, i8** %13
  %45 = call i8* @malloc(i64 200000)
  store i8* %45, i8** %13
  %46 = load i8*, i8** %14
  %47 = call i8* @malloc(i64 4000)
  store i8* %47, i8** %14
  %48 = load i32, i32* %10
  store i32 0, i32* %10
  %49 = load i32, i32* %11
  store i32 0, i32* %11
  br label %50
  50:
  %51 = load i32, i32* %8
  %52 = add i32 %51, 1
  store i32 %52, i32* %8
  %53 = load i8*, i8** %13
  %54 = load i32, i32* %8
  %55 = mul i32 %54, 1000
  %56 = add i8* %53, %55
  %57 = call  () @gets(i8* %56)
  %58 = mul i32 %54, 1000
  %59 = getelementptr inbounds i8, i8* %53, i32 %58
  %60 = load i8, i8* %59
  %61 = icmp eq i8 %60, 0
  br i1 %61, label %62, label %65
  62:
  %63 = sub i32 %54, 1
  store i32 %63, i32* %8
  br label %0
  64:
  br label %65
  65:
  br label %50
  66:
  br label %67
  67:
  %68 = load i32, i32* %7
  store i32 1, i32* %7
  br label %69
  69:
  %70 = load i32, i32* %7
  %71 = load i32, i32* %8
  %72 = icmp sle i32 %70, %71
  br i1 %72, label %73, label %83
  73:
  %74 = load i8*, i8** %14
  %75 = mul i32 %70, 10
  %76 = add i8* %74, %75
  %77 = load i8*, i8** %13
  %78 = mul i32 %70, 1000
  %79 = add i8* %77, %78
  %80 = call i32 (i8* %0, i8* %1) @store(i8* %76, i8* %79)
  %81 = add i32 %70, 1
  store i32 %81, i32* %7
  br label %69
  82:
  br label %83
  83:
  %84 = load i32, i32* %7
  store i32 1, i32* %7
  br label %85
  85:
  %86 = load i32, i32* %7
  %87 = load i32, i32* %8
  %88 = icmp sle i32 %86, %87
  br i1 %88, label %89, label %133
  89:
  %90 = load i8*, i8** %15
  %91 = load i8*, i8** %13
  %92 = mul i32 %86, 1000
  %93 = add i8* %91, %92
  store i8* %93, i8** %15
  %94 = load i8*, i8** %15
  %95 = call i8* @strchr( i8* %94, i32 124)
  %96 = add i8* %95, 1
  store i8* %96, i8** %15
  %97 = load i32*, i32** %5
  %98 = getelementptr inbounds i32, i32* %97, i32 %86
  %99 = load i32, i32* %98
  %100 = load i8*, i8** %15
  %101 = call i32 (i8*, i8*, ...) @sscanf(i8* getelementptr inbounds (i8*, i8** %100, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.0, i32* %98)
  %102 = call i8* @strchr( i8* %100, i32 124)
  store i8* %102, i8** %15
  %103 = load i32*, i32** %6
  %104 = getelementptr inbounds i32, i32* %103, i32 %86
  %105 = load i32, i32* %104
  %106 = load i8*, i8** %15
  %107 = load i8*, i8** %14
  %108 = load i32, i32* %11
  %109 = load i32, i32* %10
  %110 = load i32*, i32** %3
  %111 = load i32*, i32** %1
  %112 = load i32*, i32** %4
  %113 = load i32*, i32** %2
  %114 = call i32 (i8* %0, i32* %1, i8* %2, i32* %3, i32* %4, i32* %5, i32* %6, i32* %7, i32* %8) @storeOrSeq(i8* %106, i32* %8, i8* %107, i32* %11, i32* %10, i32* %110, i32* %111, i32* %112, i32* %113)
  store i32 %114, i32* %104
  %115 = add i8* %106, 1
  store i8* %115, i8** %15
  %116 = load i8*, i8** %15
  %117 = call i8* @strchr( i8* %116, i32 124)
  %118 = add i8* %117, 1
  store i8* %118, i8** %15
  %119 = load i8*, i8** %15
  %120 = getelementptr inbounds i8, i8* %119, i32 0
  %121 = load i8, i8* %120
  %122 = icmp ne i8 %121, 10
  br i1 %122, label %123, label %129
  123:
  %124 = load i8*, i8** %12
  %125 = getelementptr inbounds i8, i8* %124, i32 %86
  %126 = load i8, i8* %125
  %127 = getelementptr inbounds i8, i8* %119, i32 0
  %128 = load i8, i8* %127
  store i8 %128, i8* %125
  br label %129
  129:
  %130 = load i32, i32* %7
  %131 = add i32 %130, 1
  store i32 %131, i32* %7
  br label %85
  132:
  br label %133
  133:
  %134 = load i32, i32* %8
  %135 = load i8*, i8** %12
  %136 = load i32*, i32** %5
  %137 = call double (i32* %0, i8* %1, i32* %2) @getGPA(i32* %8, i8* %135, i32* %136)
  %138 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.1, i64 0, i64 0), double %137)
  %139 = load i32, i32* %8
  %140 = call i32 (i32* %0, i8* %1, i32* %2) @getAttempted(i32* %8, i8* %135, i32* %136)
  %141 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.2, i64 0, i64 0), i32 %140)
  %142 = load i32, i32* %8
  %143 = call i32 (i32* %0, i8* %1, i32* %2) @getCompleted(i32* %8, i8* %135, i32* %136)
  %144 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.3, i64 0, i64 0), i32 %143)
  %145 = load i32, i32* %8
  %146 = call i32 (i32* %0, i8* %1, i32* %2) @getRemaining(i32* %8, i8* %135, i32* %136)
  %147 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.4, i64 0, i64 0), i32 %146)
  %148 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.5, i64 0, i64 0))
  %149 = load i32, i32* %7
  store i32 1, i32* %7
  br label %150
  150:
  %151 = load i32, i32* %7
  %152 = load i32, i32* %8
  %153 = icmp sle i32 %151, %152
  br i1 %153, label %154, label %203
  154:
  %155 = load i8*, i8** %12
  %156 = getelementptr inbounds i8, i8* %155, i32 %151
  %157 = load i8, i8* %156
  %158 = icmp eq i8 %157, 0
  br i1 %158, label %159, label %176
  159:
  %160 = load i32*, i32** %6
  %161 = getelementptr inbounds i32, i32* %160, i32 %151
  %162 = load i32, i32* %161
  %163 = load i32*, i32** %1
  %164 = load i32*, i32** %2
  %165 = load i32*, i32** %3
  %166 = load i32*, i32** %4
  %167 = call i32 (i32 %0, i32* %1, i32* %2, i32* %3, i32* %4, i8* %5) @Satisfied(i32 %162, i32* %163, i32* %164, i32* %165, i32* %166, i8* %155)
  br i32 %167, label %168, label %175
  168:
  %169 = load i32, i32* %9
  %170 = add i32 %169, 1
  store i32 %170, i32* %9
  %171 = load i8*, i8** %14
  %172 = mul i32 %151, 10
  %173 = add i8* %171, %172
  %174 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.6, i64 0, i64 0), i8* %173)
  br label %175
  175:
  br label %176
  176:
  %177 = load i8*, i8** %12
  %178 = load i32, i32* %7
  %179 = getelementptr inbounds i8, i8* %177, i32 %178
  %180 = load i8, i8* %179
  %181 = icmp eq i8 %180, 70
  br i1 %181, label %182, label %199
  182:
  %183 = load i32*, i32** %6
  %184 = getelementptr inbounds i32, i32* %183, i32 %178
  %185 = load i32, i32* %184
  %186 = load i32*, i32** %1
  %187 = load i32*, i32** %2
  %188 = load i32*, i32** %3
  %189 = load i32*, i32** %4
  %190 = call i32 (i32 %0, i32* %1, i32* %2, i32* %3, i32* %4, i8* %5) @Satisfied(i32 %185, i32* %186, i32* %187, i32* %188, i32* %189, i8* %177)
  br i32 %190, label %191, label %198
  191:
  %192 = load i32, i32* %9
  %193 = add i32 %192, 1
  store i32 %193, i32* %9
  %194 = load i8*, i8** %14
  %195 = mul i32 %178, 10
  %196 = add i8* %194, %195
  %197 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.6, i64 0, i64 0), i8* %196)
  br label %198
  198:
  br label %199
  199:
  %200 = load i32, i32* %7
  %201 = add i32 %200, 1
  store i32 %201, i32* %7
  br label %150
  202:
  br label %203
  203:
  %204 = load i32, i32* %8
  %205 = load i8*, i8** %12
  %206 = load i32*, i32** %5
  %207 = call i32 (i32* %0, i8* %1, i32* %2) @getRemaining(i32* %8, i8* %205, i32* %206)
  %208 = icmp eq i32 %207, 0
  br i1 %208, label %209, label %215
  209:
  %210 = load i32, i32* %9
  %211 = icmp eq i32 %210, 0
  br i1 %211, label %212, label %214
  212:
  %213 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.8, i64 0, i64 0))
  br label %214
  214:
  br label %215
  215:
  ret i32 0
}
declare i32 @scanf(i8*, ...)
declare i32 @printf(i8*, ...)
declare i8* @malloc(i64)
declare i8* @strchr(i8*, i32)
declare i32 @sscanf(i8*, i8*, ...)
