//generated by abstract-syntax-gen
package notquitejava.ast;
import java.util.*;

@SuppressWarnings({"cast", "unused", "rawtypes"})
class NQJArrayLengthImpl implements NQJArrayLength{
    NQJArrayLengthImpl(NQJExpr arrayExpr) {
        if (arrayExpr == null)
            throw new IllegalArgumentException("Element arrayExpr must not be null.");
        this.arrayExpr = arrayExpr;
        arrayExpr.setParent(this);
    }

    private NQJElement parent;
    public NQJElement getParent() { return parent; }
    public void setParent(NQJElement parent) {
        if (parent != null && this.parent != null) {
            throw new Error("Cannot change parent of element " + this.getClass().getSimpleName() + ", as it is already used in another tree."
                + "Use the copy method to create a new tree or remove the tree from its old parent or set the parent to null before moving the tree. ");
        }
        this.parent = parent;
    }

    public void replaceBy(NQJElement other) {
        if (parent == null)
            throw new RuntimeException("Node not attached to tree.");
        for (int i=0; i<parent.size(); i++) {
            if (parent.get(i) == this) {
                parent.set(i, other);
                return;
            }
        }
    }

    private NQJExpr arrayExpr;
    public void setArrayExpr(NQJExpr arrayExpr) {
        if (arrayExpr == null) throw new IllegalArgumentException();
        this.arrayExpr.setParent(null);
        arrayExpr.setParent(this);
        this.arrayExpr = arrayExpr;
    } 
    public NQJExpr getArrayExpr() { return arrayExpr; }

    public NQJElement get(int i) {
        switch (i) {
            case 0: return arrayExpr;
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }
    public NQJElement set(int i, NQJElement newElem) {
        NQJElement oldElem;
        switch (i) {
            case 0: oldElem = arrayExpr; setArrayExpr((NQJExpr) newElem); return oldElem;
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }

    @Override
    public void forEachElement(java.util.function.Consumer<? super NQJElement> action) {
        action.accept(this.arrayExpr);
    }
    public int size() {
        return 1;
    }
    @Override public NQJArrayLength copy() {
        NQJArrayLength result = new NQJArrayLengthImpl((NQJExpr) this.arrayExpr.copy());
result.setSourcePosition(getSourcePosition());
        return result;
    }

    @Override public NQJArrayLength copyWithRefs() {
        NQJArrayLength res = copy();
        return res;
    }

    @Override public void clearAttributes() {
        arrayExpr.clearAttributes();
        clearAttributesLocal();
    }
    @Override public void clearAttributesLocal() {
    }
    @Override public void accept(Visitor v) {
        v.visit(this);
    }
    @Override public <T> T match(NQJExpr.Matcher<T> matcher) {
        return matcher.case_ArrayLength(this);
    }
    @Override public void match(NQJExpr.MatcherVoid matcher) {
        matcher.case_ArrayLength(this);
    }

    @Override public <T> T match(NQJElement.Matcher<T> matcher) {
        return matcher.case_ArrayLength(this);
    }
    @Override public void match(NQJElement.MatcherVoid matcher) {
        matcher.case_ArrayLength(this);
    }

    @Override public String toString() {
        return "ArrayLength(" + arrayExpr+")";
    }
    public boolean structuralEquals(NQJElement e) {
        if (e instanceof NQJArrayLength) {
            NQJArrayLength o = (NQJArrayLength) e;
            return this.arrayExpr.structuralEquals(o.getArrayExpr());
        } else {
            return false;
        }
    }
    private frontend.SourcePosition sourcePosition;
    /** "information about the source code"*/
    public frontend.SourcePosition getSourcePosition() {
        return sourcePosition;
    }
    /** "information about the source code"*/
    public void setSourcePosition(frontend.SourcePosition sourcePosition) {
        this.sourcePosition = sourcePosition;
    }
}