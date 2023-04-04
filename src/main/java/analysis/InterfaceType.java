package analysis;

import notquitejava.ast.NQJFunctionDecl;
import notquitejava.ast.NQJInterfaceFunctionDecl;
import notquitejava.ast.NQJInterfaceFunctionDeclList;

import java.util.HashMap;
import java.util.Map;

/**
 * Interface extension for types.
 */
public class InterfaceType extends Type {

    private String name;

    private ClassType initialized;
    private final Map<String, NQJInterfaceFunctionDecl> funcs = new HashMap<>();

    /**
     * Constructor for InterfaceType.
     *
     * @param analysis analysis object.
     * @param name name of object.
     * @param list list of functions declared in interface
     */
    public InterfaceType(Analysis analysis, String name, NQJInterfaceFunctionDeclList list) {
        this.name = name;
        for (NQJInterfaceFunctionDecl f : list) {
            NQJInterfaceFunctionDecl old = this.funcs.put(f.getName(), f);
            if (!(old == null)) {
                analysis.addError(f, "Not unique name for method declaration "
                        + f.getName() + " in interface " + name);
            }
        }
    }

    public String getName() {
        return this.name;
    }

    public NQJInterfaceFunctionDecl getFunc(String name) {
        return funcs.get(name);
    }

    public Map<String, NQJInterfaceFunctionDecl> getFuncMap() {
        return this.funcs;
    }

    /**
     * Checks if this is subtype of other.
     * In this case it only checks equality on name
     * if it is an interface, or equality on Type.ANY if not.
     *
     * @param other Type to compare with this
     * @return true if it is subtype of other, false otherwise
     */
    @Override
    boolean isSubtypeOf(Type other) {
        if (other instanceof InterfaceType) {
            return ((InterfaceType) other).getName().equals(this.name);
        }

        return other == ANY;
    }

    /**
     * Sets the class with which the Interface is initialized.
     * Example: Interface A. Class B
     * A a = new B();
     * Initialized would be B.
     *
     * @param type ClassType of the initialized class.
     * @return true if not set already, false if already set.
     */
    public boolean setInitialized(ClassType type) {
        if (this.initialized == null) {
            this.initialized = type;
            return true;
        } else {
            return false;
        }
    }

    public ClassType getInitialized() {
        return this.initialized;
    }
}
