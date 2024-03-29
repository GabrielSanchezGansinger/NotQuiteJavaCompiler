//generated by abstract-syntax-gen
package notquitejava.ast;
import java.util.*;

public interface NQJArrayLookup extends NQJElement, NQJExprL {
    void setArrayExpr(NQJExpr arrayExpr);
    NQJExpr getArrayExpr();
    void setArrayIndex(NQJExpr arrayIndex);
    NQJExpr getArrayIndex();
    NQJElement getParent();
    NQJArrayLookup copy();
    NQJArrayLookup copyWithRefs();
    void clearAttributes();
    void clearAttributesLocal();
    /** "information about the source code"*/
    public abstract frontend.SourcePosition getSourcePosition();
    /** "information about the source code"*/
    public abstract void setSourcePosition(frontend.SourcePosition sourcePosition);
    /** null*/
    public abstract analysis.ArrayType getArrayType();
    /** null*/
    public abstract void setArrayType(analysis.ArrayType arrayType);
}
