#include <middleend/visitor/codegen/ast_codegen.h>

namespace ME
{
    void ASTCodeGen::visit(FE::AST::ExprStmt& node, Module* m)
    {
        if (!node.expr) return;
        apply(*this, *node.expr, m);
    }

    void ASTCodeGen::visit(FE::AST::FuncDeclStmt& node, Module* m)
    {
        // TODO(Lab 3-2): 生成函数定义 IR（形参、入口/结束基本块、返回补丁）
        // 设置函数返回类型与参数寄存器，创建基本块骨架，并生成函数体
        // (void)node;
        // (void)m;
        // TODO("Lab3-2: Implement FuncDeclStmt IR generation");

        const auto retType = convert(node.retType);
        auto* def = new FuncDefInst(retType, node.entry->getName());
        auto* function = new Function(def);
        enterFunc(function);
        enterBlock(createBlock());
        name2reg.enterScope();
        reg2attr.clear();

        std::vector<std::pair<FE::AST::ParamDeclarator*, size_t>> parameters;
        if (node.params)
        {
            for (auto* param : *node.params)
            {
                const auto& attr = param->varAttr;
                const auto type = attr.isPointer ? DataType::PTR : convert(attr.type);
                size_t incoming = getNewRegId();
                def->argRegs.emplace_back(type, getRegOperand(incoming));
                parameters.emplace_back(param, incoming);
            }
        }

        // 指针形参已有地址。标量形参写入入口块的局部存储。
        for (const auto& [param, incoming] : parameters)
        {
            const auto& attr = param->varAttr;
            size_t address = incoming;
            if (!attr.isPointer)
            {
                const auto type = convert(attr.type);
                address = newEntryAlloca(type);
                insert(createStoreInst(type, incoming, getRegOperand(address)));
            }
            name2reg.addSymbol(param->entry, address);
            reg2attr[address] = attr;
        }

        if (node.body) apply(*this, *node.body, m);
        // 函数收尾时封闭空出口和其它未终止的基本块。
        for (const auto& [label, block] : function->blocks)
        {
            enterBlock(block);
            if (currentBlockTerminated()) continue;
            if (retType == DataType::VOID)
                insert(createRetInst());
            else if (retType == DataType::F32)
                insert(createRetInst(0.0f));
            else
                insert(createRetInst(0));
        }
        name2reg.exitScope();
        exitBlock();
        exitFunc();
        m->functions.push_back(function);
    }

    void ASTCodeGen::visit(FE::AST::VarDeclStmt& node, Module* m)
    {
        // TODO(Lab 3-2): 生成变量声明语句 IR（局部变量分配、初始化）
        // (void)node;
        // (void)m;
        // TODO("Lab3-2: Implement VarDeclStmt IR generation");

        if (!node.decl) return;
        apply(*this, *node.decl, m);
    }

    void ASTCodeGen::visit(FE::AST::BlockStmt& node, Module* m)
    {
        // TODO(Lab 3-2): 生成语句块 IR（作用域管理，顺序生成子语句）
        // (void)node;
        // (void)m;
        // TODO("Lab3-2: Implement BlockStmt IR generation");

        if (!node.stmts) return;
        name2reg.enterScope();
        for (auto* stmt : *node.stmts)
        {
            if (!stmt) continue;
            if (currentBlockTerminated()) enterBlock(createBlock());
            apply(*this, *stmt, m);
        }
        name2reg.exitScope();
    }

    void ASTCodeGen::visit(FE::AST::ReturnStmt& node, Module* m)
    {
        // TODO(Lab 3-2): 生成 return 语句 IR（可选返回值与类型转换）
        // (void)node;
        // (void)m;
        // TODO("Lab3-2: Implement ReturnStmt IR generation");

        if (!node.retExpr)
        {
            insert(createRetInst());
            return;
        }

        auto& expr = *node.retExpr;
        size_t value = genExpr(expr, m);
        const auto retType = curFunc->funcDef->retType;
        value = castReg(value, convert(expr.attr.val.value.type), retType);
        insert(createRetInst(retType, value));
    }

    void ASTCodeGen::visit(FE::AST::WhileStmt& node, Module* m)
    {
        // TODO(Lab 3-2): 生成 while 循环 IR（条件块、循环体与结束块、循环标签）
        (void)node;
        (void)m;
        TODO("Lab3-2: Implement WhileStmt IR generation");
    }

    void ASTCodeGen::visit(FE::AST::IfStmt& node, Module* m)
    {
        // TODO(Lab 3-2): 生成 if/else IR（then/else/end 基本块与条件分支）
        (void)node;
        (void)m;
        TODO("Lab3-2: Implement IfStmt IR generation");
    }

    void ASTCodeGen::visit(FE::AST::BreakStmt& node, Module* m)
    {
        // TODO(Lab 3-2): 生成 break 的无条件跳转至循环结束块
        (void)node;
        (void)m;
        TODO("Lab3-2: Implement BreakStmt IR generation");
    }

    void ASTCodeGen::visit(FE::AST::ContinueStmt& node, Module* m)
    {
        // TODO(Lab 3-2): 生成 continue 的无条件跳转至循环步进/条件块
        (void)node;
        (void)m;
        TODO("Lab3-2: Implement ContinueStmt IR generation");
    }

    void ASTCodeGen::visit(FE::AST::ForStmt& node, Module* m)
    {
        // TODO(Lab 3-2): 生成 for 循环 IR（init/cond/body/step 基本块与循环标签）
        (void)node;
        (void)m;
        TODO("Lab3-2: Implement ForStmt IR generation");
    }
}  // namespace ME
