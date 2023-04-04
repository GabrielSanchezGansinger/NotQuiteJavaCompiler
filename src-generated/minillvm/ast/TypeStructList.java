//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

@SuppressWarnings({"cast", "unused", "rawtypes"})
public abstract class TypeStructList extends AsgList<TypeStruct> implements Element{
    public TypeStructList copy() {
        TypeStructList result = new TypeStructListImpl();
        for (TypeStruct elem : this) {
            result.add((TypeStruct) elem.copy());
        }
        return result;
    }

    @Override public TypeStructList copyWithRefs() {
        TypeStructList res = copy();
        return res;
    }

    /** */
    public abstract String toString();
}
