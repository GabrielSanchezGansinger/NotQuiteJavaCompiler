int main() {
        Feathers f;
        f = new Feathers();
        f.changeWeight(1);
        Steel s;
        s = new Steel();
        s.changeWeight(1);

        int result;
        result = heavier(f,s);
        printInt(result);
        return 0;
}
interface Thing {
    int changeWeight(int val);
    int getWeight();
}
class Feathers implements Thing {
    int weightInKg;
    int changeWeight(int val){
        weightInKg = val;
    }
    int getWeight() {
        return weightInKg;
    }
}

class Steel implements Thing {
    int weightInKg;
    int changeWeight(int val){
        weightInKg = val;
    }

    int getWeight() {
        return weightInKg;
    }
}

int heavier (Thing a, Thing b){
    if (a.getWeight() < b.getWeight())
        return 0;
    else
        return 1;
}

