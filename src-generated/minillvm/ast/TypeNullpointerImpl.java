//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

@SuppressWarnings({"cast", "unused", "rawtypes"})
class TypeNullpointerImpl implements TypeNullpointer{
    TypeNullpointerImpl() {
    }

    private Element parent;
    public Element getParent() { return parent; }
    public void setParent(Element parent) {
        if (parent != null && this.parent != null) {
            throw new Error("Cannot change parent of element " + this.getClass().getSimpleName() + ", as it is already used in another tree."
                + "Use the copy method to create a new tree or remove the tree from its old parent or set the parent to null before moving the tree. ");
        }
        this.parent = parent;
    }

    public void replaceBy(Element other) {
        if (parent == null)
            throw new RuntimeException("Node not attached to tree.");
        for (int i=0; i<parent.size(); i++) {
            if (parent.get(i) == this) {
                parent.set(i, other);
                return;
            }
        }
    }

    public Element get(int i) {
        switch (i) {
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }
    public Element set(int i, Element newElem) {
        Element oldElem;
        switch (i) {
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }

    @Override
    public void forEachElement(java.util.function.Consumer<? super Element> action) {
    }
    public int size() {
        return 0;
    }
    @Override public TypeNullpointer copy() {
        TypeNullpointer result = new TypeNullpointerImpl();
        return result;
    }

    @Override public TypeNullpointer copyWithRefs() {
        TypeNullpointer res = copy();
        return res;
    }

    @Override public void clearAttributes() {
        clearAttributesLocal();
    }
    @Override public void clearAttributesLocal() {
    }
    @Override public void accept(Visitor v) {
        v.visit(this);
    }
    @Override public <T> T match(Type.Matcher<T> matcher) {
        return matcher.case_TypeNullpointer(this);
    }
    @Override public void match(Type.MatcherVoid matcher) {
        matcher.case_TypeNullpointer(this);
    }

    @Override public <T> T match(Element.Matcher<T> matcher) {
        return matcher.case_TypeNullpointer(this);
    }
    @Override public void match(Element.MatcherVoid matcher) {
        matcher.case_TypeNullpointer(this);
    }

    public boolean structuralEquals(Element e) {
        return e instanceof TypeNullpointer;
    }
    /** */
    public String toString() {
        return minillvm.printer.PrettyPrinter.elementToString((TypeNullpointer)this);
    }
    /** "checks, whether this type is equal to another type"*/
    public boolean equalsType(Type other) {
        return minillvm.analysis.Typechecker.equalsType((TypeNullpointer)this, other);
    }
}
