//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

public interface Prog extends Element {
    void setStructTypes(TypeStructList structTypes);
    TypeStructList getStructTypes();
    void setGlobals(GlobalList globals);
    GlobalList getGlobals();
    void setProcedures(ProcList procedures);
    ProcList getProcedures();
    Element getParent();
    Prog copy();
    Prog copyWithRefs();
    void clearAttributes();
    void clearAttributesLocal();
    /** */
    public abstract String toString();
}
