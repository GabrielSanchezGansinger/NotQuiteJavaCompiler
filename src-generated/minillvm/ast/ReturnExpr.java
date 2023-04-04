//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

public interface ReturnExpr extends TerminatingInstruction, Element {
    void setReturnValue(Operand returnValue);
    Operand getReturnValue();
    Element getParent();
    ReturnExpr copy();
    ReturnExpr copyWithRefs();
    void clearAttributes();
    void clearAttributesLocal();
    /** */
    public abstract String toString();
}