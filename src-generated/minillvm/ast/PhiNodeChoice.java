//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

public interface PhiNodeChoice extends Element {
    void setLabel(BasicBlock label);
    BasicBlock getLabel();
    void setValue(Operand value);
    Operand getValue();
    Element getParent();
    PhiNodeChoice copy();
    PhiNodeChoice copyWithRefs();
    void clearAttributes();
    void clearAttributesLocal();
    /** */
    public abstract String toString();
}
