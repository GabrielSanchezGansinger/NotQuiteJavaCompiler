//generated by abstract-syntax-gen
package notquitejava.ast;
import java.util.*;

@SuppressWarnings({"cast", "unused", "rawtypes"})
class NQJClassDeclImpl implements NQJClassDecl{
    NQJClassDeclImpl(String name, NQJExtended extended, NQJImplements impl, NQJVarDeclList fields, NQJFunctionDeclList methods) {
        if (name == null)
            throw new IllegalArgumentException("Element name must not be null.");
        if (extended == null)
            throw new IllegalArgumentException("Element extended must not be null.");
        if (impl == null)
            throw new IllegalArgumentException("Element impl must not be null.");
        if (fields == null)
            throw new IllegalArgumentException("Element fields must not be null.");
        if (methods == null)
            throw new IllegalArgumentException("Element methods must not be null.");
        this.name = name;
        this.extended = extended;
        this.impl = impl;
        this.fields = fields;
        this.methods = methods;
        extended.setParent(this);
        impl.setParent(this);
        fields.setParent(this);
        methods.setParent(this);
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

    private String name;
    public void setName(String name) {
        if (name == null) throw new IllegalArgumentException();
        this.name = name;
    } 
    public String getName() { return name; }

    private NQJExtended extended;
    public void setExtended(NQJExtended extended) {
        if (extended == null) throw new IllegalArgumentException();
        this.extended.setParent(null);
        extended.setParent(this);
        this.extended = extended;
    } 
    public NQJExtended getExtended() { return extended; }

    private NQJImplements impl;
    public void setImpl(NQJImplements impl) {
        if (impl == null) throw new IllegalArgumentException();
        this.impl.setParent(null);
        impl.setParent(this);
        this.impl = impl;
    } 
    public NQJImplements getImpl() { return impl; }

    private NQJVarDeclList fields;
    public void setFields(NQJVarDeclList fields) {
        if (fields == null) throw new IllegalArgumentException();
        this.fields.setParent(null);
        fields.setParent(this);
        this.fields = fields;
    } 
    public NQJVarDeclList getFields() { return fields; }

    private NQJFunctionDeclList methods;
    public void setMethods(NQJFunctionDeclList methods) {
        if (methods == null) throw new IllegalArgumentException();
        this.methods.setParent(null);
        methods.setParent(this);
        this.methods = methods;
    } 
    public NQJFunctionDeclList getMethods() { return methods; }

    public NQJElement get(int i) {
        switch (i) {
            case 0: return extended;
            case 1: return impl;
            case 2: return fields;
            case 3: return methods;
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }
    public NQJElement set(int i, NQJElement newElem) {
        NQJElement oldElem;
        switch (i) {
            case 0: oldElem = extended; setExtended((NQJExtended) newElem); return oldElem;
            case 1: oldElem = impl; setImpl((NQJImplements) newElem); return oldElem;
            case 2: oldElem = fields; setFields((NQJVarDeclList) newElem); return oldElem;
            case 3: oldElem = methods; setMethods((NQJFunctionDeclList) newElem); return oldElem;
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }

    @Override
    public void forEachElement(java.util.function.Consumer<? super NQJElement> action) {
        action.accept(this.extended);
        action.accept(this.impl);
        action.accept(this.fields);
        action.accept(this.methods);
    }
    public int size() {
        return 4;
    }
    @Override public NQJClassDecl copy() {
        NQJClassDecl result = new NQJClassDeclImpl(name, (NQJExtended) this.extended.copy(), (NQJImplements) this.impl.copy(), (NQJVarDeclList) this.fields.copy(), (NQJFunctionDeclList) this.methods.copy());
result.setSourcePosition(getSourcePosition());
result.setDirectSuperClass(getDirectSuperClass());
        return result;
    }

    @Override public NQJClassDecl copyWithRefs() {
        NQJClassDecl res = copy();
        return res;
    }

    @Override public void clearAttributes() {
        extended.clearAttributes();
        impl.clearAttributes();
        fields.clearAttributes();
        methods.clearAttributes();
        clearAttributesLocal();
    }
    @Override public void clearAttributesLocal() {
    }
    @Override public void accept(Visitor v) {
        v.visit(this);
    }
    @Override public <T> T match(NQJTopLevelDecl.Matcher<T> matcher) {
        return matcher.case_ClassDecl(this);
    }
    @Override public void match(NQJTopLevelDecl.MatcherVoid matcher) {
        matcher.case_ClassDecl(this);
    }

    @Override public <T> T match(NQJElement.Matcher<T> matcher) {
        return matcher.case_ClassDecl(this);
    }
    @Override public void match(NQJElement.MatcherVoid matcher) {
        matcher.case_ClassDecl(this);
    }

    @Override public String toString() {
        return "ClassDecl(" + name + ", " +extended + ", " +impl + ", " +fields + ", " +methods+")";
    }
    public boolean structuralEquals(NQJElement e) {
        if (e instanceof NQJClassDecl) {
            NQJClassDecl o = (NQJClassDecl) e;
            return java.util.Objects.equals(name, o.getName())
                && this.extended.structuralEquals(o.getExtended())
                && this.impl.structuralEquals(o.getImpl())
                && this.fields.structuralEquals(o.getFields())
                && this.methods.structuralEquals(o.getMethods());
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
    private NQJClassDecl directSuperClass;
    /** null*/
    public NQJClassDecl getDirectSuperClass() {
        return directSuperClass;
    }
    /** null*/
    public void setDirectSuperClass(NQJClassDecl directSuperClass) {
        this.directSuperClass = directSuperClass;
    }
}
