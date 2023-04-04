package notquitejava.analysis;

import analysis.Analysis;
import frontend.NQJFrontend;
import frontend.SyntaxError;
import notquitejava.ast.NQJProgram;
import org.hamcrest.CoreMatchers;
import org.junit.Assert;
import org.junit.Test;

import static org.junit.Assert.fail;

public class Portfolio_tests_analysis {

    @Test
    public void testSimpleClassWithMethod() throws Exception{
        String input = "class Test {" +
                "   int helloWorld(){" +
                "       printInt(1);" +
                "       return 0;" +
                "   }" +
                "}" +
                "int main(){" +
                "   Test a;" +
                "   a = new Test();" +
                "   a.helloWorld();" +
                "   return 0;" +
                "}";
        test(input);
    }
    @Test
    public void testSimpleClassWithField() throws Exception{
        String input = "class Test {" +
                "   int value;" +
                "}" +
                "int main(){" +
                "   Test a;" +
                "   a.value = 1;" +
                "   printInt(a.value);" +
                "   return 0;" +
                "}";
        test(input);
    }
    @Test
    public void testClassandInterfaceInteraction() throws Exception{
        String input = "interface A {" +
                "    int helloWorld();" +
                "}" +
                "" +
                "class B implements A{" +
                "    int helloWorld(){" +
                "        return 1;" +
                "    }" +
                "}" +
                "" +
                "int main(){" +
                "    A b;" +
                "    b = new B();" +
                "    b.helloWorld();" +
                "    return 0;" +
                "}";
        test(input);
    }

    @Test
    public void testClassFieldAccess() throws Exception{
        String input =
                "class B{" +
                "    int val;" +
                "    int helloWorld(){" +
                "        val = 1;" +
                        "return 1;" +
                "    }" +
                "}" +
                "" +
                "int main(){" +
                "    B b;" +
                "    b = new B();" +
                "    b.helloWorld();" +
                        "b.val = 2;" +
                "    return 0;" +
                "}";
        test(input);
    }
    @Test
    public void testInterfaceCall() throws Exception{
        String input = "interface A {" +
                "    int helloWorld();" +
                "}" +
                "" +
                "class B implements A{" +
                "   int helloWorld(){" +
                "       printInt(1);" +
                "       return 1;" +
                "    }" +
                "}" +
                "" +
                "int main(){" +
                "    A b;" +
                "    b = new B();" +
                "    test(b);" +
                "    return 0;" +
                "}" +
                "int test(A a){" +
                "   a.helloWorld();" +
                "   return 0;" +
                "}";
        test(input);
    }

    public void test(String input) throws Exception {
        NQJFrontend frontend = new NQJFrontend();
        NQJProgram program = frontend.parseString(input);
        if (!frontend.getSyntaxErrors().isEmpty()) {
            SyntaxError syntaxError = frontend.getSyntaxErrors().get(0);
            fail("Unexpected syntax error in (" + "Input string" + ":" + syntaxError.getLine() + ")\n" + syntaxError.getMessage());
        }
        Analysis analysis = new Analysis(program);
        analysis.check();
        if(!analysis.getTypeErrors().isEmpty()){
            fail("Analysis fail");
        }
    }
}
