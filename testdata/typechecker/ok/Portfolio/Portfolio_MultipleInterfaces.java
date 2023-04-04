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

int main() {
    Vehicle a;
    a = new Car();
    a.getWheelAmmount();

    Motorized b;
    b = new Car();
    b.getHorsePower();
    return 0;
}