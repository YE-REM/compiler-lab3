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
@g = global i32 4

; Function Definitions
define i32 @f(i32 %reg_1, i32 %reg_2)
{
Block0:
	%reg_5 = alloca i32
	%reg_4 = alloca i32
	%reg_3 = alloca i32
	store i32 %reg_1, ptr %reg_3
	store i32 %reg_2, ptr %reg_4
	%reg_6 = load i32, ptr %reg_3
	%reg_7 = load i32, ptr %reg_4
	%reg_8 = mul i32 %reg_6, %reg_7
	store i32 %reg_8, ptr %reg_5
	%reg_9 = load i32, ptr %reg_5
	%reg_10 = load i32, ptr @g
	%reg_11 = add i32 %reg_9, %reg_10
	store i32 %reg_11, ptr %reg_5
	%reg_12 = load i32, ptr %reg_5
	%reg_13 = add i32 2, 0
	%reg_14 = sdiv i32 %reg_12, %reg_13
	ret i32 %reg_14
}

define i32 @main()
{
Block0:
	%reg_1 = alloca i32
	%reg_2 = add i32 6, 0
	%reg_3 = add i32 5, 0
	%reg_4 = call i32 @f(i32 %reg_2, i32 %reg_3)
	store i32 %reg_4, ptr %reg_1
	%reg_5 = load i32, ptr %reg_1
	call void @putint(i32 %reg_5)
	%reg_6 = add i32 10, 0
	call void @putch(i32 %reg_6)
	%reg_7 = load i32, ptr %reg_1
	ret i32 %reg_7
}
