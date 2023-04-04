package frontend;

import java.util.List;
import notquitejava.ast.*;


/**
 * Helper methods to be used inside CUP grammar rules.
 */
public class AstHelper {
    /**
     * Parsing members of classes into a class declaration.
     */
    public static NQJClassDecl classDecl(String name, String ext,
                                         NQJImplements impl, List<NQJMemberDecl> members) {
        NQJFunctionDeclList methods = NQJ.FunctionDeclList();
        NQJVarDeclList fields = NQJ.VarDeclList();
        NQJExtended extended;
        if (ext == null) {
            extended = NQJ.ExtendsNothing();
        } else {
            extended = NQJ.ExtendsClass(ext);
        }

        for (NQJMemberDecl member : members) {
            member.match(new NQJMemberDecl.MatcherVoid() {

                @Override
                public void case_FunctionDecl(NQJFunctionDecl methodDecl) {
                    methods.add(methodDecl.copy());
                }

                @Override
                public void case_VarDecl(NQJVarDecl varDecl) {
                    fields.add(varDecl.copy());
                }
            });
        }

        return NQJ.ClassDecl(name, extended, impl, fields, methods);
    }

    /** Parsing top level delcaration into a program. */
    public static NQJProgram program(List<NQJTopLevelDecl> decls) {
        NQJFunctionDeclList functions = NQJ.FunctionDeclList();
        NQJClassDeclList classDecls = NQJ.ClassDeclList();
        NQJInterfaceDeclList intefaceDecls = NQJ.InterfaceDeclList();
        for (NQJTopLevelDecl decl : decls) {
            decl.match(new NQJTopLevelDecl.MatcherVoid() {
                @Override
                public void case_FunctionDecl(NQJFunctionDecl functionDecl) {
                    functions.add(functionDecl.copy());
                }

                @Override
                public void case_ClassDecl(NQJClassDecl classDecl) {
                    classDecls.add(classDecl.copy());
                }

                @Override
                public void case_InterfaceDecl(NQJInterfaceDecl interfaceDecl) {
                    intefaceDecls.add(interfaceDecl.copy());
                }
            });
        }

        return NQJ.Program(classDecls, functions, intefaceDecls);
    }

    /**
     * Create an array type out of a type and dimensions.
     */
    public static NQJType buildArrayType(NQJType t, int dimensions) {
        for (int i = 0; i < dimensions; i++) {
            t = NQJ.TypeArray(t, NQJ.ExprNull());
        }
        return t;
    }

    /**
     * Create an array type out of a L expression and dimensions.
     */
    public static NQJType buildArrayType(NQJExprL e, int dimensions) {
        NQJType t;
        if (e instanceof NQJVarUse) {
            NQJVarUse vu = (NQJVarUse) e;
            t = NQJ.TypeClass(vu.getVarName());
        } else {
            t = NQJ.TypeClass("unknown type");
        }
        for (int i = 0; i < dimensions; i++) {
            t = NQJ.TypeArray(t, NQJ.ExprNull());
        }
        return t;
    }

    /**
     * Creates an array out of the type, the size expression, and the dimensions.
     */
    public static NQJExpr newArray(NQJType t, NQJExprList size, int dimensions) {

        //If no size is specified we return a non valid
        // NewArray that is catched in the Analysis phase
        if (size.size() == 0) {
            return NQJ.NewArray(t, NQJ.ExprNull());
        }
        for (int i = 0; i < dimensions; i++) {
            t = NQJ.TypeArray(t, NQJ.ExprNull());
        }

        for (int i = 1; i < size.size(); i++) {
            t = NQJ.TypeArray(t, size.get(i).copy());
        }

        return NQJ.NewArray(t, size.get(0).copy());

    }
}

