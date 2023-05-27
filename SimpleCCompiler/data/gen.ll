source_filename = "example.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"
@.0 = constant [6 x i8] c"%d %d\00"
@.1 = constant [3 x i8] c"%d\00"
@.2 = constant [6 x i8] c"%d %d\00"
@.3 = constant [3 x i8] c"%d\00"
@.4 = constant [25 x i8] c"Incompatible Dimensions\0A\00"
@.5 = constant [5 x i8] c"%10d\00"
@.6 = constant [2 x i8] c"\0A\00"
define i32 @main() {
  %1 = alloca i32
  %2 = alloca i32
  %3 = alloca i32
  %4 = alloca i32
  %5 = alloca i32
  %6 = alloca i32
  %7 = load i32, i32* %1
  store i32 0, i32* %1
  %8 = load i32, i32* %2
  store i32 0, i32* %2
  %9 = load i32, i32* %3
  store i32 0, i32* %3
  %10 = load i32, i32* %4
  store i32 0, i32* %4
  %11 = load i32, i32* %5
  store i32 0, i32* %5
  %12 = load i32, i32* %6
  store i32 0, i32* %6
  %13 = alloca i32*
  %14 = alloca i32*
  %15 = alloca i32*
  %16 = load i32*, i32** %13
  %17 = call i8* @malloc(i64 2500)
  %18 = bitcast i8* %17 to i32*
  store i32* %18, i32** %13
  %19 = load i32*, i32** %14
  %20 = call i8* @malloc(i64 2500)
  %21 = bitcast i8* %20 to i32*
  store i32* %21, i32** %14
  %22 = load i32*, i32** %15
  %23 = call i8* @malloc(i64 2500)
  %24 = bitcast i8* %23 to i32*
  store i32* %24, i32** %15
  %25 = alloca i32
  %26 = alloca i32
  %27 = alloca i32
  %28 = load i32, i32* %1
  %29 = load i32, i32* %4
  %30 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.0, i64 0, i64 0), i32* %1, i32* %4)
  %31 = load i32, i32* %25
  store i32 0, i32* %25
  br label %32
  32:
  %33 = load i32, i32* %25
  %34 = load i32, i32* %1
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %56
  36:
  %37 = load i32, i32* %26
  store i32 0, i32* %26
  br label %38
  38:
  %39 = load i32, i32* %26
  %40 = load i32, i32* %4
  %41 = icmp slt i32 %39, %40
  br i1 %41, label %42, label %52
  42:
  %43 = load i32*, i32** %13
  %44 = load i32, i32* %25
  %45 = mul i32 %44, %40
  %46 = add i32 %45, %39
  %47 = getelementptr inbounds i32, i32* %43, i32 %46
  %48 = load i32, i32* %47
  %49 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.1, i64 0, i64 0), i32* %47)
  %50 = add i32 %39, 1
  store i32 %50, i32* %26
  br label %38
  51:
  br label %52
  52:
  %53 = load i32, i32* %25
  %54 = add i32 %53, 1
  store i32 %54, i32* %25
  br label %32
  55:
  br label %56
  56:
  %57 = load i32, i32* %2
  %58 = load i32, i32* %5
  %59 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.0, i64 0, i64 0), i32* %2, i32* %5)
  %60 = load i32, i32* %25
  store i32 0, i32* %25
  br label %61
  61:
  %62 = load i32, i32* %25
  %63 = load i32, i32* %2
  %64 = icmp slt i32 %62, %63
  br i1 %64, label %65, label %85
  65:
  %66 = load i32, i32* %26
  store i32 0, i32* %26
  br label %67
  67:
  %68 = load i32, i32* %26
  %69 = load i32, i32* %5
  %70 = icmp slt i32 %68, %69
  br i1 %70, label %71, label %81
  71:
  %72 = load i32*, i32** %14
  %73 = load i32, i32* %25
  %74 = mul i32 %73, %69
  %75 = add i32 %74, %68
  %76 = getelementptr inbounds i32, i32* %72, i32 %75
  %77 = load i32, i32* %76
  %78 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.1, i64 0, i64 0), i32* %76)
  %79 = add i32 %68, 1
  store i32 %79, i32* %26
  br label %67
  80:
  br label %81
  81:
  %82 = load i32, i32* %25
  %83 = add i32 %82, 1
  store i32 %83, i32* %25
  br label %61
  84:
  br label %85
  85:
  %86 = load i32, i32* %4
  %87 = load i32, i32* %2
  %88 = icmp ne i32 %86, %87
  br i1 %88, label %89, label %91
  89:
  %90 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.4, i64 0, i64 0))
  br label %91
  91:
  %92 = load i32, i32* %4
  %93 = load i32, i32* %2
  %94 = icmp eq i32 %92, %93
  br i1 %94, label %95, label %187
  95:
  %96 = load i32, i32* %3
  %97 = load i32, i32* %1
  store i32 %97, i32* %3
  %98 = load i32, i32* %6
  %99 = load i32, i32* %5
  store i32 %99, i32* %6
  %100 = load i32, i32* %25
  store i32 0, i32* %25
  br label %101
  101:
  %102 = load i32, i32* %25
  %103 = load i32, i32* %3
  %104 = icmp slt i32 %102, %103
  br i1 %104, label %105, label %159
  105:
  %106 = load i32, i32* %26
  store i32 0, i32* %26
  br label %107
  107:
  %108 = load i32, i32* %26
  %109 = load i32, i32* %6
  %110 = icmp slt i32 %108, %109
  br i1 %110, label %111, label %155
  111:
  %112 = load i32*, i32** %15
  %113 = load i32, i32* %25
  %114 = mul i32 %113, %109
  %115 = add i32 %114, %108
  %116 = getelementptr inbounds i32, i32* %112, i32 %115
  %117 = load i32, i32* %116
  store i32 0, i32* %116
  %118 = load i32, i32* %27
  store i32 0, i32* %27
  br label %119
  119:
  %120 = load i32, i32* %27
  %121 = load i32, i32* %4
  %122 = icmp slt i32 %120, %121
  br i1 %122, label %123, label %151
  123:
  %124 = load i32*, i32** %15
  %125 = load i32, i32* %25
  %126 = load i32, i32* %6
  %127 = mul i32 %125, %126
  %128 = load i32, i32* %26
  %129 = add i32 %127, %128
  %130 = getelementptr inbounds i32, i32* %124, i32 %129
  %131 = load i32, i32* %130
  %132 = mul i32 %125, %126
  %133 = add i32 %132, %128
  %134 = getelementptr inbounds i32, i32* %124, i32 %133
  %135 = load i32, i32* %134
  %136 = load i32*, i32** %13
  %137 = mul i32 %125, %121
  %138 = add i32 %137, %120
  %139 = getelementptr inbounds i32, i32* %136, i32 %138
  %140 = load i32, i32* %139
  %141 = load i32*, i32** %14
  %142 = load i32, i32* %5
  %143 = mul i32 %120, %142
  %144 = add i32 %143, %128
  %145 = getelementptr inbounds i32, i32* %141, i32 %144
  %146 = load i32, i32* %145
  %147 = mul i32 %140, %146
  %148 = add i32 %135, %147
  store i32 %148, i32* %130
  %149 = add i32 %120, 1
  store i32 %149, i32* %27
  br label %119
  150:
  br label %151
  151:
  %152 = load i32, i32* %26
  %153 = add i32 %152, 1
  store i32 %153, i32* %26
  br label %107
  154:
  br label %155
  155:
  %156 = load i32, i32* %25
  %157 = add i32 %156, 1
  store i32 %157, i32* %25
  br label %101
  158:
  br label %159
  159:
  %160 = load i32, i32* %25
  store i32 0, i32* %25
  br label %161
  161:
  %162 = load i32, i32* %25
  %163 = load i32, i32* %3
  %164 = icmp slt i32 %162, %163
  br i1 %164, label %165, label %186
  165:
  %166 = load i32, i32* %26
  store i32 0, i32* %26
  br label %167
  167:
  %168 = load i32, i32* %26
  %169 = load i32, i32* %6
  %170 = icmp slt i32 %168, %169
  br i1 %170, label %171, label %181
  171:
  %172 = load i32*, i32** %15
  %173 = load i32, i32* %25
  %174 = mul i32 %173, %169
  %175 = add i32 %174, %168
  %176 = getelementptr inbounds i32, i32* %172, i32 %175
  %177 = load i32, i32* %176
  %178 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.5, i64 0, i64 0), i32 %177)
  %179 = add i32 %168, 1
  store i32 %179, i32* %26
  br label %167
  180:
  br label %181
  181:
  %182 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.6, i64 0, i64 0))
  %183 = load i32, i32* %25
  %184 = add i32 %183, 1
  store i32 %184, i32* %25
  br label %161
  185:
  br label %186
  186:
  br label %187
  187:
  ret i32 0
}
declare i32 @scanf(i8*, ...)
declare i32 @printf(i8*, ...)
declare i8* @malloc(i64)
