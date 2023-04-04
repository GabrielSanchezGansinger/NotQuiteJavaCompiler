//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

public interface Bitcast extends Assign, Element {
    void setVar(TemporaryVar var);
    TemporaryVar getVar();
    void setType(Type type);
    Type getType();
    void setExpr(Operand expr);
    Operand getExpr();
    Element getParent();
    Bitcast copy();
    Bitcast copyWithRefs();
    void clearAttributes();
    void clearAttributesLocal();
    /** */
    public abstract String toString();
}
