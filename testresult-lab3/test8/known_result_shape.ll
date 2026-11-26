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
define void @add_fixed(ptr %reg_1, ptr %reg_2, i32 %reg_3)
{
Block0:
	%reg_25 = alloca i32
	%reg_14 = alloca i32
	%reg_4 = alloca [2 x i32]
	%reg_5 = getelementptr [2 x i32], ptr %reg_4, i32 0, i32 0
	call void @llvm.memset.p0.i32(ptr %reg_5, i8 0, i32 8, i1 0)
	%reg_6 = add i32 1, 0
	%reg_7 = getelementptr i32, ptr %reg_5, i32 0
	store i32 %reg_6, ptr %reg_7
	%reg_8 = add i32 2, 0
	%reg_9 = getelementptr i32, ptr %reg_5, i32 1
	store i32 %reg_8, ptr %reg_9
	%reg_10 = getelementptr i32, ptr %reg_2, i32 0
	%reg_11 = getelementptr [2 x i32], ptr %reg_4, i32 0, i32 0
	%reg_12 = icmp eq i32 %reg_3, 2
	%reg_13 = alloca i32, i32 2
	br i1 %reg_12, label %Block1, label %Block2
Block1:
	store i32 0, ptr %reg_14
	br label %Block3
Block2:
	call void @llvm.trap()
	br label %Block1
Block3:
	%reg_15 = load i32, ptr %reg_14
	%reg_16 = icmp slt i32 %reg_15, 2
	br i1 %reg_16, label %Block4, label %Block5
Block4:
	%reg_17 = getelementptr i32, ptr %reg_10, i32 %reg_15
	%reg_18 = load i32, ptr %reg_17
	%reg_19 = getelementptr i32, ptr %reg_11, i32 %reg_15
	%reg_20 = load i32, ptr %reg_19
	%reg_21 = add i32 %reg_18, %reg_20
	%reg_22 = getelementptr i32, ptr %reg_13, i32 %reg_15
	store i32 %reg_21, ptr %reg_22
	%reg_23 = add i32 1, %reg_15
	store i32 %reg_23, ptr %reg_14
	br label %Block3
Block5:
	%reg_24 = getelementptr i32, ptr %reg_13, i32 0
	store i32 0, ptr %reg_25
	br label %Block6
Block6:
	%reg_26 = load i32, ptr %reg_25
	%reg_27 = icmp slt i32 %reg_26, 2
	br i1 %reg_27, label %Block7, label %Block8
Block7:
	%reg_28 = getelementptr i32, ptr %reg_24, i32 %reg_26
	%reg_29 = load i32, ptr %reg_28
	%reg_30 = getelementptr i32, ptr %reg_1, i32 %reg_26
	store i32 %reg_29, ptr %reg_30
	%reg_31 = add i32 1, %reg_26
	store i32 %reg_31, ptr %reg_25
	br label %Block6
Block8:
	ret void
}

define i32 @main()
{
Block0:
	%reg_12 = alloca i32
	%reg_10 = alloca [2 x i32]
	%reg_7 = alloca [2 x i32]
	%reg_1 = alloca [2 x i32]
	%reg_2 = getelementptr [2 x i32], ptr %reg_1, i32 0, i32 0
	call void @llvm.memset.p0.i32(ptr %reg_2, i8 0, i32 8, i1 0)
	%reg_3 = add i32 6, 0
	%reg_4 = getelementptr i32, ptr %reg_2, i32 0
	store i32 %reg_3, ptr %reg_4
	%reg_5 = add i32 10, 0
	%reg_6 = getelementptr i32, ptr %reg_2, i32 1
	store i32 %reg_5, ptr %reg_6
	%reg_8 = getelementptr [2 x i32], ptr %reg_7, i32 0, i32 0
	%reg_9 = getelementptr [2 x i32], ptr %reg_1, i32 0, i32 0
	%reg_11 = getelementptr [2 x i32], ptr %reg_10, i32 0, i32 0
	call void @add_fixed(ptr %reg_11, ptr %reg_9, i32 2)
	store i32 0, ptr %reg_12
	br label %Block1
Block1:
	%reg_13 = load i32, ptr %reg_12
	%reg_14 = icmp slt i32 %reg_13, 2
	br i1 %reg_14, label %Block2, label %Block3
Block2:
	%reg_15 = getelementptr i32, ptr %reg_11, i32 %reg_13
	%reg_16 = load i32, ptr %reg_15
	%reg_17 = getelementptr i32, ptr %reg_8, i32 %reg_13
	store i32 %reg_16, ptr %reg_17
	%reg_18 = add i32 1, %reg_13
	store i32 %reg_18, ptr %reg_12
	br label %Block1
Block3:
	%reg_19 = add i32 0, 0
	%reg_20 = getelementptr [2 x i32], ptr %reg_7, i32 0, i32 %reg_19
	%reg_21 = load i32, ptr %reg_20
	%reg_22 = add i32 1, 0
	%reg_23 = getelementptr [2 x i32], ptr %reg_7, i32 0, i32 %reg_22
	%reg_24 = load i32, ptr %reg_23
	%reg_25 = add i32 %reg_21, %reg_24
	ret i32 %reg_25
}
