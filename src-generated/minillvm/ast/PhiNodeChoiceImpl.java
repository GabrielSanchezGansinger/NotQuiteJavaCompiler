//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

@SuppressWarnings({"cast", "unused", "rawtypes"})
class PhiNodeChoiceImpl implements PhiNodeChoice{
    PhiNodeChoiceImpl(BasicBlock label, Operand value) {
        if (label == null)
            throw new IllegalArgumentException("Element label must not be null.");
        if (value == null)
            throw new IllegalArgumentException("Element value must not be null.");
        this.label = label;
        this.value = value;
        value.setParent(this);
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

    private BasicBlock label;
    public void setLabel(BasicBlock label) {
        if (label == null) throw new IllegalArgumentException();
        this.label = label;
    } 
    public BasicBlock getLabel() { return label; }

    private Operand value;
    public void setValue(Operand value) {
        if (value == null) throw new IllegalArgumentException();
        this.value.setParent(null);
        value.setParent(this);
        this.value = value;
    } 
    public Operand getValue() { return value; }

    public Element get(int i) {
        switch (i) {
            case 0: return value;
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }
    public Element set(int i, Element newElem) {
        Element oldElem;
        switch (i) {
            case 0: oldElem = value; setValue((Operand) newElem); return oldElem;
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }

    @Override
    public void forEachElement(java.util.function.Consumer<? super Element> action) {
        action.accept(this.value);
    }
    public int size() {
        return 1;
    }
    @Override public PhiNodeChoice copy() {
        PhiNodeChoice result = new PhiNodeChoiceImpl(label, (Operand) this.value.copy());
        return result;
    }

    @Override public PhiNodeChoice copyWithRefs() {
        PhiNodeChoice res = copy();
        return res;
    }

    @Override public void clearAttributes() {
        value.clearAttributes();
        clearAttributesLocal();
    }
    @Override public void clearAttributesLocal() {
    }
    @Override public void accept(Visitor v) {
        v.visit(this);
    }
    @Override public <T> T match(Element.Matcher<T> matcher) {
        return matcher.case_PhiNodeChoice(this);
    }
    @Override public void match(Element.MatcherVoid matcher) {
        matcher.case_PhiNodeChoice(this);
    }

    public boolean structuralEquals(Element e) {
        if (e instanceof PhiNodeChoice) {
            PhiNodeChoice o = (PhiNodeChoice) e;
            return this.label == o.getLabel()
                && this.value.structuralEquals(o.getValue());
        } else {
            return false;
        }
    }
    /** */
    public String toString() {
        return minillvm.printer.PrettyPrinter.elementToString((PhiNodeChoice)this);
    }
}
