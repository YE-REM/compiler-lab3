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

; Global Variable Declarations
@cols = global i32 3
@g = global [2 x [3 x i32]] zeroinitializer

; Function Definitions
define i32 @sum(ptr %reg_1, i32 %reg_2)
{
Block0:
	%reg_3 = alloca i32
	store i32 %reg_2, ptr %reg_3
	%reg_4 = add i32 0, 0
	%reg_5 = add i32 0, 0
	%reg_6 = getelementptr [3 x i32], ptr %reg_1, i32 %reg_4, i32 %reg_5
	%reg_7 = load i32, ptr %reg_6
	%reg_8 = add i32 1, 0
	%reg_9 = add i32 2, 0
	%reg_10 = getelementptr [3 x i32], ptr %reg_1, i32 %reg_8, i32 %reg_9
	%reg_11 = load i32, ptr %reg_10
	%reg_12 = add i32 %reg_7, %reg_11
	%reg_13 = load i32, ptr %reg_3
	%reg_14 = add i32 %reg_12, %reg_13
	ret i32 %reg_14
}

define i32 @main()
{
Block0:
	%reg_3 = alloca [2 x [3 x i32]]
	%reg_1 = alloca i32
	%reg_2 = add i32 4, 0
	store i32 %reg_2, ptr %reg_1
	%reg_4 = add i32 0, 0
	%reg_5 = add i32 0, 0
	%reg_6 = getelementptr [2 x [3 x i32]], ptr %reg_3, i32 0, i32 %reg_4, i32 %reg_5
	%reg_7 = add i32 5, 0
	store i32 %reg_7, ptr %reg_6
	%reg_8 = add i32 1, 0
	%reg_9 = add i32 2, 0
	%reg_10 = getelementptr [2 x [3 x i32]], ptr %reg_3, i32 0, i32 %reg_8, i32 %reg_9
	%reg_11 = add i32 7, 0
	store i32 %reg_11, ptr %reg_10
	%reg_12 = add i32 1, 0
	%reg_13 = add i32 2, 0
	%reg_14 = getelementptr [2 x [3 x i32]], ptr @g, i32 0, i32 %reg_12, i32 %reg_13
	%reg_15 = getelementptr [2 x [3 x i32]], ptr %reg_3, i32 0, i32 0
	%reg_16 = load i32, ptr %reg_1
	%reg_17 = call i32 @sum(ptr %reg_15, i32 %reg_16)
	store i32 %reg_17, ptr %reg_14
	%reg_18 = add i32 1, 0
	%reg_19 = add i32 2, 0
	%reg_20 = getelementptr [2 x [3 x i32]], ptr @g, i32 0, i32 %reg_18, i32 %reg_19
	%reg_21 = load i32, ptr %reg_20
	ret i32 %reg_21
}
