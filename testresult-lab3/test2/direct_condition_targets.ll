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
define i32 @hit(i32 %reg_1)
{
Block0:
	%reg_2 = alloca i32
	store i32 %reg_1, ptr %reg_2
	%reg_3 = load i32, ptr @calls
	%reg_4 = add i32 1, 0
	%reg_5 = add i32 %reg_3, %reg_4
	store i32 %reg_5, ptr @calls
	%reg_6 = load i32, ptr %reg_2
	ret i32 %reg_6
}

define i32 @main()
{
Block0:
	%reg_25 = alloca i32
	%reg_1 = alloca i32
	%reg_2 = add i32 0, 0
	store i32 %reg_2, ptr %reg_1
	%reg_3 = add i32 0, 0
	%reg_4 = icmp ne i32 %reg_3, 0
	br i1 %reg_4, label %Block4, label %Block3
Block1:
	%reg_13 = load i32, ptr %reg_1
	%reg_14 = add i32 1, 0
	%reg_15 = add i32 %reg_13, %reg_14
	store i32 %reg_15, ptr %reg_1
	br label %Block2
Block2:
	br label %Block6
Block3:
	%reg_8 = add i32 1, 0
	%reg_9 = icmp ne i32 %reg_8, 0
	br i1 %reg_9, label %Block1, label %Block5
Block4:
	%reg_5 = add i32 1, 0
	%reg_6 = call i32 @hit(i32 %reg_5)
	%reg_7 = icmp ne i32 %reg_6, 0
	br i1 %reg_7, label %Block1, label %Block3
Block5:
	%reg_10 = add i32 0, 0
	%reg_11 = call i32 @hit(i32 %reg_10)
	%reg_12 = icmp ne i32 %reg_11, 0
	br i1 %reg_12, label %Block1, label %Block2
Block6:
	%reg_16 = load i32, ptr %reg_1
	%reg_17 = add i32 3, 0
	%reg_18 = icmp slt i32 %reg_16, %reg_17
	br i1 %reg_18, label %Block9, label %Block8
Block7:
	%reg_22 = load i32, ptr %reg_1
	%reg_23 = add i32 1, 0
	%reg_24 = add i32 %reg_22, %reg_23
	store i32 %reg_24, ptr %reg_1
	br label %Block6
Block8:
	%reg_26 = add i32 0, 0
	store i32 %reg_26, ptr %reg_25
	br label %Block10
Block9:
	%reg_19 = add i32 1, 0
	%reg_20 = call i32 @hit(i32 %reg_19)
	%reg_21 = icmp ne i32 %reg_20, 0
	br i1 %reg_21, label %Block7, label %Block8
Block10:
	%reg_27 = load i32, ptr %reg_25
	%reg_28 = add i32 1, 0
	%reg_29 = icmp slt i32 %reg_27, %reg_28
	br i1 %reg_29, label %Block14, label %Block13
Block11:
	%reg_33 = load i32, ptr %reg_1
	%reg_34 = add i32 1, 0
	%reg_35 = add i32 %reg_33, %reg_34
	store i32 %reg_35, ptr %reg_1
	br label %Block12
Block12:
	%reg_36 = load i32, ptr %reg_25
	%reg_37 = add i32 1, 0
	%reg_38 = add i32 %reg_36, %reg_37
	store i32 %reg_38, ptr %reg_25
	br label %Block10
Block13:
	%reg_39 = add i32 10, 0
	%reg_40 = load i32, ptr %reg_1
	%reg_41 = mul i32 %reg_39, %reg_40
	%reg_42 = load i32, ptr @calls
	%reg_43 = add i32 %reg_41, %reg_42
	ret i32 %reg_43
Block14:
	%reg_30 = add i32 1, 0
	%reg_31 = call i32 @hit(i32 %reg_30)
	%reg_32 = icmp ne i32 %reg_31, 0
	br i1 %reg_32, label %Block11, label %Block13
}
