//generated by abstract-syntax-gen
package notquitejava.ast;
import java.util.*;

public interface NQJImplementsNothing extends NQJImplements, NQJElement {
    NQJElement getParent();
    NQJImplementsNothing copy();
    NQJImplementsNothing copyWithRefs();
    void clearAttributes();
    void clearAttributesLocal();
    /** "information about the source code"*/
    public abstract frontend.SourcePosition getSourcePosition();
    /** "information about the source code"*/
    public abstract void setSourcePosition(frontend.SourcePosition sourcePosition);
}
