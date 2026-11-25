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
@a = global [50000000 x i32] zeroinitializer
@b = global [50000000 x i32] zeroinitializer
@n = global i32 2

; Function Definitions
define i32 @main()
{
Block0:
	%reg_1 = alloca [2 x i32]
	%reg_2 = add i32 5, 0
	%reg_3 = getelementptr [50000000 x i32], ptr @a, i32 0, i32 %reg_2
	%reg_4 = add i32 3, 0
	store i32 %reg_4, ptr %reg_3
	%reg_5 = add i32 1, 0
	%reg_6 = getelementptr [2 x i32], ptr %reg_1, i32 0, i32 %reg_5
	%reg_7 = add i32 5, 0
	%reg_8 = getelementptr [50000000 x i32], ptr @a, i32 0, i32 %reg_7
	%reg_9 = load i32, ptr %reg_8
	store i32 %reg_9, ptr %reg_6
	%reg_10 = add i32 1, 0
	%reg_11 = getelementptr [2 x i32], ptr %reg_1, i32 0, i32 %reg_10
	%reg_12 = load i32, ptr %reg_11
	%reg_13 = add i32 5, 0
	%reg_14 = getelementptr [50000000 x i32], ptr @b, i32 0, i32 %reg_13
	%reg_15 = load i32, ptr %reg_14
	%reg_16 = add i32 %reg_12, %reg_15
	ret i32 %reg_16
}
