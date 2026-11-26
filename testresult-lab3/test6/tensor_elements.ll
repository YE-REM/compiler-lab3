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
@a = global [3 x i32] [i32 1,i32 2,i32 zeroinitializer]
@b = global [3 x i32] [i32 4,i32 6,i32 8]

; Function Definitions
define i32 @main()
{
Block0:
	%reg_68 = alloca i32
	%reg_59 = alloca i32
	%reg_50 = alloca i32
	%reg_48 = alloca [3 x i32]
	%reg_46 = alloca [3 x i32]
	%reg_39 = alloca i32
	%reg_30 = alloca i32
	%reg_18 = alloca i32
	%reg_9 = alloca i32
	%reg_6 = alloca [3 x i32]
	%reg_4 = alloca [3 x i32]
	%reg_3 = alloca [3 x i32]
	%reg_1 = alloca [3 x i32]
	%reg_2 = getelementptr [3 x i32], ptr %reg_1, i32 0, i32 0
	%reg_5 = getelementptr [3 x i32], ptr @a, i32 0, i32 0
	%reg_7 = getelementptr [3 x i32], ptr @b, i32 0, i32 0
	%reg_8 = add i32 2, 0
	store i32 0, ptr %reg_9
	br label %Block1
Block1:
	%reg_10 = load i32, ptr %reg_9
	%reg_11 = icmp slt i32 %reg_10, 3
	br i1 %reg_11, label %Block2, label %Block3
Block2:
	%reg_12 = getelementptr i32, ptr %reg_7, i32 %reg_10
	%reg_13 = load i32, ptr %reg_12
	%reg_14 = mul i32 %reg_13, %reg_8
	%reg_15 = getelementptr i32, ptr %reg_6, i32 %reg_10
	store i32 %reg_14, ptr %reg_15
	%reg_16 = add i32 1, %reg_10
	store i32 %reg_16, ptr %reg_9
	br label %Block1
Block3:
	%reg_17 = getelementptr i32, ptr %reg_6, i32 0
	store i32 0, ptr %reg_18
	br label %Block4
Block4:
	%reg_19 = load i32, ptr %reg_18
	%reg_20 = icmp slt i32 %reg_19, 3
	br i1 %reg_20, label %Block5, label %Block6
Block5:
	%reg_21 = getelementptr i32, ptr %reg_5, i32 %reg_19
	%reg_22 = load i32, ptr %reg_21
	%reg_23 = getelementptr i32, ptr %reg_17, i32 %reg_19
	%reg_24 = load i32, ptr %reg_23
	%reg_25 = add i32 %reg_22, %reg_24
	%reg_26 = getelementptr i32, ptr %reg_4, i32 %reg_19
	store i32 %reg_25, ptr %reg_26
	%reg_27 = add i32 1, %reg_19
	store i32 %reg_27, ptr %reg_18
	br label %Block4
Block6:
	%reg_28 = getelementptr i32, ptr %reg_4, i32 0
	%reg_29 = add i32 1, 0
	store i32 0, ptr %reg_30
	br label %Block7
Block7:
	%reg_31 = load i32, ptr %reg_30
	%reg_32 = icmp slt i32 %reg_31, 3
	br i1 %reg_32, label %Block8, label %Block9
Block8:
	%reg_33 = getelementptr i32, ptr %reg_28, i32 %reg_31
	%reg_34 = load i32, ptr %reg_33
	%reg_35 = add i32 %reg_34, %reg_29
	%reg_36 = getelementptr i32, ptr %reg_3, i32 %reg_31
	store i32 %reg_35, ptr %reg_36
	%reg_37 = add i32 1, %reg_31
	store i32 %reg_37, ptr %reg_30
	br label %Block7
Block9:
	%reg_38 = getelementptr i32, ptr %reg_3, i32 0
	store i32 0, ptr %reg_39
	br label %Block10
Block10:
	%reg_40 = load i32, ptr %reg_39
	%reg_41 = icmp slt i32 %reg_40, 3
	br i1 %reg_41, label %Block11, label %Block12
Block11:
	%reg_42 = getelementptr i32, ptr %reg_38, i32 %reg_40
	%reg_43 = load i32, ptr %reg_42
	%reg_44 = getelementptr i32, ptr %reg_2, i32 %reg_40
	store i32 %reg_43, ptr %reg_44
	%reg_45 = add i32 1, %reg_40
	store i32 %reg_45, ptr %reg_39
	br label %Block10
Block12:
	%reg_47 = getelementptr [3 x i32], ptr %reg_46, i32 0, i32 0
	%reg_49 = getelementptr [3 x i32], ptr %reg_1, i32 0, i32 0
	store i32 0, ptr %reg_50
	br label %Block13
Block13:
	%reg_51 = load i32, ptr %reg_50
	%reg_52 = icmp slt i32 %reg_51, 3
	br i1 %reg_52, label %Block14, label %Block15
Block14:
	%reg_53 = getelementptr i32, ptr %reg_49, i32 %reg_51
	%reg_54 = load i32, ptr %reg_53
	%reg_55 = sub i32 0, %reg_54
	%reg_56 = getelementptr i32, ptr %reg_48, i32 %reg_51
	store i32 %reg_55, ptr %reg_56
	%reg_57 = add i32 1, %reg_51
	store i32 %reg_57, ptr %reg_50
	br label %Block13
Block15:
	%reg_58 = getelementptr i32, ptr %reg_48, i32 0
	store i32 0, ptr %reg_59
	br label %Block16
Block16:
	%reg_60 = load i32, ptr %reg_59
	%reg_61 = icmp slt i32 %reg_60, 3
	br i1 %reg_61, label %Block17, label %Block18
Block17:
	%reg_62 = getelementptr i32, ptr %reg_58, i32 %reg_60
	%reg_63 = load i32, ptr %reg_62
	%reg_64 = getelementptr i32, ptr %reg_47, i32 %reg_60
	store i32 %reg_63, ptr %reg_64
	%reg_65 = add i32 1, %reg_60
	store i32 %reg_65, ptr %reg_59
	br label %Block16
Block18:
	%reg_66 = getelementptr [3 x i32], ptr %reg_1, i32 0, i32 0
	%reg_67 = getelementptr [3 x i32], ptr %reg_46, i32 0, i32 0
	store i32 0, ptr %reg_68
	br label %Block19
Block19:
	%reg_69 = load i32, ptr %reg_68
	%reg_70 = icmp slt i32 %reg_69, 3
	br i1 %reg_70, label %Block20, label %Block21
Block20:
	%reg_71 = getelementptr i32, ptr %reg_67, i32 %reg_69
	%reg_72 = load i32, ptr %reg_71
	%reg_73 = getelementptr i32, ptr %reg_66, i32 %reg_69
	store i32 %reg_72, ptr %reg_73
	%reg_74 = add i32 1, %reg_69
	store i32 %reg_74, ptr %reg_68
	br label %Block19
Block21:
	%reg_75 = getelementptr i32, ptr %reg_66, i32 0
	%reg_76 = add i32 2, 0
	%reg_77 = getelementptr [3 x i32], ptr %reg_1, i32 0, i32 %reg_76
	%reg_78 = add i32 17, 0
	store i32 %reg_78, ptr %reg_77
	%reg_79 = add i32 0, 0
	%reg_80 = getelementptr [3 x i32], ptr %reg_1, i32 0, i32 %reg_79
	%reg_81 = load i32, ptr %reg_80
	%reg_82 = add i32 1, 0
	%reg_83 = getelementptr [3 x i32], ptr %reg_1, i32 0, i32 %reg_82
	%reg_84 = load i32, ptr %reg_83
	%reg_85 = add i32 %reg_81, %reg_84
	%reg_86 = add i32 2, 0
	%reg_87 = getelementptr [3 x i32], ptr %reg_1, i32 0, i32 %reg_86
	%reg_88 = load i32, ptr %reg_87
	%reg_89 = add i32 %reg_85, %reg_88
	%reg_90 = add i32 0, 0
	%reg_91 = getelementptr [3 x i32], ptr @b, i32 0, i32 %reg_90
	%reg_92 = load i32, ptr %reg_91
	%reg_93 = add i32 %reg_89, %reg_92
	ret i32 %reg_93
}
