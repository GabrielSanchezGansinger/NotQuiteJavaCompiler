//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

public interface Nullpointer extends Const, Element {
    Element getParent();
    Nullpointer copy();
    Nullpointer copyWithRefs();
    void clearAttributes();
    void clearAttributesLocal();
    /** */
    public abstract String toString();
    /** */
    public abstract Type calculateType();
}
