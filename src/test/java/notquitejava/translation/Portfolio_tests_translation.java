package notquitejava.translation;

import org.junit.Test;

public class Portfolio_tests_translation {


    @Test
    public void testClassAssignment() throws Exception{
        String input =
                "class B{" +
                "    int value; "  +
                "}" +
                " " +
                "int main(){" +
                "    B b;" +
                "    b = new B();" +
                "    printInt(b.value);" +
                "    b.value = 2;" +
                "    printInt(b.value);" +
                "    return 0;" +
                "}";
        TranslationTestHelper.testLLVMTranslation("Test.java", input);
    }

    @Test
    public void testClassMethod() throws Exception{
        String input = "interface A {" +
                "   int helloworld();" +
                "}" +
                " " +
                "class B implements A{" +
                "    int value; " +
                "    int helloworld() {" +
                "       this.value = 4;" +
                "       return 1;" +
                "    }"  +
                "}" +
                " " +
                "int main(){" +
                "    B b;" +
                "    b = new B();" +
                "    printInt(b.value);" +
                "    b.helloworld();" +
                "    printInt(b.value);" +
                "    return 0;" +
                "}";
        TranslationTestHelper.testLLVMTranslation("Test.java", input);
    }

    @Test
    public void testArrayAccess() throws Exception{
        String input = "int main() {\n" +
                "        int[][][] a;\n" +
                "        a = new int[5][1][5];\n" +
                "        printInt(a[0][0][1]);\n" +
                "        return 0;\n" +
                "    }";
        TranslationTestHelper.testLLVMTranslation("Test.java", input);
    }

    @Test
    public void testInterfaceCallRunsThrough() throws Exception{
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
        TranslationTestHelper.testLLVMTranslation("Test.java", input);
    }
}
