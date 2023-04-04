//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

public interface TypeArray extends Type, Element {
    void setOf(Type of);
    Type getOf();
    void setSize(int size);
    int getSize();
    Element getParent();
    TypeArray copy();
    TypeArray copyWithRefs();
    void clearAttributes();
    void clearAttributesLocal();
    /** */
    public abstract String toString();
    /** "checks, whether this type is equal to another type"*/
    public abstract boolean equalsType(Type other);
}