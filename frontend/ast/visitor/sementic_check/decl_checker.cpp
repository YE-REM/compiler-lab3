#include <frontend/ast/visitor/sementic_check/ast_checker.h>
#include <debug.h>
#include <algorithm>
#include <functional>
#include <limits>

namespace FE::AST
{
    namespace
    {
        VarValue zeroValue(Type* elem)
        {
            if (elem && elem->getBaseType() == Type_t::FLOAT) return VarValue(0.0f);
            return VarValue(0);
        }

        VarValue convertValue(const VarValue& v, Type* elem)
        {
            if (!elem) return v;
            if (elem->getBaseType() == Type_t::FLOAT)
            {
                if (v.type == floatType) return v;
                if (v.type == intType || v.type == boolType || v.type == llType) return VarValue(v.getFloat());
                return VarValue(0.0f);
            }
            if (elem->getBaseType() == Type_t::INT || elem->getBaseType() == Type_t::LL)
            {
                if (v.type == intType) return v;
                if (v.type == floatType || v.type == boolType || v.type == llType) return VarValue(v.getInt());
                return VarValue(0);
            }
            return v;
        }
    }  // namespace

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

    bool ASTChecker::visit(VarDeclarator& node)
    {
        // TODO(Lab3-1): 实现变量声明器的语义检查
        // 访问左值表达式，同步属性，处理初始化器（如果有）
        // (void)node;
        // TODO("Lab3-1: Implement VarDeclarator semantic checking");

        auto* lhs = dynamic_cast<LeftValExpr*>(node.lval);
        if (!lhs || !lhs->entry)
        {
            reportError("invalid variable declarator", node);
            return false;
        }

        VarAttr& attr = node.varAttr;
        if (symTable.hasSymbolInCurrentScope(lhs->entry) ||
            (attr.isGlobal && glbSymbols.find(lhs->entry) != glbSymbols.end()))
        {
            reportError("redefinition of symbol '" + lhs->entry->getName() + "'", node);
            return false;
        }

        bool ok = true;
        if (lhs->indices)
        {
            for (ExprNode* index : *lhs->indices)
            {
                if (!index) continue;
                int extent = 0;
                if (!apply(*this, *index) || !evalConstInt(index, extent))
                {
                    reportError("array dimension must be a constant integer", *index);
                    extent = 1;
                    ok = false;
                }
                if (extent <= 0)
                {
                    reportError("array dimension must be positive", *index);
                    extent = 1;
                    ok = false;
                }
                attr.arrayDims.push_back(extent);
            }
        }

        symTable.addSymbol(lhs->entry, attr);
        if (attr.isGlobal) glbSymbols[lhs->entry] = attr;

        lhs->attr.val.value.type     = attr.type;
        lhs->attr.val.value.isTensor = attr.isTensor;
        lhs->attr.val.value.isArray  = !attr.arrayDims.empty();
        lhs->attr.val.value.dims     = attr.arrayDims;
        if (!attr.isGlobal) lhs->isLval = true;

        ok &= checkVarInit(node, attr, attr.isGlobal);
        // 初始化检查会填写 constValue/initList，回写给后续的符号查询。
        symTable.addSymbol(lhs->entry, attr);
        if (attr.isGlobal) glbSymbols[lhs->entry] = attr;
        return ok;
    }

    bool ASTChecker::visit(ParamDeclarator& node)
    {
        // TODO(Lab3-1): 实现函数形参的语义检查
        // 检查形参重定义，处理数组形参的类型退化，将形参加入符号表
        // (void)node;
        // TODO("Lab3-1: Implement ParamDeclarator semantic checking");

        // 签名扫描计算形参类型，进入函数作用域后再登记符号。
        if (!symTable.isGlobalScope())
        {
            if (symTable.hasSymbolInCurrentScope(node.entry))
            {
                reportError("duplicate parameter '" + node.entry->getName() + "'", node);
                return false;
            }

            VarAttr attr = node.varAttr;
            if (!attr.type) attr.type = elementType(node.type);
            attr.isParam = true;
            attr.scopeLevel = symTable.getScopeDepth();
            symTable.addSymbol(node.entry, attr);
            return true;
        }

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
        // (void)node;
        // TODO("Lab3-1: Implement VarDeclaration semantic checking");

        Type* elem = elementType(node.type);
        if (elem == voidType)
        {
            reportError("variable cannot have void type", node);
            return false;
        }
        if (!node.decls) return true;

        VarAttr attr(elem, node.isConstDecl, symTable.getScopeDepth());
        attr.isTensor = isTensorType(node.type);
        attr.isGlobal = symTable.isGlobalScope();
        bool ok = true;
        for (VarDeclarator* declarator : *node.decls)
        {
            if (!declarator) continue;
            declarator->varAttr = attr;
            ok &= apply(*this, *declarator);
        }
        return ok;
    }

    bool ASTChecker::evalConstInt(ExprNode* expr, int& value)
    {
        if (!expr || !expr->attr.val.isConstexpr) return false;
        const VarValue& v = expr->attr.val.value;
        if (!isScalarValue(v) || v.type != intType) return false;
        value = v.getInt();
        return true;
    }

    bool ASTChecker::checkVarInit(VarDeclarator& decl, VarAttr& attr, bool isGlobal)
    {
        decl.arrayInitElements.clear();
        if (!decl.init)
        {
            if (attr.isConstDecl)
            {
                reportError("const variable must be initialized", decl);
                return false;
            }
            return true;
        }

        Type*            elem = elementType(attr.type);
        const auto& dims = attr.arrayDims;

        if (dims.empty())
        {
            Initializer* init = dynamic_cast<Initializer*>(decl.init);
            if (!init)
            {
                reportError("scalar variable cannot be initialized with an initializer list", decl);
                return false;
            }
            if (!apply(*this, *init)) return false;
            if (!checkAssignable(attr, *init->init_val, "initializer")) return false;
            if (isGlobal && !init->init_val->attr.val.isConstexpr)
            {
                reportError("global variable initializer must be a constant expression", *init->init_val);
                return false;
            }
            if (attr.isConstDecl && !init->init_val->attr.val.isConstexpr)
            {
                reportError("const variable initializer must be a constant expression", *init->init_val);
                return false;
            }
            attr.constValue = convertValue(init->init_val->attr.val.value, elem);
            attr.isInitialized = true;
            return true;
        }

        // tensor 允许用同形状的 tensor 表达式初始化（例如 tensor int c[4] = a + b * 2;）
        if (attr.isTensor)
        {
            if (Initializer* exprInit = dynamic_cast<Initializer*>(decl.init))
            {
                if (!apply(*this, *exprInit)) return false;
                if (!checkAssignable(attr, *exprInit->init_val, "tensor initializer")) return false;
                if (isGlobal && !exprInit->init_val->attr.val.isConstexpr)
                {
                    reportError("global tensor initializer must be a constant expression", *exprInit->init_val);
                    return false;
                }
                attr.isInitialized = true;
                attr.initList.clear();
                return true;
            }
        }

        InitializerList* init = dynamic_cast<InitializerList*>(decl.init);
        if (!init)
        {
            reportError("array/tensor variable must be initialized with an initializer list", decl);
            return false;
        }

        // 缺省尾部保持隐式零，避免按整个数组容量分配语义值。
        attr.initList.clear();
        if (!flattenInitializer(*init, decl, attr, isGlobal)) return false;
        attr.isInitialized = true;
        return true;
    }

    bool ASTChecker::flattenInitializer(InitializerList& init, VarDeclarator& decl, VarAttr& attr, bool isGlobal)
    {
        const auto& dims = attr.arrayDims;
        const size_t rank = dims.size();
        Type* elem = elementType(attr.type);

        // strides[d] 是从深度 d 开始的子对象容量。深度 rank 是单个标量。
        std::vector<size_t> strides(rank + 1, 1);
        for (size_t d = rank; d > 0; --d)
        {
            int extent = dims[d - 1];
            if (extent <= 0 || strides[d] > static_cast<size_t>(std::numeric_limits<int>::max()) / extent)
            {
                reportError("invalid array/tensor size", decl);
                return false;
            }
            strides[d - 1] = strides[d] * static_cast<size_t>(extent);
        }

        std::function<bool(InitializerList&, size_t, size_t)> fill =
            [&](InitializerList& list, size_t depth, size_t start) {
                if (!list.init_list)
                {
                    reportError("invalid initializer list", list);
                    return false;
                }

                size_t cursor = start;
                const size_t end = start + strides[depth];
                for (InitDecl* child : *list.init_list)
                {
                    if (!child) continue;
                    if (cursor == end)
                    {
                        const char* message = depth == 0 ? "too many initializers" : "too many initializers for sub-array";
                        if (depth == rank) message = "too many initializers for scalar element";
                        reportError(message, *child);
                        return false;
                    }

                    if (auto* nested = dynamic_cast<InitializerList*>(child))
                    {
                        // 按当前下标选择能对齐的最大子对象，不把游标移到下一行。
                        // 若各层都未对齐，这层花括号就包住当前位置的一个标量。
                        size_t childDepth = std::min(depth + 1, rank);
                        while (childDepth < rank && cursor % strides[childDepth] != 0) ++childDepth;
                        if (!fill(*nested, childDepth, cursor)) return false;
                        // 一个列表占完整的子对象空间，余下位置隐式补零。
                        cursor += strides[childDepth];
                        continue;
                    }

                    auto* scalar = dynamic_cast<Initializer*>(child);
                    if (!scalar || !scalar->init_val)
                    {
                        reportError("invalid initializer element", *child);
                        return false;
                    }
                    if (!apply(*this, *scalar)) return false;
                    ExprNode& value = *scalar->init_val;
                    const VarValue& v = value.attr.val.value;
                    if (!isArithmeticScalar(v))
                    {
                        reportError("initializer element must be a scalar", value);
                        return false;
                    }
                    if ((isGlobal || attr.isConstDecl) && !value.attr.val.isConstexpr)
                    {
                        reportError(isGlobal ? "global initializer element must be a constant expression"
                                             : "const initializer element must be a constant expression",
                            value);
                        return false;
                    }
                    if (!isGlobal) decl.arrayInitElements.push_back({cursor, scalar});
                    if (isGlobal || attr.isConstDecl)
                    {
                        if (attr.initList.size() <= cursor) attr.initList.resize(cursor + 1, zeroValue(elem));
                        attr.initList[cursor] = convertValue(v, elem);
                    }
                    ++cursor;
                }
                return true;
            };

        return fill(init, 0, 0);
    }
}  // namespace FE::AST
