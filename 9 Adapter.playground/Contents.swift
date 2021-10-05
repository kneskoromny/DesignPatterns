


// его подстраиваем под методы протокола
class SimpleCar {
    func sound() -> String {
        return "tr-tr-tr-tr"
    }
}

// методы этого протокола необходимо реализовать
protocol SupercarProtocol {
    func makeNoise() -> String
}

class Supercar: SupercarProtocol {
    func makeNoise() -> String {
        return "wroom-wroom"
    }
}

// адаптер
class SupercarAdaptor: SupercarProtocol {
    
    var simpleCar: SimpleCar
    
    init(simpleCar: SimpleCar) {
        self.simpleCar = simpleCar
    }
    func makeNoise() -> String {
        return simpleCar.sound()
    }
}






