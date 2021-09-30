
protocol SwimBehavior {
    func swim()
}
// каждый класс, подписанный на протокол предлагает свою реализацию методов этого протокола
class ProfessionalSwimmer: SwimBehavior {
    func swim() {
        print("professional swimming")
    }
}
class NonSwimmer: SwimBehavior {
    func swim() {
        print("non-swimming")
    }
}

// тоже самое с dive
protocol DiveBehavior {
    func dive()
}
class ProfessionalDiver: DiveBehavior {
    func dive() {
        print("professional diving")
    }
}
class NewbieDiver: DiveBehavior {
    func dive() {
        print("newbie diving")
    }
}
class NonDiver: DiveBehavior {
    func dive() {
        print("non-diving")
    }
}


class Human {
    // создаем свойства с типом данных протоколов, то есть объединяем внутри свойства методы всех классов, подписанных на этот протокол
    private var diveBehavior: DiveBehavior!
    private var swimBehavior: SwimBehavior!
    
    func performSwim() {
        // этой записью получаем доступ к методам swim обоих классов
        swimBehavior.swim()
    }
    func performDive() {
        // этой записью получаем доступ к методам dive всех классов
        diveBehavior.dive()
    }
    func setSwimBehavior(sb: SwimBehavior) {
        // в этом методе при создании экземпляра присваиваем ему значение, переданное в метод
        self.swimBehavior = sb
    }
    func setDiveBehavior(db: DiveBehavior) {
        // в этом методе при создании экземпляра присваиваем ему значение, переданное в метод
        self.diveBehavior = db
    }
    func run() {
        print("running")
    }
    
    init(swimBehavior: SwimBehavior, diveBehavior: DiveBehavior) {
        self.swimBehavior = swimBehavior
        self.diveBehavior = diveBehavior
    }
}


let human = Human(swimBehavior: ProfessionalSwimmer(), diveBehavior: ProfessionalDiver())
human.setSwimBehavior(sb: NonSwimmer())
human.performDive()
human.performSwim()









