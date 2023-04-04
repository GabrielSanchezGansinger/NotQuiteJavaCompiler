package analysis;

import notquitejava.ast.NQJExpr;

/** Array extension for types. */
public class ArrayType extends Type {
    public final Type baseType;

    public final NQJExpr dimSize;

    public ArrayType(Type baseType, NQJExpr dimSize) {
        this.baseType = baseType;
        this.dimSize = dimSize;
    }

    @Override
    boolean isSubtypeOf(Type other) {
        if (other instanceof ArrayType) {
            ArrayType ct = (ArrayType) other;
            return baseType.isSubtypeOf(ct.baseType);
        }
        return other == ANY;
    }


    @Override
    public String toString() {
        return baseType.toString() + "[]";
    }

    public Type getBaseType() {
        return baseType;
    }
}
