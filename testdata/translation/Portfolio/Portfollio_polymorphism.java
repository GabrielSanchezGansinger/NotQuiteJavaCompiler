
interface Vehicle {
    int getWheelAmmount();
}

interface Motorized {
    int getHorsePower();
}

class Car implements Vehicle, Motorized {
    int getHorsePower() {
        return 50;
    }
    int getWheelAmmount() {
        return 4;
    }
}

class Bicycle implements Vehicle {
    int getWheelAmmount() {
        return 2;
    }
}


    int main() {
        int res;

        Vehicle a;
        a = new Car();
        res = a.getWheelAmmount();
        printInt(res);

        a = new Bicycle();
        res = a.getWheelAmmount();
        printInt(res);
        return 0;
    }