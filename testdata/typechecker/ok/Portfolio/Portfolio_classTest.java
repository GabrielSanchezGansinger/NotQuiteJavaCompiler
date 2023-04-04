interface A {
    int helloWorld();
}

class B implements A{
    int helloWorld(){
        return 1;
    }
}

int main(){
    A b;
    b = new B();
    b.helloWorld();
    return 1;
}
