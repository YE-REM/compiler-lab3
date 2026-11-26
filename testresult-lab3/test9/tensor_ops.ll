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
@c = global [4 x i32] zeroinitializer

; Function Definitions
define i32 @main()
{
Block0:
	%reg_167 = alloca i32
	%reg_141 = alloca i32
	%reg_140 = alloca i32
	%reg_139 = alloca i32
	%reg_138 = alloca i32
	%reg_133 = alloca [2 x [2 x i32]]
	%reg_123 = alloca [2 x [2 x i32]]
	%reg_113 = alloca [2 x [2 x i32]]
	%reg_94 = alloca i32
	%reg_83 = alloca i32
	%reg_78 = alloca [3 x float]
	%reg_68 = alloca [3 x float]
	%reg_60 = alloca [3 x float]
	%reg_36 = alloca i32
	%reg_25 = alloca i32
	%reg_14 = alloca i32
	%reg_5 = alloca i32
	%reg_1 = alloca [4 x i32]
	%reg_2 = getelementptr [4 x i32], ptr %reg_1, i32 0, i32 0
	%reg_3 = getelementptr [4 x i32], ptr @a, i32 0, i32 0
	%reg_4 = alloca i32, i32 4
	store i32 0, ptr %reg_5
	%reg_24 = alloca i32, i32 4
	%reg_82 = alloca float, i32 3
	%reg_137 = alloca i32, i32 4
	br label %Block1
Block1:
	%reg_6 = load i32, ptr %reg_5
	%reg_7 = icmp slt i32 %reg_6, 4
	br i1 %reg_7, label %Block2, label %Block3
Block2:
	%reg_8 = getelementptr i32, ptr %reg_3, i32 %reg_6
	%reg_9 = load i32, ptr %reg_8
	%reg_10 = sub i32 0, %reg_9
	%reg_11 = getelementptr i32, ptr %reg_4, i32 %reg_6
	store i32 %reg_10, ptr %reg_11
	%reg_12 = add i32 1, %reg_6
	store i32 %reg_12, ptr %reg_5
	br label %Block1
Block3:
	%reg_13 = getelementptr i32, ptr %reg_4, i32 0
	store i32 0, ptr %reg_14
	br label %Block4
Block4:
	%reg_15 = load i32, ptr %reg_14
	%reg_16 = icmp slt i32 %reg_15, 4
	br i1 %reg_16, label %Block5, label %Block6
Block5:
	%reg_17 = getelementptr i32, ptr %reg_13, i32 %reg_15
	%reg_18 = load i32, ptr %reg_17
	%reg_19 = getelementptr i32, ptr %reg_2, i32 %reg_15
	store i32 %reg_18, ptr %reg_19
	%reg_20 = add i32 1, %reg_15
	store i32 %reg_20, ptr %reg_14
	br label %Block4
Block6:
	%reg_21 = getelementptr [4 x i32], ptr @c, i32 0, i32 0
	%reg_22 = getelementptr [4 x i32], ptr %reg_1, i32 0, i32 0
	%reg_23 = getelementptr [4 x i32], ptr @b, i32 0, i32 0
	store i32 0, ptr %reg_25
	br label %Block7
Block7:
	%reg_26 = load i32, ptr %reg_25
	%reg_27 = icmp slt i32 %reg_26, 4
	br i1 %reg_27, label %Block8, label %Block9
Block8:
	%reg_28 = getelementptr i32, ptr %reg_22, i32 %reg_26
	%reg_29 = load i32, ptr %reg_28
	%reg_30 = getelementptr i32, ptr %reg_23, i32 %reg_26
	%reg_31 = load i32, ptr %reg_30
	%reg_32 = add i32 %reg_29, %reg_31
	%reg_33 = getelementptr i32, ptr %reg_24, i32 %reg_26
	store i32 %reg_32, ptr %reg_33
	%reg_34 = add i32 1, %reg_26
	store i32 %reg_34, ptr %reg_25
	br label %Block7
Block9:
	%reg_35 = getelementptr i32, ptr %reg_24, i32 0
	store i32 0, ptr %reg_36
	br label %Block10
Block10:
	%reg_37 = load i32, ptr %reg_36
	%reg_38 = icmp slt i32 %reg_37, 4
	br i1 %reg_38, label %Block11, label %Block12
Block11:
	%reg_39 = getelementptr i32, ptr %reg_35, i32 %reg_37
	%reg_40 = load i32, ptr %reg_39
	%reg_41 = getelementptr i32, ptr %reg_21, i32 %reg_37
	store i32 %reg_40, ptr %reg_41
	%reg_42 = add i32 1, %reg_37
	store i32 %reg_42, ptr %reg_36
	br label %Block10
Block12:
	%reg_43 = getelementptr i32, ptr %reg_21, i32 0
	%reg_44 = add i32 0, 0
	%reg_45 = getelementptr [4 x i32], ptr @c, i32 0, i32 %reg_44
	%reg_46 = load i32, ptr %reg_45
	call void @putint(i32 %reg_46)
	%reg_47 = add i32 32, 0
	call void @putch(i32 %reg_47)
	%reg_48 = add i32 1, 0
	%reg_49 = getelementptr [4 x i32], ptr @c, i32 0, i32 %reg_48
	%reg_50 = load i32, ptr %reg_49
	call void @putint(i32 %reg_50)
	%reg_51 = add i32 32, 0
	call void @putch(i32 %reg_51)
	%reg_52 = add i32 2, 0
	%reg_53 = getelementptr [4 x i32], ptr @c, i32 0, i32 %reg_52
	%reg_54 = load i32, ptr %reg_53
	call void @putint(i32 %reg_54)
	%reg_55 = add i32 32, 0
	call void @putch(i32 %reg_55)
	%reg_56 = add i32 3, 0
	%reg_57 = getelementptr [4 x i32], ptr @c, i32 0, i32 %reg_56
	%reg_58 = load i32, ptr %reg_57
	call void @putint(i32 %reg_58)
	%reg_59 = add i32 10, 0
	call void @putch(i32 %reg_59)
	%reg_61 = getelementptr [3 x float], ptr %reg_60, i32 0, i32 0
	call void @llvm.memset.p0.i32(ptr %reg_61, i8 0, i32 12, i1 0)
	%reg_62 = fadd float 0x3ff8000000000000, 0x0
	%reg_63 = getelementptr float, ptr %reg_61, i32 0
	store float %reg_62, ptr %reg_63
	%reg_64 = fadd float 0x4004000000000000, 0x0
	%reg_65 = getelementptr float, ptr %reg_61, i32 1
	store float %reg_64, ptr %reg_65
	%reg_66 = fadd float 0x400c000000000000, 0x0
	%reg_67 = getelementptr float, ptr %reg_61, i32 2
	store float %reg_66, ptr %reg_67
	%reg_69 = getelementptr [3 x float], ptr %reg_68, i32 0, i32 0
	call void @llvm.memset.p0.i32(ptr %reg_69, i8 0, i32 12, i1 0)
	%reg_70 = fadd float 0x3ff0000000000000, 0x0
	%reg_71 = fsub float 0x0, %reg_70
	%reg_72 = getelementptr float, ptr %reg_69, i32 0
	store float %reg_71, ptr %reg_72
	%reg_73 = fadd float 0x4000000000000000, 0x0
	%reg_74 = getelementptr float, ptr %reg_69, i32 1
	store float %reg_73, ptr %reg_74
	%reg_75 = fadd float 0x4008000000000000, 0x0
	%reg_76 = fsub float 0x0, %reg_75
	%reg_77 = getelementptr float, ptr %reg_69, i32 2
	store float %reg_76, ptr %reg_77
	%reg_79 = getelementptr [3 x float], ptr %reg_78, i32 0, i32 0
	%reg_80 = getelementptr [3 x float], ptr %reg_60, i32 0, i32 0
	%reg_81 = getelementptr [3 x float], ptr %reg_68, i32 0, i32 0
	store i32 0, ptr %reg_83
	br label %Block13
Block13:
	%reg_84 = load i32, ptr %reg_83
	%reg_85 = icmp slt i32 %reg_84, 3
	br i1 %reg_85, label %Block14, label %Block15
Block14:
	%reg_86 = getelementptr float, ptr %reg_80, i32 %reg_84
	%reg_87 = load float, ptr %reg_86
	%reg_88 = getelementptr float, ptr %reg_81, i32 %reg_84
	%reg_89 = load float, ptr %reg_88
	%reg_90 = fadd float %reg_87, %reg_89
	%reg_91 = getelementptr float, ptr %reg_82, i32 %reg_84
	store float %reg_90, ptr %reg_91
	%reg_92 = add i32 1, %reg_84
	store i32 %reg_92, ptr %reg_83
	br label %Block13
Block15:
	%reg_93 = getelementptr float, ptr %reg_82, i32 0
	store i32 0, ptr %reg_94
	br label %Block16
Block16:
	%reg_95 = load i32, ptr %reg_94
	%reg_96 = icmp slt i32 %reg_95, 3
	br i1 %reg_96, label %Block17, label %Block18
Block17:
	%reg_97 = getelementptr float, ptr %reg_93, i32 %reg_95
	%reg_98 = load float, ptr %reg_97
	%reg_99 = getelementptr float, ptr %reg_79, i32 %reg_95
	store float %reg_98, ptr %reg_99
	%reg_100 = add i32 1, %reg_95
	store i32 %reg_100, ptr %reg_94
	br label %Block16
Block18:
	%reg_101 = add i32 0, 0
	%reg_102 = getelementptr [3 x float], ptr %reg_78, i32 0, i32 %reg_101
	%reg_103 = load float, ptr %reg_102
	call void @putfloat(float %reg_103)
	%reg_104 = add i32 32, 0
	call void @putch(i32 %reg_104)
	%reg_105 = add i32 1, 0
	%reg_106 = getelementptr [3 x float], ptr %reg_78, i32 0, i32 %reg_105
	%reg_107 = load float, ptr %reg_106
	call void @putfloat(float %reg_107)
	%reg_108 = add i32 32, 0
	call void @putch(i32 %reg_108)
	%reg_109 = add i32 2, 0
	%reg_110 = getelementptr [3 x float], ptr %reg_78, i32 0, i32 %reg_109
	%reg_111 = load float, ptr %reg_110
	call void @putfloat(float %reg_111)
	%reg_112 = add i32 10, 0
	call void @putch(i32 %reg_112)
	%reg_114 = getelementptr [2 x [2 x i32]], ptr %reg_113, i32 0, i32 0, i32 0
	call void @llvm.memset.p0.i32(ptr %reg_114, i8 0, i32 16, i1 0)
	%reg_115 = add i32 1, 0
	%reg_116 = getelementptr i32, ptr %reg_114, i32 0
	store i32 %reg_115, ptr %reg_116
	%reg_117 = add i32 2, 0
	%reg_118 = getelementptr i32, ptr %reg_114, i32 1
	store i32 %reg_117, ptr %reg_118
	%reg_119 = add i32 3, 0
	%reg_120 = getelementptr i32, ptr %reg_114, i32 2
	store i32 %reg_119, ptr %reg_120
	%reg_121 = add i32 4, 0
	%reg_122 = getelementptr i32, ptr %reg_114, i32 3
	store i32 %reg_121, ptr %reg_122
	%reg_124 = getelementptr [2 x [2 x i32]], ptr %reg_123, i32 0, i32 0, i32 0
	call void @llvm.memset.p0.i32(ptr %reg_124, i8 0, i32 16, i1 0)
	%reg_125 = add i32 5, 0
	%reg_126 = getelementptr i32, ptr %reg_124, i32 0
	store i32 %reg_125, ptr %reg_126
	%reg_127 = add i32 6, 0
	%reg_128 = getelementptr i32, ptr %reg_124, i32 1
	store i32 %reg_127, ptr %reg_128
	%reg_129 = add i32 7, 0
	%reg_130 = getelementptr i32, ptr %reg_124, i32 2
	store i32 %reg_129, ptr %reg_130
	%reg_131 = add i32 8, 0
	%reg_132 = getelementptr i32, ptr %reg_124, i32 3
	store i32 %reg_131, ptr %reg_132
	%reg_134 = getelementptr [2 x [2 x i32]], ptr %reg_133, i32 0, i32 0, i32 0
	%reg_135 = getelementptr [2 x [2 x i32]], ptr %reg_113, i32 0, i32 0
	%reg_136 = getelementptr [2 x [2 x i32]], ptr %reg_123, i32 0, i32 0
	store i32 0, ptr %reg_138
	br label %Block19
Block19:
	%reg_142 = load i32, ptr %reg_138
	%reg_143 = icmp slt i32 %reg_142, 2
	br i1 %reg_143, label %Block20, label %Block21
Block20:
	store i32 0, ptr %reg_139
	br label %Block22
Block21:
	%reg_166 = getelementptr i32, ptr %reg_137, i32 0
	store i32 0, ptr %reg_167
	br label %Block28
Block22:
	%reg_144 = load i32, ptr %reg_139
	%reg_145 = icmp slt i32 %reg_144, 2
	br i1 %reg_145, label %Block23, label %Block24
Block23:
	store i32 0, ptr %reg_141
	store i32 0, ptr %reg_140
	br label %Block25
Block24:
	%reg_165 = add i32 1, %reg_142
	store i32 %reg_165, ptr %reg_138
	br label %Block19
Block25:
	%reg_146 = load i32, ptr %reg_140
	%reg_147 = icmp slt i32 %reg_146, 2
	br i1 %reg_147, label %Block26, label %Block27
Block26:
	%reg_148 = mul i32 2, %reg_142
	%reg_149 = add i32 %reg_148, %reg_146
	%reg_150 = getelementptr i32, ptr %reg_135, i32 %reg_149
	%reg_151 = load i32, ptr %reg_150
	%reg_152 = mul i32 2, %reg_146
	%reg_153 = add i32 %reg_152, %reg_144
	%reg_154 = getelementptr i32, ptr %reg_136, i32 %reg_153
	%reg_155 = load i32, ptr %reg_154
	%reg_156 = mul i32 %reg_151, %reg_155
	%reg_157 = load i32, ptr %reg_141
	%reg_158 = add i32 %reg_157, %reg_156
	store i32 %reg_158, ptr %reg_141
	%reg_159 = add i32 1, %reg_146
	store i32 %reg_159, ptr %reg_140
	br label %Block25
Block27:
	%reg_160 = mul i32 2, %reg_142
	%reg_161 = add i32 %reg_160, %reg_144
	%reg_162 = getelementptr i32, ptr %reg_137, i32 %reg_161
	%reg_163 = load i32, ptr %reg_141
	store i32 %reg_163, ptr %reg_162
	%reg_164 = add i32 1, %reg_144
	store i32 %reg_164, ptr %reg_139
	br label %Block22
Block28:
	%reg_168 = load i32, ptr %reg_167
	%reg_169 = icmp slt i32 %reg_168, 4
	br i1 %reg_169, label %Block29, label %Block30
Block29:
	%reg_170 = getelementptr i32, ptr %reg_166, i32 %reg_168
	%reg_171 = load i32, ptr %reg_170
	%reg_172 = getelementptr i32, ptr %reg_134, i32 %reg_168
	store i32 %reg_171, ptr %reg_172
	%reg_173 = add i32 1, %reg_168
	store i32 %reg_173, ptr %reg_167
	br label %Block28
Block30:
	%reg_174 = add i32 0, 0
	%reg_175 = add i32 0, 0
	%reg_176 = getelementptr [2 x [2 x i32]], ptr %reg_133, i32 0, i32 %reg_174, i32 %reg_175
	%reg_177 = load i32, ptr %reg_176
	call void @putint(i32 %reg_177)
	%reg_178 = add i32 32, 0
	call void @putch(i32 %reg_178)
	%reg_179 = add i32 0, 0
	%reg_180 = add i32 1, 0
	%reg_181 = getelementptr [2 x [2 x i32]], ptr %reg_133, i32 0, i32 %reg_179, i32 %reg_180
	%reg_182 = load i32, ptr %reg_181
	call void @putint(i32 %reg_182)
	%reg_183 = add i32 32, 0
	call void @putch(i32 %reg_183)
	%reg_184 = add i32 1, 0
	%reg_185 = add i32 0, 0
	%reg_186 = getelementptr [2 x [2 x i32]], ptr %reg_133, i32 0, i32 %reg_184, i32 %reg_185
	%reg_187 = load i32, ptr %reg_186
	call void @putint(i32 %reg_187)
	%reg_188 = add i32 32, 0
	call void @putch(i32 %reg_188)
	%reg_189 = add i32 1, 0
	%reg_190 = add i32 1, 0
	%reg_191 = getelementptr [2 x [2 x i32]], ptr %reg_133, i32 0, i32 %reg_189, i32 %reg_190
	%reg_192 = load i32, ptr %reg_191
	call void @putint(i32 %reg_192)
	%reg_193 = add i32 10, 0
	call void @putch(i32 %reg_193)
	%reg_194 = add i32 0, 0
	ret i32 %reg_194
}
