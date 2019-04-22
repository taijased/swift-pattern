// Поведенческий паттерн

let array = [1, 2, 3, 4, 5, 6]
var iterator = array.makeIterator()

while let item = iterator.next() {
    print(item)
}

//for item in array {
//    print(item)
//}


class Driver {
    let isGoodDriver: Bool
    let name: String
    
    init(isGood: Bool, name: String) {
        self.isGoodDriver = isGood
        self.name = name
    }
}

class Car {
    var goodDriveIterator: GoodDriveIterator {
        return GoodDriveIterator(drivers: drivers)
    }
    var badDriveIterator: BadDriveIterator {
        return BadDriveIterator(drivers: drivers)
    }
    private let drivers = [Driver(isGood: true, name: "Maxim"),
                   Driver(isGood: false, name: "Alexandr"),
                   Driver(isGood: true, name: "Dima"),
                   Driver(isGood: true, name: "Ivan"),
                   Driver(isGood: false, name: "Mariya")]
}

extension Car: Sequence {
    func makeIterator() -> GoodDriveIterator {
        return GoodDriveIterator(drivers: drivers)
    }
}



class GoodDriveIterator: IteratorProtocol {
    private let drivers: [Driver]
    private var current = 0
    init(drivers: [Driver]) {
        self.drivers = drivers.filter { $0.isGoodDriver }
    }
    func next() -> Driver? {
        defer { current += 1 }
        return drivers.count > current ? drivers[current] : nil
    }
    func allDrivers() -> [Driver] {
        return drivers
    }
}

class BadDriveIterator: IteratorProtocol {
    private let drivers: [Driver]
    private var current = 0
    init(drivers: [Driver]) {
        self.drivers = drivers.filter { !$0.isGoodDriver }
    }
    func next() -> Driver? {
        defer { current += 1 }
        return drivers.count > current ? drivers[current] : nil
    }
    func allDrivers() -> [Driver] {
        return drivers
    }
}

let car = Car()
let goodDriver = car.goodDriveIterator.next()
let badDriver = car.badDriveIterator.next()

for driver in car {
    print(driver.name)
}

//let goodDriverSequence = car.makeIterator().allDrivers()
