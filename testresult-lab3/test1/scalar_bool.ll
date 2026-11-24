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
	%reg_1 = alloca i32
	%reg_2 = add i32 5, 0
	store i32 %reg_2, ptr %reg_1
	%reg_3 = load i32, ptr %reg_1
	%reg_4 = load i32, ptr %reg_1
	%reg_5 = icmp eq i32 %reg_4, 0
	%reg_6 = zext i1 %reg_5 to i32
	%reg_7 = add i32 %reg_3, %reg_6
	ret i32 %reg_7
}
