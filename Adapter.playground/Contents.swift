// Структурный паттерн

// adaptee
class SimpleCar {
    func sound() -> String {
        return "tractor v pole tr-tr-tr"
    }
}
// target
protocol SupercarProtocol {
    func makeNoise() -> String
}

class Supercar: SupercarProtocol {
    func makeNoise() -> String {
        return "yooouuupeee"
    }
}
// adaptor
class SupercarAdaptor: SupercarProtocol {
    var simpleCar: SimpleCar
    
    init(simpleCar: SimpleCar) {
        self.simpleCar = simpleCar
    }
    func makeNoise() -> String {
        return simpleCar.sound()
    }
}

