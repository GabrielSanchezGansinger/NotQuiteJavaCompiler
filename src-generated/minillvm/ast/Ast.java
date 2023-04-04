//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

@SuppressWarnings({"cast", "unused", "rawtypes"})
public class Ast {
    public static Prog Prog(TypeStructList structTypes, GlobalList globals, ProcList procedures) {
        return new ProgImpl(structTypes, globals, procedures);
    }
    public static Global Global(Type type, String name, boolean isConstant, Const initialValue) {
        return new GlobalImpl(type, name, isConstant, initialValue);
    }
    public static Parameter Parameter(Type type, String name) {
        return new ParameterImpl(type, name);
    }
    public static TemporaryVar TemporaryVar(String name) {
        return new TemporaryVarImpl(name);
    }
    public static Proc Proc(String name, Type returnType, ParameterList parameters, BasicBlockList basicBlocks) {
        return new ProcImpl(name, returnType, parameters, basicBlocks);
    }
    public static Print Print(Operand e) {
        return new PrintImpl(e);
    }
    public static Store Store(Operand address, Operand value) {
        return new StoreImpl(address, value);
    }
    public static CommentInstr CommentInstr(String text) {
        return new CommentInstrImpl(text);
    }
    public static Alloc Alloc(TemporaryVar var, Operand sizeInBytes) {
        return new AllocImpl(var, sizeInBytes);
    }
    public static Alloca Alloca(TemporaryVar var, Type type) {
        return new AllocaImpl(var, type);
    }
    public static BinaryOperation BinaryOperation(TemporaryVar var, Operand left, Operator operator, Operand right) {
        return new BinaryOperationImpl(var, left, operator, right);
    }
    public static Bitcast Bitcast(TemporaryVar var, Type type, Operand expr) {
        return new BitcastImpl(var, type, expr);
    }
    public static Call Call(TemporaryVar var, Operand function, OperandList arguments) {
        return new CallImpl(var, function, arguments);
    }
    public static GetElementPtr GetElementPtr(TemporaryVar var, Operand baseAddress, OperandList indices) {
        return new GetElementPtrImpl(var, baseAddress, indices);
    }
    public static Load Load(TemporaryVar var, Operand address) {
        return new LoadImpl(var, address);
    }
    public static PhiNode PhiNode(TemporaryVar var, Type type, PhiNodeChoiceList choices) {
        return new PhiNodeImpl(var, type, choices);
    }
    public static Add Add() {
        return new AddImpl();
    }
    public static Sub Sub() {
        return new SubImpl();
    }
    public static Mul Mul() {
        return new MulImpl();
    }
    public static Sdiv Sdiv() {
        return new SdivImpl();
    }
    public static Srem Srem() {
        return new SremImpl();
    }
    public static And And() {
        return new AndImpl();
    }
    public static Or Or() {
        return new OrImpl();
    }
    public static Xor Xor() {
        return new XorImpl();
    }
    public static Eq Eq() {
        return new EqImpl();
    }
    public static Slt Slt() {
        return new SltImpl();
    }
    public static PhiNodeChoice PhiNodeChoice(BasicBlock label, Operand value) {
        return new PhiNodeChoiceImpl(label, value);
    }
    public static Branch Branch(Operand condition, BasicBlock ifTrueLabel, BasicBlock ifFalseLabel) {
        return new BranchImpl(condition, ifTrueLabel, ifFalseLabel);
    }
    public static Jump Jump(BasicBlock label) {
        return new JumpImpl(label);
    }
    public static ReturnExpr ReturnExpr(Operand returnValue) {
        return new ReturnExprImpl(returnValue);
    }
    public static ReturnVoid ReturnVoid() {
        return new ReturnVoidImpl();
    }
    public static HaltWithError HaltWithError(String msg) {
        return new HaltWithErrorImpl(msg);
    }
    public static VarRef VarRef(Variable variable) {
        return new VarRefImpl(variable);
    }
    public static ConstBool ConstBool(boolean boolVal) {
        return new ConstBoolImpl(boolVal);
    }
    public static ConstInt ConstInt(int intVal) {
        return new ConstIntImpl(intVal);
    }
    public static GlobalRef GlobalRef(Global global) {
        return new GlobalRefImpl(global);
    }
    public static ProcedureRef ProcedureRef(Proc procedure) {
        return new ProcedureRefImpl(procedure);
    }
    public static Nullpointer Nullpointer() {
        return new NullpointerImpl();
    }
    public static Sizeof Sizeof(TypeStruct structType) {
        return new SizeofImpl(structType);
    }
    public static ConstStruct ConstStruct(TypeStruct structType, ConstList values) {
        return new ConstStructImpl(structType, values);
    }
    public static TypeArray TypeArray(Type of, int size) {
        return new TypeArrayImpl(of, size);
    }
    public static TypeBool TypeBool() {
        return new TypeBoolImpl();
    }
    public static TypeByte TypeByte() {
        return new TypeByteImpl();
    }
    public static TypeInt TypeInt() {
        return new TypeIntImpl();
    }
    public static TypePointer TypePointer(Type to) {
        return new TypePointerImpl(to);
    }
    public static TypeNullpointer TypeNullpointer() {
        return new TypeNullpointerImpl();
    }
    public static TypeProc TypeProc(TypeRefList argTypes, Type resultType) {
        return new TypeProcImpl(argTypes, resultType);
    }
    public static TypeStruct TypeStruct(String name, StructFieldList fields) {
        return new TypeStructImpl(name, fields);
    }
    public static TypeVoid TypeVoid() {
        return new TypeVoidImpl();
    }
    public static StructField StructField(Type type, String name) {
        return new StructFieldImpl(type, name);
    }
    public static BasicBlock BasicBlock(Instruction ... elements ) {
        BasicBlock l = new BasicBlockImpl();
        l.addAll(Arrays.asList(elements));
        return l;
    }
    public static BasicBlock BasicBlock(Iterable<Instruction> elements ) {
        BasicBlock l = new BasicBlockImpl();
        if (elements instanceof Collection) l.addAll((Collection<? extends Instruction>) elements);
        else for (Instruction elem : elements) l.add(elem);
        return l;
    }
    public static TypeStructList TypeStructList(TypeStruct ... elements ) {
        TypeStructList l = new TypeStructListImpl();
        l.addAll(Arrays.asList(elements));
        return l;
    }
    public static TypeStructList TypeStructList(Iterable<TypeStruct> elements ) {
        TypeStructList l = new TypeStructListImpl();
        if (elements instanceof Collection) l.addAll((Collection<? extends TypeStruct>) elements);
        else for (TypeStruct elem : elements) l.add(elem);
        return l;
    }
    public static GlobalList GlobalList(Global ... elements ) {
        GlobalList l = new GlobalListImpl();
        l.addAll(Arrays.asList(elements));
        return l;
    }
    public static GlobalList GlobalList(Iterable<Global> elements ) {
        GlobalList l = new GlobalListImpl();
        if (elements instanceof Collection) l.addAll((Collection<? extends Global>) elements);
        else for (Global elem : elements) l.add(elem);
        return l;
    }
    public static ProcList ProcList(Proc ... elements ) {
        ProcList l = new ProcListImpl();
        l.addAll(Arrays.asList(elements));
        return l;
    }
    public static ProcList ProcList(Iterable<Proc> elements ) {
        ProcList l = new ProcListImpl();
        if (elements instanceof Collection) l.addAll((Collection<? extends Proc>) elements);
        else for (Proc elem : elements) l.add(elem);
        return l;
    }
    public static ParameterList ParameterList(Parameter ... elements ) {
        ParameterList l = new ParameterListImpl();
        l.addAll(Arrays.asList(elements));
        return l;
    }
    public static ParameterList ParameterList(Iterable<Parameter> elements ) {
        ParameterList l = new ParameterListImpl();
        if (elements instanceof Collection) l.addAll((Collection<? extends Parameter>) elements);
        else for (Parameter elem : elements) l.add(elem);
        return l;
    }
    public static ConstList ConstList(Const ... elements ) {
        ConstList l = new ConstListImpl();
        l.addAll(Arrays.asList(elements));
        return l;
    }
    public static ConstList ConstList(Iterable<Const> elements ) {
        ConstList l = new ConstListImpl();
        if (elements instanceof Collection) l.addAll((Collection<? extends Const>) elements);
        else for (Const elem : elements) l.add(elem);
        return l;
    }
    public static StructFieldList StructFieldList(StructField ... elements ) {
        StructFieldList l = new StructFieldListImpl();
        l.addAll(Arrays.asList(elements));
        return l;
    }
    public static StructFieldList StructFieldList(Iterable<StructField> elements ) {
        StructFieldList l = new StructFieldListImpl();
        if (elements instanceof Collection) l.addAll((Collection<? extends StructField>) elements);
        else for (StructField elem : elements) l.add(elem);
        return l;
    }
    public static TypeRefList TypeRefList(Type ... elements ) {
        TypeRefList l = new TypeRefListImpl();
        l.addAll(Arrays.asList(elements));
        return l;
    }
    public static TypeRefList TypeRefList(Iterable<Type> elements ) {
        TypeRefList l = new TypeRefListImpl();
        if (elements instanceof Collection) l.addAll((Collection<? extends Type>) elements);
        else for (Type elem : elements) l.add(elem);
        return l;
    }
    public static BasicBlockList BasicBlockList(BasicBlock ... elements ) {
        BasicBlockList l = new BasicBlockListImpl();
        l.addAll(Arrays.asList(elements));
        return l;
    }
    public static BasicBlockList BasicBlockList(Iterable<BasicBlock> elements ) {
        BasicBlockList l = new BasicBlockListImpl();
        if (elements instanceof Collection) l.addAll((Collection<? extends BasicBlock>) elements);
        else for (BasicBlock elem : elements) l.add(elem);
        return l;
    }
    public static PhiNodeList PhiNodeList(PhiNode ... elements ) {
        PhiNodeList l = new PhiNodeListImpl();
        l.addAll(Arrays.asList(elements));
        return l;
    }
    public static PhiNodeList PhiNodeList(Iterable<PhiNode> elements ) {
        PhiNodeList l = new PhiNodeListImpl();
        if (elements instanceof Collection) l.addAll((Collection<? extends PhiNode>) elements);
        else for (PhiNode elem : elements) l.add(elem);
        return l;
    }
    public static PhiNodeChoiceList PhiNodeChoiceList(PhiNodeChoice ... elements ) {
        PhiNodeChoiceList l = new PhiNodeChoiceListImpl();
        l.addAll(Arrays.asList(elements));
        return l;
    }
    public static PhiNodeChoiceList PhiNodeChoiceList(Iterable<PhiNodeChoice> elements ) {
        PhiNodeChoiceList l = new PhiNodeChoiceListImpl();
        if (elements instanceof Collection) l.addAll((Collection<? extends PhiNodeChoice>) elements);
        else for (PhiNodeChoice elem : elements) l.add(elem);
        return l;
    }
    public static InstructionList InstructionList(Instruction ... elements ) {
        InstructionList l = new InstructionListImpl();
        l.addAll(Arrays.asList(elements));
        return l;
    }
    public static InstructionList InstructionList(Iterable<Instruction> elements ) {
        InstructionList l = new InstructionListImpl();
        if (elements instanceof Collection) l.addAll((Collection<? extends Instruction>) elements);
        else for (Instruction elem : elements) l.add(elem);
        return l;
    }
    public static OperandList OperandList(Operand ... elements ) {
        OperandList l = new OperandListImpl();
        l.addAll(Arrays.asList(elements));
        return l;
    }
    public static OperandList OperandList(Iterable<Operand> elements ) {
        OperandList l = new OperandListImpl();
        if (elements instanceof Collection) l.addAll((Collection<? extends Operand>) elements);
        else for (Operand elem : elements) l.add(elem);
        return l;
    }
}