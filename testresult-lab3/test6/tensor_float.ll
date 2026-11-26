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
	%reg_32 = alloca i32
	%reg_23 = alloca i32
	%reg_14 = alloca i32
	%reg_11 = alloca [2 x float]
	%reg_9 = alloca [2 x float]
	%reg_7 = alloca [2 x float]
	%reg_1 = alloca [2 x float]
	%reg_2 = getelementptr [2 x float], ptr %reg_1, i32 0, i32 0
	call void @llvm.memset.p0.i32(ptr %reg_2, i8 0, i32 8, i1 0)
	%reg_3 = fadd float 0x3ff8000000000000, 0x0
	%reg_4 = getelementptr float, ptr %reg_2, i32 0
	store float %reg_3, ptr %reg_4
	%reg_5 = fadd float 0x4004000000000000, 0x0
	%reg_6 = getelementptr float, ptr %reg_2, i32 1
	store float %reg_5, ptr %reg_6
	%reg_8 = getelementptr [2 x float], ptr %reg_7, i32 0, i32 0
	%reg_10 = fadd float 0x3fe0000000000000, 0x0
	%reg_12 = getelementptr [2 x float], ptr %reg_1, i32 0, i32 0
	%reg_13 = fadd float 0x4000000000000000, 0x0
	store i32 0, ptr %reg_14
	br label %Block1
Block1:
	%reg_15 = load i32, ptr %reg_14
	%reg_16 = icmp slt i32 %reg_15, 2
	br i1 %reg_16, label %Block2, label %Block3
Block2:
	%reg_17 = getelementptr float, ptr %reg_12, i32 %reg_15
	%reg_18 = load float, ptr %reg_17
	%reg_19 = fdiv float %reg_18, %reg_13
	%reg_20 = getelementptr float, ptr %reg_11, i32 %reg_15
	store float %reg_19, ptr %reg_20
	%reg_21 = add i32 1, %reg_15
	store i32 %reg_21, ptr %reg_14
	br label %Block1
Block3:
	%reg_22 = getelementptr float, ptr %reg_11, i32 0
	store i32 0, ptr %reg_23
	br label %Block4
Block4:
	%reg_24 = load i32, ptr %reg_23
	%reg_25 = icmp slt i32 %reg_24, 2
	br i1 %reg_25, label %Block5, label %Block6
Block5:
	%reg_26 = getelementptr float, ptr %reg_22, i32 %reg_24
	%reg_27 = load float, ptr %reg_26
	%reg_28 = fadd float %reg_10, %reg_27
	%reg_29 = getelementptr float, ptr %reg_9, i32 %reg_24
	store float %reg_28, ptr %reg_29
	%reg_30 = add i32 1, %reg_24
	store i32 %reg_30, ptr %reg_23
	br label %Block4
Block6:
	%reg_31 = getelementptr float, ptr %reg_9, i32 0
	store i32 0, ptr %reg_32
	br label %Block7
Block7:
	%reg_33 = load i32, ptr %reg_32
	%reg_34 = icmp slt i32 %reg_33, 2
	br i1 %reg_34, label %Block8, label %Block9
Block8:
	%reg_35 = getelementptr float, ptr %reg_31, i32 %reg_33
	%reg_36 = load float, ptr %reg_35
	%reg_37 = getelementptr float, ptr %reg_8, i32 %reg_33
	store float %reg_36, ptr %reg_37
	%reg_38 = add i32 1, %reg_33
	store i32 %reg_38, ptr %reg_32
	br label %Block7
Block9:
	%reg_39 = add i32 0, 0
	%reg_40 = getelementptr [2 x float], ptr %reg_7, i32 0, i32 %reg_39
	%reg_41 = load float, ptr %reg_40
	call void @putfloat(float %reg_41)
	%reg_42 = add i32 10, 0
	call void @putch(i32 %reg_42)
	%reg_43 = add i32 0, 0
	ret i32 %reg_43
}
