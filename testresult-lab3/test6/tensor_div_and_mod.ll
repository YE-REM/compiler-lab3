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
define i32 @main()
{
Block0:
	%reg_52 = alloca i32
	%reg_41 = alloca i32
	%reg_38 = alloca [2 x i32]
	%reg_36 = alloca [2 x i32]
	%reg_29 = alloca i32
	%reg_18 = alloca i32
	%reg_15 = alloca [2 x i32]
	%reg_13 = alloca [2 x i32]
	%reg_7 = alloca [2 x i32]
	%reg_1 = alloca [2 x i32]
	%reg_2 = getelementptr [2 x i32], ptr %reg_1, i32 0, i32 0
	call void @llvm.memset.p0.i32(ptr %reg_2, i8 0, i32 8, i1 0)
	%reg_3 = add i32 3, 0
	%reg_4 = getelementptr i32, ptr %reg_2, i32 0
	store i32 %reg_3, ptr %reg_4
	%reg_5 = add i32 5, 0
	%reg_6 = getelementptr i32, ptr %reg_2, i32 1
	store i32 %reg_5, ptr %reg_6
	%reg_8 = getelementptr [2 x i32], ptr %reg_7, i32 0, i32 0
	call void @llvm.memset.p0.i32(ptr %reg_8, i8 0, i32 8, i1 0)
	%reg_9 = add i32 8, 0
	%reg_10 = getelementptr i32, ptr %reg_8, i32 0
	store i32 %reg_9, ptr %reg_10
	%reg_11 = add i32 11, 0
	%reg_12 = getelementptr i32, ptr %reg_8, i32 1
	store i32 %reg_11, ptr %reg_12
	%reg_14 = getelementptr [2 x i32], ptr %reg_13, i32 0, i32 0
	%reg_16 = getelementptr [2 x i32], ptr %reg_7, i32 0, i32 0
	%reg_17 = getelementptr [2 x i32], ptr %reg_1, i32 0, i32 0
	store i32 0, ptr %reg_18
	br label %Block1
Block1:
	%reg_19 = load i32, ptr %reg_18
	%reg_20 = icmp slt i32 %reg_19, 2
	br i1 %reg_20, label %Block2, label %Block3
Block2:
	%reg_21 = getelementptr i32, ptr %reg_16, i32 %reg_19
	%reg_22 = load i32, ptr %reg_21
	%reg_23 = getelementptr i32, ptr %reg_17, i32 %reg_19
	%reg_24 = load i32, ptr %reg_23
	%reg_25 = sdiv i32 %reg_22, %reg_24
	%reg_26 = getelementptr i32, ptr %reg_15, i32 %reg_19
	store i32 %reg_25, ptr %reg_26
	%reg_27 = add i32 1, %reg_19
	store i32 %reg_27, ptr %reg_18
	br label %Block1
Block3:
	%reg_28 = getelementptr i32, ptr %reg_15, i32 0
	store i32 0, ptr %reg_29
	br label %Block4
Block4:
	%reg_30 = load i32, ptr %reg_29
	%reg_31 = icmp slt i32 %reg_30, 2
	br i1 %reg_31, label %Block5, label %Block6
Block5:
	%reg_32 = getelementptr i32, ptr %reg_28, i32 %reg_30
	%reg_33 = load i32, ptr %reg_32
	%reg_34 = getelementptr i32, ptr %reg_14, i32 %reg_30
	store i32 %reg_33, ptr %reg_34
	%reg_35 = add i32 1, %reg_30
	store i32 %reg_35, ptr %reg_29
	br label %Block4
Block6:
	%reg_37 = getelementptr [2 x i32], ptr %reg_36, i32 0, i32 0
	%reg_39 = getelementptr [2 x i32], ptr %reg_7, i32 0, i32 0
	%reg_40 = getelementptr [2 x i32], ptr %reg_1, i32 0, i32 0
	store i32 0, ptr %reg_41
	br label %Block7
Block7:
	%reg_42 = load i32, ptr %reg_41
	%reg_43 = icmp slt i32 %reg_42, 2
	br i1 %reg_43, label %Block8, label %Block9
Block8:
	%reg_44 = getelementptr i32, ptr %reg_39, i32 %reg_42
	%reg_45 = load i32, ptr %reg_44
	%reg_46 = getelementptr i32, ptr %reg_40, i32 %reg_42
	%reg_47 = load i32, ptr %reg_46
	%reg_48 = srem i32 %reg_45, %reg_47
	%reg_49 = getelementptr i32, ptr %reg_38, i32 %reg_42
	store i32 %reg_48, ptr %reg_49
	%reg_50 = add i32 1, %reg_42
	store i32 %reg_50, ptr %reg_41
	br label %Block7
Block9:
	%reg_51 = getelementptr i32, ptr %reg_38, i32 0
	store i32 0, ptr %reg_52
	br label %Block10
Block10:
	%reg_53 = load i32, ptr %reg_52
	%reg_54 = icmp slt i32 %reg_53, 2
	br i1 %reg_54, label %Block11, label %Block12
Block11:
	%reg_55 = getelementptr i32, ptr %reg_51, i32 %reg_53
	%reg_56 = load i32, ptr %reg_55
	%reg_57 = getelementptr i32, ptr %reg_37, i32 %reg_53
	store i32 %reg_56, ptr %reg_57
	%reg_58 = add i32 1, %reg_53
	store i32 %reg_58, ptr %reg_52
	br label %Block10
Block12:
	%reg_59 = add i32 0, 0
	%reg_60 = getelementptr [2 x i32], ptr %reg_13, i32 0, i32 %reg_59
	%reg_61 = load i32, ptr %reg_60
	%reg_62 = add i32 1, 0
	%reg_63 = getelementptr [2 x i32], ptr %reg_13, i32 0, i32 %reg_62
	%reg_64 = load i32, ptr %reg_63
	%reg_65 = add i32 %reg_61, %reg_64
	%reg_66 = add i32 0, 0
	%reg_67 = getelementptr [2 x i32], ptr %reg_36, i32 0, i32 %reg_66
	%reg_68 = load i32, ptr %reg_67
	%reg_69 = add i32 %reg_65, %reg_68
	%reg_70 = add i32 1, 0
	%reg_71 = getelementptr [2 x i32], ptr %reg_36, i32 0, i32 %reg_70
	%reg_72 = load i32, ptr %reg_71
	%reg_73 = add i32 %reg_69, %reg_72
	ret i32 %reg_73
}
