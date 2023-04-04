//generated by abstract-syntax-gen
package notquitejava.ast;
import java.util.*;

@SuppressWarnings({"cast", "unused", "rawtypes"})
public abstract class NQJExprList extends AsgList<NQJExpr> implements NQJElement{
    public NQJExprList copy() {
        NQJExprList result = new NQJExprListImpl();
        for (NQJExpr elem : this) {
            result.add((NQJExpr) elem.copy());
        }
        return result;
    }

    @Override public NQJExprList copyWithRefs() {
        NQJExprList res = copy();
        return res;
    }

    /** "information about the source code"*/
    public abstract frontend.SourcePosition getSourcePosition();
    /** "information about the source code"*/
    public abstract void setSourcePosition(frontend.SourcePosition sourcePosition);
}
