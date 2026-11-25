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
define i32 @bump()
{
Block0:
	%reg_1 = add i32 9, 0
	call void @putint(i32 %reg_1)
	%reg_2 = add i32 1, 0
	ret i32 %reg_2
}

define i32 @main()
{
Block0:
	%reg_14 = alloca i1
	%reg_3 = alloca i1
	%reg_1 = alloca i32
	%reg_2 = add i32 1, 0
	store i32 %reg_2, ptr %reg_1
	%reg_4 = add i32 0, 0
	%reg_5 = icmp ne i32 %reg_4, 0
	br i1 %reg_5, label %Block1, label %Block2
Block1:
	%reg_6 = call i32 @bump()
	%reg_7 = icmp ne i32 %reg_6, 0
	store i1 %reg_7, ptr %reg_3
	br label %Block3
Block2:
	store i1 0, ptr %reg_3
	br label %Block3
Block3:
	%reg_8 = load i1, ptr %reg_3
	%reg_9 = zext i1 %reg_8 to i32
	%reg_10 = icmp eq i32 %reg_9, 0
	%reg_11 = add i32 10, 0
	%reg_12 = zext i1 %reg_10 to i32
	%reg_13 = mul i32 %reg_12, %reg_11
	%reg_15 = load i32, ptr %reg_1
	%reg_16 = icmp ne i32 %reg_15, 0
	br i1 %reg_16, label %Block4, label %Block5
Block4:
	%reg_17 = call i32 @bump()
	%reg_18 = icmp ne i32 %reg_17, 0
	store i1 %reg_18, ptr %reg_14
	br label %Block6
Block5:
	store i1 0, ptr %reg_14
	br label %Block6
Block6:
	%reg_19 = load i1, ptr %reg_14
	%reg_20 = add i32 2, 0
	%reg_21 = zext i1 %reg_19 to i32
	%reg_22 = mul i32 %reg_21, %reg_20
	%reg_23 = add i32 %reg_13, %reg_22
	ret i32 %reg_23
}
