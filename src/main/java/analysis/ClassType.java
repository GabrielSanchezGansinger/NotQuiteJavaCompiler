package analysis;

import notquitejava.ast.*;

import java.util.HashMap;
import java.util.Map;

/**
 * Class extension for types.
 */
public class ClassType extends Type {

    private String className;
    private NQJImplements impl;

    private Map<String, NQJFunctionDecl> methods = new HashMap<>();

    private Map<String, NQJVarDecl> fields = new HashMap<>();

    /**
     * Constructor of ClassType.
     *
     * @param analysis Analysis object.
     * @param className Name of the class.
     * @param impl Interfaces the class implements.
     * @param meth List of methods.
     * @param vars List of variable Declarations.
     */
    public ClassType(Analysis analysis, String className,
                     NQJImplements impl, NQJFunctionDeclList meth, NQJVarDeclList vars) {
        this.className = className;
        this.impl = impl;

        for (NQJFunctionDecl m : meth) {
            NQJFunctionDecl old = this.methods.put(m.getName(), m);
            if (!(old == null)) {
                analysis.addError(m, "Not unique name for method declaration "
                        + m.getName() + " in class " + className);
            }
        }
        for (NQJVarDecl v : vars) {
            this.fields.put(v.getName(), v);
        }

    }

    /**
     * Checks if this is subtype of other.
     * This is the case if they are the same ClassType,
     * or if this has the InterfaceType in its implements.
     * Otherwise, it checks if other == Type.ANY.
     *
     * @param other Type to compare with this
     * @return true if it is subtype of other, false otherwise
     */
    @Override
    boolean isSubtypeOf(Type other) {
        if (other instanceof ClassType) {
            return ((ClassType) other).getClassName().equals(className);
        }

        if (other instanceof InterfaceType) {
            analysis.InterfaceType type = (analysis.InterfaceType) other;
            if (this.impl instanceof NQJImplementsInterface) {
                return ((NQJImplementsInterface) this.impl).getName().equals(type.getName());
            }

            if (this.impl instanceof NQJImplementsInterfaceList) {
                NQJImplementsInterfaceList list = ((NQJImplementsInterfaceList) this.impl);
                for (NQJImplementsInterface inter : list) {
                    if (inter.getName().equals(type.getName())) {
                        return true;
                    }
                }
            }
        }

        return other == ANY;
    }

    public String getClassName() {
        return this.className;
    }

    public NQJVarDecl getField(String name) {
        return this.fields.get(name);
    }

    public NQJFunctionDecl getFunc(String name) {
        return this.methods.get(name);
    }
}
