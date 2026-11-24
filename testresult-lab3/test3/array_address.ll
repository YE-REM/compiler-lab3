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


; Function Definitions
define i32 @f(ptr %reg_1)
{
Block0:
	%reg_2 = add i32 1, 0
	%reg_3 = add i32 2, 0
	%reg_4 = getelementptr [3 x i32], ptr %reg_1, i32 %reg_2, i32 %reg_3
	%reg_5 = load i32, ptr %reg_4
	ret i32 %reg_5
}

define i32 @row(ptr %reg_1)
{
Block0:
	%reg_2 = add i32 1, 0
	%reg_3 = getelementptr i32, ptr %reg_1, i32 %reg_2
	%reg_4 = load i32, ptr %reg_3
	ret i32 %reg_4
}

define i32 @main()
{
Block0:
	%reg_1 = alloca [2 x [3 x i32]]
	%reg_2 = add i32 1, 0
	%reg_3 = add i32 2, 0
	%reg_4 = getelementptr [2 x [3 x i32]], ptr %reg_1, i32 0, i32 %reg_2, i32 %reg_3
	%reg_5 = add i32 7, 0
	store i32 %reg_5, ptr %reg_4
	%reg_6 = add i32 1, 0
	%reg_7 = add i32 1, 0
	%reg_8 = getelementptr [2 x [3 x i32]], ptr %reg_1, i32 0, i32 %reg_6, i32 %reg_7
	%reg_9 = add i32 9, 0
	store i32 %reg_9, ptr %reg_8
	%reg_10 = getelementptr [2 x [3 x i32]], ptr %reg_1, i32 0, i32 0
	%reg_11 = call i32 @f(ptr %reg_10)
	%reg_12 = add i32 1, 0
	%reg_13 = getelementptr [2 x [3 x i32]], ptr %reg_1, i32 0, i32 %reg_12, i32 0
	%reg_14 = call i32 @row(ptr %reg_13)
	%reg_15 = add i32 %reg_11, %reg_14
	ret i32 %reg_15
}
