#include <frontend/ast/visitor/sementic_check/ast_checker.h>
#include <debug.h>

namespace FE::AST
{
    bool ASTChecker::visit(ExprStmt& node)
    {
        // 示例实现：表达式语句的语义检查
        // 空表达式直接通过，否则访问内部表达式
        if (!node.expr) return true;
        return apply(*this, *node.expr);
    }

    bool ASTChecker::visit(FuncDeclStmt& node)
    {
        // TODO(Lab3-1): 实现函数声明的语义检查
        // 检查作用域，记录函数信息，处理形参和函数体，检查返回语句
        // (void)node;
        // TODO("Lab3-1: Implement FuncDeclStmt semantic checking");

        if (!node.body)
        {
            if (!isTensorType(node.retType)) return true;
            reportError("tensor function must return a value", node);
            return false;
        }

        FuncDeclStmt* oldFunc    = curFuncDecl;
        Type*         oldRetType = curFuncRetType;
        bool          oldIsTens  = curFuncRetIsTensor;
        bool          oldHasRet  = funcHasReturn;

        curFuncDecl        = &node;
        curFuncRetType     = elementType(node.retType);
        curFuncRetIsTensor = isTensorType(node.retType);
        funcHasReturn      = false;
        node.retIsTensor   = curFuncRetIsTensor;

        symTable.enterScope();

        if (node.params)
        {
            for (ParamDeclarator* p : *node.params)
            {
                if (!p || !p->entry) continue;
                apply(*this, *p);
            }
        }

        bool ok = apply(*this, *node.body);
        if (curFuncRetIsTensor && !node.retDimsKnown)
        {
            reportError("tensor function must return a compile-time known shape", node);
            ok = false;
        }

        symTable.exitScope();

        curFuncDecl        = oldFunc;
        curFuncRetType     = oldRetType;
        curFuncRetIsTensor = oldIsTens;
        funcHasReturn      = oldHasRet;
        return ok;
    }

    bool ASTChecker::visit(VarDeclStmt& node)
    {
        // TODO(Lab3-1): 实现变量声明语句的语义检查
        // 空声明直接通过，否则委托给变量声明处理
        // (void)node;
        // TODO("Lab3-1: Implement VarDeclStmt semantic checking");

        return !node.decl || apply(*this, *node.decl);
    }

    bool ASTChecker::visit(BlockStmt& node)
    {
        // TODO(Lab3-1): 实现块语句的语义检查
        // 进入新作用域，逐条访问语句，退出作用域
        // (void)node;
        // TODO("Lab3-1: Implement BlockStmt semantic checking");

        symTable.enterScope();
        bool ok = true;
        if (node.stmts)
        {
            for (StmtNode* stmt : *node.stmts)
            {
                if (!stmt) continue;
                ok &= apply(*this, *stmt);
            }
        }
        symTable.exitScope();
        return ok;
    }

    bool ASTChecker::visit(ReturnStmt& node)
    {
        // TODO(Lab3-1): 实现返回语句的语义检查
        // 设置返回标记，检查作用域，检查返回值类型匹配
        // (void)node;
        // TODO("Lab3-1: Implement ReturnStmt semantic checking");

        funcHasReturn = true;
        if (!curFuncDecl)
        {
            reportError("return statement outside function", node);
            return false;
        }

        bool retVoid = curFuncRetType == voidType && !curFuncRetIsTensor;
        if (retVoid)
        {
            if (node.retExpr)
            {
                reportError("void function should not return a value", node);
                apply(*this, *node.retExpr);
                return false;
            }
            return true;
        }

        if (!node.retExpr)
        {
            reportError("non-void function should return a value", node);
            return false;
        }

        if (!apply(*this, *node.retExpr)) return false;

        const VarValue& v = node.retExpr->attr.val.value;
        if (curFuncRetIsTensor)
        {
            if (!v.isTensor)
            {
                reportError("tensor-returning function must return a tensor", *node.retExpr);
                return false;
            }
            if (v.type->getBaseType() != curFuncRetType->getBaseType())
            {
                reportError("returned tensor element type does not match function return type", *node.retExpr);
                return false;
            }
            if (v.dims.empty() || v.dims.front() <= 0)
            {
                reportError("returned tensor shape must be known at compile time", *node.retExpr);
                return false;
            }
            if (!curFuncDecl->retDimsKnown)
            {
                curFuncDecl->retDims      = v.dims;
                curFuncDecl->retDimsKnown = true;
                curFuncDecl->retIsTensor  = true;
            }
            else if (curFuncDecl->retDims != v.dims)
            {
                reportError("inconsistent tensor return shape", *node.retExpr);
                return false;
            }
            return true;
        }

        return checkAssignable(curFuncRetType, false, {}, *node.retExpr, "return statement");
    }

    bool ASTChecker::visit(WhileStmt& node)
    {
        // TODO(Lab3-1): 实现while循环的语义检查
        // 检查作用域，访问条件表达式，管理循环深度，访问循环体
        // (void)node;
        // TODO("Lab3-1: Implement WhileStmt semantic checking");

        bool ok = true;
        if (node.cond)
        {
            ok &= apply(*this, *node.cond);
            if (!isCondScalar(node.cond->attr.val.value))
            {
                reportError("while condition must be a scalar expression", *node.cond);
                ok = false;
            }
        }
        ++loopDepth;
        checkBranch(node.body);
        --loopDepth;
        return ok;
    }

    bool ASTChecker::visit(IfStmt& node)
    {
        // TODO(Lab3-1): 实现if语句的语义检查
        // 检查作用域，访问条件表达式，分别访问then和else分支
        // (void)node;
        // TODO("Lab3-1: Implement IfStmt semantic checking");

        bool ok = true;
        if (node.cond)
        {
            ok &= apply(*this, *node.cond);
            if (!isCondScalar(node.cond->attr.val.value))
            {
                reportError("if condition must be a scalar expression", *node.cond);
                ok = false;
            }
        }
        checkBranch(node.thenStmt);
        checkBranch(node.elseStmt);
        return ok;
    }

    bool ASTChecker::visit(BreakStmt& node)
    {
        // TODO(Lab3-1): 实现break语句的语义检查
        // 检查是否在循环内使用
        // (void)node;
        // TODO("Lab3-1: Implement BreakStmt semantic checking");

        if (loopDepth == 0)
        {
            reportError("break statement outside loop", node);
            return false;
        }
        return true;
    }

    bool ASTChecker::visit(ContinueStmt& node)
    {
        // TODO(Lab3-1): 实现continue语句的语义检查
        // 检查是否在循环内使用
        // (void)node;
        // TODO("Lab3-1: Implement ContinueStmt semantic checking");

        if (loopDepth == 0)
        {
            reportError("continue statement outside loop", node);
            return false;
        }
        return true;
    }

    bool ASTChecker::visit(ForStmt& node)
    {
        // TODO(Lab3-1): 实现for循环的语义检查
        // 检查作用域，访问初始化、条件、步进表达式，管理循环深度
        // (void)node;
        // TODO("Lab3-1: Implement ForStmt semantic checking");

        symTable.enterScope();
        bool ok = true;
        if (node.init) ok &= apply(*this, *node.init);
        if (node.cond)
        {
            ok &= apply(*this, *node.cond);
            if (!isCondScalar(node.cond->attr.val.value))
            {
                reportError("for condition must be a scalar expression", *node.cond);
                ok = false;
            }
        }
        if (node.step) ok &= apply(*this, *node.step);

        ++loopDepth;
        checkBranch(node.body);
        --loopDepth;
        symTable.exitScope();
        return ok;
    }

    void ASTChecker::registerFunctionSignature(FuncDeclStmt& node)
    {
        FE::Sym::Entry* entry = node.entry;
        if (!entry) return;

        auto it = funcDecls.find(entry);
        if (it != funcDecls.end())
        {
            // funcDecls 中已有同名函数（包括 SysY 运行时库函数）
            reportError("redefinition of function '" + entry->getName() + "'", node);
            return;
        }

        funcDecls[entry] = &node;

        VarAttr funcAttr;
        funcAttr.type       = elementType(node.retType);
        funcAttr.isTensor   = isTensorType(node.retType);
        funcAttr.isFunction = true;
        funcAttr.isGlobal   = true;
        funcAttr.scopeLevel = 0;

        if (symTable.hasSymbolInCurrentScope(entry))
        {
            reportError("redefinition of symbol '" + entry->getName() + "'", node);
        }
        else
        {
            symTable.addSymbol(entry, funcAttr);
        }

        node.attr.val.value.type     = funcAttr.type;
        node.attr.val.value.isTensor = funcAttr.isTensor;
        node.attr.val.value.isArray  = false;
        node.attr.val.value.dims.clear();

        if (node.retType->getTypeGroup() == TypeGroup::TENSOR && !node.retDimsKnown)
        {
            node.retIsTensor = true;
        }

        std::set<std::string> paramNames;
        if (node.params)
        {
            for (ParamDeclarator* p : *node.params)
            {
                if (!p || !p->entry) continue;
                const std::string& name = p->entry->getName();
                if (!paramNames.insert(name).second)
                {
                    reportError("duplicate parameter '" + name + "'", *p);
                }

                apply(*this, *p);
            }
        }
    }

    bool ASTChecker::isCondScalar(const VarValue& v) const
    {
        return isArithmeticScalar(v);
    }

    void ASTChecker::checkBranch(StmtNode* stmt)
    {
        if (!stmt) return;
        symTable.enterScope();
        apply(*this, *stmt);
        symTable.exitScope();
    }
}  // namespace FE::AST
