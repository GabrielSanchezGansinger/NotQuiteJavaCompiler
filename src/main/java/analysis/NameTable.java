package analysis;

import java.util.*;
import notquitejava.ast.*;

/**
 * Name table for analysis class hierarchies.
 */
public class NameTable {
    private final Map<Type, ArrayType> arrayTypes = new HashMap<>();

    private final Map<String, NQJFunctionDecl> globalFunctions = new HashMap<>();

    private final Map<String, ClassType> classDeclarations = new HashMap<>();

    private final Map<String, InterfaceType> interfaceDeclarations = new HashMap<>();

    private final Analysis analysis;

    NameTable(Analysis analysis, NQJProgram prog) {
        this.analysis = analysis;
        globalFunctions.put("printInt", NQJ.FunctionDecl(NQJ.TypeInt(), "main",
                NQJ.VarDeclList(NQJ.VarDecl(NQJ.TypeInt(), "elem")), NQJ.Block()));
        for (NQJFunctionDecl f : prog.getFunctionDecls()) {
            var old = globalFunctions.put(f.getName(), f);
            if (old != null) {
                analysis.addError(f, "There already is a global function with name " + f.getName()
                        + " defined in " + old.getSourcePosition());
            }
        }
        for (NQJInterfaceDecl i : prog.getInterfaceDecls()) {
            InterfaceType t = new InterfaceType(analysis, i.getName(), i.getFuncs());
            interfaceDeclarations.put(t.getName(), t);
        }
        for (NQJClassDecl c : prog.getClassDecls()) {
            ClassType t = new ClassType(analysis, c.getName(),
                    c.getImpl(), c.getMethods(), c.getFields());
            if (c.getImpl() instanceof NQJImplementsInterfaceList) {
                NQJImplementsInterfaceList list = (NQJImplementsInterfaceList) c.getImpl();
                for (NQJImplementsInterface im : list) {
                    InterfaceType interType = interfaceDeclarations.get(im.getName());
                    for (NQJInterfaceFunctionDecl f : interType.getFuncMap().values()) {
                        if (t.getFunc(f.getName()) == null) {
                            analysis.addError(c, "Has not implemented function " + f.getName());
                        }
                    }
                }
            }

            classDeclarations.put(c.getName(), t);
        }
    }

    public NQJFunctionDecl lookupFunction(String functionName) {
        return globalFunctions.get(functionName);
    }

    /**
     * Transform base type to array type.
     */
    public ArrayType getArrayType(Type baseType, NQJExpr dimSize) {
        if (!arrayTypes.containsKey(baseType)) {
            arrayTypes.put(baseType, new ArrayType(baseType, dimSize));
        }
        return arrayTypes.get(baseType);
    }


    public ClassType getClassType(String name) {
        return classDeclarations.get(name);
    }

    public InterfaceType getInterfaceType(String name) {
        return interfaceDeclarations.get(name);
    }
}
