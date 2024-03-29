//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

@SuppressWarnings({"cast", "unused", "rawtypes"})
class GetElementPtrImpl implements GetElementPtr{
    GetElementPtrImpl(TemporaryVar var, Operand baseAddress, OperandList indices) {
        if (var == null)
            throw new IllegalArgumentException("Element var must not be null.");
        if (baseAddress == null)
            throw new IllegalArgumentException("Element baseAddress must not be null.");
        if (indices == null)
            throw new IllegalArgumentException("Element indices must not be null.");
        this.var = var;
        this.baseAddress = baseAddress;
        this.indices = indices;
        var.setParent(this);
        baseAddress.setParent(this);
        indices.setParent(this);
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

    private TemporaryVar var;
    public void setVar(TemporaryVar var) {
        if (var == null) throw new IllegalArgumentException();
        this.var.setParent(null);
        var.setParent(this);
        this.var = var;
    } 
    public TemporaryVar getVar() { return var; }

    private Operand baseAddress;
    public void setBaseAddress(Operand baseAddress) {
        if (baseAddress == null) throw new IllegalArgumentException();
        this.baseAddress.setParent(null);
        baseAddress.setParent(this);
        this.baseAddress = baseAddress;
    } 
    public Operand getBaseAddress() { return baseAddress; }

    private OperandList indices;
    public void setIndices(OperandList indices) {
        if (indices == null) throw new IllegalArgumentException();
        this.indices.setParent(null);
        indices.setParent(this);
        this.indices = indices;
    } 
    public OperandList getIndices() { return indices; }

    public Element get(int i) {
        switch (i) {
            case 0: return var;
            case 1: return baseAddress;
            case 2: return indices;
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }
    public Element set(int i, Element newElem) {
        Element oldElem;
        switch (i) {
            case 0: oldElem = var; setVar((TemporaryVar) newElem); return oldElem;
            case 1: oldElem = baseAddress; setBaseAddress((Operand) newElem); return oldElem;
            case 2: oldElem = indices; setIndices((OperandList) newElem); return oldElem;
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }

    @Override
    public void forEachElement(java.util.function.Consumer<? super Element> action) {
        action.accept(this.var);
        action.accept(this.baseAddress);
        action.accept(this.indices);
    }
    public int size() {
        return 3;
    }
    @Override public GetElementPtr copy() {
        GetElementPtr result = new GetElementPtrImpl((TemporaryVar) this.var.copy(), (Operand) this.baseAddress.copy(), (OperandList) this.indices.copy());
        return result;
    }

    @Override public GetElementPtr copyWithRefs() {
        GetElementPtr res = copy();
        return res;
    }

    @Override public void clearAttributes() {
        var.clearAttributes();
        baseAddress.clearAttributes();
        indices.clearAttributes();
        clearAttributesLocal();
    }
    @Override public void clearAttributesLocal() {
    }
    @Override public void accept(Visitor v) {
        v.visit(this);
    }
    @Override public <T> T match(Instruction.Matcher<T> matcher) {
        return matcher.case_GetElementPtr(this);
    }
    @Override public void match(Instruction.MatcherVoid matcher) {
        matcher.case_GetElementPtr(this);
    }

    @Override public <T> T match(Assign.Matcher<T> matcher) {
        return matcher.case_GetElementPtr(this);
    }
    @Override public void match(Assign.MatcherVoid matcher) {
        matcher.case_GetElementPtr(this);
    }

    @Override public <T> T match(Element.Matcher<T> matcher) {
        return matcher.case_GetElementPtr(this);
    }
    @Override public void match(Element.MatcherVoid matcher) {
        matcher.case_GetElementPtr(this);
    }

    public boolean structuralEquals(Element e) {
        if (e instanceof GetElementPtr) {
            GetElementPtr o = (GetElementPtr) e;
            return this.var.structuralEquals(o.getVar())
                && this.baseAddress.structuralEquals(o.getBaseAddress())
                && this.indices.structuralEquals(o.getIndices());
        } else {
            return false;
        }
    }
    /** */
    public String toString() {
        return minillvm.printer.PrettyPrinter.elementToString((GetElementPtr)this);
    }
}
