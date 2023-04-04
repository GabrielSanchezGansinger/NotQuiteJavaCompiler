package analysis;

import analysis.TypeContext.VarRef;
import minillvm.ast.TypeArray;
import notquitejava.ast.*;

/**
 * Matcher implementation for expressions returning a NQJ type.
 */
public class ExprChecker implements NQJExpr.Matcher<Type>, NQJExprL.Matcher<Type> {
    private final Analysis analysis;
    private final TypeContext ctxt;

    public ExprChecker(Analysis analysis, TypeContext ctxt) {
        this.analysis = analysis;
        this.ctxt = ctxt;
    }

    Type check(NQJExpr e) {
        return e.match(this);
    }

    Type check(NQJExprL e) {
        return e.match(this);
    }

    void expect(NQJExpr e, Type expected) {
        Type actual = check(e);
        if (!actual.isSubtypeOf(expected)) {
            analysis.addError(e, "Expected expression of type " + expected
                    + " but found " + actual + ".");
        }
    }

    Type expectArray(NQJExpr e) {
        Type actual = check(e);
        if (!(actual instanceof ArrayType)) {
            analysis.addError(e, "Expected expression of array type,  but found " + actual + ".");
            return Type.ANY;
        } else {
            return actual;
        }
    }

    @Override
    public Type case_ExprUnary(NQJExprUnary exprUnary) {
        Type t = check(exprUnary.getExpr());
        return exprUnary.getUnaryOperator().match(new NQJUnaryOperator.Matcher<Type>() {

            @Override
            public Type case_UnaryMinus(NQJUnaryMinus unaryMinus) {
                expect(exprUnary.getExpr(), Type.INT);
                return Type.INT;
            }

            @Override
            public Type case_Negate(NQJNegate negate) {
                expect(exprUnary.getExpr(), Type.BOOL);
                return Type.BOOL;
            }
        });
    }

    @Override
    public Type case_MethodCall(NQJMethodCall methodCall) {
        NQJExpr rec = methodCall.getReceiver();
        Type recType = check(rec);

        if (recType instanceof InterfaceType) {
            InterfaceType type = (InterfaceType) recType;
            if (type.getFunc(methodCall.getMethodName()) == null) {
                analysis.addError(methodCall, "Method with name "
                        + methodCall.getMethodName() + " not found");
                return Type.ANY;
            }
            NQJExprList args = methodCall.getArguments();
            NQJVarDeclList params = type.getFunc(methodCall.getMethodName()).getFormalParameters();
            if (args.size() < params.size()) {
                analysis.addError(methodCall, "Not enough arguments.");
            } else if (args.size() > params.size()) {
                analysis.addError(methodCall, "Too many arguments.");
            } else {
                for (int i = 0; i < params.size(); i++) {
                    expect(args.get(i), analysis.type(params.get(i).getType()));
                }
            }

            return analysis.type(type.getFunc(methodCall.getMethodName()).getReturnType());
        } else if ((recType instanceof ClassType)) {
            ClassType type = (ClassType) recType;
            if (type.getFunc(methodCall.getMethodName()) == null) {
                analysis.addError(methodCall, "Method with name "
                        + methodCall.getMethodName() + " not found");
                return Type.ANY;
            }
            NQJExprList args = methodCall.getArguments();
            NQJVarDeclList params = type.getFunc(methodCall.getMethodName()).getFormalParameters();
            if (args.size() < params.size()) {
                analysis.addError(methodCall, "Not enough arguments.");
            } else if (args.size() > params.size()) {
                analysis.addError(methodCall, "Too many arguments.");
            } else {
                for (int i = 0; i < params.size(); i++) {
                    expect(args.get(i), analysis.type(params.get(i).getType()));
                }
            }
            //TODO Check if all okey and refactor
            methodCall.setFunctionDeclaration(type.getFunc(methodCall.getMethodName()));

            return analysis.type(type.getFunc(methodCall.getMethodName()).getReturnType());
        } else {
            analysis.addError(methodCall, "Methods need to be called on classes");
            return Type.ANY;
        }

    }


    @Override
    public Type case_ArrayLength(NQJArrayLength arrayLength) {
        expectArray(arrayLength.getArrayExpr());
        return Type.INT;
    }

    @Override
    public Type case_ExprThis(NQJExprThis exprThis) {
        return ctxt.getThisType();
    }

    @Override
    public Type case_ExprBinary(NQJExprBinary exprBinary) {
        return exprBinary.getOperator().match(new NQJOperator.Matcher<>() {
            @Override
            public Type case_And(NQJAnd and) {
                expect(exprBinary.getLeft(), Type.BOOL);
                expect(exprBinary.getRight(), Type.BOOL);
                return Type.BOOL;
            }

            @Override
            public Type case_Times(NQJTimes times) {
                return case_intOperation();
            }

            @Override
            public Type case_Div(NQJDiv div) {
                return case_intOperation();
            }

            @Override
            public Type case_Plus(NQJPlus plus) {
                return case_intOperation();
            }

            @Override
            public Type case_Minus(NQJMinus minus) {
                return case_intOperation();
            }

            private Type case_intOperation() {
                expect(exprBinary.getLeft(), Type.INT);
                expect(exprBinary.getRight(), Type.INT);
                return Type.INT;
            }

            @Override
            public Type case_Equals(NQJEquals equals) {
                Type l = check(exprBinary.getLeft());
                Type r = check(exprBinary.getRight());
                if (!l.isSubtypeOf(r) && !r.isSubtypeOf(l)) {
                    analysis.addError(exprBinary, "Cannot compare types " + l + " and " + r + ".");
                }
                return Type.BOOL;
            }

            @Override
            public Type case_Less(NQJLess less) {
                expect(exprBinary.getLeft(), Type.INT);
                expect(exprBinary.getRight(), Type.INT);
                return Type.BOOL;
            }
        });
    }

    @Override
    public Type case_ExprNull(NQJExprNull exprNull) {
        return Type.NULL;
    }

    @Override
    public Type case_FunctionCall(NQJFunctionCall functionCall) {
        NQJFunctionDecl m = analysis.getNameTable().lookupFunction(functionCall.getMethodName());
        if (m == null) {
            analysis.addError(functionCall, "Function " + functionCall.getMethodName()
                    + " does not exists.");
            return Type.ANY;
        }
        NQJExprList args = functionCall.getArguments();
        NQJVarDeclList params = m.getFormalParameters();
        if (args.size() < params.size()) {
            analysis.addError(functionCall, "Not enough arguments.");
        } else if (args.size() > params.size()) {
            analysis.addError(functionCall, "Too many arguments.");
        } else {
            for (int i = 0; i < params.size(); i++) {
                expect(args.get(i), analysis.type(params.get(i).getType()));
            }
        }
        functionCall.setFunctionDeclaration(m);
        return analysis.type(m.getReturnType());
    }

    @Override
    public Type case_Number(NQJNumber number) {
        return Type.INT;
    }


    @Override
    public Type case_NewArray(NQJNewArray newArray) {
        expect(newArray.getArraySize(), Type.INT);
        ArrayType t = new ArrayType(analysis.type(newArray.getBaseType()), newArray.getArraySize());
        Type res = checkBaseType(newArray, newArray.getBaseType(), t);
        if (res == Type.NULL) {
            return Type.ANY;
        }
        newArray.setArrayType((ArrayType) res);
        return t;
    }

    /**
     * Checks baseType of array iterating over the nested TypeArrays.
     * Also creates nested ArrayType as in template.
     *
     * @param newArr array to be checked.
     * @param baseType baseType of Array.
     * @param arrType ArrayType of base Array.
     * @return Type.NULL if error occured Type.ArrayType if all went well.
     */
    private Type checkBaseType(NQJNewArray newArr, NQJType baseType, ArrayType arrType) {
        ArrayType res = arrType;
        while (baseType instanceof NQJTypeArray) {
            Type chk = check(((NQJTypeArray) baseType).getDimSize());
            res = new ArrayType(res, ((NQJTypeArray) baseType).getDimSize());

            if (!((chk == Type.INT) || (chk == Type.NULL))) {
                analysis.addError(newArr, "Expected size of dimension but got: " + chk.toString());
                return Type.NULL;
            }
            baseType = ((NQJTypeArray) baseType).getComponentType();
        }
        return res;
    }

    @Override
    public Type case_NewObject(NQJNewObject newObject) {
        ClassType t = analysis.getNameTable().getClassType(newObject.getClassName());
        if (t == null) {
            analysis.addError(newObject, "Class not found " + newObject.getClassName());
            return Type.ANY;
        }
        return t;
    }

    @Override
    public Type case_BoolConst(NQJBoolConst boolConst) {
        return Type.BOOL;
    }

    @Override
    public Type case_Read(NQJRead read) {
        return read.getAddress().match(this);
    }

    @Override
    public Type case_FieldAccess(NQJFieldAccess fieldAccess) {
        NQJExpr rec = fieldAccess.getReceiver();
        Type recType = check(rec);
        ClassType type;
        if (!(recType instanceof ClassType)) {
            if (recType instanceof InterfaceType) {
                type = ((InterfaceType) recType).getInitialized();
                if (type == null) {
                    analysis.addError(fieldAccess, "Cannot access field of " + recType.toString());
                    return Type.ANY;
                }
            } else {
                analysis.addError(fieldAccess, "Cannot access field of " + recType.toString());
                return Type.ANY;
            }
        } else {
            type = (ClassType) recType;
        }

        NQJVarDecl varDecl = type.getField(fieldAccess.getFieldName());
        if (varDecl == null) {
            analysis.addError(fieldAccess, "No Field in class "
                    + type.getClassName() + " with name " + fieldAccess.getFieldName());
            return Type.ANY;
        }
        return analysis.type(varDecl.getType());
    }

    @Override
    public Type case_VarUse(NQJVarUse varUse) {
        VarRef ref = ctxt.lookupVar(varUse.getVarName());
        if (ref == null) {
            analysis.addError(varUse, "Variable " + varUse.getVarName() + " is not defined.");
            return Type.ANY;
        }
        varUse.setVariableDeclaration(ref.decl);
        return ref.type;
    }

    @Override
    public Type case_ArrayLookup(NQJArrayLookup arrayLookup) {
        Type type = analysis.checkExpr(ctxt, arrayLookup.getArrayExpr());
        expect(arrayLookup.getArrayIndex(), Type.INT);
        if (type instanceof ArrayType) {
            ArrayType arrayType = (ArrayType) type;
            arrayLookup.setArrayType(arrayType);
            return arrayType.getBaseType();
        }
        analysis.addError(arrayLookup, "Expected an array for array-lookup, but found " + type);
        return Type.ANY;
    }
}
