class Enemy {
    let strength = 400
}
// определяет что необходимо для участия в цепочке каждому классу
protocol MilitaryChain {
    var strength: Int { get }
    // используется для передачи по цепочке
    var nextRank: MilitaryChain? { get set }
    // попытка обработать запрос
    func shouldDefeatWithStrength(amount: Int)
}

class Soldier: MilitaryChain {
    var strength = 100
    var nextRank: MilitaryChain?
    func shouldDefeatWithStrength(amount: Int) {
        // проверяем можем ли обработать запрос
        if amount < strength {
            print("Soldier got it")
        } else {
            // обращаемся к след звену и пробуем выполнить им
            nextRank?.shouldDefeatWithStrength(amount: amount)
        }
    }
}

class Officer: MilitaryChain {
    var strength = 500
    var nextRank: MilitaryChain?
    func shouldDefeatWithStrength(amount: Int) {
        if amount < strength {
            print("Officer got it")
        } else {
            nextRank?.shouldDefeatWithStrength(amount: amount)
        }
    }
}

class General: MilitaryChain {
    var strength = 1000
    var nextRank: MilitaryChain?
    func shouldDefeatWithStrength(amount: Int) {
        if amount < strength {
            print("General got it")
        } else {
            print("We can't defeat this enemy")
        }
    }
}

let enemy = Enemy()

let solider = Soldier()
let officer = Officer()
let general = General()

solider.nextRank = officer
officer.nextRank = general

solider.shouldDefeatWithStrength(amount: enemy.strength)









