int main() {
        boolean res;
        Apple app;
        app = new Apple();
        healthy(app);


        Fruit ban;
        ban = new Banana();
        res = healthy(ban);
        if (res == false)
        printInt(1);
        else
        printInt(0);

        return 0;
}

interface Fruit {
    int getColorHue();

    int getAmmountOfCalories();
}

class Banana implements Fruit {
    int getColorHue() {
        return 56;
    }

    int getAmmountOfCalories() {
        return 89;
    }
}

class Apple implements Fruit {
    int getColorHue() {
        return 360;
    }

    int getAmmountOfCalories() {
        return 52;
    }
}

boolean healthy(Fruit f) {
    if (f.getAmmountOfCalories() < 60)
        return true;
    else
        return false;
    return false;
}

