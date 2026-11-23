#include <frontend/symbol/symbol_table.h>
#include <debug.h>

namespace FE::Sym
{
    void SymTable::reset_impl()
    {
        // TODO("Lab3-1: Reset symbol table");

        scopes.clear();
        scopes.emplace_back(nullptr, 0);
        current = &scopes.back();
    }

    void SymTable::enterScope_impl()
    {
        // TODO("Lab3-1: Enter new scope");

        ASSERT(current != nullptr && "SymTable not initialized");
        scopes.emplace_back(current, current->depth + 1);
        current = &scopes.back();
    }

    void SymTable::exitScope_impl()
    {
        // TODO("Lab3-1: Exit current scope");

        ASSERT(current != nullptr && "SymTable not initialized");
        ASSERT(current->parent != nullptr && "Cannot exit global scope");
        // 注意：不删除 scope，只改变当前可见作用域。
        current = current->parent;
    }

    void SymTable::addSymbol_impl(Entry* entry, FE::AST::VarAttr& attr)
    {
        // (void)entry;
        // (void)attr;
        // TODO("Lab3-1: Add symbol to current scope");

        ASSERT(current != nullptr && "SymTable not initialized");
        ASSERT(entry != nullptr && "Cannot add a null symbol");
        current->symbols[entry] = attr;
    }

    FE::AST::VarAttr* SymTable::getSymbol_impl(Entry* entry)
    {
        // (void)entry;
        // TODO("Lab3-1: Get symbol from symbol table");

        if (!entry) return nullptr;
        for (Scope* scope = current; scope != nullptr; scope = scope->parent)
        {
            auto it = scope->symbols.find(entry);
            if (it != scope->symbols.end()) return &it->second;
        }
        return nullptr;
    }

    bool SymTable::isGlobalScope_impl()
    {
        // TODO("Lab3-1: Check if current scope is global scope");

        return current != nullptr && current->parent == nullptr;
    }

    int SymTable::getScopeDepth_impl()
    {
        // TODO("Lab3-1: Get current scope depth");

        return current ? current->depth : -1;
    }
}  // namespace FE::Sym
