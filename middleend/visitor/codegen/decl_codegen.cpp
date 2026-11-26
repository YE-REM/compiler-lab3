#include <middleend/visitor/codegen/ast_codegen.h>
#include <debug.h>
#include <numeric>

namespace ME
{
    void ASTCodeGen::visit(FE::AST::Initializer& node, Module* m)
    {
        (void)m;
        ERROR("Initializer should not appear here, at line %d", node.line_num);
    }
    void ASTCodeGen::visit(FE::AST::InitializerList& node, Module* m)
    {
        (void)m;
        ERROR("InitializerList should not appear here, at line %d", node.line_num);
    }
    void ASTCodeGen::visit(FE::AST::VarDeclarator& node, Module* m)
    {
        (void)m;
        ERROR("VarDeclarator should not appear here, at line %d", node.line_num);
    }
    void ASTCodeGen::visit(FE::AST::ParamDeclarator& node, Module* m)
    {
        (void)m;
        ERROR("ParamDeclarator should not appear here, at line %d", node.line_num);
    }

    void ASTCodeGen::visit(FE::AST::VarDeclaration& node, Module* m)
    {
        // TODO(Lab 3-2): 生成变量声明 IR（alloca、数组零初始化、可选初始化表达式）
        // (void)node;
        // (void)m;
        // TODO("Lab3-2: Implement VarDeclaration IR generation");

        if (!node.decls) return;
        for (auto* decl : *node.decls)
        {
            auto* lval = static_cast<FE::AST::LeftValExpr*>(decl->lval);
            const auto& attr = decl->varAttr;
            const auto& dims = attr.arrayDims;
            const auto type = convert(attr.type);
            size_t storage = newEntryAlloca(type, dims);
            name2reg.addSymbol(lval->entry, storage);
            reg2attr[storage] = attr;

            if (!decl->init) continue;
            auto* init = dynamic_cast<FE::AST::Initializer*>(decl->init);
            if (dims.empty())
            {
                auto& expr = *init->init_val;
                size_t value = castReg(genExpr(expr, m), convert(expr.attr.val.value.type), type);
                insert(createStoreInst(type, value, getRegOperand(storage)));
                continue;
            }

            // 聚合存储先转成首元素地址。初始化偏移按元素计数。
            size_t base = getNewRegId();
            std::vector<Operand*> zeros(dims.size() + 1, getImmeI32Operand(0));
            insert(createGEP_I32Inst(type, getRegOperand(storage), dims, zeros, base));
            const auto count = std::accumulate(dims.begin(), dims.end(), 1, std::multiplies<int>());
            if (init)
            {
                // 张量表达式直接拷贝到声明分配的存储。
                auto& expr = *init->init_val;
                size_t value = genExpr(expr, m);
                emitTensorAssign(base, value, type, count);
                continue;
            }

            // 列表未写到的位置保持为零。显式初值使用语义阶段记录的偏移。
            CallInst::argList args = {
                {DataType::PTR, getRegOperand(base)},
                {DataType::I8, getImmeI32Operand(0)},
                {DataType::I32, getImmeI32Operand(static_cast<int>(4ULL * count))},
                {DataType::I1, getImmeI32Operand(0)},
            };
            insert(createCallInst(DataType::VOID, "llvm.memset.p0.i32", args));
            for (const auto& [offset, element] : decl->arrayInitElements)
            {
                auto& expr = *element->init_val;
                size_t value = castReg(genExpr(expr, m), convert(expr.attr.val.value.type), type);
                size_t address = getNewRegId();
                insert(createGEP_I32Inst(type, getRegOperand(base), {},
                    {getImmeI32Operand(static_cast<int>(offset))}, address));
                insert(createStoreInst(type, value, getRegOperand(address)));
            }
        }
    }
}  // namespace ME
