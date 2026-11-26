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
declare void @llvm.trap()

; Global Variable Declarations
@a = global [4 x i32] [i32 1,i32 2,i32 3,i32 4]
@b = global [4 x i32] [i32 5,i32 6,i32 7,i32 8]

; Function Definitions
define void @addv(ptr %reg_1, ptr %reg_2, i32 %reg_3, ptr %reg_4, i32 %reg_5, i32 %reg_6)
{
Block0:
	%reg_36 = alloca i32
	%reg_18 = alloca i32
	%reg_8 = alloca [4 x i32]
	%reg_7 = alloca i32
	store i32 %reg_6, ptr %reg_7
	%reg_9 = getelementptr [4 x i32], ptr %reg_8, i32 0, i32 0
	call void @llvm.memset.p0.i32(ptr %reg_9, i8 0, i32 16, i1 0)
	%reg_10 = add i32 0, 0
	%reg_11 = getelementptr i32, ptr %reg_9, i32 0
	store i32 %reg_10, ptr %reg_11
	%reg_12 = add i32 0, 0
	%reg_13 = getelementptr i32, ptr %reg_9, i32 1
	store i32 %reg_12, ptr %reg_13
	%reg_14 = add i32 0, 0
	%reg_15 = getelementptr i32, ptr %reg_9, i32 2
	store i32 %reg_14, ptr %reg_15
	%reg_16 = add i32 0, 0
	%reg_17 = getelementptr i32, ptr %reg_9, i32 3
	store i32 %reg_16, ptr %reg_17
	%reg_19 = add i32 0, 0
	store i32 %reg_19, ptr %reg_18
	br label %Block1
Block1:
	%reg_20 = load i32, ptr %reg_18
	%reg_21 = load i32, ptr %reg_7
	%reg_22 = icmp slt i32 %reg_20, %reg_21
	br i1 %reg_22, label %Block2, label %Block3
Block2:
	%reg_23 = load i32, ptr %reg_18
	%reg_24 = getelementptr [4 x i32], ptr %reg_8, i32 0, i32 %reg_23
	%reg_25 = load i32, ptr %reg_18
	%reg_26 = getelementptr i32, ptr %reg_2, i32 %reg_25
	%reg_27 = load i32, ptr %reg_26
	%reg_28 = load i32, ptr %reg_18
	%reg_29 = getelementptr i32, ptr %reg_4, i32 %reg_28
	%reg_30 = load i32, ptr %reg_29
	%reg_31 = add i32 %reg_27, %reg_30
	store i32 %reg_31, ptr %reg_24
	%reg_32 = load i32, ptr %reg_18
	%reg_33 = add i32 1, 0
	%reg_34 = add i32 %reg_32, %reg_33
	store i32 %reg_34, ptr %reg_18
	br label %Block1
Block3:
	%reg_35 = getelementptr [4 x i32], ptr %reg_8, i32 0, i32 0
	store i32 0, ptr %reg_36
	br label %Block4
Block4:
	%reg_37 = load i32, ptr %reg_36
	%reg_38 = icmp slt i32 %reg_37, 4
	br i1 %reg_38, label %Block5, label %Block6
Block5:
	%reg_39 = getelementptr i32, ptr %reg_35, i32 %reg_37
	%reg_40 = load i32, ptr %reg_39
	%reg_41 = getelementptr i32, ptr %reg_1, i32 %reg_37
	store i32 %reg_40, ptr %reg_41
	%reg_42 = add i32 1, %reg_37
	store i32 %reg_42, ptr %reg_36
	br label %Block4
Block6:
	ret void
}

define i32 @sum4(ptr %reg_1, i32 %reg_2)
{
Block0:
	%reg_3 = add i32 0, 0
	%reg_4 = getelementptr i32, ptr %reg_1, i32 %reg_3
	%reg_5 = load i32, ptr %reg_4
	%reg_6 = add i32 1, 0
	%reg_7 = getelementptr i32, ptr %reg_1, i32 %reg_6
	%reg_8 = load i32, ptr %reg_7
	%reg_9 = add i32 %reg_5, %reg_8
	%reg_10 = add i32 2, 0
	%reg_11 = getelementptr i32, ptr %reg_1, i32 %reg_10
	%reg_12 = load i32, ptr %reg_11
	%reg_13 = add i32 %reg_9, %reg_12
	%reg_14 = add i32 3, 0
	%reg_15 = getelementptr i32, ptr %reg_1, i32 %reg_14
	%reg_16 = load i32, ptr %reg_15
	%reg_17 = add i32 %reg_13, %reg_16
	ret i32 %reg_17
}

define i32 @main()
{
Block0:
	%reg_233 = alloca i32
	%reg_207 = alloca i32
	%reg_206 = alloca i32
	%reg_205 = alloca i32
	%reg_204 = alloca i32
	%reg_199 = alloca [2 x [2 x i32]]
	%reg_185 = alloca [3 x [2 x i32]]
	%reg_171 = alloca [2 x [3 x i32]]
	%reg_145 = alloca i32
	%reg_143 = alloca [4 x i32]
	%reg_138 = alloca [4 x i32]
	%reg_83 = alloca i32
	%reg_74 = alloca i32
	%reg_69 = alloca [4 x i32]
	%reg_62 = alloca i32
	%reg_51 = alloca i32
	%reg_46 = alloca [4 x i32]
	%reg_39 = alloca i32
	%reg_30 = alloca i32
	%reg_17 = alloca i32
	%reg_7 = alloca i32
	%reg_1 = alloca [4 x i32]
	%reg_2 = getelementptr [4 x i32], ptr %reg_1, i32 0, i32 0
	%reg_3 = getelementptr [4 x i32], ptr @a, i32 0, i32 0
	%reg_4 = getelementptr [4 x i32], ptr @b, i32 0, i32 0
	%reg_5 = add i32 2, 0
	%reg_6 = alloca i32, i32 4
	store i32 0, ptr %reg_7
	%reg_16 = alloca i32, i32 4
	%reg_29 = alloca i32, i32 4
	%reg_50 = alloca i32, i32 4
	%reg_73 = alloca i32, i32 4
	%reg_203 = alloca i32, i32 4
	br label %Block1
Block1:
	%reg_8 = load i32, ptr %reg_7
	%reg_9 = icmp slt i32 %reg_8, 4
	br i1 %reg_9, label %Block2, label %Block3
Block2:
	%reg_10 = getelementptr i32, ptr %reg_4, i32 %reg_8
	%reg_11 = load i32, ptr %reg_10
	%reg_12 = mul i32 %reg_11, %reg_5
	%reg_13 = getelementptr i32, ptr %reg_6, i32 %reg_8
	store i32 %reg_12, ptr %reg_13
	%reg_14 = add i32 1, %reg_8
	store i32 %reg_14, ptr %reg_7
	br label %Block1
Block3:
	%reg_15 = getelementptr i32, ptr %reg_6, i32 0
	store i32 0, ptr %reg_17
	br label %Block4
Block4:
	%reg_18 = load i32, ptr %reg_17
	%reg_19 = icmp slt i32 %reg_18, 4
	br i1 %reg_19, label %Block5, label %Block6
Block5:
	%reg_20 = getelementptr i32, ptr %reg_3, i32 %reg_18
	%reg_21 = load i32, ptr %reg_20
	%reg_22 = getelementptr i32, ptr %reg_15, i32 %reg_18
	%reg_23 = load i32, ptr %reg_22
	%reg_24 = add i32 %reg_21, %reg_23
	%reg_25 = getelementptr i32, ptr %reg_16, i32 %reg_18
	store i32 %reg_24, ptr %reg_25
	%reg_26 = add i32 1, %reg_18
	store i32 %reg_26, ptr %reg_17
	br label %Block4
Block6:
	%reg_27 = getelementptr i32, ptr %reg_16, i32 0
	%reg_28 = add i32 10, 0
	store i32 0, ptr %reg_30
	br label %Block7
Block7:
	%reg_31 = load i32, ptr %reg_30
	%reg_32 = icmp slt i32 %reg_31, 4
	br i1 %reg_32, label %Block8, label %Block9
Block8:
	%reg_33 = getelementptr i32, ptr %reg_27, i32 %reg_31
	%reg_34 = load i32, ptr %reg_33
	%reg_35 = add i32 %reg_34, %reg_28
	%reg_36 = getelementptr i32, ptr %reg_29, i32 %reg_31
	store i32 %reg_35, ptr %reg_36
	%reg_37 = add i32 1, %reg_31
	store i32 %reg_37, ptr %reg_30
	br label %Block7
Block9:
	%reg_38 = getelementptr i32, ptr %reg_29, i32 0
	store i32 0, ptr %reg_39
	br label %Block10
Block10:
	%reg_40 = load i32, ptr %reg_39
	%reg_41 = icmp slt i32 %reg_40, 4
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
	%reg_47 = getelementptr [4 x i32], ptr %reg_46, i32 0, i32 0
	%reg_48 = getelementptr [4 x i32], ptr @a, i32 0, i32 0
	%reg_49 = getelementptr [4 x i32], ptr @b, i32 0, i32 0
	store i32 0, ptr %reg_51
	br label %Block13
Block13:
	%reg_52 = load i32, ptr %reg_51
	%reg_53 = icmp slt i32 %reg_52, 4
	br i1 %reg_53, label %Block14, label %Block15
Block14:
	%reg_54 = getelementptr i32, ptr %reg_48, i32 %reg_52
	%reg_55 = load i32, ptr %reg_54
	%reg_56 = getelementptr i32, ptr %reg_49, i32 %reg_52
	%reg_57 = load i32, ptr %reg_56
	%reg_58 = mul i32 %reg_55, %reg_57
	%reg_59 = getelementptr i32, ptr %reg_50, i32 %reg_52
	store i32 %reg_58, ptr %reg_59
	%reg_60 = add i32 1, %reg_52
	store i32 %reg_60, ptr %reg_51
	br label %Block13
Block15:
	%reg_61 = getelementptr i32, ptr %reg_50, i32 0
	store i32 0, ptr %reg_62
	br label %Block16
Block16:
	%reg_63 = load i32, ptr %reg_62
	%reg_64 = icmp slt i32 %reg_63, 4
	br i1 %reg_64, label %Block17, label %Block18
Block17:
	%reg_65 = getelementptr i32, ptr %reg_61, i32 %reg_63
	%reg_66 = load i32, ptr %reg_65
	%reg_67 = getelementptr i32, ptr %reg_47, i32 %reg_63
	store i32 %reg_66, ptr %reg_67
	%reg_68 = add i32 1, %reg_63
	store i32 %reg_68, ptr %reg_62
	br label %Block16
Block18:
	%reg_70 = getelementptr [4 x i32], ptr %reg_69, i32 0, i32 0
	%reg_71 = getelementptr [4 x i32], ptr @a, i32 0, i32 0
	%reg_72 = add i32 3, 0
	store i32 0, ptr %reg_74
	br label %Block19
Block19:
	%reg_75 = load i32, ptr %reg_74
	%reg_76 = icmp slt i32 %reg_75, 4
	br i1 %reg_76, label %Block20, label %Block21
Block20:
	%reg_77 = getelementptr i32, ptr %reg_71, i32 %reg_75
	%reg_78 = load i32, ptr %reg_77
	%reg_79 = srem i32 %reg_78, %reg_72
	%reg_80 = getelementptr i32, ptr %reg_73, i32 %reg_75
	store i32 %reg_79, ptr %reg_80
	%reg_81 = add i32 1, %reg_75
	store i32 %reg_81, ptr %reg_74
	br label %Block19
Block21:
	%reg_82 = getelementptr i32, ptr %reg_73, i32 0
	store i32 0, ptr %reg_83
	br label %Block22
Block22:
	%reg_84 = load i32, ptr %reg_83
	%reg_85 = icmp slt i32 %reg_84, 4
	br i1 %reg_85, label %Block23, label %Block24
Block23:
	%reg_86 = getelementptr i32, ptr %reg_82, i32 %reg_84
	%reg_87 = load i32, ptr %reg_86
	%reg_88 = getelementptr i32, ptr %reg_70, i32 %reg_84
	store i32 %reg_87, ptr %reg_88
	%reg_89 = add i32 1, %reg_84
	store i32 %reg_89, ptr %reg_83
	br label %Block22
Block24:
	%reg_90 = add i32 0, 0
	%reg_91 = getelementptr [4 x i32], ptr %reg_1, i32 0, i32 %reg_90
	%reg_92 = load i32, ptr %reg_91
	call void @putint(i32 %reg_92)
	%reg_93 = add i32 32, 0
	call void @putch(i32 %reg_93)
	%reg_94 = add i32 1, 0
	%reg_95 = getelementptr [4 x i32], ptr %reg_1, i32 0, i32 %reg_94
	%reg_96 = load i32, ptr %reg_95
	call void @putint(i32 %reg_96)
	%reg_97 = add i32 32, 0
	call void @putch(i32 %reg_97)
	%reg_98 = add i32 2, 0
	%reg_99 = getelementptr [4 x i32], ptr %reg_1, i32 0, i32 %reg_98
	%reg_100 = load i32, ptr %reg_99
	call void @putint(i32 %reg_100)
	%reg_101 = add i32 32, 0
	call void @putch(i32 %reg_101)
	%reg_102 = add i32 3, 0
	%reg_103 = getelementptr [4 x i32], ptr %reg_1, i32 0, i32 %reg_102
	%reg_104 = load i32, ptr %reg_103
	call void @putint(i32 %reg_104)
	%reg_105 = add i32 10, 0
	call void @putch(i32 %reg_105)
	%reg_106 = add i32 0, 0
	%reg_107 = getelementptr [4 x i32], ptr %reg_46, i32 0, i32 %reg_106
	%reg_108 = load i32, ptr %reg_107
	call void @putint(i32 %reg_108)
	%reg_109 = add i32 32, 0
	call void @putch(i32 %reg_109)
	%reg_110 = add i32 1, 0
	%reg_111 = getelementptr [4 x i32], ptr %reg_46, i32 0, i32 %reg_110
	%reg_112 = load i32, ptr %reg_111
	call void @putint(i32 %reg_112)
	%reg_113 = add i32 32, 0
	call void @putch(i32 %reg_113)
	%reg_114 = add i32 2, 0
	%reg_115 = getelementptr [4 x i32], ptr %reg_46, i32 0, i32 %reg_114
	%reg_116 = load i32, ptr %reg_115
	call void @putint(i32 %reg_116)
	%reg_117 = add i32 32, 0
	call void @putch(i32 %reg_117)
	%reg_118 = add i32 3, 0
	%reg_119 = getelementptr [4 x i32], ptr %reg_46, i32 0, i32 %reg_118
	%reg_120 = load i32, ptr %reg_119
	call void @putint(i32 %reg_120)
	%reg_121 = add i32 10, 0
	call void @putch(i32 %reg_121)
	%reg_122 = add i32 0, 0
	%reg_123 = getelementptr [4 x i32], ptr %reg_69, i32 0, i32 %reg_122
	%reg_124 = load i32, ptr %reg_123
	call void @putint(i32 %reg_124)
	%reg_125 = add i32 32, 0
	call void @putch(i32 %reg_125)
	%reg_126 = add i32 1, 0
	%reg_127 = getelementptr [4 x i32], ptr %reg_69, i32 0, i32 %reg_126
	%reg_128 = load i32, ptr %reg_127
	call void @putint(i32 %reg_128)
	%reg_129 = add i32 32, 0
	call void @putch(i32 %reg_129)
	%reg_130 = add i32 2, 0
	%reg_131 = getelementptr [4 x i32], ptr %reg_69, i32 0, i32 %reg_130
	%reg_132 = load i32, ptr %reg_131
	call void @putint(i32 %reg_132)
	%reg_133 = add i32 32, 0
	call void @putch(i32 %reg_133)
	%reg_134 = add i32 3, 0
	%reg_135 = getelementptr [4 x i32], ptr %reg_69, i32 0, i32 %reg_134
	%reg_136 = load i32, ptr %reg_135
	call void @putint(i32 %reg_136)
	%reg_137 = add i32 10, 0
	call void @putch(i32 %reg_137)
	%reg_139 = getelementptr [4 x i32], ptr %reg_138, i32 0, i32 0
	%reg_140 = getelementptr [4 x i32], ptr @a, i32 0, i32 0
	%reg_141 = getelementptr [4 x i32], ptr @b, i32 0, i32 0
	%reg_142 = add i32 4, 0
	%reg_144 = getelementptr [4 x i32], ptr %reg_143, i32 0, i32 0
	call void @addv(ptr %reg_144, ptr %reg_140, i32 4, ptr %reg_141, i32 4, i32 %reg_142)
	store i32 0, ptr %reg_145
	br label %Block25
Block25:
	%reg_146 = load i32, ptr %reg_145
	%reg_147 = icmp slt i32 %reg_146, 4
	br i1 %reg_147, label %Block26, label %Block27
Block26:
	%reg_148 = getelementptr i32, ptr %reg_144, i32 %reg_146
	%reg_149 = load i32, ptr %reg_148
	%reg_150 = getelementptr i32, ptr %reg_139, i32 %reg_146
	store i32 %reg_149, ptr %reg_150
	%reg_151 = add i32 1, %reg_146
	store i32 %reg_151, ptr %reg_145
	br label %Block25
Block27:
	%reg_152 = add i32 0, 0
	%reg_153 = getelementptr [4 x i32], ptr %reg_138, i32 0, i32 %reg_152
	%reg_154 = load i32, ptr %reg_153
	call void @putint(i32 %reg_154)
	%reg_155 = add i32 32, 0
	call void @putch(i32 %reg_155)
	%reg_156 = add i32 1, 0
	%reg_157 = getelementptr [4 x i32], ptr %reg_138, i32 0, i32 %reg_156
	%reg_158 = load i32, ptr %reg_157
	call void @putint(i32 %reg_158)
	%reg_159 = add i32 32, 0
	call void @putch(i32 %reg_159)
	%reg_160 = add i32 2, 0
	%reg_161 = getelementptr [4 x i32], ptr %reg_138, i32 0, i32 %reg_160
	%reg_162 = load i32, ptr %reg_161
	call void @putint(i32 %reg_162)
	%reg_163 = add i32 32, 0
	call void @putch(i32 %reg_163)
	%reg_164 = add i32 3, 0
	%reg_165 = getelementptr [4 x i32], ptr %reg_138, i32 0, i32 %reg_164
	%reg_166 = load i32, ptr %reg_165
	call void @putint(i32 %reg_166)
	%reg_167 = add i32 10, 0
	call void @putch(i32 %reg_167)
	%reg_168 = getelementptr [4 x i32], ptr %reg_138, i32 0, i32 0
	%reg_169 = call i32 @sum4(ptr %reg_168, i32 4)
	call void @putint(i32 %reg_169)
	%reg_170 = add i32 10, 0
	call void @putch(i32 %reg_170)
	%reg_172 = getelementptr [2 x [3 x i32]], ptr %reg_171, i32 0, i32 0, i32 0
	call void @llvm.memset.p0.i32(ptr %reg_172, i8 0, i32 24, i1 0)
	%reg_173 = add i32 1, 0
	%reg_174 = getelementptr i32, ptr %reg_172, i32 0
	store i32 %reg_173, ptr %reg_174
	%reg_175 = add i32 2, 0
	%reg_176 = getelementptr i32, ptr %reg_172, i32 1
	store i32 %reg_175, ptr %reg_176
	%reg_177 = add i32 3, 0
	%reg_178 = getelementptr i32, ptr %reg_172, i32 2
	store i32 %reg_177, ptr %reg_178
	%reg_179 = add i32 4, 0
	%reg_180 = getelementptr i32, ptr %reg_172, i32 3
	store i32 %reg_179, ptr %reg_180
	%reg_181 = add i32 5, 0
	%reg_182 = getelementptr i32, ptr %reg_172, i32 4
	store i32 %reg_181, ptr %reg_182
	%reg_183 = add i32 6, 0
	%reg_184 = getelementptr i32, ptr %reg_172, i32 5
	store i32 %reg_183, ptr %reg_184
	%reg_186 = getelementptr [3 x [2 x i32]], ptr %reg_185, i32 0, i32 0, i32 0
	call void @llvm.memset.p0.i32(ptr %reg_186, i8 0, i32 24, i1 0)
	%reg_187 = add i32 7, 0
	%reg_188 = getelementptr i32, ptr %reg_186, i32 0
	store i32 %reg_187, ptr %reg_188
	%reg_189 = add i32 8, 0
	%reg_190 = getelementptr i32, ptr %reg_186, i32 1
	store i32 %reg_189, ptr %reg_190
	%reg_191 = add i32 9, 0
	%reg_192 = getelementptr i32, ptr %reg_186, i32 2
	store i32 %reg_191, ptr %reg_192
	%reg_193 = add i32 10, 0
	%reg_194 = getelementptr i32, ptr %reg_186, i32 3
	store i32 %reg_193, ptr %reg_194
	%reg_195 = add i32 11, 0
	%reg_196 = getelementptr i32, ptr %reg_186, i32 4
	store i32 %reg_195, ptr %reg_196
	%reg_197 = add i32 12, 0
	%reg_198 = getelementptr i32, ptr %reg_186, i32 5
	store i32 %reg_197, ptr %reg_198
	%reg_200 = getelementptr [2 x [2 x i32]], ptr %reg_199, i32 0, i32 0, i32 0
	%reg_201 = getelementptr [2 x [3 x i32]], ptr %reg_171, i32 0, i32 0
	%reg_202 = getelementptr [3 x [2 x i32]], ptr %reg_185, i32 0, i32 0
	store i32 0, ptr %reg_204
	br label %Block28
Block28:
	%reg_208 = load i32, ptr %reg_204
	%reg_209 = icmp slt i32 %reg_208, 2
	br i1 %reg_209, label %Block29, label %Block30
Block29:
	store i32 0, ptr %reg_205
	br label %Block31
Block30:
	%reg_232 = getelementptr i32, ptr %reg_203, i32 0
	store i32 0, ptr %reg_233
	br label %Block37
Block31:
	%reg_210 = load i32, ptr %reg_205
	%reg_211 = icmp slt i32 %reg_210, 2
	br i1 %reg_211, label %Block32, label %Block33
Block32:
	store i32 0, ptr %reg_207
	store i32 0, ptr %reg_206
	br label %Block34
Block33:
	%reg_231 = add i32 1, %reg_208
	store i32 %reg_231, ptr %reg_204
	br label %Block28
Block34:
	%reg_212 = load i32, ptr %reg_206
	%reg_213 = icmp slt i32 %reg_212, 3
	br i1 %reg_213, label %Block35, label %Block36
Block35:
	%reg_214 = mul i32 3, %reg_208
	%reg_215 = add i32 %reg_214, %reg_212
	%reg_216 = getelementptr i32, ptr %reg_201, i32 %reg_215
	%reg_217 = load i32, ptr %reg_216
	%reg_218 = mul i32 2, %reg_212
	%reg_219 = add i32 %reg_218, %reg_210
	%reg_220 = getelementptr i32, ptr %reg_202, i32 %reg_219
	%reg_221 = load i32, ptr %reg_220
	%reg_222 = mul i32 %reg_217, %reg_221
	%reg_223 = load i32, ptr %reg_207
	%reg_224 = add i32 %reg_223, %reg_222
	store i32 %reg_224, ptr %reg_207
	%reg_225 = add i32 1, %reg_212
	store i32 %reg_225, ptr %reg_206
	br label %Block34
Block36:
	%reg_226 = mul i32 2, %reg_208
	%reg_227 = add i32 %reg_226, %reg_210
	%reg_228 = getelementptr i32, ptr %reg_203, i32 %reg_227
	%reg_229 = load i32, ptr %reg_207
	store i32 %reg_229, ptr %reg_228
	%reg_230 = add i32 1, %reg_210
	store i32 %reg_230, ptr %reg_205
	br label %Block31
Block37:
	%reg_234 = load i32, ptr %reg_233
	%reg_235 = icmp slt i32 %reg_234, 4
	br i1 %reg_235, label %Block38, label %Block39
Block38:
	%reg_236 = getelementptr i32, ptr %reg_232, i32 %reg_234
	%reg_237 = load i32, ptr %reg_236
	%reg_238 = getelementptr i32, ptr %reg_200, i32 %reg_234
	store i32 %reg_237, ptr %reg_238
	%reg_239 = add i32 1, %reg_234
	store i32 %reg_239, ptr %reg_233
	br label %Block37
Block39:
	%reg_240 = add i32 0, 0
	%reg_241 = add i32 0, 0
	%reg_242 = getelementptr [2 x [2 x i32]], ptr %reg_199, i32 0, i32 %reg_240, i32 %reg_241
	%reg_243 = load i32, ptr %reg_242
	call void @putint(i32 %reg_243)
	%reg_244 = add i32 32, 0
	call void @putch(i32 %reg_244)
	%reg_245 = add i32 0, 0
	%reg_246 = add i32 1, 0
	%reg_247 = getelementptr [2 x [2 x i32]], ptr %reg_199, i32 0, i32 %reg_245, i32 %reg_246
	%reg_248 = load i32, ptr %reg_247
	call void @putint(i32 %reg_248)
	%reg_249 = add i32 32, 0
	call void @putch(i32 %reg_249)
	%reg_250 = add i32 1, 0
	%reg_251 = add i32 0, 0
	%reg_252 = getelementptr [2 x [2 x i32]], ptr %reg_199, i32 0, i32 %reg_250, i32 %reg_251
	%reg_253 = load i32, ptr %reg_252
	call void @putint(i32 %reg_253)
	%reg_254 = add i32 32, 0
	call void @putch(i32 %reg_254)
	%reg_255 = add i32 1, 0
	%reg_256 = add i32 1, 0
	%reg_257 = getelementptr [2 x [2 x i32]], ptr %reg_199, i32 0, i32 %reg_255, i32 %reg_256
	%reg_258 = load i32, ptr %reg_257
	call void @putint(i32 %reg_258)
	%reg_259 = add i32 10, 0
	call void @putch(i32 %reg_259)
	%reg_260 = add i32 0, 0
	ret i32 %reg_260
}
