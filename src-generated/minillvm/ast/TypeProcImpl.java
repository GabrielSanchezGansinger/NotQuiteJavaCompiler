//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

@SuppressWarnings({"cast", "unused", "rawtypes"})
class TypeProcImpl implements TypeProc{
    TypeProcImpl(TypeRefList argTypes, Type resultType) {
        if (argTypes == null)
            throw new IllegalArgumentException("Element argTypes must not be null.");
        if (resultType == null)
            throw new IllegalArgumentException("Element resultType must not be null.");
        this.argTypes = argTypes;
        this.resultType = resultType;
        argTypes.setParent(this);
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

    private TypeRefList argTypes;
    public void setArgTypes(TypeRefList argTypes) {
        if (argTypes == null) throw new IllegalArgumentException();
        this.argTypes.setParent(null);
        argTypes.setParent(this);
        this.argTypes = argTypes;
    } 
    public TypeRefList getArgTypes() { return argTypes; }

    private Type resultType;
    public void setResultType(Type resultType) {
        if (resultType == null) throw new IllegalArgumentException();
        this.resultType = resultType;
    } 
    public Type getResultType() { return resultType; }

    public Element get(int i) {
        switch (i) {
            case 0: return argTypes;
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }
    public Element set(int i, Element newElem) {
        Element oldElem;
        switch (i) {
            case 0: oldElem = argTypes; setArgTypes((TypeRefList) newElem); return oldElem;
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }

    @Override
    public void forEachElement(java.util.function.Consumer<? super Element> action) {
        action.accept(this.argTypes);
    }
    public int size() {
        return 1;
    }
    @Override public TypeProc copy() {
        TypeProc result = new TypeProcImpl((TypeRefList) this.argTypes.copy(), resultType);
        return result;
    }

    @Override public TypeProc copyWithRefs() {
        TypeProc res = copy();
        return res;
    }

    @Override public void clearAttributes() {
        argTypes.clearAttributes();
        clearAttributesLocal();
    }
    @Override public void clearAttributesLocal() {
    }
    @Override public void accept(Visitor v) {
        v.visit(this);
    }
    @Override public <T> T match(Type.Matcher<T> matcher) {
        return matcher.case_TypeProc(this);
    }
    @Override public void match(Type.MatcherVoid matcher) {
        matcher.case_TypeProc(this);
    }

    @Override public <T> T match(Element.Matcher<T> matcher) {
        return matcher.case_TypeProc(this);
    }
    @Override public void match(Element.MatcherVoid matcher) {
        matcher.case_TypeProc(this);
    }

    public boolean structuralEquals(Element e) {
        if (e instanceof TypeProc) {
            TypeProc o = (TypeProc) e;
            return this.argTypes.structuralEquals(o.getArgTypes())
                && this.resultType == o.getResultType();
        } else {
            return false;
        }
    }
    /** */
    public String toString() {
        return minillvm.printer.PrettyPrinter.elementToString((TypeProc)this);
    }
    /** "checks, whether this type is equal to another type"*/
    public boolean equalsType(Type other) {
        return minillvm.analysis.Typechecker.equalsType((TypeProc)this, other);
    }
}
