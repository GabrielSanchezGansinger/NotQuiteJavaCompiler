package notquitejava.parser;

import frontend.AstPrinter;
import frontend.NQJFrontend;
import frontend.SyntaxError;
import notquitejava.ast.NQJElement;
import notquitejava.ast.NQJMethodCall;
import notquitejava.ast.NQJProgram;
import org.hamcrest.CoreMatchers;
import org.junit.Assert;
import org.junit.Test;
public class Portfolio_tests_parser {

    @Test
    public void testInterfacesAndClassesAlternate() throws Exception {
        String input = "interface Z { int foo(); } class A{} interface Y {} class B{} class C{}";
        NQJProgram ast = new NQJFrontend().parseString(input);
        String printed = AstPrinter.print(ast);
        System.out.println(printed);
        Assert.assertThat(printed, CoreMatchers.containsString("interface Z"));
        Assert.assertThat(printed, CoreMatchers.containsString("class A"));
        Assert.assertThat(printed, CoreMatchers.containsString("interface Y"));
        Assert.assertThat(printed, CoreMatchers.containsString("class B"));
        Assert.assertThat(printed, CoreMatchers.containsString("class C"));
    }
}
