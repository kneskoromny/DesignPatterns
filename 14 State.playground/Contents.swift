// описывает состояния принтера
protocol State {
    func on(printer: Printer)
    func off(printer: Printer)
    func printDocument(printer: Printer)
}
// описывает действия в состоянии ВКЛ
class On: State {
    // основное состояние
    func on(printer: Printer) {
        print("it is on already")
    }
    // при вызове ВЫКЛ переходит в ВЫКЛ
    func off(printer: Printer) {
        print("turning printer off")
        printer.set(state: Off())
    }
    // при вызове печати переходит в ПЕЧАТЬ
    func printDocument(printer: Printer) {
        print("printing")
        printer.set(state: Print())
    }
}
// описывает действия в состоянии ВЫКЛ
class Off: State {
    func on(printer: Printer) {
        print("turning on")
        printer.set(state: On())
    }
    // основное состояние
    func off(printer: Printer) {
        print("it is already off")
    }
    func printDocument(printer: Printer) {
        print("it is off, we can't print")
    }
}
// описывает действия в состоянии ПЕЧАТЬ
class Print: State {
    func on(printer: Printer) {
        print("it is on already")
    }
    func off(printer: Printer) {
        print("turning printer off")
        printer.set(state: Off())
    }
    // основное состояние
    func printDocument(printer: Printer) {
        print("it is already printing")
    }
}

class Printer {
    // состояние принтера
    var state: State
    
    init() {
        self.state = On()
    }
    
    func set(state: State) {
        self.state = state
    }
    // вызываем методы протокола
    func turnOn() {
        state.on(printer: self)
    }
    func turnOff() {
        state.off(printer: self)
    }
    func printDocument() {
        state.printDocument(printer: self)
    }
}

let printer = Printer()
printer.printDocument()
printer.turnOff()
printer.turnOn()
printer.turnOn()
printer.turnOff()
printer.turnOff()












