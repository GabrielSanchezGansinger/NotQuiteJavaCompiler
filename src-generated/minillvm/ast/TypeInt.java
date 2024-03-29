//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

public interface TypeInt extends Type, Element {
    Element getParent();
    TypeInt copy();
    TypeInt copyWithRefs();
    void clearAttributes();
    void clearAttributesLocal();
    /** */
    public abstract String toString();
    /** "checks, whether this type is equal to another type"*/
    public abstract boolean equalsType(Type other);
}
