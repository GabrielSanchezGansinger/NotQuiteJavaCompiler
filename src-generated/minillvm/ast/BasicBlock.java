//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

@SuppressWarnings({"cast", "unused", "rawtypes"})
public abstract class BasicBlock extends AsgList<Instruction> implements Element{
    public BasicBlock copy() {
        BasicBlock result = new BasicBlockImpl();
        for (Instruction elem : this) {
            result.add((Instruction) elem.copy());
        }
        return result;
    }

    @Override public BasicBlock copyWithRefs() {
        BasicBlock res = copy();
        Element self = this;
        res.accept(new Element.DefaultVisitor() {
            @Override public void visit(PhiNodeChoice e) {
                super.visit(e);
                // check reference label
                {
                    Element elem = e.getLabel();
                    while (elem != self && elem != null) {
                        elem = elem.getParent();
                    }
                    if (elem == self) {
                        e.setLabel((BasicBlock) res.followPath(self.pathTo(e.getLabel())));
                    }
                }
            }
            @Override public void visit(Branch e) {
                super.visit(e);
                // check reference ifTrueLabel
                {
                    Element elem = e.getIfTrueLabel();
                    while (elem != self && elem != null) {
                        elem = elem.getParent();
                    }
                    if (elem == self) {
                        e.setIfTrueLabel((BasicBlock) res.followPath(self.pathTo(e.getIfTrueLabel())));
                    }
                }
                // check reference ifFalseLabel
                {
                    Element elem = e.getIfFalseLabel();
                    while (elem != self && elem != null) {
                        elem = elem.getParent();
                    }
                    if (elem == self) {
                        e.setIfFalseLabel((BasicBlock) res.followPath(self.pathTo(e.getIfFalseLabel())));
                    }
                }
            }
            @Override public void visit(Jump e) {
                super.visit(e);
                // check reference label
                {
                    Element elem = e.getLabel();
                    while (elem != self && elem != null) {
                        elem = elem.getParent();
                    }
                    if (elem == self) {
                        e.setLabel((BasicBlock) res.followPath(self.pathTo(e.getLabel())));
                    }
                }
            }
        });
        return res;
    }

    /** */
    public abstract String toString();
    /** "returns the phi node instructions at the beginning of the basic block"*/
    public abstract java.util.List<PhiNode> getPhiNodes();
    /** "returns the final terminating instruction of the basic block if any"*/
    public abstract java.util.Optional<TerminatingInstruction> getTerminatingInstruction();
    /** "a name for this basic block"*/
    public abstract String getName();
    /** "a name for this basic block"*/
    public abstract void setName(String name);
}
