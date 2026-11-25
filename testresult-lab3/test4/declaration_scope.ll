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
@extra = global i32 2
@value = global i32 7

; Function Definitions
define i32 @from_global()
{
Block0:
	%reg_1 = load i32, ptr @value
	ret i32 %reg_1
}

define i32 @main()
{
Block0:
	%reg_11 = alloca i32
	%reg_7 = alloca [3 x i32]
	%reg_3 = alloca i32
	%reg_1 = alloca i32
	%reg_2 = add i32 5, 0
	store i32 %reg_2, ptr %reg_1
	%reg_4 = load i32, ptr @extra
	%reg_5 = add i32 1, 0
	%reg_6 = add i32 %reg_4, %reg_5
	store i32 %reg_6, ptr %reg_3
	%reg_8 = add i32 2, 0
	%reg_9 = getelementptr [3 x i32], ptr %reg_7, i32 0, i32 %reg_8
	%reg_10 = load i32, ptr %reg_1
	store i32 %reg_10, ptr %reg_9
	%reg_12 = add i32 2, 0
	store i32 %reg_12, ptr %reg_11
	%reg_13 = add i32 0, 0
	%reg_14 = getelementptr [3 x i32], ptr %reg_7, i32 0, i32 %reg_13
	%reg_15 = load i32, ptr %reg_11
	store i32 %reg_15, ptr %reg_14
	%reg_16 = add i32 0, 0
	%reg_17 = getelementptr [3 x i32], ptr %reg_7, i32 0, i32 %reg_16
	%reg_18 = load i32, ptr %reg_17
	%reg_19 = add i32 2, 0
	%reg_20 = getelementptr [3 x i32], ptr %reg_7, i32 0, i32 %reg_19
	%reg_21 = load i32, ptr %reg_20
	%reg_22 = mul i32 %reg_18, %reg_21
	%reg_23 = load i32, ptr %reg_1
	%reg_24 = add i32 %reg_22, %reg_23
	%reg_25 = call i32 @from_global()
	%reg_26 = add i32 %reg_24, %reg_25
	ret i32 %reg_26
}
