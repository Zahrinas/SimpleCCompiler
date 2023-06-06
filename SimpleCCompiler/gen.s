	.file	"example.c"
	.option	pic
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sd	fp,8(sp)
	sd	ra,0(sp)
	mv	fp,sp
	li	t0,-2384
	add	sp,sp,t0
# %1 = alloca i64
	li	t0,-2064
	add	t1,t0,fp
	li	t0,-16
	add	t0,t0,fp
	sd	t1,0(t0)
# %2 = alloca i64
	li	t0,-2072
	add	t1,t0,fp
	li	t0,-24
	add	t0,t0,fp
	sd	t1,0(t0)
# %3 = alloca i64
	li	t0,-2080
	add	t1,t0,fp
	li	t0,-32
	add	t0,t0,fp
	sd	t1,0(t0)
# %4 = alloca i64
	li	t0,-2088
	add	t1,t0,fp
	li	t0,-40
	add	t0,t0,fp
	sd	t1,0(t0)
# %5 = alloca i64
	li	t0,-2096
	add	t1,t0,fp
	li	t0,-48
	add	t0,t0,fp
	sd	t1,0(t0)
# %6 = alloca i64
	li	t0,-2104
	add	t1,t0,fp
	li	t0,-56
	add	t0,t0,fp
	sd	t1,0(t0)
# %7 = load i64 , i64* %1
	li	t0,-16
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-64
	add	t0,t0,fp
	sd	t1,0(t0)
# %8 = alloca i64
	li	t0,-2112
	add	t1,t0,fp
	li	t0,-72
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 0 , i64* %8
	li	t2,0
	li	t0,-72
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %9 = load i64 , i64* %8
	li	t0,-72
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-80
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %9 , i64* %1
	li	t0,-80
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-16
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %10 = load i64 , i64* %2
	li	t0,-24
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-88
	add	t0,t0,fp
	sd	t1,0(t0)
# %11 = alloca i64
	li	t0,-2120
	add	t1,t0,fp
	li	t0,-96
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 0 , i64* %11
	li	t2,0
	li	t0,-96
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %12 = load i64 , i64* %11
	li	t0,-96
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-104
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %12 , i64* %2
	li	t0,-104
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-24
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %13 = load i64 , i64* %3
	li	t0,-32
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-112
	add	t0,t0,fp
	sd	t1,0(t0)
# %14 = alloca i64
	li	t0,-2128
	add	t1,t0,fp
	li	t0,-120
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 0 , i64* %14
	li	t2,0
	li	t0,-120
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %15 = load i64 , i64* %14
	li	t0,-120
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-128
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %15 , i64* %3
	li	t0,-128
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-32
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %16 = load i64 , i64* %4
	li	t0,-40
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-136
	add	t0,t0,fp
	sd	t1,0(t0)
# %17 = alloca i64
	li	t0,-2136
	add	t1,t0,fp
	li	t0,-144
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 0 , i64* %17
	li	t2,0
	li	t0,-144
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %18 = load i64 , i64* %17
	li	t0,-144
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-152
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %18 , i64* %4
	li	t0,-152
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-40
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %19 = load i64 , i64* %5
	li	t0,-48
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-160
	add	t0,t0,fp
	sd	t1,0(t0)
# %20 = alloca i64
	li	t0,-2144
	add	t1,t0,fp
	li	t0,-168
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 0 , i64* %20
	li	t2,0
	li	t0,-168
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %21 = load i64 , i64* %20
	li	t0,-168
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-176
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %21 , i64* %5
	li	t0,-176
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-48
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %22 = load i64 , i64* %6
	li	t0,-56
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-184
	add	t0,t0,fp
	sd	t1,0(t0)
# %23 = alloca i64
	li	t0,-2152
	add	t1,t0,fp
	li	t0,-192
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 0 , i64* %23
	li	t2,0
	li	t0,-192
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %24 = load i64 , i64* %23
	li	t0,-192
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-200
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %24 , i64* %6
	li	t0,-200
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-56
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %25 = alloca i64*
	li	t0,-2160
	add	t1,t0,fp
	li	t0,-208
	add	t0,t0,fp
	sd	t1,0(t0)
# %26 = alloca i64*
	li	t0,-2168
	add	t1,t0,fp
	li	t0,-216
	add	t0,t0,fp
	sd	t1,0(t0)
# %27 = alloca i64*
	li	t0,-2176
	add	t1,t0,fp
	li	t0,-224
	add	t0,t0,fp
	sd	t1,0(t0)
# %28 = load i64* , i64** %25
	li	t0,-208
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-232
	add	t0,t0,fp
	sd	t1,0(t0)
# %29 = alloca i64
	li	t0,-2184
	add	t1,t0,fp
	li	t0,-240
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 5000 , i64* %29
	li	t2,5000
	li	t0,-240
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %30 = load i64 , i64* %29
	li	t0,-240
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-248
	add	t0,t0,fp
	sd	t1,0(t0)
# %31 = call i8* (i64) @malloc (i64 %30)
	li	t0,-248
	add	t0,t0,fp
	ld	a0,0(t0)
	call	malloc@plt
	li	t0,-256
	add	t0,t0,fp
	sd	a0,0(t0)
# %32 = bitcast i8* %31 to i64*
	li	t0,-256
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-264
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64* %32 , i64** %25
	li	t0,-264
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-208
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %33 = load i64* , i64** %26
	li	t0,-216
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-272
	add	t0,t0,fp
	sd	t1,0(t0)
# %34 = alloca i64
	li	t0,-2192
	add	t1,t0,fp
	li	t0,-280
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 5000 , i64* %34
	li	t2,5000
	li	t0,-280
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %35 = load i64 , i64* %34
	li	t0,-280
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-288
	add	t0,t0,fp
	sd	t1,0(t0)
# %36 = call i8* (i64) @malloc (i64 %35)
	li	t0,-288
	add	t0,t0,fp
	ld	a0,0(t0)
	call	malloc@plt
	li	t0,-296
	add	t0,t0,fp
	sd	a0,0(t0)
# %37 = bitcast i8* %36 to i64*
	li	t0,-296
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-304
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64* %37 , i64** %26
	li	t0,-304
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-216
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %38 = load i64* , i64** %27
	li	t0,-224
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-312
	add	t0,t0,fp
	sd	t1,0(t0)
# %39 = alloca i64
	li	t0,-2200
	add	t1,t0,fp
	li	t0,-320
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 5000 , i64* %39
	li	t2,5000
	li	t0,-320
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %40 = load i64 , i64* %39
	li	t0,-320
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-328
	add	t0,t0,fp
	sd	t1,0(t0)
# %41 = call i8* (i64) @malloc (i64 %40)
	li	t0,-328
	add	t0,t0,fp
	ld	a0,0(t0)
	call	malloc@plt
	li	t0,-336
	add	t0,t0,fp
	sd	a0,0(t0)
# %42 = bitcast i8* %41 to i64*
	li	t0,-336
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-344
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64* %42 , i64** %27
	li	t0,-344
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-224
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %43 = alloca i64
	li	t0,-2208
	add	t1,t0,fp
	li	t0,-352
	add	t0,t0,fp
	sd	t1,0(t0)
# %44 = alloca i64
	li	t0,-2216
	add	t1,t0,fp
	li	t0,-360
	add	t0,t0,fp
	sd	t1,0(t0)
# %45 = alloca i64
	li	t0,-2224
	add	t1,t0,fp
	li	t0,-368
	add	t0,t0,fp
	sd	t1,0(t0)
# %46 = load i64 , i64* %1
	li	t0,-16
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-376
	add	t0,t0,fp
	sd	t1,0(t0)
# %47 = getelementptr inbounds [5 x i8] , [5 x i8]* @.0 , i64 0, i64 0
	lla	t1,.LC0
	li	t0,-384
	add	t0,t0,fp
	sd	t1,0(t0)
# %48 = call i64 (i8*, ...) @scanf (i8* %47 , i64* %1)
	li	t0,-384
	add	t0,t0,fp
	ld	a0,0(t0)
	li	t0,-16
	add	t0,t0,fp
	ld	a1,0(t0)
	call	scanf@plt
	li	t0,-392
	add	t0,t0,fp
	sd	a0,0(t0)
# %49 = load i64 , i64* %4
	li	t0,-40
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-400
	add	t0,t0,fp
	sd	t1,0(t0)
# %50 = getelementptr inbounds [5 x i8] , [5 x i8]* @.0 , i64 0, i64 0
	lla	t1,.LC0
	li	t0,-408
	add	t0,t0,fp
	sd	t1,0(t0)
# %51 = call i64 (i8*, ...) @scanf (i8* %50 , i64* %4)
	li	t0,-408
	add	t0,t0,fp
	ld	a0,0(t0)
	li	t0,-40
	add	t0,t0,fp
	ld	a1,0(t0)
	call	scanf@plt
	li	t0,-416
	add	t0,t0,fp
	sd	a0,0(t0)
# %52 = load i64 , i64* %43
	li	t0,-352
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-424
	add	t0,t0,fp
	sd	t1,0(t0)
# %53 = alloca i64
	li	t0,-2232
	add	t1,t0,fp
	li	t0,-432
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 0 , i64* %53
	li	t2,0
	li	t0,-432
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %54 = load i64 , i64* %53
	li	t0,-432
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-440
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %54 , i64* %43
	li	t0,-440
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-352
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# br label %55
	j	.L0_55
# 55:
.L0_55:
# %56 = load i64 , i64* %43
	li	t0,-352
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-456
	add	t0,t0,fp
	sd	t1,0(t0)
# %57 = load i64 , i64* %1
	li	t0,-16
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-464
	add	t0,t0,fp
	sd	t1,0(t0)
# %58 = icmp slt i64 %56 , %57
# br i1 %58 , label %59 , label %86
	li	t0,-456
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-464
	add	t0,t0,fp
	ld	t2,0(t0)
	bge	t1,t2,.L0_86
# 59:
.L0_59:
# %60 = load i64 , i64* %44
	li	t0,-360
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-488
	add	t0,t0,fp
	sd	t1,0(t0)
# %61 = alloca i64
	li	t0,-2240
	add	t1,t0,fp
	li	t0,-496
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 0 , i64* %61
	li	t2,0
	li	t0,-496
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %62 = load i64 , i64* %61
	li	t0,-496
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-504
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %62 , i64* %44
	li	t0,-504
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-360
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# br label %63
	j	.L0_63
# 63:
.L0_63:
# %64 = load i64 , i64* %44
	li	t0,-360
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-520
	add	t0,t0,fp
	sd	t1,0(t0)
# %65 = load i64 , i64* %4
	li	t0,-40
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-528
	add	t0,t0,fp
	sd	t1,0(t0)
# %66 = icmp slt i64 %64 , %65
# br i1 %66 , label %67 , label %80
	li	t0,-520
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-528
	add	t0,t0,fp
	ld	t2,0(t0)
	bge	t1,t2,.L0_80
# 67:
.L0_67:
# %68 = load i64* , i64** %25
	li	t0,-208
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-552
	add	t0,t0,fp
	sd	t1,0(t0)
# %69 = load i64 , i64* %43
	li	t0,-352
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-560
	add	t0,t0,fp
	sd	t1,0(t0)
# %70 = mul i64 %69 , %65
	li	t0,-560
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-528
	add	t0,t0,fp
	ld	t2,0(t0)
	mul	t1,t1,t2
	li	t0,-568
	add	t0,t0,fp
	sd	t1,0(t0)
# %71 = add i64 %70 , %64
	li	t0,-568
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-520
	add	t0,t0,fp
	ld	t2,0(t0)
	add	t1,t1,t2
	li	t0,-576
	add	t0,t0,fp
	sd	t1,0(t0)
# %72 = getelementptr inbounds i64 , i64* %68 , i64 %71
	li	t0,-552
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-576
	add	t0,t0,fp
	ld	t2,0(t0)
	slli	t2,t2,3
	add	t1,t1,t2
	li	t0,-584
	add	t0,t0,fp
	sd	t1,0(t0)
# %73 = load i64 , i64* %72
	li	t0,-584
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-592
	add	t0,t0,fp
	sd	t1,0(t0)
# %74 = getelementptr inbounds [5 x i8] , [5 x i8]* @.0 , i64 0, i64 0
	lla	t1,.LC0
	li	t0,-600
	add	t0,t0,fp
	sd	t1,0(t0)
# %75 = call i64 (i8*, ...) @scanf (i8* %74 , i64* %72)
	li	t0,-600
	add	t0,t0,fp
	ld	a0,0(t0)
	li	t0,-584
	add	t0,t0,fp
	ld	a1,0(t0)
	call	scanf@plt
	li	t0,-608
	add	t0,t0,fp
	sd	a0,0(t0)
# %76 = alloca i64
	li	t0,-2248
	add	t1,t0,fp
	li	t0,-616
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 1 , i64* %76
	li	t2,1
	li	t0,-616
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %77 = load i64 , i64* %76
	li	t0,-616
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-624
	add	t0,t0,fp
	sd	t1,0(t0)
# %78 = add i64 %64 , %77
	li	t0,-520
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-624
	add	t0,t0,fp
	ld	t2,0(t0)
	add	t1,t1,t2
	li	t0,-632
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %78 , i64* %44
	li	t0,-632
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-360
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# br label %63
	j	.L0_63
# 79:
.L0_79:
# br label %80
	j	.L0_80
# 80:
.L0_80:
# %81 = load i64 , i64* %43
	li	t0,-352
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-656
	add	t0,t0,fp
	sd	t1,0(t0)
# %82 = alloca i64
	li	t0,-2256
	add	t1,t0,fp
	li	t0,-664
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 1 , i64* %82
	li	t2,1
	li	t0,-664
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %83 = load i64 , i64* %82
	li	t0,-664
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-672
	add	t0,t0,fp
	sd	t1,0(t0)
# %84 = add i64 %81 , %83
	li	t0,-656
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-672
	add	t0,t0,fp
	ld	t2,0(t0)
	add	t1,t1,t2
	li	t0,-680
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %84 , i64* %43
	li	t0,-680
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-352
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# br label %55
	j	.L0_55
# 85:
.L0_85:
# br label %86
	j	.L0_86
# 86:
.L0_86:
# %87 = load i64 , i64* %2
	li	t0,-24
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-704
	add	t0,t0,fp
	sd	t1,0(t0)
# %88 = getelementptr inbounds [5 x i8] , [5 x i8]* @.0 , i64 0, i64 0
	lla	t1,.LC0
	li	t0,-712
	add	t0,t0,fp
	sd	t1,0(t0)
# %89 = call i64 (i8*, ...) @scanf (i8* %88 , i64* %2)
	li	t0,-712
	add	t0,t0,fp
	ld	a0,0(t0)
	li	t0,-24
	add	t0,t0,fp
	ld	a1,0(t0)
	call	scanf@plt
	li	t0,-720
	add	t0,t0,fp
	sd	a0,0(t0)
# %90 = load i64 , i64* %5
	li	t0,-48
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-728
	add	t0,t0,fp
	sd	t1,0(t0)
# %91 = getelementptr inbounds [5 x i8] , [5 x i8]* @.0 , i64 0, i64 0
	lla	t1,.LC0
	li	t0,-736
	add	t0,t0,fp
	sd	t1,0(t0)
# %92 = call i64 (i8*, ...) @scanf (i8* %91 , i64* %5)
	li	t0,-736
	add	t0,t0,fp
	ld	a0,0(t0)
	li	t0,-48
	add	t0,t0,fp
	ld	a1,0(t0)
	call	scanf@plt
	li	t0,-744
	add	t0,t0,fp
	sd	a0,0(t0)
# %93 = load i64 , i64* %43
	li	t0,-352
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-752
	add	t0,t0,fp
	sd	t1,0(t0)
# %94 = alloca i64
	li	t0,-2264
	add	t1,t0,fp
	li	t0,-760
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 0 , i64* %94
	li	t2,0
	li	t0,-760
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %95 = load i64 , i64* %94
	li	t0,-760
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-768
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %95 , i64* %43
	li	t0,-768
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-352
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# br label %96
	j	.L0_96
# 96:
.L0_96:
# %97 = load i64 , i64* %43
	li	t0,-352
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-784
	add	t0,t0,fp
	sd	t1,0(t0)
# %98 = load i64 , i64* %2
	li	t0,-24
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-792
	add	t0,t0,fp
	sd	t1,0(t0)
# %99 = icmp slt i64 %97 , %98
# br i1 %99 , label %100 , label %127
	li	t0,-784
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-792
	add	t0,t0,fp
	ld	t2,0(t0)
	bge	t1,t2,.L0_127
# 100:
.L0_100:
# %101 = load i64 , i64* %44
	li	t0,-360
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-816
	add	t0,t0,fp
	sd	t1,0(t0)
# %102 = alloca i64
	li	t0,-2272
	add	t1,t0,fp
	li	t0,-824
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 0 , i64* %102
	li	t2,0
	li	t0,-824
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %103 = load i64 , i64* %102
	li	t0,-824
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-832
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %103 , i64* %44
	li	t0,-832
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-360
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# br label %104
	j	.L0_104
# 104:
.L0_104:
# %105 = load i64 , i64* %44
	li	t0,-360
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-848
	add	t0,t0,fp
	sd	t1,0(t0)
# %106 = load i64 , i64* %5
	li	t0,-48
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-856
	add	t0,t0,fp
	sd	t1,0(t0)
# %107 = icmp slt i64 %105 , %106
# br i1 %107 , label %108 , label %121
	li	t0,-848
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-856
	add	t0,t0,fp
	ld	t2,0(t0)
	bge	t1,t2,.L0_121
# 108:
.L0_108:
# %109 = load i64* , i64** %26
	li	t0,-216
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-880
	add	t0,t0,fp
	sd	t1,0(t0)
# %110 = load i64 , i64* %43
	li	t0,-352
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-888
	add	t0,t0,fp
	sd	t1,0(t0)
# %111 = mul i64 %110 , %106
	li	t0,-888
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-856
	add	t0,t0,fp
	ld	t2,0(t0)
	mul	t1,t1,t2
	li	t0,-896
	add	t0,t0,fp
	sd	t1,0(t0)
# %112 = add i64 %111 , %105
	li	t0,-896
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-848
	add	t0,t0,fp
	ld	t2,0(t0)
	add	t1,t1,t2
	li	t0,-904
	add	t0,t0,fp
	sd	t1,0(t0)
# %113 = getelementptr inbounds i64 , i64* %109 , i64 %112
	li	t0,-880
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-904
	add	t0,t0,fp
	ld	t2,0(t0)
	slli	t2,t2,3
	add	t1,t1,t2
	li	t0,-912
	add	t0,t0,fp
	sd	t1,0(t0)
# %114 = load i64 , i64* %113
	li	t0,-912
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-920
	add	t0,t0,fp
	sd	t1,0(t0)
# %115 = getelementptr inbounds [5 x i8] , [5 x i8]* @.0 , i64 0, i64 0
	lla	t1,.LC0
	li	t0,-928
	add	t0,t0,fp
	sd	t1,0(t0)
# %116 = call i64 (i8*, ...) @scanf (i8* %115 , i64* %113)
	li	t0,-928
	add	t0,t0,fp
	ld	a0,0(t0)
	li	t0,-912
	add	t0,t0,fp
	ld	a1,0(t0)
	call	scanf@plt
	li	t0,-936
	add	t0,t0,fp
	sd	a0,0(t0)
# %117 = alloca i64
	li	t0,-2280
	add	t1,t0,fp
	li	t0,-944
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 1 , i64* %117
	li	t2,1
	li	t0,-944
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %118 = load i64 , i64* %117
	li	t0,-944
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-952
	add	t0,t0,fp
	sd	t1,0(t0)
# %119 = add i64 %105 , %118
	li	t0,-848
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-952
	add	t0,t0,fp
	ld	t2,0(t0)
	add	t1,t1,t2
	li	t0,-960
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %119 , i64* %44
	li	t0,-960
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-360
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# br label %104
	j	.L0_104
# 120:
.L0_120:
# br label %121
	j	.L0_121
# 121:
.L0_121:
# %122 = load i64 , i64* %43
	li	t0,-352
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-984
	add	t0,t0,fp
	sd	t1,0(t0)
# %123 = alloca i64
	li	t0,-2288
	add	t1,t0,fp
	li	t0,-992
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 1 , i64* %123
	li	t2,1
	li	t0,-992
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %124 = load i64 , i64* %123
	li	t0,-992
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1000
	add	t0,t0,fp
	sd	t1,0(t0)
# %125 = add i64 %122 , %124
	li	t0,-984
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1000
	add	t0,t0,fp
	ld	t2,0(t0)
	add	t1,t1,t2
	li	t0,-1008
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %125 , i64* %43
	li	t0,-1008
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-352
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# br label %96
	j	.L0_96
# 126:
.L0_126:
# br label %127
	j	.L0_127
# 127:
.L0_127:
# %128 = load i64 , i64* %4
	li	t0,-40
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1032
	add	t0,t0,fp
	sd	t1,0(t0)
# %129 = load i64 , i64* %2
	li	t0,-24
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1040
	add	t0,t0,fp
	sd	t1,0(t0)
# %130 = icmp ne i64 %128 , %129
# br i1 %130 , label %131 , label %134
	li	t0,-1032
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1040
	add	t0,t0,fp
	ld	t2,0(t0)
	beq	t1,t2,.L0_134
# 131:
.L0_131:
# %132 = getelementptr inbounds [25 x i8] , [25 x i8]* @.6 , i64 0, i64 0
	lla	t1,.LC6
	li	t0,-1064
	add	t0,t0,fp
	sd	t1,0(t0)
# %133 = call i64 (i8*, ...) @printf (i8* %132)
	li	t0,-1064
	add	t0,t0,fp
	ld	a0,0(t0)
	call	printf@plt
	li	t0,-1072
	add	t0,t0,fp
	sd	a0,0(t0)
# br label %134
	j	.L0_134
# 134:
.L0_134:
# %135 = load i64 , i64* %4
	li	t0,-40
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1088
	add	t0,t0,fp
	sd	t1,0(t0)
# %136 = load i64 , i64* %2
	li	t0,-24
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1096
	add	t0,t0,fp
	sd	t1,0(t0)
# %137 = icmp eq i64 %135 , %136
# br i1 %137 , label %138 , label %254
	li	t0,-1088
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1096
	add	t0,t0,fp
	ld	t2,0(t0)
	bne	t1,t2,.L0_254
# 138:
.L0_138:
# %139 = load i64 , i64* %3
	li	t0,-32
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1120
	add	t0,t0,fp
	sd	t1,0(t0)
# %140 = load i64 , i64* %1
	li	t0,-16
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1128
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %140 , i64* %3
	li	t0,-1128
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-32
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %141 = load i64 , i64* %6
	li	t0,-56
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1136
	add	t0,t0,fp
	sd	t1,0(t0)
# %142 = load i64 , i64* %5
	li	t0,-48
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1144
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %142 , i64* %6
	li	t0,-1144
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-56
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %143 = load i64 , i64* %43
	li	t0,-352
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1152
	add	t0,t0,fp
	sd	t1,0(t0)
# %144 = alloca i64
	li	t0,-2296
	add	t1,t0,fp
	li	t0,-1160
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 0 , i64* %144
	li	t2,0
	li	t0,-1160
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %145 = load i64 , i64* %144
	li	t0,-1160
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1168
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %145 , i64* %43
	li	t0,-1168
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-352
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# br label %146
	j	.L0_146
# 146:
.L0_146:
# %147 = load i64 , i64* %43
	li	t0,-352
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1184
	add	t0,t0,fp
	sd	t1,0(t0)
# %148 = load i64 , i64* %3
	li	t0,-32
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1192
	add	t0,t0,fp
	sd	t1,0(t0)
# %149 = icmp slt i64 %147 , %148
# br i1 %149 , label %150 , label %216
	li	t0,-1184
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1192
	add	t0,t0,fp
	ld	t2,0(t0)
	bge	t1,t2,.L0_216
# 150:
.L0_150:
# %151 = load i64 , i64* %44
	li	t0,-360
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1216
	add	t0,t0,fp
	sd	t1,0(t0)
# %152 = alloca i64
	li	t0,-2304
	add	t1,t0,fp
	li	t0,-1224
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 0 , i64* %152
	li	t2,0
	li	t0,-1224
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %153 = load i64 , i64* %152
	li	t0,-1224
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1232
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %153 , i64* %44
	li	t0,-1232
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-360
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# br label %154
	j	.L0_154
# 154:
.L0_154:
# %155 = load i64 , i64* %44
	li	t0,-360
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1248
	add	t0,t0,fp
	sd	t1,0(t0)
# %156 = load i64 , i64* %6
	li	t0,-56
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1256
	add	t0,t0,fp
	sd	t1,0(t0)
# %157 = icmp slt i64 %155 , %156
# br i1 %157 , label %158 , label %210
	li	t0,-1248
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1256
	add	t0,t0,fp
	ld	t2,0(t0)
	bge	t1,t2,.L0_210
# 158:
.L0_158:
# %159 = load i64* , i64** %27
	li	t0,-224
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1280
	add	t0,t0,fp
	sd	t1,0(t0)
# %160 = load i64 , i64* %43
	li	t0,-352
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1288
	add	t0,t0,fp
	sd	t1,0(t0)
# %161 = mul i64 %160 , %156
	li	t0,-1288
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1256
	add	t0,t0,fp
	ld	t2,0(t0)
	mul	t1,t1,t2
	li	t0,-1296
	add	t0,t0,fp
	sd	t1,0(t0)
# %162 = add i64 %161 , %155
	li	t0,-1296
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1248
	add	t0,t0,fp
	ld	t2,0(t0)
	add	t1,t1,t2
	li	t0,-1304
	add	t0,t0,fp
	sd	t1,0(t0)
# %163 = getelementptr inbounds i64 , i64* %159 , i64 %162
	li	t0,-1280
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1304
	add	t0,t0,fp
	ld	t2,0(t0)
	slli	t2,t2,3
	add	t1,t1,t2
	li	t0,-1312
	add	t0,t0,fp
	sd	t1,0(t0)
# %164 = load i64 , i64* %163
	li	t0,-1312
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1320
	add	t0,t0,fp
	sd	t1,0(t0)
# %165 = alloca i64
	li	t0,-2312
	add	t1,t0,fp
	li	t0,-1328
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 0 , i64* %165
	li	t2,0
	li	t0,-1328
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %166 = load i64 , i64* %165
	li	t0,-1328
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1336
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %166 , i64* %163
	li	t0,-1336
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-1312
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %167 = load i64 , i64* %45
	li	t0,-368
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1344
	add	t0,t0,fp
	sd	t1,0(t0)
# %168 = alloca i64
	li	t0,-2320
	add	t1,t0,fp
	li	t0,-1352
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 0 , i64* %168
	li	t2,0
	li	t0,-1352
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %169 = load i64 , i64* %168
	li	t0,-1352
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1360
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %169 , i64* %45
	li	t0,-1360
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-368
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# br label %170
	j	.L0_170
# 170:
.L0_170:
# %171 = load i64 , i64* %45
	li	t0,-368
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1376
	add	t0,t0,fp
	sd	t1,0(t0)
# %172 = load i64 , i64* %4
	li	t0,-40
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1384
	add	t0,t0,fp
	sd	t1,0(t0)
# %173 = icmp slt i64 %171 , %172
# br i1 %173 , label %174 , label %204
	li	t0,-1376
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1384
	add	t0,t0,fp
	ld	t2,0(t0)
	bge	t1,t2,.L0_204
# 174:
.L0_174:
# %175 = load i64* , i64** %27
	li	t0,-224
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1408
	add	t0,t0,fp
	sd	t1,0(t0)
# %176 = load i64 , i64* %43
	li	t0,-352
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1416
	add	t0,t0,fp
	sd	t1,0(t0)
# %177 = load i64 , i64* %6
	li	t0,-56
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1424
	add	t0,t0,fp
	sd	t1,0(t0)
# %178 = mul i64 %176 , %177
	li	t0,-1416
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1424
	add	t0,t0,fp
	ld	t2,0(t0)
	mul	t1,t1,t2
	li	t0,-1432
	add	t0,t0,fp
	sd	t1,0(t0)
# %179 = load i64 , i64* %44
	li	t0,-360
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1440
	add	t0,t0,fp
	sd	t1,0(t0)
# %180 = add i64 %178 , %179
	li	t0,-1432
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1440
	add	t0,t0,fp
	ld	t2,0(t0)
	add	t1,t1,t2
	li	t0,-1448
	add	t0,t0,fp
	sd	t1,0(t0)
# %181 = getelementptr inbounds i64 , i64* %175 , i64 %180
	li	t0,-1408
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1448
	add	t0,t0,fp
	ld	t2,0(t0)
	slli	t2,t2,3
	add	t1,t1,t2
	li	t0,-1456
	add	t0,t0,fp
	sd	t1,0(t0)
# %182 = load i64 , i64* %181
	li	t0,-1456
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1464
	add	t0,t0,fp
	sd	t1,0(t0)
# %183 = mul i64 %176 , %177
	li	t0,-1416
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1424
	add	t0,t0,fp
	ld	t2,0(t0)
	mul	t1,t1,t2
	li	t0,-1472
	add	t0,t0,fp
	sd	t1,0(t0)
# %184 = add i64 %183 , %179
	li	t0,-1472
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1440
	add	t0,t0,fp
	ld	t2,0(t0)
	add	t1,t1,t2
	li	t0,-1480
	add	t0,t0,fp
	sd	t1,0(t0)
# %185 = getelementptr inbounds i64 , i64* %175 , i64 %184
	li	t0,-1408
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1480
	add	t0,t0,fp
	ld	t2,0(t0)
	slli	t2,t2,3
	add	t1,t1,t2
	li	t0,-1488
	add	t0,t0,fp
	sd	t1,0(t0)
# %186 = load i64 , i64* %185
	li	t0,-1488
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1496
	add	t0,t0,fp
	sd	t1,0(t0)
# %187 = load i64* , i64** %25
	li	t0,-208
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1504
	add	t0,t0,fp
	sd	t1,0(t0)
# %188 = mul i64 %176 , %172
	li	t0,-1416
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1384
	add	t0,t0,fp
	ld	t2,0(t0)
	mul	t1,t1,t2
	li	t0,-1512
	add	t0,t0,fp
	sd	t1,0(t0)
# %189 = add i64 %188 , %171
	li	t0,-1512
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1376
	add	t0,t0,fp
	ld	t2,0(t0)
	add	t1,t1,t2
	li	t0,-1520
	add	t0,t0,fp
	sd	t1,0(t0)
# %190 = getelementptr inbounds i64 , i64* %187 , i64 %189
	li	t0,-1504
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1520
	add	t0,t0,fp
	ld	t2,0(t0)
	slli	t2,t2,3
	add	t1,t1,t2
	li	t0,-1528
	add	t0,t0,fp
	sd	t1,0(t0)
# %191 = load i64 , i64* %190
	li	t0,-1528
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1536
	add	t0,t0,fp
	sd	t1,0(t0)
# %192 = load i64* , i64** %26
	li	t0,-216
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1544
	add	t0,t0,fp
	sd	t1,0(t0)
# %193 = load i64 , i64* %5
	li	t0,-48
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1552
	add	t0,t0,fp
	sd	t1,0(t0)
# %194 = mul i64 %171 , %193
	li	t0,-1376
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1552
	add	t0,t0,fp
	ld	t2,0(t0)
	mul	t1,t1,t2
	li	t0,-1560
	add	t0,t0,fp
	sd	t1,0(t0)
# %195 = add i64 %194 , %179
	li	t0,-1560
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1440
	add	t0,t0,fp
	ld	t2,0(t0)
	add	t1,t1,t2
	li	t0,-1568
	add	t0,t0,fp
	sd	t1,0(t0)
# %196 = getelementptr inbounds i64 , i64* %192 , i64 %195
	li	t0,-1544
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1568
	add	t0,t0,fp
	ld	t2,0(t0)
	slli	t2,t2,3
	add	t1,t1,t2
	li	t0,-1576
	add	t0,t0,fp
	sd	t1,0(t0)
# %197 = load i64 , i64* %196
	li	t0,-1576
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1584
	add	t0,t0,fp
	sd	t1,0(t0)
# %198 = mul i64 %191 , %197
	li	t0,-1536
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1584
	add	t0,t0,fp
	ld	t2,0(t0)
	mul	t1,t1,t2
	li	t0,-1592
	add	t0,t0,fp
	sd	t1,0(t0)
# %199 = add i64 %186 , %198
	li	t0,-1496
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1592
	add	t0,t0,fp
	ld	t2,0(t0)
	add	t1,t1,t2
	li	t0,-1600
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %199 , i64* %181
	li	t0,-1600
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-1456
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %200 = alloca i64
	li	t0,-2328
	add	t1,t0,fp
	li	t0,-1608
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 1 , i64* %200
	li	t2,1
	li	t0,-1608
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %201 = load i64 , i64* %200
	li	t0,-1608
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1616
	add	t0,t0,fp
	sd	t1,0(t0)
# %202 = add i64 %171 , %201
	li	t0,-1376
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1616
	add	t0,t0,fp
	ld	t2,0(t0)
	add	t1,t1,t2
	li	t0,-1624
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %202 , i64* %45
	li	t0,-1624
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-368
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# br label %170
	j	.L0_170
# 203:
.L0_203:
# br label %204
	j	.L0_204
# 204:
.L0_204:
# %205 = load i64 , i64* %44
	li	t0,-360
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1648
	add	t0,t0,fp
	sd	t1,0(t0)
# %206 = alloca i64
	li	t0,-2336
	add	t1,t0,fp
	li	t0,-1656
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 1 , i64* %206
	li	t2,1
	li	t0,-1656
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %207 = load i64 , i64* %206
	li	t0,-1656
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1664
	add	t0,t0,fp
	sd	t1,0(t0)
# %208 = add i64 %205 , %207
	li	t0,-1648
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1664
	add	t0,t0,fp
	ld	t2,0(t0)
	add	t1,t1,t2
	li	t0,-1672
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %208 , i64* %44
	li	t0,-1672
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-360
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# br label %154
	j	.L0_154
# 209:
.L0_209:
# br label %210
	j	.L0_210
# 210:
.L0_210:
# %211 = load i64 , i64* %43
	li	t0,-352
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1696
	add	t0,t0,fp
	sd	t1,0(t0)
# %212 = alloca i64
	li	t0,-2344
	add	t1,t0,fp
	li	t0,-1704
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 1 , i64* %212
	li	t2,1
	li	t0,-1704
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %213 = load i64 , i64* %212
	li	t0,-1704
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1712
	add	t0,t0,fp
	sd	t1,0(t0)
# %214 = add i64 %211 , %213
	li	t0,-1696
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1712
	add	t0,t0,fp
	ld	t2,0(t0)
	add	t1,t1,t2
	li	t0,-1720
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %214 , i64* %43
	li	t0,-1720
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-352
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# br label %146
	j	.L0_146
# 215:
.L0_215:
# br label %216
	j	.L0_216
# 216:
.L0_216:
# %217 = load i64 , i64* %43
	li	t0,-352
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1744
	add	t0,t0,fp
	sd	t1,0(t0)
# %218 = alloca i64
	li	t0,-2352
	add	t1,t0,fp
	li	t0,-1752
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 0 , i64* %218
	li	t2,0
	li	t0,-1752
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %219 = load i64 , i64* %218
	li	t0,-1752
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1760
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %219 , i64* %43
	li	t0,-1760
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-352
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# br label %220
	j	.L0_220
# 220:
.L0_220:
# %221 = load i64 , i64* %43
	li	t0,-352
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1776
	add	t0,t0,fp
	sd	t1,0(t0)
# %222 = load i64 , i64* %3
	li	t0,-32
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1784
	add	t0,t0,fp
	sd	t1,0(t0)
# %223 = icmp slt i64 %221 , %222
# br i1 %223 , label %224 , label %253
	li	t0,-1776
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1784
	add	t0,t0,fp
	ld	t2,0(t0)
	bge	t1,t2,.L0_253
# 224:
.L0_224:
# %225 = load i64 , i64* %44
	li	t0,-360
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1808
	add	t0,t0,fp
	sd	t1,0(t0)
# %226 = alloca i64
	li	t0,-2360
	add	t1,t0,fp
	li	t0,-1816
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 0 , i64* %226
	li	t2,0
	li	t0,-1816
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %227 = load i64 , i64* %226
	li	t0,-1816
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1824
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %227 , i64* %44
	li	t0,-1824
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-360
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# br label %228
	j	.L0_228
# 228:
.L0_228:
# %229 = load i64 , i64* %44
	li	t0,-360
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1840
	add	t0,t0,fp
	sd	t1,0(t0)
# %230 = load i64 , i64* %6
	li	t0,-56
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1848
	add	t0,t0,fp
	sd	t1,0(t0)
# %231 = icmp slt i64 %229 , %230
# br i1 %231 , label %232 , label %245
	li	t0,-1840
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1848
	add	t0,t0,fp
	ld	t2,0(t0)
	bge	t1,t2,.L0_245
# 232:
.L0_232:
# %233 = load i64* , i64** %27
	li	t0,-224
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1872
	add	t0,t0,fp
	sd	t1,0(t0)
# %234 = load i64 , i64* %43
	li	t0,-352
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1880
	add	t0,t0,fp
	sd	t1,0(t0)
# %235 = mul i64 %234 , %230
	li	t0,-1880
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1848
	add	t0,t0,fp
	ld	t2,0(t0)
	mul	t1,t1,t2
	li	t0,-1888
	add	t0,t0,fp
	sd	t1,0(t0)
# %236 = add i64 %235 , %229
	li	t0,-1888
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1840
	add	t0,t0,fp
	ld	t2,0(t0)
	add	t1,t1,t2
	li	t0,-1896
	add	t0,t0,fp
	sd	t1,0(t0)
# %237 = getelementptr inbounds i64 , i64* %233 , i64 %236
	li	t0,-1872
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1896
	add	t0,t0,fp
	ld	t2,0(t0)
	slli	t2,t2,3
	add	t1,t1,t2
	li	t0,-1904
	add	t0,t0,fp
	sd	t1,0(t0)
# %238 = load i64 , i64* %237
	li	t0,-1904
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1912
	add	t0,t0,fp
	sd	t1,0(t0)
# %239 = getelementptr inbounds [5 x i8] , [5 x i8]* @.7 , i64 0, i64 0
	lla	t1,.LC7
	li	t0,-1920
	add	t0,t0,fp
	sd	t1,0(t0)
# %240 = call i64 (i8*, ...) @printf (i8* %239 , i64 %238)
	li	t0,-1920
	add	t0,t0,fp
	ld	a0,0(t0)
	li	t0,-1912
	add	t0,t0,fp
	ld	a1,0(t0)
	call	printf@plt
	li	t0,-1928
	add	t0,t0,fp
	sd	a0,0(t0)
# %241 = alloca i64
	li	t0,-2368
	add	t1,t0,fp
	li	t0,-1936
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 1 , i64* %241
	li	t2,1
	li	t0,-1936
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %242 = load i64 , i64* %241
	li	t0,-1936
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1944
	add	t0,t0,fp
	sd	t1,0(t0)
# %243 = add i64 %229 , %242
	li	t0,-1840
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-1944
	add	t0,t0,fp
	ld	t2,0(t0)
	add	t1,t1,t2
	li	t0,-1952
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %243 , i64* %44
	li	t0,-1952
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-360
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# br label %228
	j	.L0_228
# 244:
.L0_244:
# br label %245
	j	.L0_245
# 245:
.L0_245:
# %246 = getelementptr inbounds [2 x i8] , [2 x i8]* @.8 , i64 0, i64 0
	lla	t1,.LC8
	li	t0,-1976
	add	t0,t0,fp
	sd	t1,0(t0)
# %247 = call i64 (i8*, ...) @printf (i8* %246)
	li	t0,-1976
	add	t0,t0,fp
	ld	a0,0(t0)
	call	printf@plt
	li	t0,-1984
	add	t0,t0,fp
	sd	a0,0(t0)
# %248 = load i64 , i64* %43
	li	t0,-352
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-1992
	add	t0,t0,fp
	sd	t1,0(t0)
# %249 = alloca i64
	li	t0,-2376
	add	t1,t0,fp
	li	t0,-2000
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 1 , i64* %249
	li	t2,1
	li	t0,-2000
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %250 = load i64 , i64* %249
	li	t0,-2000
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-2008
	add	t0,t0,fp
	sd	t1,0(t0)
# %251 = add i64 %248 , %250
	li	t0,-1992
	add	t0,t0,fp
	ld	t1,0(t0)
	li	t0,-2008
	add	t0,t0,fp
	ld	t2,0(t0)
	add	t1,t1,t2
	li	t0,-2016
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 %251 , i64* %43
	li	t0,-2016
	add	t0,t0,fp
	ld	t2,0(t0)
	li	t0,-352
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# br label %220
	j	.L0_220
# 252:
.L0_252:
# br label %253
	j	.L0_253
# 253:
.L0_253:
# br label %254
	j	.L0_254
# 254:
.L0_254:
# %255 = alloca i64
	li	t0,-2384
	add	t1,t0,fp
	li	t0,-2048
	add	t0,t0,fp
	sd	t1,0(t0)
# store i64 0 , i64* %255
	li	t2,0
	li	t0,-2048
	add	t0,t0,fp
	ld	t1,0(t0)
	sd	t2,0(t1)
# %256 = load i64 , i64* %255
	li	t0,-2048
	add	t0,t0,fp
	ld	t1,0(t0)
	ld	t1,0(t1)
	li	t0,-2056
	add	t0,t0,fp
	sd	t1,0(t0)
# ret i64 %256
	li	t0,-2056
	add	t0,t0,fp
	ld	a0,0(t0)
	li	t0,2384
	add	sp,sp,t0
	ld	ra,0(sp)
	ld	fp,8(sp)
	add	sp,sp,16
	ret
	.size	main, .-main
	.section	.rodata
	.align	3
.LC0:
	.string	"%lld"
	.align	3
.LC1:
	.string	"%lld"
	.align	3
.LC2:
	.string	"%lld"
	.align	3
.LC3:
	.string	"%lld"
	.align	3
.LC4:
	.string	"%lld"
	.align	3
.LC5:
	.string	"%lld"
	.align	3
.LC6:
	.string	"Incompatible Dimensions\n"
	.align	3
.LC7:
	.string	"%10d"
	.align	3
.LC8:
	.string	"\n"
	.section	.note.GNU-stack,"",@progbits
