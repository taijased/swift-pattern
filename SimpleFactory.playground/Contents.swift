// Пораждающий паттерн

class HugeCar {
    func drive() {
        print("you drive huge car")
    }
}


class FastCar {
    func drive() {
        print("you drive fast car")
    }
}


// В один прекрасный день измениться инициализация этих классов и тоби придет пиздец заебешься все переделывывать 
let hugeCar = HugeCar()
hugeCar.drive()

let fastCar = FastCar()
fastCar.drive()


enum CarType {
    case truck, classic
}
protocol Car {
    func drive()
}

class CarFactory {
    static func produceCar(type: CarType) -> Car {
        var car: Car
        switch type {
            case .truck: car = TruckCar()
            case .classic: car = ClassicCar(model: "Panamera")
        }
        return car
    }
}

class TruckCar: Car {
    func drive() {
        print("you drive truck car")
    }
}


class ClassicCar: Car {
    var model: String
    init(model: String) {
        self.model = model
    }
    func drive() {
        print("you drive classic car \(model)")
    }
}


let trackCar = CarFactory.produceCar(type: .truck)
trackCar.drive()
let classicCar = CarFactory.produceCar(type: .classic)
classicCar.drive()
