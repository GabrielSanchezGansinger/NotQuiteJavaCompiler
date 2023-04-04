interface Thing {
}
class Feathers implements Thing {
    int weightInKg;
}

class Steel implements Thing {
    int weightInKg;
}

int heavier (Thing a, Thing b){
    if (a.weightInKg < b.weightInKg)
        return 0;
    else
        return 1;
}

int main() {
    Feathers f;
    f = new Feathers();
    f.weightInKg = 1;
    Steel s;
    s = new Steel();
    s.weightInKg = 1;

    int result;
    result = heavier(f,s);
    printInt(result);
    return 0;
}