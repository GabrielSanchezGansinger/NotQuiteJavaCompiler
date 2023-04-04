package translation;

import analysis.ArrayType;
import analysis.ClassType;
import analysis.InterfaceType;
import minillvm.ast.*;
import notquitejava.ast.*;

import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

import static frontend.AstPrinter.print;
import static minillvm.ast.Ast.*;


/**
 * Entry class for the translation phase.
 */
public class Translator {

    private final StmtTranslator stmtTranslator = new StmtTranslator(this);
    private final ExprLValue exprLValue = new ExprLValue(this);
    private final ExprRValue exprRValue = new ExprRValue(this);
    private final Map<NQJFunctionDecl, Proc> functionImpl = new HashMap<>();
    private final Map<NQJFunctionDecl, Proc> methodImpl = new HashMap<>();
    private final Prog prog = Prog(TypeStructList(), GlobalList(), ProcList());
    private final NQJProgram javaProg;
    public final Map<NQJVarDecl, TemporaryVar> localVarLocation = new HashMap<>();
    private final Map<analysis.Type, Type> translatedType = new HashMap<>();
    private final Map<Type, TypeStruct> arrayStruct = new HashMap<>();
    private final Map<Type, Proc> newArrayFuncForType = new HashMap<>();
    private final Map<String, TypeStruct> classes = new HashMap<>();
    private final Map<String, Proc> contructors = new HashMap<>();
    private final Map<String, Global> vtables = new HashMap<>();
    private final Map<String, TypeStruct> vtableStructs = new HashMap<>();
    // mutable state
    private Proc currentProcedure;
    private BasicBlock currentBlock;

    public Translator(NQJProgram javaProg) {
        this.javaProg = javaProg;
    }

    /**
     * Translates given program into a mini llvm program.
     */
    public Prog translate() {

        translateClasses();

        // translate functions except main
        // has only access to functions
        translateFunctions();


        // translate main function
        // has access to functions
        translateMainFunction();

        finishNewArrayProcs();

        return prog;
    }

    TemporaryVar getLocalVarLocation(NQJVarDecl varDecl) {
        return localVarLocation.get(varDecl);
    }

    private void finishNewArrayProcs() {
        for (Type type : newArrayFuncForType.keySet()) {
            finishNewArrayProc(type);
        }
    }

    private void finishNewArrayProc(Type componentType) {
        final Proc newArrayFunc = newArrayFuncForType.get(componentType);
        final Parameter size = newArrayFunc.getParameters().get(0);

        addProcedure(newArrayFunc);
        setCurrentProc(newArrayFunc);

        BasicBlock init = newBasicBlock("init");
        addBasicBlock(init);
        setCurrentBlock(init);
        TemporaryVar sizeLessThanZero = TemporaryVar("sizeLessThanZero");
        addInstruction(BinaryOperation(sizeLessThanZero,
                VarRef(size), Slt(), ConstInt(0)));
        BasicBlock negativeSize = newBasicBlock("negativeSize");
        BasicBlock goodSize = newBasicBlock("goodSize");
        currentBlock.add(Branch(VarRef(sizeLessThanZero), negativeSize, goodSize));

        addBasicBlock(negativeSize);
        negativeSize.add(HaltWithError("Array Size must be positive"));

        addBasicBlock(goodSize);
        setCurrentBlock(goodSize);

        // allocate space for the array

        TemporaryVar arraySizeInBytes = TemporaryVar("arraySizeInBytes");
        addInstruction(BinaryOperation(arraySizeInBytes,
                VarRef(size), Mul(), byteSize(componentType)));

        // 4 bytes for the length
        TemporaryVar arraySizeWithLen = TemporaryVar("arraySizeWitLen");
        addInstruction(BinaryOperation(arraySizeWithLen,
                VarRef(arraySizeInBytes), Add(), ConstInt(4)));

        TemporaryVar mallocResult = TemporaryVar("mallocRes");
        addInstruction(Alloc(mallocResult, VarRef(arraySizeWithLen)));
        TemporaryVar newArray = TemporaryVar("newArray");
        addInstruction(Bitcast(newArray,
                getArrayPointerType(componentType), VarRef(mallocResult)));

        // store the size
        TemporaryVar sizeAddr = TemporaryVar("sizeAddr");
        addInstruction(GetElementPtr(sizeAddr,
                VarRef(newArray), OperandList(ConstInt(0), ConstInt(0))));
        addInstruction(Store(VarRef(sizeAddr), VarRef(size)));

        /*
        //TODO Array loop to initialize componenttype
        while(componentType instanceof TypePointer){
            ArrayType next = (ArrayType) componentType;

        }
        */

        // initialize Array with zeros:
        final BasicBlock loopStart = newBasicBlock("loopStart");
        final BasicBlock loopBody = newBasicBlock("loopBody");
        final BasicBlock loopEnd = newBasicBlock("loopEnd");
        final TemporaryVar iVar = TemporaryVar("iVar");
        currentBlock.add(Alloca(iVar, TypeInt()));
        currentBlock.add(Store(VarRef(iVar), ConstInt(0)));
        currentBlock.add(Jump(loopStart));

        // loop condition: while i < size
        addBasicBlock(loopStart);
        setCurrentBlock(loopStart);
        final TemporaryVar i = TemporaryVar("i");
        final TemporaryVar nextI = TemporaryVar("nextI");
        loopStart.add(Load(i, VarRef(iVar)));
        TemporaryVar smallerSize = TemporaryVar("smallerSize");
        addInstruction(BinaryOperation(smallerSize,
                VarRef(i), Slt(), VarRef(size)));
        currentBlock.add(Branch(VarRef(smallerSize), loopBody, loopEnd));

        // loop body
        addBasicBlock(loopBody);
        setCurrentBlock(loopBody);
        // ar[i] = 0;
        final TemporaryVar iAddr = TemporaryVar("iAddr");
        addInstruction(GetElementPtr(iAddr,
                VarRef(newArray), OperandList(ConstInt(0), ConstInt(1), VarRef(i))));
        addInstruction(Store(VarRef(iAddr), defaultValue(componentType)));

        // nextI = i + 1;
        addInstruction(BinaryOperation(nextI, VarRef(i), Add(), ConstInt(1)));
        // store new value in i
        addInstruction(Store(VarRef(iVar), VarRef(nextI)));

        loopBody.add(Jump(loopStart));

        addBasicBlock(loopEnd);
        loopEnd.add(ReturnExpr(VarRef(newArray)));
    }

    /**
     * Translates the classes by:
     * 1.Creating dummy TypeStructs
     * 2.Creating the Procs for the methods.
     * 3.Translating the classes, their constructors,
     * vtables, and filling the TypeStructs.
     * 4.Translating the procedures for the methods.
     */
    private void translateClasses() {

        for (NQJClassDecl classDecl : javaProg.getClassDecls()) {
            TypeStruct dummy = TypeStruct(classDecl.getName(), StructFieldList());
            classes.put(classDecl.getName(), dummy);

        }

        for (NQJClassDecl classDecl : javaProg.getClassDecls()) {
            for (NQJFunctionDecl func : classDecl.getMethods()) {
                methodImpl.put(func, initMethod(func, classDecl));
            }

        }

        for (NQJClassDecl classDecl : javaProg.getClassDecls()) {
            translateClass(classDecl);
        }


        for (NQJClassDecl classDecl : javaProg.getClassDecls()) {
            for (NQJFunctionDecl func : classDecl.getMethods()) {
                translateMethod(func);
            }
        }


    }

    /**
     * Translates a class by:
     * 1.Creating the vtable.
     * 2.Filling the TypeStruct with Fields of the class
     * 3.Creating a Proc, that will serve as the constructor
     * 4.Adding the Instructions to create an object of the class to the constructor procedure
     *
     * @param classDecl NQJClassDecl object of the class to be translated.
     */
    private void translateClass(NQJClassDecl classDecl) {
        TypeStruct vtable = initVTable(classDecl);
        TypePointer vtablePointer = TypePointer(vtable);


        TypeStruct dummyStruct = classes.get(classDecl.getName());

        StructFieldList strList = StructFieldList();
        strList.add(StructField(vtablePointer, "vTablePointer: " + classDecl.getName()));
        for (NQJVarDecl var : classDecl.getFields()) {
            strList.add(StructField(translateType(var.getType()), var.getName()));
        }
        dummyStruct.setFields(strList);
        TypeStruct typeStruct = dummyStruct;



        Proc constr = Proc(
                "Create " + classDecl.getName(),
                TypePointer(typeStruct),
                ParameterList(),
                BasicBlockList()
        );



        addProcedure(constr);
        setCurrentProc(constr);

        BasicBlock constrBlock = newBasicBlock("Constr class " + classDecl.getName());
        addBasicBlock(constrBlock);
        setCurrentBlock(constrBlock);

        TemporaryVar structVar = TemporaryVar("struct " + classDecl.getName());
        addInstruction(Alloc(structVar, Sizeof(typeStruct)));

        TemporaryVar classPointer = TemporaryVar("classPointer " + classDecl.getName());
        addInstruction(Bitcast(classPointer, TypePointer(typeStruct), VarRef(structVar)));


        TemporaryVar firstFieldAdress = TemporaryVar("ffAdress");
        addInstruction(GetElementPtr(firstFieldAdress, VarRef(classPointer),
                OperandList(ConstInt(0), ConstInt(0))));
        addInstruction(Store(VarRef(firstFieldAdress),
                GlobalRef(vtables.get(classDecl.getName()))));

        //translates fields and sets them to default value
        for (int i = 1; i < typeStruct.getFields().size(); i++) {
            TemporaryVar address = TemporaryVar("addres");
            StructField field = typeStruct.getFields().get(i);

            addInstruction(GetElementPtr(address, VarRef(classPointer),
                    OperandList(ConstInt(0), ConstInt(i))));

            addInstruction(Store(VarRef(address), defaultValue(field.getType())));
        }
        addInstruction(ReturnExpr(VarRef(classPointer)));
        contructors.put(classDecl.getName(), constr);
        prog.getStructTypes().add(typeStruct);



    }

    /**
     * Creates vtable for a class.
     *
     * @param classDecl NQJClassDecl, of the class
     * @return TypeStruct of the vtable
     */
    private TypeStruct initVTable(NQJClassDecl classDecl) {
        //StructfieldList for vtable struct
        StructFieldList pointers = StructFieldList();
        //ConstList with procedure references
        ConstList procedures = ConstList();
        //Iterate through all methods,
        // get procedure reference for each and add fields to vTable struct
        for (NQJFunctionDecl func : classDecl.getMethods()) {
            ProcedureRef methodRef = ProcedureRef(methodImpl.get(func));
            procedures.add(methodRef);
            pointers.add(StructField(methodRef.calculateType(), func.getName()));
        }
        //Construct vTable Struct and add to StructTypes
        TypeStruct vtable = TypeStruct("vTable_" + classDecl.getName(), pointers);
        prog.getStructTypes().add(vtable);
        //Initial data for the global vTable
        ConstStruct initialData = ConstStruct(vtable, procedures);
        //create global vTable and set the initial data aka.
        // procedure refs and add it to the globals
        Global globalVTable = Global(vtable, "vTable_"
                + classDecl.getName(), true, initialData);
        prog.getGlobals().add(globalVTable);
        //add the global to internal vTable Map to use later maybe?
        vtables.put(classDecl.getName(), globalVTable);
        vtableStructs.put(classDecl.getName(), vtable);
        return vtable;
    }

    /**
     * Initiates Methods.
     * Similar to initFunction, but with added this parameter
     *
     * @param method method to be initialized.
     * @param classDecl classDecl of the method.
     * @return ProcedureRef to the procedure of the method
     */
    private Proc initMethod(NQJFunctionDecl method, NQJClassDecl classDecl) {

        TypeStruct classStruct = classes.get(classDecl.getName());
        //get parameters (equal to the method used to get parameters in functions)
        Proc res;
        ParameterList params =  method.getFormalParameters()
                .stream()
                .map(p -> Parameter(translateType(p.getType()), p.getName()))
                .collect(Collectors.toCollection(Ast::ParameterList));
        // add this to parameters
        Parameter thisParameter = Parameter(TypePointer(classStruct), "this");
        params.addFront(thisParameter);
        //Construct the Procedure
        res = Proc(method.getName(), translateType(method.getReturnType()),
                params, BasicBlockList());

        addProcedure(res);
        //return the reference to the procedure
        return res;
    }

    /**
     * Translates Method.
     * Similar to translateFunction, but skipping the first parameter.
     *
     * @param m Method to be translated
     */
    private void translateMethod(NQJFunctionDecl m) {
        Proc proc = methodImpl.get(m);
        setCurrentProc(proc);
        BasicBlock initBlock = newBasicBlock("initMethod");
        addBasicBlock(initBlock);
        setCurrentBlock(initBlock);

        localVarLocation.clear();

        // store copies of the parameters in Allocas, to make uniform read/write access possible
        int i = 1;
        for (NQJVarDecl param : m.getFormalParameters()) {
            TemporaryVar v = TemporaryVar(param.getName());
            addInstruction(Alloca(v, translateType(param.getType())));
            addInstruction(Store(VarRef(v), VarRef(proc.getParameters().get(i))));
            localVarLocation.put(param, v);
            i++;
        }


        // allocate space for the local variables
        allocaLocalVars(m.getMethodBody());

        translateStmt(m.getMethodBody());
    }

    private void translateFunctions() {
        for (NQJFunctionDecl functionDecl : javaProg.getFunctionDecls()) {
            if (functionDecl.getName().equals("main")) {
                continue;
            }
            initFunction(functionDecl);
        }
        for (NQJFunctionDecl functionDecl : javaProg.getFunctionDecls()) {
            if (functionDecl.getName().equals("main")) {
                continue;
            }
            translateFunction(functionDecl);
        }
    }

    private void translateMainFunction() {
        NQJFunctionDecl f = null;
        for (NQJFunctionDecl functionDecl : javaProg.getFunctionDecls()) {
            if (functionDecl.getName().equals("main")) {
                f = functionDecl;
                break;
            }
        }

        if (f == null) {
            throw new IllegalStateException("Main function expected");
        }

        Proc proc = Proc("main", TypeInt(), ParameterList(), BasicBlockList());
        addProcedure(proc);
        functionImpl.put(f, proc);

        setCurrentProc(proc);
        BasicBlock initBlock = newBasicBlock("init");
        addBasicBlock(initBlock);
        setCurrentBlock(initBlock);

        // allocate space for the local variables
        allocaLocalVars(f.getMethodBody());

        // translate
        translateStmt(f.getMethodBody());
    }

    private void initFunction(NQJFunctionDecl f) {
        Type returnType = translateType(f.getReturnType());
        ParameterList params = f.getFormalParameters()
                .stream()
                .map(p -> Parameter(translateType(p.getType()), p.getName()))
                .collect(Collectors.toCollection(Ast::ParameterList));
        Proc proc = Proc(f.getName(), returnType, params, BasicBlockList());
        addProcedure(proc);
        functionImpl.put(f, proc);
    }

    private void translateFunction(NQJFunctionDecl m) {
        Proc proc = functionImpl.get(m);
        setCurrentProc(proc);
        BasicBlock initBlock = newBasicBlock("init");
        addBasicBlock(initBlock);
        setCurrentBlock(initBlock);

        localVarLocation.clear();

        // store copies of the parameters in Allocas, to make uniform read/write access possible
        int i = 0;
        for (NQJVarDecl param : m.getFormalParameters()) {
            TemporaryVar v = TemporaryVar(param.getName());
            addInstruction(Alloca(v, translateType(param.getType())));
            addInstruction(Store(VarRef(v), VarRef(proc.getParameters().get(i))));
            localVarLocation.put(param, v);
            i++;
        }

        // allocate space for the local variables
        allocaLocalVars(m.getMethodBody());

        translateStmt(m.getMethodBody());
    }

    void translateStmt(NQJStatement s) {
        addInstruction(CommentInstr(sourceLine(s) + " start statement : " + printFirstline(s)));
        s.match(stmtTranslator);
        addInstruction(CommentInstr(sourceLine(s) + " end statement: " + printFirstline(s)));
    }

    int sourceLine(NQJElement e) {
        while (e != null) {
            if (e.getSourcePosition() != null) {
                return e.getSourcePosition().getLine();
            }
            e = e.getParent();
        }
        return 0;
    }

    private String printFirstline(NQJStatement s) {
        String str = print(s);
        str = str.replaceAll("\n.*", "");
        return str;
    }

    BasicBlock newBasicBlock(String name) {
        BasicBlock block = BasicBlock();
        block.setName(name);
        return block;
    }

    void addBasicBlock(BasicBlock block) {
        currentProcedure.getBasicBlocks().add(block);
    }

    BasicBlock getCurrentBlock() {
        return currentBlock;
    }

    void setCurrentBlock(BasicBlock currentBlock) {
        this.currentBlock = currentBlock;
    }


    void addProcedure(Proc proc) {
        prog.getProcedures().add(proc);
    }

    void setCurrentProc(Proc currentProc) {
        if (currentProc == null) {
            throw new RuntimeException("Cannot set proc to null");
        }
        this.currentProcedure = currentProc;
    }

    private void allocaLocalVars(NQJBlock methodBody) {
        methodBody.accept(new NQJElement.DefaultVisitor() {
            @Override
            public void visit(NQJVarDecl localVar) {
                super.visit(localVar);
                TemporaryVar v = TemporaryVar(localVar.getName());
                addInstruction(Alloca(v, translateType(localVar.getType())));
                localVarLocation.put(localVar, v);
            }
        });
    }

    void addInstruction(Instruction instruction) {
        currentBlock.add(instruction);
    }

    Type translateType(NQJType type) {
        return translateType(type.getType());
    }

    Type translateType(analysis.Type t) {
        Type result = translatedType.get(t);
        if (result == null) {
            if (t == analysis.Type.INT) {
                result = TypeInt();
            } else if (t == analysis.Type.BOOL) {
                result = TypeBool();
            } else if (t instanceof ArrayType) {
                ArrayType at = (ArrayType) t;
                result = TypePointer(getArrayStruct(translateType(at.getBaseType())));
            } else if (t instanceof ClassType) {
                ClassType ct = (ClassType) t;
                result = TypePointer(classes.get(ct.getClassName()));
            } else if (t instanceof InterfaceType) {
                InterfaceType it = (InterfaceType) t;
                result = TypePointer(classes.get(it.getInitialized().getClassName()));
            } else {
                throw new RuntimeException("unhandled case " + t);
            }
            translatedType.put(t, result);
        }
        return result;
    }

    Parameter getThisParameter() {
        // in our case 'this' is always the first parameter
        return currentProcedure.getParameters().get(0);
    }

    Operand exprLvalue(NQJExprL e) {
        return e.match(exprLValue);
    }

    Operand exprRvalue(NQJExpr e) {
        return e.match(exprRValue);
    }

    void addNullcheck(Operand arrayAddr, String errorMessage) {
        TemporaryVar isNull = TemporaryVar("isNull");
        addInstruction(BinaryOperation(isNull, arrayAddr.copy(), Eq(), Nullpointer()));

        BasicBlock whenIsNull = newBasicBlock("whenIsNull");
        BasicBlock notNull = newBasicBlock("notNull");
        currentBlock.add(Branch(VarRef(isNull), whenIsNull, notNull));

        addBasicBlock(whenIsNull);
        whenIsNull.add(HaltWithError(errorMessage));

        addBasicBlock(notNull);
        setCurrentBlock(notNull);
    }

    Operand getArrayLen(Operand arrayAddr) {
        TemporaryVar addr = TemporaryVar("length_addr");
        addInstruction(GetElementPtr(addr,
                arrayAddr.copy(), OperandList(ConstInt(0), ConstInt(0))));
        TemporaryVar len = TemporaryVar("len");
        addInstruction(Load(len, VarRef(addr)));
        return VarRef(len);
    }

    public Operand getNewArrayFunc(Type componentType) {
        Proc proc = newArrayFuncForType.computeIfAbsent(componentType, this::createNewArrayProc);
        return ProcedureRef(proc);
    }

    private Proc createNewArrayProc(Type componentType) {
        Parameter size = Parameter(TypeInt(), "size");
        return Proc("newArray",
                getArrayPointerType(componentType), ParameterList(size), BasicBlockList());
    }

    private Type getArrayPointerType(Type componentType) {
        return TypePointer(getArrayStruct(componentType));
    }

    TypeStruct getArrayStruct(Type type) {
        return arrayStruct.computeIfAbsent(type, t -> {
            TypeStruct struct = TypeStruct("array_" + type, StructFieldList(
                    StructField(TypeInt(), "length"),
                    StructField(TypeArray(type, 0), "data")
            ));
            prog.getStructTypes().add(struct);
            return struct;
        });
    }

    Operand addCastIfNecessary(Operand value, Type expectedType) {
        if (expectedType.equalsType(value.calculateType())) {
            return value;
        }
        TemporaryVar castValue = TemporaryVar("castValue");
        addInstruction(Bitcast(castValue, expectedType, value));
        return VarRef(castValue);
    }

    BasicBlock unreachableBlock() {
        return BasicBlock();
    }

    Type getCurrentReturnType() {
        return currentProcedure.getReturnType();
    }

    Proc getConstructor(String name) {
        return contructors.get(name);
    }

    public Proc loadFunctionProc(NQJFunctionDecl functionDeclaration) {
        return functionImpl.get(functionDeclaration);
    }

    public Global getvTable(String name) {
        return vtables.get(name);
    }

    public TypeStruct getvTableStruct(String name) {
        return vtableStructs.get(name);
    }

    public TypeStruct getClassStruct(String name) {
        return classes.get(name);
    }

    public Proc getMethodProc(NQJFunctionDecl methodDeclaration) {
        return methodImpl.get(methodDeclaration);
    }

    /**
     * return the number of bytes required by the given type.
     */
    public Operand byteSize(Type type) {
        return type.match(new Type.Matcher<>() {
            @Override
            public Operand case_TypeByte(TypeByte typeByte) {
                return ConstInt(1);
            }

            @Override
            public Operand case_TypeArray(TypeArray typeArray) {
                throw new RuntimeException("TODO implement");
            }

            @Override
            public Operand case_TypeProc(TypeProc typeProc) {
                throw new RuntimeException("TODO implement");
            }

            @Override
            public Operand case_TypeInt(TypeInt typeInt) {
                return ConstInt(4);
            }

            @Override
            public Operand case_TypeStruct(TypeStruct typeStruct) {
                return Sizeof(typeStruct);
            }

            @Override
            public Operand case_TypeNullpointer(TypeNullpointer typeNullpointer) {
                return ConstInt(8);
            }

            @Override
            public Operand case_TypeVoid(TypeVoid typeVoid) {
                return ConstInt(0);
            }

            @Override
            public Operand case_TypeBool(TypeBool typeBool) {
                return ConstInt(1);
            }

            @Override
            public Operand case_TypePointer(TypePointer typePointer) {
                return ConstInt(8);
            }
        });
    }

    private Operand defaultValue(Type componentType) {
        return componentType.match(new Type.Matcher<>() {
            @Override
            public Operand case_TypeByte(TypeByte typeByte) {
                throw new RuntimeException("TODO implement");
            }

            @Override
            public Operand case_TypeArray(TypeArray typeArray) {
                throw new RuntimeException("TODO implement");
            }

            @Override
            public Operand case_TypeProc(TypeProc typeProc) {
                throw new RuntimeException("TODO implement");
            }

            @Override
            public Operand case_TypeInt(TypeInt typeInt) {
                return ConstInt(0);
            }

            @Override
            public Operand case_TypeStruct(TypeStruct typeStruct) {
                throw new RuntimeException("TODO implement");
            }

            @Override
            public Operand case_TypeNullpointer(TypeNullpointer typeNullpointer) {
                return Nullpointer();
            }

            @Override
            public Operand case_TypeVoid(TypeVoid typeVoid) {
                throw new RuntimeException("TODO implement");
            }

            @Override
            public Operand case_TypeBool(TypeBool typeBool) {
                return ConstBool(false);
            }

            @Override
            public Operand case_TypePointer(TypePointer typePointer) {
                return Nullpointer();
            }
        });
    }
}
