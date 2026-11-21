#include <middleend/visitor/codegen/ast_codegen.h>
#include <debug.h>

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

            ERROR("Array initializer lowering has not been implemented");
        }
    }
}  // namespace ME
