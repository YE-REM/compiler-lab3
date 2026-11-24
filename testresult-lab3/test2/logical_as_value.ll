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
@calls = global i32 0

; Function Definitions
define i32 @hit()
{
Block0:
	%reg_1 = load i32, ptr @calls
	%reg_2 = add i32 1, 0
	%reg_3 = add i32 %reg_1, %reg_2
	store i32 %reg_3, ptr @calls
	%reg_4 = add i32 1, 0
	ret i32 %reg_4
}

define i32 @main()
{
Block0:
	%reg_10 = alloca i1
	%reg_9 = alloca i32
	%reg_2 = alloca i1
	%reg_1 = alloca i32
	%reg_3 = add i32 0, 0
	%reg_4 = icmp ne i32 %reg_3, 0
	br i1 %reg_4, label %Block1, label %Block2
Block1:
	store i1 1, ptr %reg_2
	br label %Block3
Block2:
	%reg_5 = call i32 @hit()
	%reg_6 = icmp ne i32 %reg_5, 0
	store i1 %reg_6, ptr %reg_2
	br label %Block3
Block3:
	%reg_7 = load i1, ptr %reg_2
	%reg_8 = zext i1 %reg_7 to i32
	store i32 %reg_8, ptr %reg_1
	%reg_11 = add i32 0, 0
	%reg_12 = icmp ne i32 %reg_11, 0
	br i1 %reg_12, label %Block4, label %Block5
Block4:
	%reg_13 = call i32 @hit()
	%reg_14 = icmp ne i32 %reg_13, 0
	store i1 %reg_14, ptr %reg_10
	br label %Block6
Block5:
	store i1 0, ptr %reg_10
	br label %Block6
Block6:
	%reg_15 = load i1, ptr %reg_10
	%reg_16 = zext i1 %reg_15 to i32
	store i32 %reg_16, ptr %reg_9
	%reg_17 = load i32, ptr %reg_1
	%reg_18 = load i32, ptr %reg_9
	%reg_19 = add i32 %reg_17, %reg_18
	%reg_20 = load i32, ptr @calls
	%reg_21 = add i32 %reg_19, %reg_20
	ret i32 %reg_21
}
