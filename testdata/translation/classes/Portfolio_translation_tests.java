interface A {
    int helloWorld();
}

class B implements A{
    int helloWorld(){
        return 1;
    }
}

    int main(){
        B b;
        b = new B();
        b.helloWorld();
        test();
        return 0;
    }

int test(){
    printInt(1);
    return 1;
}