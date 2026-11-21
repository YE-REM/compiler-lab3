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
        bool res  = apply(*this, *node.init_val);
        node.attr = node.init_val->attr;
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

    bool ASTChecker::visit(VarDeclarator& node)
    {
        // TODO(Lab3-1): 实现变量声明器的语义检查
        // 访问左值表达式，同步属性，处理初始化器（如果有）
        (void)node;
        TODO("Lab3-1: Implement VarDeclarator semantic checking");
    }

    bool ASTChecker::visit(ParamDeclarator& node)
    {
        // TODO(Lab3-1): 实现函数形参的语义检查
        // 检查形参重定义，处理数组形参的类型退化，将形参加入符号表
        // (void)node;
        // TODO("Lab3-1: Implement ParamDeclarator semantic checking");

        const size_t errorsBefore = errors.size();
        Type* elem = elementType(node.type);
        node.varAttr              = VarAttr();
        node.varAttr.type         = elem;
        node.varAttr.isTensor     = isTensorType(node.type);
        node.varAttr.isParam      = true;
        node.varAttr.scopeLevel   = 1;

        node.attr.val.value.type     = elem;
        node.attr.val.value.isTensor = node.varAttr.isTensor;
        node.attr.val.value.isArray  = false;
        node.attr.val.value.dims.clear();

        if (node.dims && !node.dims->empty())
        {
            // 形参数组的第一维退化为指针，第一维可以是 [] 或具体大小
            std::vector<int> dims;
            dims.push_back(-1);
            for (size_t i = 0; i < node.dims->size(); ++i)
            {
                ExprNode* dimExpr = (*node.dims)[i];
                if (!dimExpr) continue;
                bool ok = apply(*this, *dimExpr);
                int  val = 0;
                if (!ok || !evalConstInt(dimExpr, val))
                {
                    reportError("array parameter dimension must be a constant integer", *dimExpr);
                    val = 1;
                }
                if (i == 0)
                {
                    // 第一维允许为 -1（[]），也允许写具体大小；统一按指针处理
                    continue;
                }
                if (val <= 0)
                {
                    reportError("array parameter dimension must be positive", *dimExpr);
                    val = 1;
                }
                dims.push_back(val);
            }
            node.varAttr.arrayDims = dims;
            node.varAttr.isPointer = true;
            node.attr.val.value.dims     = dims;
            node.attr.val.value.isArray  = true;
            node.attr.val.value.isTensor = node.varAttr.isTensor;
        }
        else
        {
            node.varAttr.isPointer = false;
        }
        return errors.size() == errorsBefore;
    }

    bool ASTChecker::visit(VarDeclaration& node)
    {
        // TODO(Lab3-1): 实现变量声明的语义检查
        // 遍历声明列表，检查重定义，处理数组维度和初始化，将符号加入符号表
        (void)node;
        TODO("Lab3-1: Implement VarDeclaration semantic checking");
    }
}  // namespace FE::AST
