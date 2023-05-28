source_filename = "example.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"
@.0 = constant [4 x i8] c"%lf\00"
@.1 = constant [12 x i8] c"GPA: %.1lf\0A\00"
@.2 = constant [24 x i8] c"Hours Attempted: %.0lf\0A\00"
@.3 = constant [24 x i8] c"Hours Completed: %.0lf\0A\00"
@.4 = constant [26 x i8] c"Credits Remaining: %.0lf\0A\00"
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
  %26 = call i8* (i64) @malloc(i64 20)
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
  br i1 %41, label %42, label %149
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
  %71 = getelementptr inbounds i8, i8* %70, i32 1
  %72 = load i8, i8* %71
  store i8* %71, i8** %10
  %73 = load i8*, i8** %10
  %74 = load i8*, i8** %24
  %75 = call i32 (i8* %0, i8* %1) @store(i8* %74, i8* %73)
  %76 = getelementptr inbounds i8, i8* %73, i32 %75
  %77 = load i8, i8* %76
  store i8* %76, i8** %10
  %78 = alloca i32
  %79 = alloca i32
  %80 = load i32, i32* %79
  store i32 1, i32* %79
  br label %81
  81:
  %82 = load i32, i32* %79
  %83 = load i32*, i32** %11
  %84 = load i32*, i32** %11
  %85 = load i32, i32* %84
  %86 = icmp sle i32 %82, %85
  br i1 %86, label %87, label %101
  87:
  %88 = load i8*, i8** %24
  %89 = load i8*, i8** %12
  %90 = mul i32 %82, 10
  %91 = getelementptr inbounds i8, i8* %89, i32 %90
  %92 = load i8, i8* %91
  %93 = call i32 (i8*, i8*) @strcmp( i8* %88, i8* %91)
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %95, label %97
  95:
  %96 = load i32, i32* %78
  store i32 %82, i32* %78
  br label %97
  97:
  %98 = load i32, i32* %79
  %99 = add i32 %98, 1
  store i32 %99, i32* %79
  br label %81
  100:
  br label %101
  101:
  %102 = load i32, i32* %22
  %103 = icmp ne i32 %102, 0
  br i1 %103, label %104, label %136
  104:
  %105 = load i32*, i32** %13
  %106 = load i32*, i32** %13
  %107 = load i32, i32* %106
  %108 = load i32*, i32** %13
  %109 = load i32, i32* %108
  %110 = add i32 %109, 1
  store i32 %110, i32* %106
  %111 = load i32, i32* %19
  %112 = load i32*, i32** %13
  %113 = load i32, i32* %112
  store i32 %113, i32* %19
  %114 = load i32*, i32** %15
  %115 = load i32, i32* %19
  %116 = getelementptr inbounds i32, i32* %114, i32 %115
  %117 = load i32, i32* %116
  %118 = load i32, i32* %78
  store i32 %118, i32* %116
  %119 = load i32, i32* %21
  %120 = icmp ne i32 %119, 0
  br i1 %120, label %121, label %126
  121:
  %122 = load i32*, i32** %16
  %123 = load i32, i32* %20
  %124 = getelementptr inbounds i32, i32* %122, i32 %123
  %125 = load i32, i32* %124
  store i32 %115, i32* %124
  br label %126
  126:
  %127 = load i32, i32* %21
  %128 = icmp eq i32 %127, 0
  br i1 %128, label %129, label %135
  129:
  %130 = load i32, i32* %20
  %131 = load i32, i32* %19
  %132 = load i32*, i32** %14
  %133 = load i32*, i32** %16
  %134 = load i32*, i32** %18
  call void (i32 %0, i32 %1, i32* %2, i32* %3, i32* %4) @mergeOrList(i32 %130, i32 %131, i32* %132, i32* %133, i32* %134)
  br label %135
  135:
  br label %136
  136:
  %137 = load i32, i32* %22
  %138 = icmp eq i32 %137, 0
  br i1 %138, label %139, label %145
  139:
  %140 = load i32, i32* %19
  %141 = load i32, i32* %78
  %142 = load i32*, i32** %13
  %143 = load i32*, i32** %15
  %144 = load i32*, i32** %17
  call void (i32 %0, i32 %1, i32* %2, i32* %3, i32* %4) @mergeAndList(i32 %140, i32 %141, i32* %142, i32* %143, i32* %144)
  br label %145
  145:
  %146 = load i32, i32* %21
  store i32 0, i32* %21
  %147 = load i32, i32* %22
  store i32 0, i32* %22
  br label %39
  148:
  br label %149
  149:
  %150 = load i32, i32* %20
  ret i32 %150
}
define double @getGPA(i32* %0, i8* %1, double* %2) {
  %4 = alloca i32*
  store i32* %0, i32** %4
  %5 = alloca i8*
  store i8* %1, i8** %5
  %6 = alloca double*
  store double* %2, double** %6
  %7 = alloca double
  %8 = alloca double
  %9 = alloca i32
  %10 = alloca i32
  %11 = load double, double* %8
  store double 0.000000, double* %8
  %12 = load double, double* %7
  store double 0.000000, double* %7
  %13 = load i32, i32* %9
  store i32 1, i32* %9
  %14 = load i32, i32* %10
  store i32 0, i32* %10
  br label %15
  15:
  %16 = load i32, i32* %9
  %17 = load i32*, i32** %4
  %18 = load i32*, i32** %4
  %19 = load i32, i32* %18
  %20 = icmp sle i32 %16, %19
  br i1 %20, label %21, label %89
  21:
  %22 = load i8*, i8** %5
  %23 = getelementptr inbounds i8, i8* %22, i32 %16
  %24 = load i8, i8* %23
  %25 = icmp ne i8 %24, 0
  br i1 %25, label %26, label %33
  26:
  %27 = load i32, i32* %10
  store i32 1, i32* %10
  %28 = load double, double* %8
  %29 = load double*, double** %6
  %30 = getelementptr inbounds double, double* %29, i32 %16
  %31 = load double, double* %30
  %32 = fadd double %28, %31
  store double %32, double* %8
  br label %33
  33:
  %34 = load i8*, i8** %5
  %35 = load i32, i32* %9
  %36 = getelementptr inbounds i8, i8* %34, i32 %35
  %37 = load i8, i8* %36
  %38 = icmp eq i8 %37, 65
  br i1 %38, label %39, label %46
  39:
  %40 = load double, double* %7
  %41 = load double*, double** %6
  %42 = getelementptr inbounds double, double* %41, i32 %35
  %43 = load double, double* %42
  %44 = fmul double %43, 4.000000
  %45 = fadd double %40, %44
  store double %45, double* %7
  br label %46
  46:
  %47 = load i8*, i8** %5
  %48 = load i32, i32* %9
  %49 = getelementptr inbounds i8, i8* %47, i32 %48
  %50 = load i8, i8* %49
  %51 = icmp eq i8 %50, 66
  br i1 %51, label %52, label %59
  52:
  %53 = load double, double* %7
  %54 = load double*, double** %6
  %55 = getelementptr inbounds double, double* %54, i32 %48
  %56 = load double, double* %55
  %57 = fmul double %56, 3.000000
  %58 = fadd double %53, %57
  store double %58, double* %7
  br label %59
  59:
  %60 = load i8*, i8** %5
  %61 = load i32, i32* %9
  %62 = getelementptr inbounds i8, i8* %60, i32 %61
  %63 = load i8, i8* %62
  %64 = icmp eq i8 %63, 67
  br i1 %64, label %65, label %72
  65:
  %66 = load double, double* %7
  %67 = load double*, double** %6
  %68 = getelementptr inbounds double, double* %67, i32 %61
  %69 = load double, double* %68
  %70 = fmul double %69, 2.000000
  %71 = fadd double %66, %70
  store double %71, double* %7
  br label %72
  72:
  %73 = load i8*, i8** %5
  %74 = load i32, i32* %9
  %75 = getelementptr inbounds i8, i8* %73, i32 %74
  %76 = load i8, i8* %75
  %77 = icmp eq i8 %76, 68
  br i1 %77, label %78, label %85
  78:
  %79 = load double, double* %7
  %80 = load double*, double** %6
  %81 = getelementptr inbounds double, double* %80, i32 %74
  %82 = load double, double* %81
  %83 = fmul double %82, 1.000000
  %84 = fadd double %79, %83
  store double %84, double* %7
  br label %85
  85:
  %86 = load i32, i32* %9
  %87 = add i32 %86, 1
  store i32 %87, i32* %9
  br label %15
  88:
  br label %89
  89:
  %90 = load double, double* %7
  %91 = load double, double* %8
  %92 = fdiv double %90, %91
  store double %92, double* %7
  %93 = load i32, i32* %10
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %95, label %97
  95:
  %96 = load double, double* %7
  store double 0.000000, double* %7
  br label %97
  97:
  %98 = load double, double* %7
  ret double %98
}
define double @getAttempted(i32* %0, i8* %1, double* %2) {
  %4 = alloca i32*
  store i32* %0, i32** %4
  %5 = alloca i8*
  store i8* %1, i8** %5
  %6 = alloca double*
  store double* %2, double** %6
  %7 = alloca double
  %8 = alloca i32
  %9 = load double, double* %7
  store double 0.000000, double* %7
  %10 = load i32, i32* %8
  store i32 1, i32* %8
  br label %11
  11:
  %12 = load i32, i32* %8
  %13 = load i32*, i32** %4
  %14 = load i32*, i32** %4
  %15 = load i32, i32* %14
  %16 = icmp sle i32 %12, %15
  br i1 %16, label %17, label %32
  17:
  %18 = load i8*, i8** %5
  %19 = getelementptr inbounds i8, i8* %18, i32 %12
  %20 = load i8, i8* %19
  %21 = icmp ne i8 %20, 0
  br i1 %21, label %22, label %28
  22:
  %23 = load double, double* %7
  %24 = load double*, double** %6
  %25 = getelementptr inbounds double, double* %24, i32 %12
  %26 = load double, double* %25
  %27 = fadd double %23, %26
  store double %27, double* %7
  br label %28
  28:
  %29 = load i32, i32* %8
  %30 = add i32 %29, 1
  store i32 %30, i32* %8
  br label %11
  31:
  br label %32
  32:
  %33 = load double, double* %7
  ret double %33
}
define double @getCompleted(i32* %0, i8* %1, double* %2) {
  %4 = alloca i32*
  store i32* %0, i32** %4
  %5 = alloca i8*
  store i8* %1, i8** %5
  %6 = alloca double*
  store double* %2, double** %6
  %7 = alloca double
  %8 = alloca i32
  %9 = load double, double* %7
  store double 0.000000, double* %7
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
  %27 = load double, double* %7
  %28 = load double*, double** %6
  %29 = getelementptr inbounds double, double* %28, i32 %12
  %30 = load double, double* %29
  %31 = fadd double %27, %30
  store double %31, double* %7
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
  %38 = load double, double* %7
  ret double %38
}
define double @getRemaining(i32* %0, i8* %1, double* %2) {
  %4 = alloca i32*
  store i32* %0, i32** %4
  %5 = alloca i8*
  store i8* %1, i8** %5
  %6 = alloca double*
  store double* %2, double** %6
  %7 = alloca double
  %8 = alloca i32
  %9 = load double, double* %7
  store double 0.000000, double* %7
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
  %23 = load double, double* %7
  %24 = load double*, double** %6
  %25 = getelementptr inbounds double, double* %24, i32 %12
  %26 = load double, double* %25
  %27 = fadd double %23, %26
  store double %27, double* %7
  br label %28
  28:
  %29 = load i8*, i8** %5
  %30 = load i32, i32* %8
  %31 = getelementptr inbounds i8, i8* %29, i32 %30
  %32 = load i8, i8* %31
  %33 = icmp eq i8 %32, 70
  br i1 %33, label %34, label %40
  34:
  %35 = load double, double* %7
  %36 = load double*, double** %6
  %37 = getelementptr inbounds double, double* %36, i32 %30
  %38 = load double, double* %37
  %39 = fadd double %35, %38
  store double %39, double* %7
  br label %40
  40:
  %41 = load i32, i32* %8
  %42 = add i32 %41, 1
  store i32 %42, i32* %8
  br label %11
  43:
  br label %44
  44:
  %45 = load double, double* %7
  ret double %45
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
  %6 = alloca double*
  %7 = alloca i32
  %8 = alloca i32
  %9 = alloca i32
  %10 = alloca i32
  %11 = alloca i32
  %12 = alloca i32
  %13 = alloca i8*
  %14 = alloca i8*
  %15 = alloca i8*
  %16 = alloca i8*
  %17 = load i32*, i32** %1
  %18 = call i8* (i64) @malloc(i64 5000)
  %19 = bitcast i8* %18 to i32*
  store i32* %19, i32** %1
  %20 = load i8*, i8** %16
  %21 = load i32*, i32** %1
  %22 = bitcast i32* %21 to i8*
  store i8* %22, i8** %16
  %23 = load i8*, i8** %16
  call void (i8*, i8, i64) @memset( i8* %23, i8 0, i64 5000)
  %24 = load i32*, i32** %2
  %25 = call i8* (i64) @malloc(i64 5000)
  %26 = bitcast i8* %25 to i32*
  store i32* %26, i32** %2
  %27 = load i32*, i32** %2
  %28 = bitcast i32* %27 to i8*
  store i8* %28, i8** %16
  %29 = load i8*, i8** %16
  call void (i8*, i8, i64) @memset( i8* %29, i8 0, i64 5000)
  %30 = load i32*, i32** %3
  %31 = call i8* (i64) @malloc(i64 50000)
  %32 = bitcast i8* %31 to i32*
  store i32* %32, i32** %3
  %33 = load i32*, i32** %3
  %34 = bitcast i32* %33 to i8*
  store i8* %34, i8** %16
  %35 = load i8*, i8** %16
  call void (i8*, i8, i64) @memset( i8* %35, i8 0, i64 50000)
  %36 = load i32*, i32** %4
  %37 = call i8* (i64) @malloc(i64 50000)
  %38 = bitcast i8* %37 to i32*
  store i32* %38, i32** %4
  %39 = load i32*, i32** %4
  %40 = bitcast i32* %39 to i8*
  store i8* %40, i8** %16
  %41 = load i8*, i8** %16
  call void (i8*, i8, i64) @memset( i8* %41, i8 0, i64 50000)
  %42 = load double*, double** %6
  %43 = call i8* (i64) @malloc(i64 1000)
  %44 = bitcast i8* %43 to double*
  store double* %44, double** %6
  %45 = load i32*, i32** %5
  %46 = call i8* (i64) @malloc(i64 500)
  %47 = bitcast i8* %46 to i32*
  store i32* %47, i32** %5
  %48 = load i8*, i8** %13
  %49 = call i8* (i64) @malloc(i64 200)
  store i8* %49, i8** %13
  %50 = load i8*, i8** %14
  %51 = call i8* (i64) @malloc(i64 200000)
  store i8* %51, i8** %14
  %52 = load i8*, i8** %15
  %53 = call i8* (i64) @malloc(i64 4000)
  store i8* %53, i8** %15
  %54 = load i32, i32* %8
  store i32 0, i32* %8
  %55 = load i32, i32* %10
  store i32 0, i32* %10
  %56 = load i32, i32* %9
  store i32 0, i32* %9
  %57 = load i32, i32* %11
  store i32 0, i32* %11
  %58 = load i32, i32* %12
  store i32 0, i32* %12
  br label %59
  59:
  %60 = load i32, i32* %8
  %61 = add i32 %60, 1
  store i32 %61, i32* %8
  %62 = load i8*, i8** %14
  %63 = load i32, i32* %8
  %64 = mul i32 %63, 1000
  %65 = getelementptr inbounds i8, i8* %62, i32 %64
  %66 = load i8, i8* %65
  %67 = call i32 (...) @gets( i8* %65)
  %68 = mul i32 %63, 1000
  %69 = getelementptr inbounds i8, i8* %62, i32 %68
  %70 = load i8, i8* %69
  %71 = icmp eq i8 %70, 0
  br i1 %71, label %72, label %75
  72:
  %73 = sub i32 %63, 1
  store i32 %73, i32* %8
  %74 = load i32, i32* %9
  store i32 1, i32* %9
  br label %75
  75:
  %76 = load i32, i32* %9
  %77 = icmp ne i32 %76, 1
  br i1 %77, label %78, label %80
  78:
  br label %59
  79:
  br label %80
  80:
  %81 = load i32, i32* %9
  store i32 0, i32* %9
  %82 = load i32, i32* %7
  store i32 1, i32* %7
  br label %83
  83:
  %84 = load i32, i32* %7
  %85 = load i32, i32* %8
  %86 = icmp sle i32 %84, %85
  br i1 %86, label %87, label %99
  87:
  %88 = load i8*, i8** %15
  %89 = mul i32 %84, 10
  %90 = getelementptr inbounds i8, i8* %88, i32 %89
  %91 = load i8, i8* %90
  %92 = load i8*, i8** %14
  %93 = mul i32 %84, 1000
  %94 = getelementptr inbounds i8, i8* %92, i32 %93
  %95 = load i8, i8* %94
  %96 = call i32 (i8* %0, i8* %1) @store(i8* %90, i8* %94)
  %97 = add i32 %84, 1
  store i32 %97, i32* %7
  br label %83
  98:
  br label %99
  99:
  %100 = load i32, i32* %7
  store i32 1, i32* %7
  br label %101
  101:
  %102 = load i32, i32* %7
  %103 = load i32, i32* %8
  %104 = icmp sle i32 %102, %103
  br i1 %104, label %105, label %155
  105:
  %106 = load i8*, i8** %16
  %107 = load i8*, i8** %14
  %108 = mul i32 %102, 1000
  %109 = getelementptr inbounds i8, i8* %107, i32 %108
  %110 = load i8, i8* %109
  store i8* %109, i8** %16
  %111 = load i8*, i8** %16
  %112 = call i8* (i8*, i32) @strchr( i8* %111, i32 124)
  store i8* %112, i8** %16
  %113 = load i8*, i8** %16
  %114 = getelementptr inbounds i8, i8* %113, i32 1
  %115 = load i8, i8* %114
  store i8* %114, i8** %16
  %116 = load double*, double** %6
  %117 = getelementptr inbounds double, double* %116, i32 %102
  %118 = load double, double* %117
  %119 = load i8*, i8** %16
  %120 = call i32 (i8*, i8*, ...) @sscanf(i8* %119, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.0, i64 0, i64 0), double* %117)
  %121 = call i8* (i8*, i32) @strchr( i8* %119, i32 124)
  store i8* %121, i8** %16
  %122 = load i32*, i32** %5
  %123 = getelementptr inbounds i32, i32* %122, i32 %102
  %124 = load i32, i32* %123
  %125 = load i8*, i8** %16
  %126 = load i8*, i8** %15
  %127 = load i32, i32* %12
  %128 = load i32, i32* %11
  %129 = load i32*, i32** %3
  %130 = load i32*, i32** %1
  %131 = load i32*, i32** %4
  %132 = load i32*, i32** %2
  %133 = call i32 (i8* %0, i32* %1, i8* %2, i32* %3, i32* %4, i32* %5, i32* %6, i32* %7, i32* %8) @storeOrSeq(i8* %125, i32* %8, i8* %126, i32* %12, i32* %11, i32* %129, i32* %130, i32* %131, i32* %132)
  store i32 %133, i32* %123
  %134 = getelementptr inbounds i8, i8* %125, i32 1
  %135 = load i8, i8* %134
  store i8* %134, i8** %16
  %136 = load i8*, i8** %16
  %137 = call i8* (i8*, i32) @strchr( i8* %136, i32 124)
  store i8* %137, i8** %16
  %138 = load i8*, i8** %16
  %139 = getelementptr inbounds i8, i8* %138, i32 1
  %140 = load i8, i8* %139
  store i8* %139, i8** %16
  %141 = load i8*, i8** %16
  %142 = getelementptr inbounds i8, i8* %141, i32 0
  %143 = load i8, i8* %142
  %144 = icmp ne i8 %143, 10
  br i1 %144, label %145, label %151
  145:
  %146 = load i8*, i8** %13
  %147 = getelementptr inbounds i8, i8* %146, i32 %102
  %148 = load i8, i8* %147
  %149 = getelementptr inbounds i8, i8* %141, i32 0
  %150 = load i8, i8* %149
  store i8 %150, i8* %147
  br label %151
  151:
  %152 = load i32, i32* %7
  %153 = add i32 %152, 1
  store i32 %153, i32* %7
  br label %101
  154:
  br label %155
  155:
  %156 = load i32, i32* %8
  %157 = load i8*, i8** %13
  %158 = load double*, double** %6
  %159 = call double (i32* %0, i8* %1, double* %2) @getGPA(i32* %8, i8* %157, double* %158)
  %160 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.1, i64 0, i64 0), double %159)
  %161 = load i32, i32* %8
  %162 = call double (i32* %0, i8* %1, double* %2) @getAttempted(i32* %8, i8* %157, double* %158)
  %163 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.2, i64 0, i64 0), double %162)
  %164 = load i32, i32* %8
  %165 = call double (i32* %0, i8* %1, double* %2) @getCompleted(i32* %8, i8* %157, double* %158)
  %166 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.3, i64 0, i64 0), double %165)
  %167 = load i32, i32* %8
  %168 = call double (i32* %0, i8* %1, double* %2) @getRemaining(i32* %8, i8* %157, double* %158)
  %169 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.4, i64 0, i64 0), double %168)
  %170 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.5, i64 0, i64 0))
  %171 = load i32, i32* %7
  store i32 1, i32* %7
  br label %172
  172:
  %173 = load i32, i32* %7
  %174 = load i32, i32* %8
  %175 = icmp sle i32 %173, %174
  br i1 %175, label %176, label %231
  176:
  %177 = load i8*, i8** %13
  %178 = getelementptr inbounds i8, i8* %177, i32 %173
  %179 = load i8, i8* %178
  %180 = icmp eq i8 %179, 0
  br i1 %180, label %181, label %201
  181:
  %182 = load i32, i32* %9
  store i32 1, i32* %9
  %183 = load i32*, i32** %5
  %184 = getelementptr inbounds i32, i32* %183, i32 %173
  %185 = load i32, i32* %184
  %186 = load i32*, i32** %1
  %187 = load i32*, i32** %2
  %188 = load i32*, i32** %3
  %189 = load i32*, i32** %4
  %190 = call i32 (i32 %0, i32* %1, i32* %2, i32* %3, i32* %4, i8* %5) @Satisfied(i32 %185, i32* %186, i32* %187, i32* %188, i32* %189, i8* %177)
  %191 = icmp ne i32 %190, 0
  br i1 %191, label %192, label %200
  192:
  %193 = load i32, i32* %10
  %194 = add i32 %193, 1
  store i32 %194, i32* %10
  %195 = load i8*, i8** %15
  %196 = mul i32 %173, 10
  %197 = getelementptr inbounds i8, i8* %195, i32 %196
  %198 = load i8, i8* %197
  %199 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.6, i64 0, i64 0), i8* %197)
  br label %200
  200:
  br label %201
  201:
  %202 = load i8*, i8** %13
  %203 = load i32, i32* %7
  %204 = getelementptr inbounds i8, i8* %202, i32 %203
  %205 = load i8, i8* %204
  %206 = icmp eq i8 %205, 70
  br i1 %206, label %207, label %227
  207:
  %208 = load i32, i32* %9
  store i32 1, i32* %9
  %209 = load i32*, i32** %5
  %210 = getelementptr inbounds i32, i32* %209, i32 %203
  %211 = load i32, i32* %210
  %212 = load i32*, i32** %1
  %213 = load i32*, i32** %2
  %214 = load i32*, i32** %3
  %215 = load i32*, i32** %4
  %216 = call i32 (i32 %0, i32* %1, i32* %2, i32* %3, i32* %4, i8* %5) @Satisfied(i32 %211, i32* %212, i32* %213, i32* %214, i32* %215, i8* %202)
  %217 = icmp ne i32 %216, 0
  br i1 %217, label %218, label %226
  218:
  %219 = load i32, i32* %10
  %220 = add i32 %219, 1
  store i32 %220, i32* %10
  %221 = load i8*, i8** %15
  %222 = mul i32 %203, 10
  %223 = getelementptr inbounds i8, i8* %221, i32 %222
  %224 = load i8, i8* %223
  %225 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.6, i64 0, i64 0), i8* %223)
  br label %226
  226:
  br label %227
  227:
  %228 = load i32, i32* %7
  %229 = add i32 %228, 1
  store i32 %229, i32* %7
  br label %172
  230:
  br label %231
  231:
  %232 = load i32, i32* %9
  %233 = icmp eq i32 %232, 0
  br i1 %233, label %234, label %236
  234:
  %235 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.8, i64 0, i64 0))
  br label %236
  236:
  ret i32 0
}
declare i32 @scanf(i8*, ...)
declare i32 @printf(i8*, ...)
declare i8* @malloc(i64)
declare i8* @strchr(i8*, i32)
declare i32 @sscanf(i8*, i8*, ...)
declare i32 @strcmp(i8*, i8*)
declare void @memset(i8*, i8, i64)
declare i32 @gets(...)
