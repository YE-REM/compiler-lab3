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
define void @calc(ptr %reg_1, ptr %reg_2, i32 %reg_3, ptr %reg_4, i32 %reg_5)
{
Block0:
	%reg_53 = alloca i32
	%reg_45 = alloca i32
	%reg_35 = alloca i32
	%reg_24 = alloca i32
	%reg_12 = alloca i32
	%reg_6 = alloca [2 x i32]
	%reg_7 = getelementptr [2 x i32], ptr %reg_6, i32 0, i32 0
	%reg_8 = getelementptr i32, ptr %reg_2, i32 0
	%reg_9 = getelementptr i32, ptr %reg_4, i32 0
	%reg_10 = icmp eq i32 %reg_3, %reg_5
	%reg_11 = alloca i32, i32 %reg_3
	%reg_23 = alloca i32, i32 %reg_3
	%reg_34 = alloca i32, i32 %reg_3
	br i1 %reg_10, label %Block1, label %Block2
Block1:
	store i32 0, ptr %reg_12
	br label %Block3
Block2:
	call void @llvm.trap()
	br label %Block1
Block3:
	%reg_13 = load i32, ptr %reg_12
	%reg_14 = icmp slt i32 %reg_13, %reg_3
	br i1 %reg_14, label %Block4, label %Block5
Block4:
	%reg_15 = getelementptr i32, ptr %reg_8, i32 %reg_13
	%reg_16 = load i32, ptr %reg_15
	%reg_17 = getelementptr i32, ptr %reg_9, i32 %reg_13
	%reg_18 = load i32, ptr %reg_17
	%reg_19 = add i32 %reg_16, %reg_18
	%reg_20 = getelementptr i32, ptr %reg_11, i32 %reg_13
	store i32 %reg_19, ptr %reg_20
	%reg_21 = add i32 1, %reg_13
	store i32 %reg_21, ptr %reg_12
	br label %Block3
Block5:
	%reg_22 = getelementptr i32, ptr %reg_11, i32 0
	store i32 0, ptr %reg_24
	br label %Block6
Block6:
	%reg_25 = load i32, ptr %reg_24
	%reg_26 = icmp slt i32 %reg_25, %reg_3
	br i1 %reg_26, label %Block7, label %Block8
Block7:
	%reg_27 = getelementptr i32, ptr %reg_22, i32 %reg_25
	%reg_28 = load i32, ptr %reg_27
	%reg_29 = sub i32 0, %reg_28
	%reg_30 = getelementptr i32, ptr %reg_23, i32 %reg_25
	store i32 %reg_29, ptr %reg_30
	%reg_31 = add i32 1, %reg_25
	store i32 %reg_31, ptr %reg_24
	br label %Block6
Block8:
	%reg_32 = getelementptr i32, ptr %reg_23, i32 0
	%reg_33 = add i32 12, 0
	store i32 0, ptr %reg_35
	br label %Block9
Block9:
	%reg_36 = load i32, ptr %reg_35
	%reg_37 = icmp slt i32 %reg_36, %reg_3
	br i1 %reg_37, label %Block10, label %Block11
Block10:
	%reg_38 = getelementptr i32, ptr %reg_32, i32 %reg_36
	%reg_39 = load i32, ptr %reg_38
	%reg_40 = add i32 %reg_39, %reg_33
	%reg_41 = getelementptr i32, ptr %reg_34, i32 %reg_36
	store i32 %reg_40, ptr %reg_41
	%reg_42 = add i32 1, %reg_36
	store i32 %reg_42, ptr %reg_35
	br label %Block9
Block11:
	%reg_43 = getelementptr i32, ptr %reg_34, i32 0
	%reg_44 = icmp eq i32 2, %reg_3
	br i1 %reg_44, label %Block12, label %Block13
Block12:
	store i32 0, ptr %reg_45
	br label %Block14
Block13:
	call void @llvm.trap()
	br label %Block12
Block14:
	%reg_46 = load i32, ptr %reg_45
	%reg_47 = icmp slt i32 %reg_46, 2
	br i1 %reg_47, label %Block15, label %Block16
Block15:
	%reg_48 = getelementptr i32, ptr %reg_43, i32 %reg_46
	%reg_49 = load i32, ptr %reg_48
	%reg_50 = getelementptr i32, ptr %reg_7, i32 %reg_46
	store i32 %reg_49, ptr %reg_50
	%reg_51 = add i32 1, %reg_46
	store i32 %reg_51, ptr %reg_45
	br label %Block14
Block16:
	%reg_52 = getelementptr [2 x i32], ptr %reg_6, i32 0, i32 0
	store i32 0, ptr %reg_53
	br label %Block17
Block17:
	%reg_54 = load i32, ptr %reg_53
	%reg_55 = icmp slt i32 %reg_54, 2
	br i1 %reg_55, label %Block18, label %Block19
Block18:
	%reg_56 = getelementptr i32, ptr %reg_52, i32 %reg_54
	%reg_57 = load i32, ptr %reg_56
	%reg_58 = getelementptr i32, ptr %reg_1, i32 %reg_54
	store i32 %reg_57, ptr %reg_58
	%reg_59 = add i32 1, %reg_54
	store i32 %reg_59, ptr %reg_53
	br label %Block17
Block19:
	ret void
}

define i32 @main()
{
Block0:
	%reg_19 = alloca i32
	%reg_17 = alloca [2 x i32]
	%reg_13 = alloca [2 x i32]
	%reg_7 = alloca [2 x i32]
	%reg_1 = alloca [2 x i32]
	%reg_2 = getelementptr [2 x i32], ptr %reg_1, i32 0, i32 0
	call void @llvm.memset.p0.i32(ptr %reg_2, i8 0, i32 8, i1 0)
	%reg_3 = add i32 1, 0
	%reg_4 = getelementptr i32, ptr %reg_2, i32 0
	store i32 %reg_3, ptr %reg_4
	%reg_5 = add i32 2, 0
	%reg_6 = getelementptr i32, ptr %reg_2, i32 1
	store i32 %reg_5, ptr %reg_6
	%reg_8 = getelementptr [2 x i32], ptr %reg_7, i32 0, i32 0
	call void @llvm.memset.p0.i32(ptr %reg_8, i8 0, i32 8, i1 0)
	%reg_9 = add i32 3, 0
	%reg_10 = getelementptr i32, ptr %reg_8, i32 0
	store i32 %reg_9, ptr %reg_10
	%reg_11 = add i32 4, 0
	%reg_12 = getelementptr i32, ptr %reg_8, i32 1
	store i32 %reg_11, ptr %reg_12
	%reg_14 = getelementptr [2 x i32], ptr %reg_13, i32 0, i32 0
	%reg_15 = getelementptr [2 x i32], ptr %reg_1, i32 0, i32 0
	%reg_16 = getelementptr [2 x i32], ptr %reg_7, i32 0, i32 0
	%reg_18 = getelementptr [2 x i32], ptr %reg_17, i32 0, i32 0
	call void @calc(ptr %reg_18, ptr %reg_15, i32 2, ptr %reg_16, i32 2)
	store i32 0, ptr %reg_19
	br label %Block1
Block1:
	%reg_20 = load i32, ptr %reg_19
	%reg_21 = icmp slt i32 %reg_20, 2
	br i1 %reg_21, label %Block2, label %Block3
Block2:
	%reg_22 = getelementptr i32, ptr %reg_18, i32 %reg_20
	%reg_23 = load i32, ptr %reg_22
	%reg_24 = getelementptr i32, ptr %reg_14, i32 %reg_20
	store i32 %reg_23, ptr %reg_24
	%reg_25 = add i32 1, %reg_20
	store i32 %reg_25, ptr %reg_19
	br label %Block1
Block3:
	%reg_26 = add i32 0, 0
	%reg_27 = getelementptr [2 x i32], ptr %reg_13, i32 0, i32 %reg_26
	%reg_28 = load i32, ptr %reg_27
	%reg_29 = add i32 1, 0
	%reg_30 = getelementptr [2 x i32], ptr %reg_13, i32 0, i32 %reg_29
	%reg_31 = load i32, ptr %reg_30
	%reg_32 = add i32 %reg_28, %reg_31
	ret i32 %reg_32
}
