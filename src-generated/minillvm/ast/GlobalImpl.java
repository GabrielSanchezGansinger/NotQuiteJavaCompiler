//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

@SuppressWarnings({"cast", "unused", "rawtypes"})
class GlobalImpl implements Global{
    GlobalImpl(Type type, String name, boolean isConstant, Const initialValue) {
        if (type == null)
            throw new IllegalArgumentException("Element type must not be null.");
        if (name == null)
            throw new IllegalArgumentException("Element name must not be null.");
        if (initialValue == null)
            throw new IllegalArgumentException("Element initialValue must not be null.");
        this.type = type;
        this.name = name;
        this.isConstant = isConstant;
        this.initialValue = initialValue;
        initialValue.setParent(this);
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

    private boolean isConstant;
    public void setIsConstant(boolean isConstant) {
        this.isConstant = isConstant;
    } 
    public boolean getIsConstant() { return isConstant; }

    private Const initialValue;
    public void setInitialValue(Const initialValue) {
        if (initialValue == null) throw new IllegalArgumentException();
        this.initialValue.setParent(null);
        initialValue.setParent(this);
        this.initialValue = initialValue;
    } 
    public Const getInitialValue() { return initialValue; }

    public Element get(int i) {
        switch (i) {
            case 0: return initialValue;
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }
    public Element set(int i, Element newElem) {
        Element oldElem;
        switch (i) {
            case 0: oldElem = initialValue; setInitialValue((Const) newElem); return oldElem;
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }

    @Override
    public void forEachElement(java.util.function.Consumer<? super Element> action) {
        action.accept(this.initialValue);
    }
    public int size() {
        return 1;
    }
    @Override public Global copy() {
        Global result = new GlobalImpl(type, name, isConstant, (Const) this.initialValue.copy());
        return result;
    }

    @Override public Global copyWithRefs() {
        Global res = copy();
        Element self = this;
        res.accept(new Element.DefaultVisitor() {
            @Override public void visit(GlobalRef e) {
                super.visit(e);
                // check reference global
                {
                    Element elem = e.getGlobal();
                    while (elem != self && elem != null) {
                        elem = elem.getParent();
                    }
                    if (elem == self) {
                        e.setGlobal((Global) res.followPath(self.pathTo(e.getGlobal())));
                    }
                }
            }
        });
        return res;
    }

    @Override public void clearAttributes() {
        initialValue.clearAttributes();
        clearAttributesLocal();
    }
    @Override public void clearAttributesLocal() {
    }
    @Override public void accept(Visitor v) {
        v.visit(this);
    }
    @Override public <T> T match(ElementWithName.Matcher<T> matcher) {
        return matcher.case_Global(this);
    }
    @Override public void match(ElementWithName.MatcherVoid matcher) {
        matcher.case_Global(this);
    }

    @Override public <T> T match(Element.Matcher<T> matcher) {
        return matcher.case_Global(this);
    }
    @Override public void match(Element.MatcherVoid matcher) {
        matcher.case_Global(this);
    }

    public boolean structuralEquals(Element e) {
        if (e instanceof Global) {
            Global o = (Global) e;
            return this.type == o.getType()
                && java.util.Objects.equals(name, o.getName())
                && java.util.Objects.equals(isConstant, o.getIsConstant())
                && this.initialValue.structuralEquals(o.getInitialValue());
        } else {
            return false;
        }
    }
    /** */
    public String toString() {
        return minillvm.printer.PrettyPrinter.elementToString((Global)this);
    }
}
