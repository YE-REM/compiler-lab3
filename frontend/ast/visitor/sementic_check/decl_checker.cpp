#include <frontend/ast/visitor/sementic_check/ast_checker.h>
#include <debug.h>

namespace FE::AST
{
    bool ASTChecker::visit(Initializer& node)
    {
        // 示例实现：单个初始化器的语义检查
        // 1) 访问初始化值表达式
        // 2) 将子表达式的属性拷贝到当前节点
        ASSERT(node.init_val && "Null initializer value");
        bool res = apply(*this, *node.init_val);
        node.attr = node.init_val->attr;
        if (node.attr.val.value.type == voidType)
        {
            reportError("void expression cannot be used as an initializer", *node.init_val);
            res = false;
        }
        return res;
    }

    bool ASTChecker::visit(InitializerList& node)
    {
        // 示例实现：初始化器列表的语义检查
        // 遍历列表中的每个初始化器并逐个访问
        if (!node.init_list) return true;
        bool res = true;
        for (auto* init : *(node.init_list))
        {
            if (!init) continue;
            res &= apply(*this, *init);
        }
        return res;
    }

    // bool ASTChecker::visit(VarDeclarator& node)
    // {
    //     // TODO(Lab3-1): 实现变量声明器的语义检查
    //     // 访问左值表达式，同步属性，处理初始化器（如果有）
    //     (void)node;
    //     TODO("Lab3-1: Implement VarDeclarator semantic checking");
    // }

    // bool ASTChecker::visit(ParamDeclarator& node)
    // {
    //     // TODO(Lab3-1): 实现函数形参的语义检查
    //     // 检查形参重定义，处理数组形参的类型退化，将形参加入符号表
    //     (void)node;
    //     TODO("Lab3-1: Implement ParamDeclarator semantic checking");
    // }

    bool ASTChecker::visit(VarDeclaration& node)
    {
        // TODO(Lab3-1): 实现变量声明的语义检查
        // 遍历声明列表，检查重定义，处理数组维度和初始化，将符号加入符号表
        // (void)node;
        // TODO("Lab3-1: Implement VarDeclaration semantic checking");

        Type* elem   = elementType(node.type);
        bool  isTens = isTensorType(node.type);
        bool  res    = true;

        if (elem == voidType)
        {
            reportError("variable cannot have void type", node);
            return false;
        }
        if (!node.decls) return true;
        for (VarDeclarator* d : *node.decls)
        {
            if (!d) continue;
            LeftValExpr* lv = dynamic_cast<LeftValExpr*>(d->lval);
            if (!lv || !lv->entry)
            {
                reportError("invalid variable declarator", *d);
                res = false;
                continue;
            }

            if (symTable.hasSymbolInCurrentScope(lv->entry))
            {
                reportError("redefinition of symbol '" + lv->entry->getName() + "'", *d);
                res = false;
                continue;
            }

            std::vector<int> dims;
            if (lv->indices)
            {
                for (ExprNode* idx : *lv->indices)
                {
                    if (!idx) continue;
                    bool applied = apply(*this, *idx);
                    int  val     = 0;
                    if (!applied || !evalConstInt(idx, val))
                    {
                        reportError("array dimension must be a constant integer", *idx);
                        val = 1;
                        res = false;
                    }
                    if (val <= 0)
                    {
                        reportError("array dimension must be positive", *idx);
                        val = 1;
                        res = false;
                    }
                    dims.push_back(val);
                }
            }

            if (isTens && dims.empty())
            {
                reportError("tensor declaration must specify dimensions", *d);
                res = false;
                continue;
            }

            VarAttr attr;
            attr.type        = elem;
            attr.isConstDecl = node.isConstDecl;
            attr.isTensor    = isTens;
            attr.isGlobal    = symTable.isGlobalScope();
            attr.scopeLevel  = symTable.getScopeDepth();
            attr.arrayDims   = dims;

            symTable.addSymbol(lv->entry, attr);
            d->varAttr = attr;

            lv->attr.val.value.type     = elem;
            lv->attr.val.value.isTensor = isTens;
            lv->attr.val.value.isArray  = !dims.empty();
            lv->attr.val.value.dims     = dims;
            lv->isLval                  = true;

            if (!checkVarInit(*d, attr, attr.isGlobal)) res = false;
            // 初始化检查会填写 constValue/initList，回写到符号表
            symTable.addSymbol(lv->entry, attr);
            d->varAttr = attr;
        }
        return res;
    }
}  // namespace FE::AST
