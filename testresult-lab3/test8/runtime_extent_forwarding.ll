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
define void @twice(ptr %reg_1, i32 %reg_2)
{
Block0:
	%reg_16 = alloca i32
	%reg_7 = alloca i32
	%reg_3 = getelementptr i32, ptr %reg_1, i32 0
	%reg_4 = getelementptr i32, ptr %reg_1, i32 0
	%reg_5 = add i32 2, 0
	%reg_6 = alloca i32, i32 %reg_2
	store i32 0, ptr %reg_7
	br label %Block1
Block1:
	%reg_8 = load i32, ptr %reg_7
	%reg_9 = icmp slt i32 %reg_8, %reg_2
	br i1 %reg_9, label %Block2, label %Block3
Block2:
	%reg_10 = getelementptr i32, ptr %reg_4, i32 %reg_8
	%reg_11 = load i32, ptr %reg_10
	%reg_12 = mul i32 %reg_11, %reg_5
	%reg_13 = getelementptr i32, ptr %reg_6, i32 %reg_8
	store i32 %reg_12, ptr %reg_13
	%reg_14 = add i32 1, %reg_8
	store i32 %reg_14, ptr %reg_7
	br label %Block1
Block3:
	%reg_15 = getelementptr i32, ptr %reg_6, i32 0
	store i32 0, ptr %reg_16
	br label %Block4
Block4:
	%reg_17 = load i32, ptr %reg_16
	%reg_18 = icmp slt i32 %reg_17, %reg_2
	br i1 %reg_18, label %Block5, label %Block6
Block5:
	%reg_19 = getelementptr i32, ptr %reg_15, i32 %reg_17
	%reg_20 = load i32, ptr %reg_19
	%reg_21 = getelementptr i32, ptr %reg_3, i32 %reg_17
	store i32 %reg_20, ptr %reg_21
	%reg_22 = add i32 1, %reg_17
	store i32 %reg_22, ptr %reg_16
	br label %Block4
Block6:
	%reg_23 = getelementptr i32, ptr %reg_3, i32 0
	ret void
}

define void @forward(ptr %reg_1, i32 %reg_2)
{
Block0:
	%reg_3 = getelementptr i32, ptr %reg_1, i32 0
	call void @twice(ptr %reg_3, i32 %reg_2)
	ret void
}

define i32 @main()
{
Block0:
	%reg_7 = alloca [3 x i32]
	%reg_1 = alloca [2 x i32]
	%reg_2 = getelementptr [2 x i32], ptr %reg_1, i32 0, i32 0
	call void @llvm.memset.p0.i32(ptr %reg_2, i8 0, i32 8, i1 0)
	%reg_3 = add i32 2, 0
	%reg_4 = getelementptr i32, ptr %reg_2, i32 0
	store i32 %reg_3, ptr %reg_4
	%reg_5 = add i32 4, 0
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
	call void @forward(ptr %reg_15, i32 2)
	%reg_16 = getelementptr [3 x i32], ptr %reg_7, i32 0, i32 0
	call void @forward(ptr %reg_16, i32 3)
	%reg_17 = add i32 1, 0
	%reg_18 = getelementptr [2 x i32], ptr %reg_1, i32 0, i32 %reg_17
	%reg_19 = load i32, ptr %reg_18
	%reg_20 = add i32 2, 0
	%reg_21 = getelementptr [3 x i32], ptr %reg_7, i32 0, i32 %reg_20
	%reg_22 = load i32, ptr %reg_21
	%reg_23 = add i32 %reg_19, %reg_22
	ret i32 %reg_23
}
