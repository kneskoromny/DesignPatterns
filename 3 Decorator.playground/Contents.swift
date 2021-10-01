


protocol Porsche {
    func getPrice() -> Double
    func getDescription() -> String
}

// класс, реализующий методы протокола
class Boxster: Porsche {
    
    func getPrice() -> Double {
        return 120
    }
    func getDescription() -> String {
        return "Porsche Boxster"
    }
}

/*
 класс-декоратор, позволяющий накладывать опции
 на основной класс, наследуется от основного
 экземпляр этого класса создаваться не будет, но
 он нужен для создания подклассов, обертка для свойств
 */
class PorscheDecorator: Porsche {
    /*
     в это свойство будем передавать тот авто,
     для которого будем использовать доп опции
     */
    private let decoratedPorsche: Porsche
    /*
     когда будем наследоваться от PorsheDecorator
     нужно, чтобы подклассы могли принимать
     уже укомплектованный опциями авто -
     поэтому используем required (обязательный) init
     */
    required init(dp: Porsche) {
        //никак не меняет изначальный авто
        self.decoratedPorsche = dp
    }
    // методы протокола
    func getPrice() -> Double {
        return decoratedPorsche.getPrice()
    }
    
    func getDescription() -> String {
        return decoratedPorsche.getDescription()
    }
}

// отдельный класс для опции аудио
class PremiumAudioSystem: PorscheDecorator {
    /*
     тк наследуемся от PorscheDecorator -
     реализуем его методы
     инициализируем авто, определенный в классе-декораторе
     */
    required init(dp: Porsche) {
        super.init(dp: dp)
    }
    // изменяем цену авто
    override func getPrice() -> Double {
        return super.getPrice() + 30
    }
    // изменяем описание
    override func getDescription() -> String {
        return super.getDescription() + " with premium audio system"
    }
}

// отдельный класс для панорамной крыши
class PanoramicSunroof: PorscheDecorator {
    // принимаем изначальный авто
    required init(dp: Porsche) {
        super.init(dp: dp)
    }
    // меняем цену
    override func getPrice() -> Double {
        return super.getPrice() + 20
    }
    // меняем описание
    override func getDescription() -> String {
        return super.getDescription() + " with panoramic sunroof"
    }
}


var porscheBoxster: Porsche = Boxster()
porscheBoxster.getDescription()
porscheBoxster.getPrice()

porscheBoxster = PremiumAudioSystem(dp: porscheBoxster)
porscheBoxster.getDescription()
porscheBoxster.getPrice()

porscheBoxster = PanoramicSunroof(dp: porscheBoxster)
porscheBoxster.getDescription()
porscheBoxster.getPrice()










