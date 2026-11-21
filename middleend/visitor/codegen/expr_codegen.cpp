#include <middleend/visitor/codegen/ast_codegen.h>
#include <algorithm>
#include <numeric>

namespace ME
{
    void ASTCodeGen::visit(FE::AST::LeftValExpr& node, Module* m)
    {
        // TODO(Lab 3-2): 生成左值表达式的取址/取值 IR
        // 查找变量位置（全局或局部），处理数组下标/GEP，必要时发出load
        // (void)node;
        // (void)m;
        // TODO("Lab3-2: Implement LeftValExpr IR generation");

        Operand* address = getLValueAddress(node, m);

        const auto& value = node.attr.val.value;
        // 数组或张量表达式保留地址。只有元素和普通标量需要 load。
        if (value.isArray || value.isTensor) return;

        size_t valueReg = getNewRegId();
        insert(createLoadInst(convert(node.attr.val.value.type), address, valueReg));
    }

    void ASTCodeGen::visit(FE::AST::LiteralExpr& node, Module* m)
    {
        (void)m;

        size_t reg = getNewRegId();
        switch (node.literal.type->getBaseType())
        {
            case FE::AST::Type_t::INT:
            case FE::AST::Type_t::LL:  // treat as I32
            {
                int             val  = node.literal.getInt();
                ArithmeticInst* inst = createArithmeticI32Inst_ImmeAll(Operator::ADD, val, 0, reg);  // reg = val + 0
                insert(inst);
                break;
            }
            case FE::AST::Type_t::FLOAT:
            {
                float           val  = node.literal.getFloat();
                ArithmeticInst* inst = createArithmeticF32Inst_ImmeAll(Operator::FADD, val, 0, reg);  // reg = val + 0
                insert(inst);
                break;
            }
            default: ERROR("Unsupported literal type");
        }
    }

    void ASTCodeGen::visit(FE::AST::UnaryExpr& node, Module* m)
    {
        // TODO(Lab 3-2): 生成一元运算的 IR（访问操作数、必要的类型转换、发出运算指令）
        // (void)node;
        // (void)m;
        // TODO("Lab3-2: Implement UnaryExpr IR generation");

        if (!node.expr) return;
        if (node.attr.val.value.isTensor)
        {
            emitTensorUnary(node, m);
            return;
        }
        handleUnaryCalc(*node.expr, node.op, m);
    }

    void ASTCodeGen::handleAssign(FE::AST::LeftValExpr& lhs, FE::AST::ExprNode& rhs, Module* m)
    {
        // TODO(Lab 3-2): 生成赋值语句的 IR（计算右值、类型转换、store 到左值地址）
        // (void)lhs;
        // (void)rhs;
        // (void)m;
        // TODO("Lab3-2: Implement assignment IR generation");

        Operand* address = getLValueAddress(lhs, m);
        const auto type = convert(lhs.attr.val.value.type);
        size_t value = genExpr(rhs, m);
        if (lhs.attr.val.value.isTensor)
        {
            const auto& dims = lhs.attr.val.value.dims;
            emitTensorAssign(address->getRegNum(), value, type, std::accumulate(dims.begin(), dims.end(), 1, std::multiplies<int>()));

            // 赋值表达式的值是目标张量，元素复制结束后重新产生其地址。
            size_t result = getNewRegId();
            insert(createGEP_I32Inst(type, address, {}, {getImmeI32Operand(0)}, result));
            return;
        }

        value = castReg(value, convert(rhs.attr.val.value.type), type);
        insert(createStoreInst(type, value, address));
    }

    void ASTCodeGen::handleLogicalAnd(
        FE::AST::BinaryExpr& node, FE::AST::ExprNode& lhs, FE::AST::ExprNode& rhs, Module* m)
    {
        // TODO(Lab 3-2): 生成短路与的基本块与条件分支
        // (void)node;
        // (void)lhs;
        // (void)rhs;
        // (void)m;
        // TODO("Lab3-2: Implement logical AND codegen");

        (void)node;
        size_t tmpPtr = newEntryAlloca(DataType::I1);
        size_t lhsReg = genBool(lhs, m);
        Block* rhsBB  = createBlock();
        Block* falseBB = createBlock();
        Block* endBB  = createBlock();

        insert(createBranchInst(lhsReg, rhsBB->blockId, falseBB->blockId));
        enterBlock(falseBB);
        insert(createStoreInst(DataType::I1, getImmeI32Operand(0), getRegOperand(tmpPtr)));
        insert(createBranchInst(endBB->blockId));

        enterBlock(rhsBB);
        size_t rhsReg = genBool(rhs, m);
        insert(createStoreInst(DataType::I1, rhsReg, getRegOperand(tmpPtr)));
        insert(createBranchInst(endBB->blockId));

        enterBlock(endBB);
        size_t res   = getNewRegId();
        insert(createLoadInst(DataType::I1, getRegOperand(tmpPtr), res));
    }

    void ASTCodeGen::handleLogicalOr(
        FE::AST::BinaryExpr& node, FE::AST::ExprNode& lhs, FE::AST::ExprNode& rhs, Module* m)
    {
        // TODO(Lab 3-2): 生成短路或的基本块与条件分支
        // (void)node;
        // (void)lhs;
        // (void)rhs;
        // (void)m;
        // TODO("Lab3-2: Implement logical OR codegen");

        (void)node;
        size_t tmpPtr  = newEntryAlloca(DataType::I1);
        size_t lhsReg  = genBool(lhs, m);
        Block* trueBB  = createBlock();
        Block* rhsBB   = createBlock();
        Block* endBB   = createBlock();

        insert(createBranchInst(lhsReg, trueBB->blockId, rhsBB->blockId));
        enterBlock(trueBB);
        insert(createStoreInst(DataType::I1, getImmeI32Operand(1), getRegOperand(tmpPtr)));
        insert(createBranchInst(endBB->blockId));

        enterBlock(rhsBB);
        size_t rhsReg = genBool(rhs, m);
        insert(createStoreInst(DataType::I1, rhsReg, getRegOperand(tmpPtr)));
        insert(createBranchInst(endBB->blockId));

        enterBlock(endBB);
        size_t res = getNewRegId();
        insert(createLoadInst(DataType::I1, getRegOperand(tmpPtr), res));
    }

    void ASTCodeGen::visit(FE::AST::BinaryExpr& node, Module* m)
    {
        // TODO(Lab 3-2): 生成二元表达式 IR（含赋值、逻辑与/或、算术/比较）
        // (void)node;
        // (void)m;
        // TODO("Lab3-2: Implement BinaryExpr IR generation");

        if (!node.lhs || !node.rhs) return;

        if (node.op == FE::AST::Operator::ASSIGN)
        {
            auto* lhs = dynamic_cast<FE::AST::LeftValExpr*>(node.lhs);
            if (!lhs) ERROR("Assignment lhs is not a left-value expression");
            handleAssign(*lhs, *node.rhs, m);
            return;
        }

        if (node.op == FE::AST::Operator::AND)
        {
            handleLogicalAnd(node, *node.lhs, *node.rhs, m);
            return;
        }
        if (node.op == FE::AST::Operator::OR)
        {
            handleLogicalOr(node, *node.lhs, *node.rhs, m);
            return;
        }
        if (node.lhs->attr.val.value.isTensor || node.rhs->attr.val.value.isTensor)
        {
            emitTensorElementwise(node, m);
            return;
        }

        // 长加法链的迭代生成，避免左深 AST 造成递归爆栈。
        if (node.op == FE::AST::Operator::ADD && !node.attr.val.value.isTensor && !node.attr.val.value.isArray)
        {
            std::vector<FE::AST::ExprNode*> operands;
            FE::AST::ExprNode*              cur = &node;
            while (auto* b = dynamic_cast<FE::AST::BinaryExpr*>(cur))
            {
                if (b->op != FE::AST::Operator::ADD || !b->lhs || !b->rhs) break;
                operands.push_back(b->rhs);
                cur = b->lhs;
            }
            if (operands.size() > 1)
            {
                operands.push_back(cur);
                std::reverse(operands.begin(), operands.end());

                size_t   accReg  = genExpr(*operands[0], m);
                DataType accType = convert(operands[0]->attr.val.value.type);
                for (size_t i = 1; i < operands.size(); ++i)
                {
                    size_t   rhsReg  = genExpr(*operands[i], m);
                    DataType rhsType = convert(operands[i]->attr.val.value.type);
                    DataType pType   = (accType == DataType::F32 || rhsType == DataType::F32) ? DataType::F32
                                                                                              : DataType::I32;
                    accReg = castReg(accReg, accType, pType);
                    rhsReg = castReg(rhsReg, rhsType, pType);
                    size_t res = getNewRegId();
                    insert(new ArithmeticInst(pType == DataType::F32 ? Operator::FADD : Operator::ADD, pType,
                        getRegOperand(accReg), getRegOperand(rhsReg), getRegOperand(res)));
                    accReg  = res;
                    accType = pType;
                }
                return;
            }
        }

        handleBinaryCalc(*node.lhs, *node.rhs, node.op, m);
    }

    void ASTCodeGen::visit(FE::AST::CallExpr& node, Module* m)
    {
        // TODO(Lab 3-2): 生成函数调用 IR（准备参数、可选返回寄存器、发出call）
        // (void)node;
        // (void)m;
        // TODO("Lab3-2: Implement CallExpr IR generation");

        const auto& f = *funcDecls.at(node.func);
        CallInst::argList args;
        for (size_t i = 0; node.args && i < node.args->size(); ++i)
        {
            auto& expr = *(*node.args)[i];
            const auto& param = *(*f.params)[i];
            const auto type = param.varAttr.isPointer ? DataType::PTR : convert(param.type);
            size_t reg = genExpr(expr, m);
            if (type != DataType::PTR) reg = castReg(reg, convert(expr.attr.val.value.type), type);
            args.emplace_back(type, getRegOperand(reg));
        }

        const auto ret = convert(f.retType);
        if (ret == DataType::VOID)
            insert(createCallInst(ret, f.entry->getName(), args));
        else
            insert(createCallInst(ret, f.entry->getName(), args, getNewRegId()));
    }

    void ASTCodeGen::visit(FE::AST::CommaExpr& node, Module* m)
    {
        // TODO(Lab 3-2): 依序生成逗号表达式每个子表达式的 IR
        // (void)node;
        // (void)m;
        // TODO("Lab3-2: Implement CommaExpr IR generation");

        if (!node.exprs) return;
        for (FE::AST::ExprNode* e : *node.exprs)
        {
            if (e) genExpr(*e, m);
        }
    }

    Operand* ASTCodeGen::getLValueAddress(FE::AST::LeftValExpr& node, Module* m)
    {
        const FE::AST::VarAttr* attr;
        Operand* base;
        size_t local = name2reg.getReg(node.entry);
        if (local == static_cast<size_t>(-1))
        {
            attr = &glbSymbols.at(node.entry);
            base = getGlobalOperand(node.entry->getName());
        }
        else
        {
            attr = &reg2attr.at(local);
            base = getRegOperand(local);
        }
        if (attr->arrayDims.empty()) return base;

        auto gepDims = attr->arrayDims;
        std::vector<Operand*> indices;
        // 数组对象先跨过外层指针。形参指向第一项，GEP 直接使用尾维。
        if (attr->isPointer)
            gepDims.erase(gepDims.begin());
        else
            indices.push_back(getImmeI32Operand(0));

        const size_t used = node.indices ? node.indices->size() : 0;
        if (node.indices)
        {
            for (auto* subscript : *node.indices)
            {
                size_t reg = castReg(genExpr(*subscript, m), convert(subscript->attr.val.value.type), DataType::I32);
                indices.push_back(getRegOperand(reg));
            }
        }
        // 少下标一次时保留子数组的首项地址，供参数传递。
        if (used < attr->arrayDims.size()) indices.push_back(getImmeI32Operand(0));

        size_t result = getNewRegId();
        insert(createGEP_I32Inst(convert(attr->type), base, gepDims, indices, result));
        return getRegOperand(result);
    }


    size_t ASTCodeGen::genBool(FE::AST::ExprNode& expr, Module* m)
    {
        return castReg(genExpr(expr, m), convert(expr.attr.val.value.type), DataType::I1);
    }

    void ASTCodeGen::emitCond(FE::AST::ExprNode& node, size_t trueTarget, size_t falseTarget, Module* m)
    {
        using FE::AST::Operator;
        auto* binary = dynamic_cast<FE::AST::BinaryExpr*>(&node);
        if (binary && (binary->op == Operator::AND || binary->op == Operator::OR))
        {
            // 条件位置直接传递真、假出口。只有需要右操作数的路径才进入 rhsBB。
            Block* rhsBB = createBlock();
            if (binary->op == Operator::AND)
                emitCond(*binary->lhs, rhsBB->blockId, falseTarget, m);
            else
                emitCond(*binary->lhs, trueTarget, rhsBB->blockId, m);

            enterBlock(rhsBB);
            emitCond(*binary->rhs, trueTarget, falseTarget, m);
            return;
        }
        size_t cond = genBool(node, m);
        insert(createBranchInst(cond, trueTarget, falseTarget));
    }

}  // namespace ME
