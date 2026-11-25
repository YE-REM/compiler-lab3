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
@a = global [2 x [3 x i32]] [[3 x i32] [i32 1,i32 6,i32 7],[3 x i32] zeroinitializer]
@ticks = global i32 0

; Function Definitions
define i32 @six()
{
Block0:
	%reg_1 = load i32, ptr @ticks
	%reg_2 = add i32 1, 0
	%reg_3 = add i32 %reg_1, %reg_2
	store i32 %reg_3, ptr @ticks
	%reg_4 = add i32 6, 0
	ret i32 %reg_4
}

define i32 @main()
{
Block0:
	%reg_1 = alloca [2 x [3 x i32]]
	%reg_2 = getelementptr [2 x [3 x i32]], ptr %reg_1, i32 0, i32 0, i32 0
	call void @llvm.memset.p0.i32(ptr %reg_2, i8 0, i32 24, i1 0)
	%reg_3 = add i32 1, 0
	%reg_4 = getelementptr i32, ptr %reg_2, i32 0
	store i32 %reg_3, ptr %reg_4
	%reg_5 = call i32 @six()
	%reg_6 = getelementptr i32, ptr %reg_2, i32 1
	store i32 %reg_5, ptr %reg_6
	%reg_7 = add i32 7, 0
	%reg_8 = getelementptr i32, ptr %reg_2, i32 2
	store i32 %reg_7, ptr %reg_8
	%reg_9 = add i32 0, 0
	%reg_10 = add i32 1, 0
	%reg_11 = getelementptr [2 x [3 x i32]], ptr @a, i32 0, i32 %reg_9, i32 %reg_10
	%reg_12 = load i32, ptr %reg_11
	%reg_13 = add i32 6, 0
	%reg_14 = icmp ne i32 %reg_12, %reg_13
	br i1 %reg_14, label %Block1, label %Block4
Block1:
	%reg_27 = add i32 11, 0
	ret i32 %reg_27
Block2:
	%reg_28 = add i32 0, 0
	%reg_29 = add i32 1, 0
	%reg_30 = getelementptr [2 x [3 x i32]], ptr %reg_1, i32 0, i32 %reg_28, i32 %reg_29
	%reg_31 = load i32, ptr %reg_30
	%reg_32 = add i32 6, 0
	%reg_33 = icmp ne i32 %reg_31, %reg_32
	br i1 %reg_33, label %Block5, label %Block8
Block3:
	%reg_21 = add i32 1, 0
	%reg_22 = add i32 0, 0
	%reg_23 = getelementptr [2 x [3 x i32]], ptr @a, i32 0, i32 %reg_21, i32 %reg_22
	%reg_24 = load i32, ptr %reg_23
	%reg_25 = add i32 0, 0
	%reg_26 = icmp ne i32 %reg_24, %reg_25
	br i1 %reg_26, label %Block1, label %Block2
Block4:
	%reg_15 = add i32 0, 0
	%reg_16 = add i32 2, 0
	%reg_17 = getelementptr [2 x [3 x i32]], ptr @a, i32 0, i32 %reg_15, i32 %reg_16
	%reg_18 = load i32, ptr %reg_17
	%reg_19 = add i32 7, 0
	%reg_20 = icmp ne i32 %reg_18, %reg_19
	br i1 %reg_20, label %Block1, label %Block3
Block5:
	%reg_46 = add i32 12, 0
	ret i32 %reg_46
Block6:
	%reg_47 = load i32, ptr @ticks
	ret i32 %reg_47
Block7:
	%reg_40 = add i32 1, 0
	%reg_41 = add i32 0, 0
	%reg_42 = getelementptr [2 x [3 x i32]], ptr %reg_1, i32 0, i32 %reg_40, i32 %reg_41
	%reg_43 = load i32, ptr %reg_42
	%reg_44 = add i32 0, 0
	%reg_45 = icmp ne i32 %reg_43, %reg_44
	br i1 %reg_45, label %Block5, label %Block6
Block8:
	%reg_34 = add i32 0, 0
	%reg_35 = add i32 2, 0
	%reg_36 = getelementptr [2 x [3 x i32]], ptr %reg_1, i32 0, i32 %reg_34, i32 %reg_35
	%reg_37 = load i32, ptr %reg_36
	%reg_38 = add i32 7, 0
	%reg_39 = icmp ne i32 %reg_37, %reg_38
	br i1 %reg_39, label %Block5, label %Block7
}
