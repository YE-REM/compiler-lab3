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
declare void @llvm.trap()

; Global Variable Declarations


; Function Definitions
define void @add_into(ptr %reg_1, i32 %reg_2, ptr %reg_3, i32 %reg_4)
{
Block0:
	%reg_21 = alloca i32
	%reg_10 = alloca i32
	%reg_5 = getelementptr i32, ptr %reg_1, i32 0
	%reg_6 = getelementptr i32, ptr %reg_1, i32 0
	%reg_7 = getelementptr i32, ptr %reg_3, i32 0
	%reg_8 = icmp eq i32 %reg_2, %reg_4
	%reg_9 = alloca i32, i32 %reg_2
	br i1 %reg_8, label %Block1, label %Block2
Block1:
	store i32 0, ptr %reg_10
	br label %Block3
Block2:
	call void @llvm.trap()
	br label %Block1
Block3:
	%reg_11 = load i32, ptr %reg_10
	%reg_12 = icmp slt i32 %reg_11, %reg_2
	br i1 %reg_12, label %Block4, label %Block5
Block4:
	%reg_13 = getelementptr i32, ptr %reg_6, i32 %reg_11
	%reg_14 = load i32, ptr %reg_13
	%reg_15 = getelementptr i32, ptr %reg_7, i32 %reg_11
	%reg_16 = load i32, ptr %reg_15
	%reg_17 = add i32 %reg_14, %reg_16
	%reg_18 = getelementptr i32, ptr %reg_9, i32 %reg_11
	store i32 %reg_17, ptr %reg_18
	%reg_19 = add i32 1, %reg_11
	store i32 %reg_19, ptr %reg_10
	br label %Block3
Block5:
	%reg_20 = getelementptr i32, ptr %reg_9, i32 0
	store i32 0, ptr %reg_21
	br label %Block6
Block6:
	%reg_22 = load i32, ptr %reg_21
	%reg_23 = icmp slt i32 %reg_22, %reg_2
	br i1 %reg_23, label %Block7, label %Block8
Block7:
	%reg_24 = getelementptr i32, ptr %reg_20, i32 %reg_22
	%reg_25 = load i32, ptr %reg_24
	%reg_26 = getelementptr i32, ptr %reg_5, i32 %reg_22
	store i32 %reg_25, ptr %reg_26
	%reg_27 = add i32 1, %reg_22
	store i32 %reg_27, ptr %reg_21
	br label %Block6
Block8:
	%reg_28 = getelementptr i32, ptr %reg_5, i32 0
	ret void
}

define i32 @main()
{
Block0:
	%reg_7 = alloca [3 x i32]
	%reg_1 = alloca [2 x i32]
	%reg_2 = getelementptr [2 x i32], ptr %reg_1, i32 0, i32 0
	call void @llvm.memset.p0.i32(ptr %reg_2, i8 0, i32 8, i1 0)
	%reg_3 = add i32 1, 0
	%reg_4 = getelementptr i32, ptr %reg_2, i32 0
	store i32 %reg_3, ptr %reg_4
	%reg_5 = add i32 2, 0
	%reg_6 = getelementptr i32, ptr %reg_2, i32 1
	store i32 %reg_5, ptr %reg_6
	%reg_8 = getelementptr [3 x i32], ptr %reg_7, i32 0, i32 0
	call void @llvm.memset.p0.i32(ptr %reg_8, i8 0, i32 12, i1 0)
	%reg_9 = add i32 1, 0
	%reg_10 = getelementptr i32, ptr %reg_8, i32 0
	store i32 %reg_9, ptr %reg_10
	%reg_11 = add i32 2, 0
	%reg_12 = getelementptr i32, ptr %reg_8, i32 1
	store i32 %reg_11, ptr %reg_12
	%reg_13 = add i32 3, 0
	%reg_14 = getelementptr i32, ptr %reg_8, i32 2
	store i32 %reg_13, ptr %reg_14
	%reg_15 = getelementptr [2 x i32], ptr %reg_1, i32 0, i32 0
	%reg_16 = getelementptr [3 x i32], ptr %reg_7, i32 0, i32 0
	call void @add_into(ptr %reg_15, i32 2, ptr %reg_16, i32 3)
	%reg_17 = add i32 0, 0
	ret i32 %reg_17
}
