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
@g = global [2 x [3 x float]] [[3 x float] [float 0x3ff4000000000000,float zeroinitializer,float zeroinitializer],[3 x float] zeroinitializer]

; Function Definitions
define i32 @main()
{
Block0:
	%reg_1 = alloca [2 x [3 x float]]
	%reg_2 = getelementptr [2 x [3 x float]], ptr %reg_1, i32 0, i32 0, i32 0
	call void @llvm.memset.p0.i32(ptr %reg_2, i8 0, i32 24, i1 0)
	%reg_3 = fadd float 0x4004000000000000, 0x0
	%reg_4 = getelementptr float, ptr %reg_2, i32 0
	store float %reg_3, ptr %reg_4
	%reg_5 = add i32 0, 0
	%reg_6 = add i32 0, 0
	%reg_7 = getelementptr [2 x [3 x float]], ptr @g, i32 0, i32 %reg_5, i32 %reg_6
	%reg_8 = load float, ptr %reg_7
	%reg_9 = fadd float 0x3ff4000000000000, 0x0
	%reg_10 = fcmp one float %reg_8, %reg_9
	br i1 %reg_10, label %Block1, label %Block4
Block1:
	%reg_23 = add i32 1, 0
	ret i32 %reg_23
Block2:
	%reg_24 = add i32 0, 0
	%reg_25 = add i32 0, 0
	%reg_26 = getelementptr [2 x [3 x float]], ptr %reg_1, i32 0, i32 %reg_24, i32 %reg_25
	%reg_27 = load float, ptr %reg_26
	%reg_28 = fadd float 0x4004000000000000, 0x0
	%reg_29 = fcmp one float %reg_27, %reg_28
	br i1 %reg_29, label %Block5, label %Block8
Block3:
	%reg_17 = add i32 1, 0
	%reg_18 = add i32 2, 0
	%reg_19 = getelementptr [2 x [3 x float]], ptr @g, i32 0, i32 %reg_17, i32 %reg_18
	%reg_20 = load float, ptr %reg_19
	%reg_21 = fadd float 0x0, 0x0
	%reg_22 = fcmp one float %reg_20, %reg_21
	br i1 %reg_22, label %Block1, label %Block2
Block4:
	%reg_11 = add i32 0, 0
	%reg_12 = add i32 1, 0
	%reg_13 = getelementptr [2 x [3 x float]], ptr @g, i32 0, i32 %reg_11, i32 %reg_12
	%reg_14 = load float, ptr %reg_13
	%reg_15 = fadd float 0x0, 0x0
	%reg_16 = fcmp one float %reg_14, %reg_15
	br i1 %reg_16, label %Block1, label %Block3
Block5:
	%reg_42 = add i32 2, 0
	ret i32 %reg_42
Block6:
	%reg_43 = add i32 0, 0
	ret i32 %reg_43
Block7:
	%reg_36 = add i32 1, 0
	%reg_37 = add i32 2, 0
	%reg_38 = getelementptr [2 x [3 x float]], ptr %reg_1, i32 0, i32 %reg_36, i32 %reg_37
	%reg_39 = load float, ptr %reg_38
	%reg_40 = fadd float 0x0, 0x0
	%reg_41 = fcmp one float %reg_39, %reg_40
	br i1 %reg_41, label %Block5, label %Block6
Block8:
	%reg_30 = add i32 0, 0
	%reg_31 = add i32 1, 0
	%reg_32 = getelementptr [2 x [3 x float]], ptr %reg_1, i32 0, i32 %reg_30, i32 %reg_31
	%reg_33 = load float, ptr %reg_32
	%reg_34 = fadd float 0x0, 0x0
	%reg_35 = fcmp one float %reg_33, %reg_34
	br i1 %reg_35, label %Block5, label %Block7
}
