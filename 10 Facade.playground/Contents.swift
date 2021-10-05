
/*
 каждый класс имеет свой определенный метод
 характерный только для него
 */
class FruitShop {
    func buyFruits() -> String {
        return "fruits"
    }
}
class MeatShop {
    func buyMeat() -> String {
        return "meat"
    }
}
class MilkShop {
    func buyMilk() -> String {
        return "milk"
    }
}
class SweetShop {
    func buySweets() -> String {
        return "sweets"
    }
}
class BreadShop {
    func buyBread() -> String {
        return "bread"
    }
}

/*
 Facade объединяет все классы путем
 создания внутри себя экземпляров
 этих классов
 */
class Supermarket {
    private let fruitShop = FruitShop()
    private let meatShop = MeatShop()
    private let milkShop = MilkShop()
    private let sweetShop = SweetShop()
    private let breadShop = BreadShop()
    
    // объединяем все методы классов внутри одного
    func buyProducts() -> String {
        var products = ""
        products += fruitShop.buyFruits() + ", "
        products += meatShop.buyMeat() + ", "
        products += milkShop.buyMilk() + ", "
        products += sweetShop.buySweets() + ", "
        products += breadShop.buyBread()
        return "I bought: " + products
    }
}

let sm = Supermarket()
sm.buyProducts()










