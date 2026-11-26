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
@a = global [1 x [2 x float]] [[2 x float] [float 0x3ff8000000000000,float 0x4000000000000000]]

; Function Definitions
define i32 @main()
{
Block0:
	%reg_41 = alloca i32
	%reg_15 = alloca float
	%reg_14 = alloca i32
	%reg_13 = alloca i32
	%reg_12 = alloca i32
	%reg_9 = alloca [1 x float]
	%reg_7 = alloca [1 x [1 x float]]
	%reg_1 = alloca [2 x [1 x float]]
	%reg_2 = getelementptr [2 x [1 x float]], ptr %reg_1, i32 0, i32 0, i32 0
	call void @llvm.memset.p0.i32(ptr %reg_2, i8 0, i32 8, i1 0)
	%reg_3 = fadd float 0x4000000000000000, 0x0
	%reg_4 = getelementptr float, ptr %reg_2, i32 0
	store float %reg_3, ptr %reg_4
	%reg_5 = fadd float 0x4008000000000000, 0x0
	%reg_6 = getelementptr float, ptr %reg_2, i32 1
	store float %reg_5, ptr %reg_6
	%reg_8 = getelementptr [1 x [1 x float]], ptr %reg_7, i32 0, i32 0, i32 0
	%reg_10 = getelementptr [1 x [2 x float]], ptr @a, i32 0, i32 0
	%reg_11 = getelementptr [2 x [1 x float]], ptr %reg_1, i32 0, i32 0
	store i32 0, ptr %reg_12
	br label %Block1
Block1:
	%reg_16 = load i32, ptr %reg_12
	%reg_17 = icmp slt i32 %reg_16, 1
	br i1 %reg_17, label %Block2, label %Block3
Block2:
	store i32 0, ptr %reg_13
	br label %Block4
Block3:
	%reg_40 = getelementptr float, ptr %reg_9, i32 0
	store i32 0, ptr %reg_41
	br label %Block10
Block4:
	%reg_18 = load i32, ptr %reg_13
	%reg_19 = icmp slt i32 %reg_18, 1
	br i1 %reg_19, label %Block5, label %Block6
Block5:
	store float 0x0, ptr %reg_15
	store i32 0, ptr %reg_14
	br label %Block7
Block6:
	%reg_39 = add i32 1, %reg_16
	store i32 %reg_39, ptr %reg_12
	br label %Block1
Block7:
	%reg_20 = load i32, ptr %reg_14
	%reg_21 = icmp slt i32 %reg_20, 2
	br i1 %reg_21, label %Block8, label %Block9
Block8:
	%reg_22 = mul i32 2, %reg_16
	%reg_23 = add i32 %reg_22, %reg_20
	%reg_24 = getelementptr float, ptr %reg_10, i32 %reg_23
	%reg_25 = load float, ptr %reg_24
	%reg_26 = mul i32 1, %reg_20
	%reg_27 = add i32 %reg_26, %reg_18
	%reg_28 = getelementptr float, ptr %reg_11, i32 %reg_27
	%reg_29 = load float, ptr %reg_28
	%reg_30 = fmul float %reg_25, %reg_29
	%reg_31 = load float, ptr %reg_15
	%reg_32 = fadd float %reg_31, %reg_30
	store float %reg_32, ptr %reg_15
	%reg_33 = add i32 1, %reg_20
	store i32 %reg_33, ptr %reg_14
	br label %Block7
Block9:
	%reg_34 = mul i32 1, %reg_16
	%reg_35 = add i32 %reg_34, %reg_18
	%reg_36 = getelementptr float, ptr %reg_9, i32 %reg_35
	%reg_37 = load float, ptr %reg_15
	store float %reg_37, ptr %reg_36
	%reg_38 = add i32 1, %reg_18
	store i32 %reg_38, ptr %reg_13
	br label %Block4
Block10:
	%reg_42 = load i32, ptr %reg_41
	%reg_43 = icmp slt i32 %reg_42, 1
	br i1 %reg_43, label %Block11, label %Block12
Block11:
	%reg_44 = getelementptr float, ptr %reg_40, i32 %reg_42
	%reg_45 = load float, ptr %reg_44
	%reg_46 = getelementptr float, ptr %reg_8, i32 %reg_42
	store float %reg_45, ptr %reg_46
	%reg_47 = add i32 1, %reg_42
	store i32 %reg_47, ptr %reg_41
	br label %Block10
Block12:
	%reg_48 = add i32 0, 0
	%reg_49 = add i32 0, 0
	%reg_50 = getelementptr [1 x [1 x float]], ptr %reg_7, i32 0, i32 %reg_48, i32 %reg_49
	%reg_51 = load float, ptr %reg_50
	call void @putfloat(float %reg_51)
	%reg_52 = add i32 10, 0
	call void @putch(i32 %reg_52)
	%reg_53 = add i32 0, 0
	ret i32 %reg_53
}
