# Lab3 标量 IR 测试结果

3 个标量 IR 用例全部通过。使用现行项目的独立源码副本构建，以 `-llvm -O0` 生成 IR，经 `llvm-as-15` 校验，用 `clang-15` 链接 x86 SysY 运行库后执行。

| 用例 | 检查内容 | 预期退出码 | 实际退出码 | 预期标准输出 | 实际标准输出 | 结果 |
| --- | --- | ---: | ---: | --- | --- | --- |
| [scalar.sy](./scalar.sy) · [LLVM IR](./scalar.ll) | 全局与局部变量、算术、形参、函数调用和输出 | 17 | 17 | `"17\n"` | `"17\n"` | 通过 |
| [scalar_bool.sy](./scalar_bool.sy) · [LLVM IR](./scalar_bool.ll) | 逻辑非及布尔结果转整数 | 5 | 5 | `""` | `""` | 通过 |
| [global_scalar_conversion.sy](./global_scalar_conversion.sy) · [LLVM IR](./global_scalar_conversion.ll) | 整数与浮点的全局初值、传参与返回转换 | 6 | 6 | `""` | `""` | 通过 |

标准错误输出实录

- `scalar`：`"TOTAL: 0H-0M-0S-0us\n"`
- `scalar_bool`：`""`
- `global_scalar_conversion`：`""`

在含本目录的源码副本根目录构建编译器后，可用以下命令复跑 `scalar.sy`。
另外两个用例替换文件名即可。

~~~bash
./bin/compiler testresult-lab3/scalar.sy -llvm -O0 -o /tmp/lab3-scalar.ll
llvm-as-15 /tmp/lab3-scalar.ll -o /dev/null
clang-15 -Wno-override-module -static /tmp/lab3-scalar.ll -L./lib -lsysy_x86 -o /tmp/lab3-scalar
/tmp/lab3-scalar
printf "exit=%s\n" "$?"
~~~
