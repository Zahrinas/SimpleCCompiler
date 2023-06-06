source_filename = "example.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "riscv64-linux-gnu"
@.0 = constant [5 x i8] c"%lld\00"
@.1 = constant [5 x i8] c"%lld\00"
@.2 = constant [5 x i8] c"%lld\00"
@.3 = constant [5 x i8] c"%lld\00"
@.4 = constant [5 x i8] c"%lld\00"
@.5 = constant [5 x i8] c"%lld\00"
@.6 = constant [25 x i8] c"Incompatible Dimensions\0A\00"
@.7 = constant [5 x i8] c"%10d\00"
@.8 = constant [2 x i8] c"\0A\00"
define i64 @main() {
  %1 = alloca i64
  %2 = alloca i64
  %3 = alloca i64
  %4 = alloca i64
  %5 = alloca i64
  %6 = alloca i64
  %7 = load i64 , i64* %1
  %8 = alloca i64
  store i64 0 , i64* %8
  %9 = load i64 , i64* %8
  store i64 %9 , i64* %1
  %10 = load i64 , i64* %2
  %11 = alloca i64
  store i64 0 , i64* %11
  %12 = load i64 , i64* %11
  store i64 %12 , i64* %2
  %13 = load i64 , i64* %3
  %14 = alloca i64
  store i64 0 , i64* %14
  %15 = load i64 , i64* %14
  store i64 %15 , i64* %3
  %16 = load i64 , i64* %4
  %17 = alloca i64
  store i64 0 , i64* %17
  %18 = load i64 , i64* %17
  store i64 %18 , i64* %4
  %19 = load i64 , i64* %5
  %20 = alloca i64
  store i64 0 , i64* %20
  %21 = load i64 , i64* %20
  store i64 %21 , i64* %5
  %22 = load i64 , i64* %6
  %23 = alloca i64
  store i64 0 , i64* %23
  %24 = load i64 , i64* %23
  store i64 %24 , i64* %6
  %25 = alloca i64*
  %26 = alloca i64*
  %27 = alloca i64*
  %28 = load i64* , i64** %25
  %29 = alloca i64
  store i64 5000 , i64* %29
  %30 = load i64 , i64* %29
  %31 = call i8* (i64) @malloc (i64 %30)
  %32 = bitcast i8* %31 to i64*
  store i64* %32 , i64** %25
  %33 = load i64* , i64** %26
  %34 = alloca i64
  store i64 5000 , i64* %34
  %35 = load i64 , i64* %34
  %36 = call i8* (i64) @malloc (i64 %35)
  %37 = bitcast i8* %36 to i64*
  store i64* %37 , i64** %26
  %38 = load i64* , i64** %27
  %39 = alloca i64
  store i64 5000 , i64* %39
  %40 = load i64 , i64* %39
  %41 = call i8* (i64) @malloc (i64 %40)
  %42 = bitcast i8* %41 to i64*
  store i64* %42 , i64** %27
  %43 = alloca i64
  %44 = alloca i64
  %45 = alloca i64
  %46 = load i64 , i64* %1
  %47 = getelementptr inbounds [5 x i8] , [5 x i8]* @.0 , i64 0, i64 0
  %48 = call i64 (i8*, ...) @scanf (i8* %47 , i64* %1)
  %49 = load i64 , i64* %4
  %50 = getelementptr inbounds [5 x i8] , [5 x i8]* @.0 , i64 0, i64 0
  %51 = call i64 (i8*, ...) @scanf (i8* %50 , i64* %4)
  %52 = load i64 , i64* %43
  %53 = alloca i64
  store i64 0 , i64* %53
  %54 = load i64 , i64* %53
  store i64 %54 , i64* %43
  br label %55
  55:
  %56 = load i64 , i64* %43
  %57 = load i64 , i64* %1
  %58 = icmp slt i64 %56 , %57
  br i1 %58 , label %59 , label %86
  59:
  %60 = load i64 , i64* %44
  %61 = alloca i64
  store i64 0 , i64* %61
  %62 = load i64 , i64* %61
  store i64 %62 , i64* %44
  br label %63
  63:
  %64 = load i64 , i64* %44
  %65 = load i64 , i64* %4
  %66 = icmp slt i64 %64 , %65
  br i1 %66 , label %67 , label %80
  67:
  %68 = load i64* , i64** %25
  %69 = load i64 , i64* %43
  %70 = mul i64 %69 , %65
  %71 = add i64 %70 , %64
  %72 = getelementptr inbounds i64 , i64* %68 , i64 %71
  %73 = load i64 , i64* %72
  %74 = getelementptr inbounds [5 x i8] , [5 x i8]* @.0 , i64 0, i64 0
  %75 = call i64 (i8*, ...) @scanf (i8* %74 , i64* %72)
  %76 = alloca i64
  store i64 1 , i64* %76
  %77 = load i64 , i64* %76
  %78 = add i64 %64 , %77
  store i64 %78 , i64* %44
  br label %63
  79:
  br label %80
  80:
  %81 = load i64 , i64* %43
  %82 = alloca i64
  store i64 1 , i64* %82
  %83 = load i64 , i64* %82
  %84 = add i64 %81 , %83
  store i64 %84 , i64* %43
  br label %55
  85:
  br label %86
  86:
  %87 = load i64 , i64* %2
  %88 = getelementptr inbounds [5 x i8] , [5 x i8]* @.0 , i64 0, i64 0
  %89 = call i64 (i8*, ...) @scanf (i8* %88 , i64* %2)
  %90 = load i64 , i64* %5
  %91 = getelementptr inbounds [5 x i8] , [5 x i8]* @.0 , i64 0, i64 0
  %92 = call i64 (i8*, ...) @scanf (i8* %91 , i64* %5)
  %93 = load i64 , i64* %43
  %94 = alloca i64
  store i64 0 , i64* %94
  %95 = load i64 , i64* %94
  store i64 %95 , i64* %43
  br label %96
  96:
  %97 = load i64 , i64* %43
  %98 = load i64 , i64* %2
  %99 = icmp slt i64 %97 , %98
  br i1 %99 , label %100 , label %127
  100:
  %101 = load i64 , i64* %44
  %102 = alloca i64
  store i64 0 , i64* %102
  %103 = load i64 , i64* %102
  store i64 %103 , i64* %44
  br label %104
  104:
  %105 = load i64 , i64* %44
  %106 = load i64 , i64* %5
  %107 = icmp slt i64 %105 , %106
  br i1 %107 , label %108 , label %121
  108:
  %109 = load i64* , i64** %26
  %110 = load i64 , i64* %43
  %111 = mul i64 %110 , %106
  %112 = add i64 %111 , %105
  %113 = getelementptr inbounds i64 , i64* %109 , i64 %112
  %114 = load i64 , i64* %113
  %115 = getelementptr inbounds [5 x i8] , [5 x i8]* @.0 , i64 0, i64 0
  %116 = call i64 (i8*, ...) @scanf (i8* %115 , i64* %113)
  %117 = alloca i64
  store i64 1 , i64* %117
  %118 = load i64 , i64* %117
  %119 = add i64 %105 , %118
  store i64 %119 , i64* %44
  br label %104
  120:
  br label %121
  121:
  %122 = load i64 , i64* %43
  %123 = alloca i64
  store i64 1 , i64* %123
  %124 = load i64 , i64* %123
  %125 = add i64 %122 , %124
  store i64 %125 , i64* %43
  br label %96
  126:
  br label %127
  127:
  %128 = load i64 , i64* %4
  %129 = load i64 , i64* %2
  %130 = icmp ne i64 %128 , %129
  br i1 %130 , label %131 , label %134
  131:
  %132 = getelementptr inbounds [25 x i8] , [25 x i8]* @.6 , i64 0, i64 0
  %133 = call i64 (i8*, ...) @printf (i8* %132)
  br label %134
  134:
  %135 = load i64 , i64* %4
  %136 = load i64 , i64* %2
  %137 = icmp eq i64 %135 , %136
  br i1 %137 , label %138 , label %254
  138:
  %139 = load i64 , i64* %3
  %140 = load i64 , i64* %1
  store i64 %140 , i64* %3
  %141 = load i64 , i64* %6
  %142 = load i64 , i64* %5
  store i64 %142 , i64* %6
  %143 = load i64 , i64* %43
  %144 = alloca i64
  store i64 0 , i64* %144
  %145 = load i64 , i64* %144
  store i64 %145 , i64* %43
  br label %146
  146:
  %147 = load i64 , i64* %43
  %148 = load i64 , i64* %3
  %149 = icmp slt i64 %147 , %148
  br i1 %149 , label %150 , label %216
  150:
  %151 = load i64 , i64* %44
  %152 = alloca i64
  store i64 0 , i64* %152
  %153 = load i64 , i64* %152
  store i64 %153 , i64* %44
  br label %154
  154:
  %155 = load i64 , i64* %44
  %156 = load i64 , i64* %6
  %157 = icmp slt i64 %155 , %156
  br i1 %157 , label %158 , label %210
  158:
  %159 = load i64* , i64** %27
  %160 = load i64 , i64* %43
  %161 = mul i64 %160 , %156
  %162 = add i64 %161 , %155
  %163 = getelementptr inbounds i64 , i64* %159 , i64 %162
  %164 = load i64 , i64* %163
  %165 = alloca i64
  store i64 0 , i64* %165
  %166 = load i64 , i64* %165
  store i64 %166 , i64* %163
  %167 = load i64 , i64* %45
  %168 = alloca i64
  store i64 0 , i64* %168
  %169 = load i64 , i64* %168
  store i64 %169 , i64* %45
  br label %170
  170:
  %171 = load i64 , i64* %45
  %172 = load i64 , i64* %4
  %173 = icmp slt i64 %171 , %172
  br i1 %173 , label %174 , label %204
  174:
  %175 = load i64* , i64** %27
  %176 = load i64 , i64* %43
  %177 = load i64 , i64* %6
  %178 = mul i64 %176 , %177
  %179 = load i64 , i64* %44
  %180 = add i64 %178 , %179
  %181 = getelementptr inbounds i64 , i64* %175 , i64 %180
  %182 = load i64 , i64* %181
  %183 = mul i64 %176 , %177
  %184 = add i64 %183 , %179
  %185 = getelementptr inbounds i64 , i64* %175 , i64 %184
  %186 = load i64 , i64* %185
  %187 = load i64* , i64** %25
  %188 = mul i64 %176 , %172
  %189 = add i64 %188 , %171
  %190 = getelementptr inbounds i64 , i64* %187 , i64 %189
  %191 = load i64 , i64* %190
  %192 = load i64* , i64** %26
  %193 = load i64 , i64* %5
  %194 = mul i64 %171 , %193
  %195 = add i64 %194 , %179
  %196 = getelementptr inbounds i64 , i64* %192 , i64 %195
  %197 = load i64 , i64* %196
  %198 = mul i64 %191 , %197
  %199 = add i64 %186 , %198
  store i64 %199 , i64* %181
  %200 = alloca i64
  store i64 1 , i64* %200
  %201 = load i64 , i64* %200
  %202 = add i64 %171 , %201
  store i64 %202 , i64* %45
  br label %170
  203:
  br label %204
  204:
  %205 = load i64 , i64* %44
  %206 = alloca i64
  store i64 1 , i64* %206
  %207 = load i64 , i64* %206
  %208 = add i64 %205 , %207
  store i64 %208 , i64* %44
  br label %154
  209:
  br label %210
  210:
  %211 = load i64 , i64* %43
  %212 = alloca i64
  store i64 1 , i64* %212
  %213 = load i64 , i64* %212
  %214 = add i64 %211 , %213
  store i64 %214 , i64* %43
  br label %146
  215:
  br label %216
  216:
  %217 = load i64 , i64* %43
  %218 = alloca i64
  store i64 0 , i64* %218
  %219 = load i64 , i64* %218
  store i64 %219 , i64* %43
  br label %220
  220:
  %221 = load i64 , i64* %43
  %222 = load i64 , i64* %3
  %223 = icmp slt i64 %221 , %222
  br i1 %223 , label %224 , label %253
  224:
  %225 = load i64 , i64* %44
  %226 = alloca i64
  store i64 0 , i64* %226
  %227 = load i64 , i64* %226
  store i64 %227 , i64* %44
  br label %228
  228:
  %229 = load i64 , i64* %44
  %230 = load i64 , i64* %6
  %231 = icmp slt i64 %229 , %230
  br i1 %231 , label %232 , label %245
  232:
  %233 = load i64* , i64** %27
  %234 = load i64 , i64* %43
  %235 = mul i64 %234 , %230
  %236 = add i64 %235 , %229
  %237 = getelementptr inbounds i64 , i64* %233 , i64 %236
  %238 = load i64 , i64* %237
  %239 = getelementptr inbounds [5 x i8] , [5 x i8]* @.7 , i64 0, i64 0
  %240 = call i64 (i8*, ...) @printf (i8* %239 , i64 %238)
  %241 = alloca i64
  store i64 1 , i64* %241
  %242 = load i64 , i64* %241
  %243 = add i64 %229 , %242
  store i64 %243 , i64* %44
  br label %228
  244:
  br label %245
  245:
  %246 = getelementptr inbounds [2 x i8] , [2 x i8]* @.8 , i64 0, i64 0
  %247 = call i64 (i8*, ...) @printf (i8* %246)
  %248 = load i64 , i64* %43
  %249 = alloca i64
  store i64 1 , i64* %249
  %250 = load i64 , i64* %249
  %251 = add i64 %248 , %250
  store i64 %251 , i64* %43
  br label %220
  252:
  br label %253
  253:
  br label %254
  254:
  %255 = alloca i64
  store i64 0 , i64* %255
  %256 = load i64 , i64* %255
  ret i64 %256
}
declare i64 @scanf(i8*, ...)
declare i64 @printf(i8*, ...)
declare i8* @malloc(i64)
declare i8* @strchr(i8*, i64)
declare i64 @sscanf(i8*, i8*, ...)
declare i64 @strcmp(i8*, i8*)
declare void @memset(i8*, i8, i64)
declare i64 @gets(...)
