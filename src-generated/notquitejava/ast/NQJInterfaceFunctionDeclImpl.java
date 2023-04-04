//generated by abstract-syntax-gen
package notquitejava.ast;
import java.util.*;

@SuppressWarnings({"cast", "unused", "rawtypes"})
class NQJInterfaceFunctionDeclImpl implements NQJInterfaceFunctionDecl{
    NQJInterfaceFunctionDeclImpl(NQJType returnType, String name, NQJVarDeclList formalParameters) {
        if (returnType == null)
            throw new IllegalArgumentException("Element returnType must not be null.");
        if (name == null)
            throw new IllegalArgumentException("Element name must not be null.");
        if (formalParameters == null)
            throw new IllegalArgumentException("Element formalParameters must not be null.");
        this.returnType = returnType;
        this.name = name;
        this.formalParameters = formalParameters;
        returnType.setParent(this);
        formalParameters.setParent(this);
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

    private NQJType returnType;
    public void setReturnType(NQJType returnType) {
        if (returnType == null) throw new IllegalArgumentException();
        this.returnType.setParent(null);
        returnType.setParent(this);
        this.returnType = returnType;
    } 
    public NQJType getReturnType() { return returnType; }

    private String name;
    public void setName(String name) {
        if (name == null) throw new IllegalArgumentException();
        this.name = name;
    } 
    public String getName() { return name; }

    private NQJVarDeclList formalParameters;
    public void setFormalParameters(NQJVarDeclList formalParameters) {
        if (formalParameters == null) throw new IllegalArgumentException();
        this.formalParameters.setParent(null);
        formalParameters.setParent(this);
        this.formalParameters = formalParameters;
    } 
    public NQJVarDeclList getFormalParameters() { return formalParameters; }

    public NQJElement get(int i) {
        switch (i) {
            case 0: return returnType;
            case 1: return formalParameters;
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }
    public NQJElement set(int i, NQJElement newElem) {
        NQJElement oldElem;
        switch (i) {
            case 0: oldElem = returnType; setReturnType((NQJType) newElem); return oldElem;
            case 1: oldElem = formalParameters; setFormalParameters((NQJVarDeclList) newElem); return oldElem;
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }

    @Override
    public void forEachElement(java.util.function.Consumer<? super NQJElement> action) {
        action.accept(this.returnType);
        action.accept(this.formalParameters);
    }
    public int size() {
        return 2;
    }
    @Override public NQJInterfaceFunctionDecl copy() {
        NQJInterfaceFunctionDecl result = new NQJInterfaceFunctionDeclImpl((NQJType) this.returnType.copy(), name, (NQJVarDeclList) this.formalParameters.copy());
result.setSourcePosition(getSourcePosition());
        return result;
    }

    @Override public NQJInterfaceFunctionDecl copyWithRefs() {
        NQJInterfaceFunctionDecl res = copy();
        return res;
    }

    @Override public void clearAttributes() {
        returnType.clearAttributes();
        formalParameters.clearAttributes();
        clearAttributesLocal();
    }
    @Override public void clearAttributesLocal() {
    }
    @Override public void accept(Visitor v) {
        v.visit(this);
    }
    @Override public <T> T match(NQJElement.Matcher<T> matcher) {
        return matcher.case_InterfaceFunctionDecl(this);
    }
    @Override public void match(NQJElement.MatcherVoid matcher) {
        matcher.case_InterfaceFunctionDecl(this);
    }

    @Override public String toString() {
        return "InterfaceFunctionDecl(" + returnType + ", " +name + ", " +formalParameters+")";
    }
    public boolean structuralEquals(NQJElement e) {
        if (e instanceof NQJInterfaceFunctionDecl) {
            NQJInterfaceFunctionDecl o = (NQJInterfaceFunctionDecl) e;
            return this.returnType.structuralEquals(o.getReturnType())
                && java.util.Objects.equals(name, o.getName())
                && this.formalParameters.structuralEquals(o.getFormalParameters());
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