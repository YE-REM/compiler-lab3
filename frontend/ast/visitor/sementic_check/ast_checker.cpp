#include <frontend/ast/visitor/sementic_check/ast_checker.h>
#include <debug.h>
#include <algorithm>

namespace FE::AST
{
    bool ASTChecker::visit(Root& node)
    {
        // TODO(Lab3-1): 实现根节点的语义检查
        // 重置符号表，遍历所有顶层语句进行检查，确保存在main函数
        // (void)node;
        // TODO("Lab3-1: Implement Root node semantic checking");

        symTable.reset();
        glbSymbols.clear();
        errors.clear();
        mainExists = false;
        for (const auto& [entry, fd] : funcDecls)
        {
            VarAttr attr(elementType(fd->retType), false, 0);
            attr.isFunction = true;
            attr.isGlobal = true;
            symTable.addSymbol(entry, attr);
        }

        if (node.getStmts())
        {
            for (StmtNode* stmt : *node.getStmts())
            {
                if (!stmt) continue;
                if (auto* fn = dynamic_cast<FuncDeclStmt*>(stmt))
                {
                    registerFunctionSignature(*fn);
                    if (fn->entry && fn->entry->getName() == "main")
                    {
                        mainExists = true;
                        if (fn->retType != intType || (fn->params && !fn->params->empty()))
                            reportError("main must have signature int main()", *fn);
                    }
                }
                else if (auto* decl = dynamic_cast<VarDeclStmt*>(stmt))
                {
                    apply(*this, *decl);
                }
                else
                {
                    reportError("statement is not allowed at global scope", *stmt);
                }
            }
        }

        if (node.getStmts())
        {
            for (StmtNode* stmt : *node.getStmts())
            {
                if (auto* fn = dynamic_cast<FuncDeclStmt*>(stmt)) apply(*this, *fn);
            }
        }
        if (!mainExists) reportErrorAt("main function is not defined", -1);
        return errors.empty();
    }

    void ASTChecker::libFuncRegister()
    {
        // 示例实现：注册 SysY 标准库函数到 funcDecls 中
        // 这样在语义检查时可以识别并检查对库函数的调用
        // 包括：getint, getch, getarray, getfloat, getfarray,
        //      putint, putch, putarray, putfloat, putfarray,
        //      _sysy_starttime, _sysy_stoptime
        using SymEnt = FE::Sym::Entry;

        // int getint(), getch(), getarray(int a[]);
        static SymEnt* getint   = SymEnt::getEntry("getint");
        static SymEnt* getch    = SymEnt::getEntry("getch");
        static SymEnt* getarray = SymEnt::getEntry("getarray");

        // float getfloat();
        static SymEnt* getfloat = SymEnt::getEntry("getfloat");

        // int getfarray(float a[]);
        static SymEnt* getfarray = SymEnt::getEntry("getfarray");

        // void putint(int a), putch(int a), putarray(int n, int a[]);
        static SymEnt* putint   = SymEnt::getEntry("putint");
        static SymEnt* putch    = SymEnt::getEntry("putch");
        static SymEnt* putarray = SymEnt::getEntry("putarray");

        // void putfloat(float a);
        static SymEnt* putfloat = SymEnt::getEntry("putfloat");

        // void putfarray(int n, float a[]);
        static SymEnt* putfarray = SymEnt::getEntry("putfarray");

        // void starttime(), stoptime();
        static SymEnt* _sysy_starttime = SymEnt::getEntry("_sysy_starttime");
        static SymEnt* _sysy_stoptime  = SymEnt::getEntry("_sysy_stoptime");

        // int getint()
        funcDecls[getint] = new FuncDeclStmt(intType, getint, nullptr);

        // int getch()
        funcDecls[getch] = new FuncDeclStmt(intType, getch, nullptr);

        // int getarray(int a[])
        auto getarray_params = new std::vector<ParamDeclarator*>();
        auto getarray_param  = new ParamDeclarator(TypeFactory::getPtrType(intType), SymEnt::getEntry("a"));
        getarray_param->attr.val.value.type = TypeFactory::getPtrType(intType);
        getarray_params->push_back(getarray_param);
        funcDecls[getarray] = new FuncDeclStmt(intType, getarray, getarray_params);

        // float getfloat()
        funcDecls[getfloat] = new FuncDeclStmt(floatType, getfloat, nullptr);

        // int getfarray(float a[])
        auto getfarray_params = new std::vector<ParamDeclarator*>();
        auto getfarray_param  = new ParamDeclarator(TypeFactory::getPtrType(floatType), SymEnt::getEntry("a"));
        getfarray_param->attr.val.value.type = TypeFactory::getPtrType(floatType);
        getfarray_params->push_back(getfarray_param);
        funcDecls[getfarray] = new FuncDeclStmt(intType, getfarray, getfarray_params);

        // void putint(int a)
        auto putint_params                = new std::vector<ParamDeclarator*>();
        auto putint_param                 = new ParamDeclarator(intType, SymEnt::getEntry("a"));
        putint_param->attr.val.value.type = intType;
        putint_params->push_back(putint_param);
        funcDecls[putint] = new FuncDeclStmt(voidType, putint, putint_params);

        // void putch(int a)
        auto putch_params                = new std::vector<ParamDeclarator*>();
        auto putch_param                 = new ParamDeclarator(intType, SymEnt::getEntry("a"));
        putch_param->attr.val.value.type = intType;
        putch_params->push_back(putch_param);
        funcDecls[putch] = new FuncDeclStmt(voidType, putch, putch_params);

        // void putarray(int n, int a[])
        auto putarray_params                 = new std::vector<ParamDeclarator*>();
        auto putarray_param1                 = new ParamDeclarator(intType, SymEnt::getEntry("n"));
        putarray_param1->attr.val.value.type = intType;
        auto putarray_param2 = new ParamDeclarator(TypeFactory::getPtrType(intType), SymEnt::getEntry("a"));
        putarray_param2->attr.val.value.type = TypeFactory::getPtrType(intType);
        putarray_params->push_back(putarray_param1);
        putarray_params->push_back(putarray_param2);
        funcDecls[putarray] = new FuncDeclStmt(voidType, putarray, putarray_params);

        // void putfloat(float a)
        auto putfloat_params                = new std::vector<ParamDeclarator*>();
        auto putfloat_param                 = new ParamDeclarator(floatType, SymEnt::getEntry("a"));
        putfloat_param->attr.val.value.type = floatType;
        putfloat_params->push_back(putfloat_param);
        funcDecls[putfloat] = new FuncDeclStmt(voidType, putfloat, putfloat_params);

        // void putfarray(int n, float a[])
        auto putfarray_params                 = new std::vector<ParamDeclarator*>();
        auto putfarray_param1                 = new ParamDeclarator(intType, SymEnt::getEntry("n"));
        putfarray_param1->attr.val.value.type = intType;
        auto putfarray_param2 = new ParamDeclarator(TypeFactory::getPtrType(floatType), SymEnt::getEntry("a"));
        putfarray_param2->attr.val.value.type = TypeFactory::getPtrType(floatType);
        putfarray_params->push_back(putfarray_param1);
        putfarray_params->push_back(putfarray_param2);
        funcDecls[putfarray] = new FuncDeclStmt(voidType, putfarray, putfarray_params);

        // void _sysy_starttime(int lineno)
        auto starttime_params                = new std::vector<ParamDeclarator*>();
        auto starttime_param                 = new ParamDeclarator(intType, SymEnt::getEntry("lineno"));
        starttime_param->attr.val.value.type = intType;
        starttime_params->push_back(starttime_param);
        funcDecls[_sysy_starttime] = new FuncDeclStmt(voidType, _sysy_starttime, starttime_params);

        // void _sysy_stoptime(int lineno)
        auto stoptime_params                = new std::vector<ParamDeclarator*>();
        auto stoptime_param                 = new ParamDeclarator(intType, SymEnt::getEntry("lineno"));
        stoptime_param->attr.val.value.type = intType;
        stoptime_params->push_back(stoptime_param);
        funcDecls[_sysy_stoptime] = new FuncDeclStmt(voidType, _sysy_stoptime, stoptime_params);
    }

    void ASTChecker::reportError(const std::string& msg, const Node& node)
    {
        reportErrorAt(msg, node.line_num);
    }

    void ASTChecker::reportErrorAt(const std::string& msg, int line)
    {
        if (line >= 0) errors.push_back(msg + " at line " + std::to_string(line));
        else errors.push_back(msg);
    }

    Type* ASTChecker::elementType(Type* t) const
    {
        if (!t) return voidType;
        if (t->getTypeGroup() == TypeGroup::TENSOR) return static_cast<TensorType*>(t)->elem;
        return t;
    }

    bool ASTChecker::isTensorType(Type* t) const
    {
        return t && t->getTypeGroup() == TypeGroup::TENSOR;
    }

    bool ASTChecker::isScalarValue(const VarValue& v) const
    {
        return v.type && v.type->getTypeGroup() == TypeGroup::BASIC && !v.isTensor && !v.isArray && v.dims.empty();
    }

    bool ASTChecker::isArithmeticScalar(const VarValue& v) const
    {
        if (!isScalarValue(v)) return false;
        Type_t k = v.type->getBaseType();
        return k == Type_t::INT || k == Type_t::FLOAT || k == Type_t::BOOL || k == Type_t::LL;
    }

    VarAttr* ASTChecker::lookupSymbol(FE::Sym::Entry* entry)
    {
        if (!entry) return nullptr;
        return symTable.getSymbol(entry);
    }

    bool ASTChecker::checkAssignable(
        Type* dstType, bool dstTensor, const std::vector<int>& dstDims, ExprNode& src, const std::string& context)
    {
        const VarValue& v = src.attr.val.value;
        if (!v.type || v.type == voidType)
        {
            reportError("void value cannot be used in " + context, src);
            return false;
        }

        Type* dstElem = elementType(dstType);
        if (dstTensor)
        {
            if (!v.isTensor || v.type->getBaseType() != dstElem->getBaseType() || v.dims != dstDims)
            {
                reportError("tensor type/shape mismatch in " + context, src);
                return false;
            }
            return true;
        }

        if (v.isTensor || v.isArray || !v.dims.empty())
        {
            reportError("array/tensor value cannot be used as scalar in " + context, src);
            return false;
        }

        Type_t dk = dstElem->getBaseType();
        Type_t sk = v.type->getBaseType();
        if (dk != Type_t::INT && dk != Type_t::FLOAT)
        {
            reportError("invalid assignment target type in " + context, src);
            return false;
        }
        if (sk != Type_t::INT && sk != Type_t::FLOAT && sk != Type_t::BOOL && sk != Type_t::LL)
        {
            reportError("invalid scalar value in " + context, src);
            return false;
        }
        return true;
    }

    bool ASTChecker::checkAssignable(
        const VarAttr& dst, ExprNode& src, const std::string& context)
    {
        return checkAssignable(dst.type, dst.isTensor, dst.arrayDims, src, context);
    }
}  // namespace FE::AST
