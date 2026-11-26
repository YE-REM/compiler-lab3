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
	%reg_63 = alloca i32
	%reg_37 = alloca i32
	%reg_36 = alloca i32
	%reg_35 = alloca i32
	%reg_34 = alloca i32
	%reg_31 = alloca [4 x i32]
	%reg_29 = alloca [2 x [2 x i32]]
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
	%reg_30 = getelementptr [2 x [2 x i32]], ptr %reg_29, i32 0, i32 0, i32 0
	%reg_32 = getelementptr [2 x [3 x i32]], ptr %reg_1, i32 0, i32 0
	%reg_33 = getelementptr [3 x [2 x i32]], ptr %reg_15, i32 0, i32 0
	store i32 0, ptr %reg_34
	br label %Block1
Block1:
	%reg_38 = load i32, ptr %reg_34
	%reg_39 = icmp slt i32 %reg_38, 2
	br i1 %reg_39, label %Block2, label %Block3
Block2:
	store i32 0, ptr %reg_35
	br label %Block4
Block3:
	%reg_62 = getelementptr i32, ptr %reg_31, i32 0
	store i32 0, ptr %reg_63
	br label %Block10
Block4:
	%reg_40 = load i32, ptr %reg_35
	%reg_41 = icmp slt i32 %reg_40, 2
	br i1 %reg_41, label %Block5, label %Block6
Block5:
	store i32 0, ptr %reg_37
	store i32 0, ptr %reg_36
	br label %Block7
Block6:
	%reg_61 = add i32 1, %reg_38
	store i32 %reg_61, ptr %reg_34
	br label %Block1
Block7:
	%reg_42 = load i32, ptr %reg_36
	%reg_43 = icmp slt i32 %reg_42, 3
	br i1 %reg_43, label %Block8, label %Block9
Block8:
	%reg_44 = mul i32 3, %reg_38
	%reg_45 = add i32 %reg_44, %reg_42
	%reg_46 = getelementptr i32, ptr %reg_32, i32 %reg_45
	%reg_47 = load i32, ptr %reg_46
	%reg_48 = mul i32 2, %reg_42
	%reg_49 = add i32 %reg_48, %reg_40
	%reg_50 = getelementptr i32, ptr %reg_33, i32 %reg_49
	%reg_51 = load i32, ptr %reg_50
	%reg_52 = mul i32 %reg_47, %reg_51
	%reg_53 = load i32, ptr %reg_37
	%reg_54 = add i32 %reg_53, %reg_52
	store i32 %reg_54, ptr %reg_37
	%reg_55 = add i32 1, %reg_42
	store i32 %reg_55, ptr %reg_36
	br label %Block7
Block9:
	%reg_56 = mul i32 2, %reg_38
	%reg_57 = add i32 %reg_56, %reg_40
	%reg_58 = getelementptr i32, ptr %reg_31, i32 %reg_57
	%reg_59 = load i32, ptr %reg_37
	store i32 %reg_59, ptr %reg_58
	%reg_60 = add i32 1, %reg_40
	store i32 %reg_60, ptr %reg_35
	br label %Block4
Block10:
	%reg_64 = load i32, ptr %reg_63
	%reg_65 = icmp slt i32 %reg_64, 4
	br i1 %reg_65, label %Block11, label %Block12
Block11:
	%reg_66 = getelementptr i32, ptr %reg_62, i32 %reg_64
	%reg_67 = load i32, ptr %reg_66
	%reg_68 = getelementptr i32, ptr %reg_30, i32 %reg_64
	store i32 %reg_67, ptr %reg_68
	%reg_69 = add i32 1, %reg_64
	store i32 %reg_69, ptr %reg_63
	br label %Block10
Block12:
	%reg_70 = add i32 0, 0
	%reg_71 = add i32 0, 0
	%reg_72 = getelementptr [2 x [2 x i32]], ptr %reg_29, i32 0, i32 %reg_70, i32 %reg_71
	%reg_73 = load i32, ptr %reg_72
	call void @putint(i32 %reg_73)
	%reg_74 = add i32 32, 0
	call void @putch(i32 %reg_74)
	%reg_75 = add i32 0, 0
	%reg_76 = add i32 1, 0
	%reg_77 = getelementptr [2 x [2 x i32]], ptr %reg_29, i32 0, i32 %reg_75, i32 %reg_76
	%reg_78 = load i32, ptr %reg_77
	call void @putint(i32 %reg_78)
	%reg_79 = add i32 32, 0
	call void @putch(i32 %reg_79)
	%reg_80 = add i32 1, 0
	%reg_81 = add i32 0, 0
	%reg_82 = getelementptr [2 x [2 x i32]], ptr %reg_29, i32 0, i32 %reg_80, i32 %reg_81
	%reg_83 = load i32, ptr %reg_82
	call void @putint(i32 %reg_83)
	%reg_84 = add i32 32, 0
	call void @putch(i32 %reg_84)
	%reg_85 = add i32 1, 0
	%reg_86 = add i32 1, 0
	%reg_87 = getelementptr [2 x [2 x i32]], ptr %reg_29, i32 0, i32 %reg_85, i32 %reg_86
	%reg_88 = load i32, ptr %reg_87
	call void @putint(i32 %reg_88)
	%reg_89 = add i32 10, 0
	call void @putch(i32 %reg_89)
	%reg_90 = add i32 0, 0
	ret i32 %reg_90
}
