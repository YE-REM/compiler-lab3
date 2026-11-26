; Function Declarations
declare i32 @getint()
declare i32 @getch()
declare i32 @getarray(ptr)
declare float @getfloat()
declare i32 @getfarray(ptr)
declare void @putint(i32)
declare void @putch(i32)
declare void @putarray(i32, ptr)
declare void @putfloat(float)
declare void @putfarray(i32, ptr)
declare void @_sysy_starttime(i32)
declare void @_sysy_stoptime(i32)
declare void @llvm.memset.p0.i32(ptr, i8, i32, i1)
declare void @llvm.trap()

; Global Variable Declarations


; Function Definitions
define i32 @sum(ptr %reg_1, i32 %reg_2, i32 %reg_3)
{
Block0:
	%reg_7 = alloca i32
	%reg_5 = alloca i32
	%reg_4 = alloca i32
	store i32 %reg_3, ptr %reg_4
	%reg_6 = add i32 0, 0
	store i32 %reg_6, ptr %reg_5
	%reg_8 = add i32 0, 0
	store i32 %reg_8, ptr %reg_7
	br label %Block1
Block1:
	%reg_9 = load i32, ptr %reg_7
	%reg_10 = load i32, ptr %reg_4
	%reg_11 = icmp slt i32 %reg_9, %reg_10
	br i1 %reg_11, label %Block2, label %Block3
Block2:
	%reg_12 = load i32, ptr %reg_5
	%reg_13 = load i32, ptr %reg_7
	%reg_14 = add i32 0, 0
	%reg_15 = getelementptr [2 x i32], ptr %reg_1, i32 %reg_13, i32 %reg_14
	%reg_16 = load i32, ptr %reg_15
	%reg_17 = add i32 %reg_12, %reg_16
	%reg_18 = load i32, ptr %reg_7
	%reg_19 = add i32 1, 0
	%reg_20 = getelementptr [2 x i32], ptr %reg_1, i32 %reg_18, i32 %reg_19
	%reg_21 = load i32, ptr %reg_20
	%reg_22 = add i32 %reg_17, %reg_21
	store i32 %reg_22, ptr %reg_5
	%reg_23 = load i32, ptr %reg_7
	%reg_24 = add i32 1, 0
	%reg_25 = add i32 %reg_23, %reg_24
	store i32 %reg_25, ptr %reg_7
	br label %Block1
Block3:
	%reg_26 = load i32, ptr %reg_5
	ret i32 %reg_26
}

define i32 @main()
{
Block0:
	%reg_1 = alloca [3 x [2 x i32]]
	%reg_2 = getelementptr [3 x [2 x i32]], ptr %reg_1, i32 0, i32 0, i32 0
	call void @llvm.memset.p0.i32(ptr %reg_2, i8 0, i32 24, i1 0)
	%reg_3 = add i32 1, 0
	%reg_4 = getelementptr i32, ptr %reg_2, i32 0
	store i32 %reg_3, ptr %reg_4
	%reg_5 = add i32 2, 0
	%reg_6 = getelementptr i32, ptr %reg_2, i32 1
	store i32 %reg_5, ptr %reg_6
	%reg_7 = add i32 3, 0
	%reg_8 = getelementptr i32, ptr %reg_2, i32 2
	store i32 %reg_7, ptr %reg_8
	%reg_9 = add i32 4, 0
	%reg_10 = getelementptr i32, ptr %reg_2, i32 3
	store i32 %reg_9, ptr %reg_10
	%reg_11 = add i32 5, 0
	%reg_12 = getelementptr i32, ptr %reg_2, i32 4
	store i32 %reg_11, ptr %reg_12
	%reg_13 = add i32 6, 0
	%reg_14 = getelementptr i32, ptr %reg_2, i32 5
	store i32 %reg_13, ptr %reg_14
	%reg_15 = getelementptr [3 x [2 x i32]], ptr %reg_1, i32 0, i32 0
	%reg_16 = add i32 3, 0
	%reg_17 = call i32 @sum(ptr %reg_15, i32 3, i32 %reg_16)
	call void @putint(i32 %reg_17)
	%reg_18 = add i32 10, 0
	call void @putch(i32 %reg_18)
	%reg_19 = add i32 0, 0
	ret i32 %reg_19
}
