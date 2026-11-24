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
@g = global float 0x4008000000000000
@n = global i32 2

; Function Definitions
define float @scale(float %reg_1)
{
Block0:
	%reg_2 = alloca float
	store float %reg_1, ptr %reg_2
	%reg_3 = load float, ptr %reg_2
	%reg_4 = load float, ptr @g
	%reg_5 = fmul float %reg_3, %reg_4
	ret float %reg_5
}

define i32 @main()
{
Block0:
	%reg_1 = alloca float
	%reg_2 = load i32, ptr @n
	%reg_3 = sitofp i32 %reg_2 to float
	%reg_4 = call float @scale(float %reg_3)
	store float %reg_4, ptr %reg_1
	%reg_5 = load float, ptr %reg_1
	%reg_6 = fptosi float %reg_5 to i32
	ret i32 %reg_6
}
