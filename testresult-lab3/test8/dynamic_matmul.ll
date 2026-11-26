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
define i32 @product(ptr %reg_1, i32 %reg_2, ptr %reg_3, i32 %reg_4)
{
Block0:
	%reg_42 = alloca i32
	%reg_15 = alloca i32
	%reg_14 = alloca i32
	%reg_13 = alloca i32
	%reg_12 = alloca i32
	%reg_5 = alloca [2 x [2 x i32]]
	%reg_6 = getelementptr [2 x [2 x i32]], ptr %reg_5, i32 0, i32 0, i32 0
	%reg_7 = getelementptr [3 x i32], ptr %reg_1, i32 0
	%reg_8 = getelementptr [2 x i32], ptr %reg_3, i32 0
	%reg_9 = icmp eq i32 3, %reg_4
	%reg_10 = mul i32 %reg_2, 2
	%reg_11 = alloca i32, i32 %reg_10
	br i1 %reg_9, label %Block1, label %Block2
Block1:
	store i32 0, ptr %reg_12
	br label %Block3
Block2:
	call void @llvm.trap()
	br label %Block1
Block3:
	%reg_16 = load i32, ptr %reg_12
	%reg_17 = icmp slt i32 %reg_16, %reg_2
	br i1 %reg_17, label %Block4, label %Block5
Block4:
	store i32 0, ptr %reg_13
	br label %Block6
Block5:
	%reg_40 = getelementptr i32, ptr %reg_11, i32 0
	%reg_41 = icmp eq i32 2, %reg_2
	br i1 %reg_41, label %Block12, label %Block13
Block6:
	%reg_18 = load i32, ptr %reg_13
	%reg_19 = icmp slt i32 %reg_18, 2
	br i1 %reg_19, label %Block7, label %Block8
Block7:
	store i32 0, ptr %reg_15
	store i32 0, ptr %reg_14
	br label %Block9
Block8:
	%reg_39 = add i32 1, %reg_16
	store i32 %reg_39, ptr %reg_12
	br label %Block3
Block9:
	%reg_20 = load i32, ptr %reg_14
	%reg_21 = icmp slt i32 %reg_20, 3
	br i1 %reg_21, label %Block10, label %Block11
Block10:
	%reg_22 = mul i32 3, %reg_16
	%reg_23 = add i32 %reg_22, %reg_20
	%reg_24 = getelementptr i32, ptr %reg_7, i32 %reg_23
	%reg_25 = load i32, ptr %reg_24
	%reg_26 = mul i32 2, %reg_20
	%reg_27 = add i32 %reg_26, %reg_18
	%reg_28 = getelementptr i32, ptr %reg_8, i32 %reg_27
	%reg_29 = load i32, ptr %reg_28
	%reg_30 = mul i32 %reg_25, %reg_29
	%reg_31 = load i32, ptr %reg_15
	%reg_32 = add i32 %reg_31, %reg_30
	store i32 %reg_32, ptr %reg_15
	%reg_33 = add i32 1, %reg_20
	store i32 %reg_33, ptr %reg_14
	br label %Block9
Block11:
	%reg_34 = mul i32 2, %reg_16
	%reg_35 = add i32 %reg_34, %reg_18
	%reg_36 = getelementptr i32, ptr %reg_11, i32 %reg_35
	%reg_37 = load i32, ptr %reg_15
	store i32 %reg_37, ptr %reg_36
	%reg_38 = add i32 1, %reg_18
	store i32 %reg_38, ptr %reg_13
	br label %Block6
Block12:
	store i32 0, ptr %reg_42
	br label %Block14
Block13:
	call void @llvm.trap()
	br label %Block12
Block14:
	%reg_43 = load i32, ptr %reg_42
	%reg_44 = icmp slt i32 %reg_43, 4
	br i1 %reg_44, label %Block15, label %Block16
Block15:
	%reg_45 = getelementptr i32, ptr %reg_40, i32 %reg_43
	%reg_46 = load i32, ptr %reg_45
	%reg_47 = getelementptr i32, ptr %reg_6, i32 %reg_43
	store i32 %reg_46, ptr %reg_47
	%reg_48 = add i32 1, %reg_43
	store i32 %reg_48, ptr %reg_42
	br label %Block14
Block16:
	%reg_49 = add i32 1, 0
	%reg_50 = add i32 1, 0
	%reg_51 = getelementptr [2 x [2 x i32]], ptr %reg_5, i32 0, i32 %reg_49, i32 %reg_50
	%reg_52 = load i32, ptr %reg_51
	ret i32 %reg_52
}

define i32 @main()
{
Block0:
	%reg_15 = alloca [3 x [2 x i32]]
	%reg_1 = alloca [2 x [3 x i32]]
	%reg_2 = getelementptr [2 x [3 x i32]], ptr %reg_1, i32 0, i32 0, i32 0
	call void @llvm.memset.p0.i32(ptr %reg_2, i8 0, i32 24, i1 0)
	%reg_3 = add i32 1, 0
	%reg_4 = getelementptr i32, ptr %reg_2, i32 0
	store i32 %reg_3, ptr %reg_4
	%reg_5 = add i32 2, 0
	%reg_6 = getelementptr i32, ptr %reg_2, i32 1
	store i32 %reg_5, ptr %reg_6
	%reg_7 = add i32 3, 0
	%reg_8 = getelementptr i32, ptr %reg_2, i32 2
	store i32 %reg_7, ptr %reg_8
	%reg_9 = add i32 4, 0
	%reg_10 = getelementptr i32, ptr %reg_2, i32 3
	store i32 %reg_9, ptr %reg_10
	%reg_11 = add i32 5, 0
	%reg_12 = getelementptr i32, ptr %reg_2, i32 4
	store i32 %reg_11, ptr %reg_12
	%reg_13 = add i32 6, 0
	%reg_14 = getelementptr i32, ptr %reg_2, i32 5
	store i32 %reg_13, ptr %reg_14
	%reg_16 = getelementptr [3 x [2 x i32]], ptr %reg_15, i32 0, i32 0, i32 0
	call void @llvm.memset.p0.i32(ptr %reg_16, i8 0, i32 24, i1 0)
	%reg_17 = add i32 7, 0
	%reg_18 = getelementptr i32, ptr %reg_16, i32 0
	store i32 %reg_17, ptr %reg_18
	%reg_19 = add i32 8, 0
	%reg_20 = getelementptr i32, ptr %reg_16, i32 1
	store i32 %reg_19, ptr %reg_20
	%reg_21 = add i32 9, 0
	%reg_22 = getelementptr i32, ptr %reg_16, i32 2
	store i32 %reg_21, ptr %reg_22
	%reg_23 = add i32 10, 0
	%reg_24 = getelementptr i32, ptr %reg_16, i32 3
	store i32 %reg_23, ptr %reg_24
	%reg_25 = add i32 11, 0
	%reg_26 = getelementptr i32, ptr %reg_16, i32 4
	store i32 %reg_25, ptr %reg_26
	%reg_27 = add i32 12, 0
	%reg_28 = getelementptr i32, ptr %reg_16, i32 5
	store i32 %reg_27, ptr %reg_28
	%reg_29 = getelementptr [2 x [3 x i32]], ptr %reg_1, i32 0, i32 0
	%reg_30 = getelementptr [3 x [2 x i32]], ptr %reg_15, i32 0, i32 0
	%reg_31 = call i32 @product(ptr %reg_29, i32 2, ptr %reg_30, i32 3)
	ret i32 %reg_31
}
