//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

@SuppressWarnings({"cast", "unused", "rawtypes"})
class StructFieldImpl implements StructField{
    StructFieldImpl(Type type, String name) {
        if (type == null)
            throw new IllegalArgumentException("Element type must not be null.");
        if (name == null)
            throw new IllegalArgumentException("Element name must not be null.");
        this.type = type;
        this.name = name;
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

    private Type type;
    public void setType(Type type) {
        if (type == null) throw new IllegalArgumentException();
        this.type = type;
    } 
    public Type getType() { return type; }

    private String name;
    public void setName(String name) {
        if (name == null) throw new IllegalArgumentException();
        this.name = name;
    } 
    public String getName() { return name; }

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
    @Override public StructField copy() {
        StructField result = new StructFieldImpl(type, name);
        return result;
    }

    @Override public StructField copyWithRefs() {
        StructField res = copy();
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
    @Override public <T> T match(Element.Matcher<T> matcher) {
        return matcher.case_StructField(this);
    }
    @Override public void match(Element.MatcherVoid matcher) {
        matcher.case_StructField(this);
    }

    public boolean structuralEquals(Element e) {
        if (e instanceof StructField) {
            StructField o = (StructField) e;
            return this.type == o.getType()
                && java.util.Objects.equals(name, o.getName());
        } else {
            return false;
        }
    }
    /** */
    public String toString() {
        return minillvm.printer.PrettyPrinter.elementToString((StructField)this);
    }
}