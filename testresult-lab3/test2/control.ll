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
	%reg_3 = alloca i32
	%reg_1 = alloca i32
	%reg_2 = add i32 0, 0
	store i32 %reg_2, ptr %reg_1
	%reg_4 = add i32 0, 0
	store i32 %reg_4, ptr %reg_3
	br label %Block1
Block1:
	%reg_5 = load i32, ptr %reg_1
	%reg_6 = add i32 5, 0
	%reg_7 = icmp slt i32 %reg_5, %reg_6
	br i1 %reg_7, label %Block2, label %Block3
Block2:
	%reg_8 = load i32, ptr %reg_1
	%reg_9 = add i32 1, 0
	%reg_10 = add i32 %reg_8, %reg_9
	store i32 %reg_10, ptr %reg_1
	%reg_11 = load i32, ptr %reg_1
	%reg_12 = add i32 2, 0
	%reg_13 = icmp eq i32 %reg_11, %reg_12
	br i1 %reg_13, label %Block4, label %Block5
Block3:
	%reg_20 = add i32 0, 0
	%reg_21 = icmp ne i32 %reg_20, 0
	br i1 %reg_21, label %Block10, label %Block9
Block4:
	br label %Block1
Block5:
	%reg_14 = load i32, ptr %reg_1
	%reg_15 = add i32 4, 0
	%reg_16 = icmp eq i32 %reg_14, %reg_15
	br i1 %reg_16, label %Block6, label %Block7
Block6:
	br label %Block3
Block7:
	%reg_17 = load i32, ptr %reg_3
	%reg_18 = load i32, ptr %reg_1
	%reg_19 = add i32 %reg_17, %reg_18
	store i32 %reg_19, ptr %reg_3
	br label %Block1
Block8:
	%reg_24 = add i32 1, 0
	ret i32 %reg_24
Block9:
	%reg_25 = add i32 1, 0
	%reg_26 = icmp ne i32 %reg_25, 0
	br i1 %reg_26, label %Block11, label %Block13
Block10:
	%reg_22 = call i32 @bump()
	%reg_23 = icmp ne i32 %reg_22, 0
	br i1 %reg_23, label %Block8, label %Block9
Block11:
	%reg_29 = load i32, ptr %reg_3
	ret i32 %reg_29
Block12:
	%reg_30 = add i32 0, 0
	ret i32 %reg_30
Block13:
	%reg_27 = call i32 @bump()
	%reg_28 = icmp ne i32 %reg_27, 0
	br i1 %reg_28, label %Block11, label %Block12
}
