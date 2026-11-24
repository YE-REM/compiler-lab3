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
@g = global [2 x [3 x i32]] zeroinitializer

; Function Definitions
define i32 @row(ptr %reg_1, i32 %reg_2)
{
Block0:
	%reg_3 = alloca i32
	store i32 %reg_2, ptr %reg_3
	%reg_4 = load i32, ptr %reg_3
	%reg_5 = getelementptr i32, ptr %reg_1, i32 %reg_4
	%reg_6 = load i32, ptr %reg_5
	ret i32 %reg_6
}

define i32 @matrix(ptr %reg_1, i32 %reg_2, i32 %reg_3)
{
Block0:
	%reg_5 = alloca i32
	%reg_4 = alloca i32
	store i32 %reg_2, ptr %reg_4
	store i32 %reg_3, ptr %reg_5
	%reg_6 = load i32, ptr %reg_4
	%reg_7 = load i32, ptr %reg_5
	%reg_8 = getelementptr [3 x i32], ptr %reg_1, i32 %reg_6, i32 %reg_7
	%reg_9 = add i32 11, 0
	store i32 %reg_9, ptr %reg_8
	%reg_10 = load i32, ptr %reg_4
	%reg_11 = getelementptr [3 x i32], ptr %reg_1, i32 %reg_10, i32 0
	%reg_12 = load i32, ptr %reg_5
	%reg_13 = call i32 @row(ptr %reg_11, i32 %reg_12)
	ret i32 %reg_13
}

define i32 @main()
{
Block0:
	%reg_3 = alloca i32
	%reg_1 = alloca i32
	%reg_2 = add i32 1, 0
	store i32 %reg_2, ptr %reg_1
	%reg_4 = add i32 2, 0
	store i32 %reg_4, ptr %reg_3
	%reg_5 = getelementptr [2 x [3 x i32]], ptr @g, i32 0, i32 0
	%reg_6 = load i32, ptr %reg_1
	%reg_7 = load i32, ptr %reg_3
	%reg_8 = call i32 @matrix(ptr %reg_5, i32 %reg_6, i32 %reg_7)
	%reg_9 = load i32, ptr %reg_1
	%reg_10 = load i32, ptr %reg_3
	%reg_11 = getelementptr [2 x [3 x i32]], ptr @g, i32 0, i32 %reg_9, i32 %reg_10
	%reg_12 = load i32, ptr %reg_11
	%reg_13 = add i32 %reg_8, %reg_12
	ret i32 %reg_13
}
