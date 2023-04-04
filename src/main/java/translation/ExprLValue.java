package translation;

import minillvm.ast.*;
import notquitejava.ast.*;

import static minillvm.ast.Ast.*;

/**
 * Evaluate L values.
 */
public class ExprLValue implements NQJExprL.Matcher<Operand> {
    private final Translator tr;

    public ExprLValue(Translator translator) {
        this.tr = translator;
    }

    @Override
    public Operand case_ArrayLookup(NQJArrayLookup e) {
        Operand arrayAddr = tr.exprRvalue(e.getArrayExpr());
        tr.addNullcheck(arrayAddr, "Nullpointer exception in line " + tr.sourceLine(e));

        Operand index = tr.exprRvalue(e.getArrayIndex());

        Operand len = tr.getArrayLen(arrayAddr);
        TemporaryVar smallerZero = Ast.TemporaryVar("smallerZero");
        TemporaryVar lenMinusOne = Ast.TemporaryVar("lenMinusOne");
        TemporaryVar greaterEqualLen = Ast.TemporaryVar("greaterEqualLen");
        TemporaryVar outOfBoundsV = Ast.TemporaryVar("outOfBounds");
        final BasicBlock outOfBounds = tr.newBasicBlock("outOfBounds");
        final BasicBlock indexInRange = tr.newBasicBlock("indexInRange");


        // smallerZero = index < 0
        tr.addInstruction(BinaryOperation(smallerZero, index, Slt(), Ast.ConstInt(0)));
        // lenMinusOne = length - 1
        tr.addInstruction(BinaryOperation(lenMinusOne, len, Sub(), Ast.ConstInt(1)));
        // greaterEqualLen = lenMinusOne < index
        tr.addInstruction(BinaryOperation(greaterEqualLen,
                VarRef(lenMinusOne), Slt(), index.copy()));
        // outOfBoundsV = smallerZero || greaterEqualLen
        tr.addInstruction(BinaryOperation(outOfBoundsV,
                VarRef(smallerZero), Or(), VarRef(greaterEqualLen)));

        tr.getCurrentBlock().add(Ast.Branch(VarRef(outOfBoundsV), outOfBounds, indexInRange));

        tr.addBasicBlock(outOfBounds);
        outOfBounds.add(Ast.HaltWithError("Index out of bounds error in line " + tr.sourceLine(e)));

        tr.addBasicBlock(indexInRange);
        tr.setCurrentBlock(indexInRange);
        TemporaryVar indexAddr = Ast.TemporaryVar("indexAddr");
        tr.addInstruction(Ast.GetElementPtr(indexAddr, arrayAddr, Ast.OperandList(
                Ast.ConstInt(0),
                Ast.ConstInt(1),
                index.copy()
        )));
        return VarRef(indexAddr);
    }

    @Override
    public Operand case_FieldAccess(NQJFieldAccess e) {

        Operand receiver = tr.exprRvalue(e.getReceiver());
        TypePointer point = (TypePointer) receiver.calculateType();
        TypeStruct struct = (TypeStruct) point.getTo();
        TemporaryVar loc = TemporaryVar("fieldLocation");
        for (int i = 0; i < struct.getFields().size(); i++) {
            StructField field = struct.getFields().get(i);
            if (field.getName().equals(e.getFieldName())) {
                tr.addInstruction(GetElementPtr(loc, receiver,
                        OperandList(ConstInt(0), ConstInt(i))));
                break;
            }
        }
        return VarRef(loc);
    }

    @Override
    public Operand case_VarUse(NQJVarUse e) {
        NQJVarDecl varDecl = e.getVariableDeclaration();
        // local TemporaryVar
        TemporaryVar res = tr.getLocalVarLocation(varDecl);
        if (res == null) {
            TemporaryVar result = TemporaryVar("res");
            Parameter thisParam = tr.getThisParameter();
            TypePointer classPoint =  (TypePointer) thisParam.calculateType();
            TypeStruct struct = (TypeStruct) classPoint.getTo();
            TypeStruct classStruct = tr.getClassStruct(struct.getName());
            int index = -1;
            for (int i = 1; i < classStruct.getFields().size(); i++) {
                if (classStruct.getFields().get(i).getName().equals(e.getVarName())) {
                    index = i;
                    break;
                }
            }
            if (index == -1) {
                throw new IllegalStateException("No field with name " + e.getVarName());
            }

            tr.addInstruction(GetElementPtr(result, VarRef(thisParam),
                    OperandList(ConstInt(0), ConstInt(index))));
            return VarRef(result);
        }
        return VarRef(res);
    }

}
