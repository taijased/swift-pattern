// Структурный паттерн

// типа магазины продающие один товар
class FruitShop {
    func buyFruits() -> String{
        return "fruits"
    }
}


class MeatShop {
    func buyMeat() -> String{
        return "meat"
    }
}


class MilkShop {
    func buyMilk() -> String{
        return "milk"
    }
}


class SweetShop {
    func buySweets() -> String{
        return "sweet"
    }
}

class BreadShop {
    func buyBread() -> String{
        return "bread"
    }
}

// создаем супермаркет который объеденит эти все покупки это и будет Facade

class Supermarket {
    private let fruitShop = FruitShop()
    private let meatShop = MeatShop()
    private let milkShop = MilkShop()
    private let sweetShop = SweetShop()
    private let breadShop = BreadShop()
    func buyProducts() -> String {
        var products = ""
        
        products += fruitShop.buyFruits() + ", "
        products += meatShop.buyMeat() + ", "
        products += milkShop.buyMilk() + ", "
        products += sweetShop.buySweets() + ", "
        products += breadShop.buyBread() + ", "
        return "I bought" + products
    }
}

let sm = Supermarket()

sm.buyProducts()
