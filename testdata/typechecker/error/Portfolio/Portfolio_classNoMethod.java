interface A {
    int helloWorld();
}

class B implements A{
}

    int main(){
        A b;
        b = new B();
        b.helloWorld();
        return 1;
    }