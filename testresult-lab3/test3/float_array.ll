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
define float @f(ptr %reg_1)
{
Block0:
	%reg_2 = add i32 1, 0
	%reg_3 = getelementptr float, ptr %reg_1, i32 %reg_2
	%reg_4 = load float, ptr %reg_3
	%reg_5 = add i32 2, 0
	%reg_6 = sitofp i32 %reg_5 to float
	%reg_7 = fdiv float %reg_4, %reg_6
	ret float %reg_7
}

define i32 @main()
{
Block0:
	%reg_1 = alloca [2 x float]
	%reg_2 = add i32 1, 0
	%reg_3 = getelementptr [2 x float], ptr %reg_1, i32 0, i32 %reg_2
	%reg_4 = add i32 3, 0
	%reg_5 = sitofp i32 %reg_4 to float
	store float %reg_5, ptr %reg_3
	%reg_6 = getelementptr [2 x float], ptr %reg_1, i32 0, i32 0
	%reg_7 = call float @f(ptr %reg_6)
	call void @putfloat(float %reg_7)
	%reg_8 = add i32 10, 0
	call void @putch(i32 %reg_8)
	%reg_9 = getelementptr [2 x float], ptr %reg_1, i32 0, i32 0
	%reg_10 = call float @f(ptr %reg_9)
	%reg_11 = add i32 4, 0
	%reg_12 = sitofp i32 %reg_11 to float
	%reg_13 = fadd float %reg_10, %reg_12
	%reg_14 = fptosi float %reg_13 to i32
	ret i32 %reg_14
}
