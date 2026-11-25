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
@a = global [5 x [4 x [3 x i32]]] [[4 x [3 x i32]] [[3 x i32] [i32 2,i32 3,i32 0],[3 x i32] [i32 6,i32 7,i32 0],[3 x i32] [i32 0,i32 0,i32 0],[3 x i32] [i32 0,i32 0,i32 0]],[4 x [3 x i32]] [[3 x i32] [i32 7,i32 8,i32 11],[3 x i32] zeroinitializer,[3 x i32] zeroinitializer,[3 x i32] zeroinitializer],[4 x [3 x i32]] zeroinitializer,[4 x [3 x i32]] zeroinitializer,[4 x [3 x i32]] zeroinitializer]

; Function Definitions
define i32 @main()
{
Block0:
	%reg_1 = alloca [5 x [4 x [3 x i32]]]
	%reg_2 = getelementptr [5 x [4 x [3 x i32]]], ptr %reg_1, i32 0, i32 0, i32 0, i32 0
	call void @llvm.memset.p0.i32(ptr %reg_2, i8 0, i32 240, i1 0)
	%reg_3 = add i32 2, 0
	%reg_4 = getelementptr i32, ptr %reg_2, i32 0
	store i32 %reg_3, ptr %reg_4
	%reg_5 = add i32 3, 0
	%reg_6 = getelementptr i32, ptr %reg_2, i32 1
	store i32 %reg_5, ptr %reg_6
	%reg_7 = add i32 6, 0
	%reg_8 = getelementptr i32, ptr %reg_2, i32 3
	store i32 %reg_7, ptr %reg_8
	%reg_9 = add i32 7, 0
	%reg_10 = getelementptr i32, ptr %reg_2, i32 4
	store i32 %reg_9, ptr %reg_10
	%reg_11 = add i32 7, 0
	%reg_12 = getelementptr i32, ptr %reg_2, i32 12
	store i32 %reg_11, ptr %reg_12
	%reg_13 = add i32 8, 0
	%reg_14 = getelementptr i32, ptr %reg_2, i32 13
	store i32 %reg_13, ptr %reg_14
	%reg_15 = add i32 11, 0
	%reg_16 = getelementptr i32, ptr %reg_2, i32 14
	store i32 %reg_15, ptr %reg_16
	%reg_17 = add i32 0, 0
	%reg_18 = add i32 0, 0
	%reg_19 = add i32 2, 0
	%reg_20 = getelementptr [5 x [4 x [3 x i32]]], ptr @a, i32 0, i32 %reg_17, i32 %reg_18, i32 %reg_19
	%reg_21 = load i32, ptr %reg_20
	%reg_22 = add i32 2, 0
	%reg_23 = add i32 0, 0
	%reg_24 = add i32 1, 0
	%reg_25 = add i32 0, 0
	%reg_26 = getelementptr [5 x [4 x [3 x i32]]], ptr @a, i32 0, i32 %reg_23, i32 %reg_24, i32 %reg_25
	%reg_27 = load i32, ptr %reg_26
	%reg_28 = mul i32 %reg_22, %reg_27
	%reg_29 = add i32 %reg_21, %reg_28
	%reg_30 = add i32 3, 0
	%reg_31 = add i32 1, 0
	%reg_32 = add i32 0, 0
	%reg_33 = add i32 0, 0
	%reg_34 = getelementptr [5 x [4 x [3 x i32]]], ptr @a, i32 0, i32 %reg_31, i32 %reg_32, i32 %reg_33
	%reg_35 = load i32, ptr %reg_34
	%reg_36 = mul i32 %reg_30, %reg_35
	%reg_37 = add i32 %reg_29, %reg_36
	%reg_38 = add i32 1, 0
	%reg_39 = add i32 0, 0
	%reg_40 = add i32 2, 0
	%reg_41 = getelementptr [5 x [4 x [3 x i32]]], ptr %reg_1, i32 0, i32 %reg_38, i32 %reg_39, i32 %reg_40
	%reg_42 = load i32, ptr %reg_41
	%reg_43 = add i32 %reg_37, %reg_42
	ret i32 %reg_43
}
