


protocol DriveVehicle {
    func haveASeat()
    func closeTheDoor()
    func useProtection()
    func lookAtTheMirror()
    func turnSignal()
    func driveForward()
    func startVehicle()
}

extension DriveVehicle {
    // шаблонный метод, не переопределяется
    func startVehicle() {
        haveASeat()
        useProtection()
        lookAtTheMirror()
        turnSignal()
        driveForward()
    }
    
    func haveASeat() {
        /*
         чтобы переопределить (override) методы суперкласса
         используем эту запись
         необходимо создавать подклассы и переписывать методы
         */
        preconditionFailure("this method should be overriden")
    }
    
    // определим этот метод именно там, где он будет нужен
    func closeTheDoor() {
    }
    func useProtection() {
        preconditionFailure("this method should be overriden")
    }
    func lookAtTheMirror() {
        preconditionFailure("this method should be overriden")
    }
    func turnSignal() {
        preconditionFailure("this method should be overriden")
    }
    func driveForward() {
        preconditionFailure("this method should be overriden")
    }
}

class Bicycle: DriveVehicle {
    // переопределяем методы суперкласса
    func haveASeat() {
        print("sit down on a bicycle seat")
    }
    func useProtection() {
        print("wear a helmet")
    }
    func lookAtTheMirror() {
        print("look at the little mirror")
    }
    func turnSignal() {
        print("show left hand")
    }
    func driveForward() {
        print("pedal")
    }
}

class Car: DriveVehicle {
    // переопределяем методы суперкласса
    func haveASeat() {
        print("sit down on a car seat")
        closeTheDoor()
    }
    /*
     если методы в дочерних классах различаются
     можно делать след образом
     */
    func closeTheDoor() {
        print("close the door")
    }
    func useProtection() {
        print("fasten seat belt")
    }
    func lookAtTheMirror() {
        print("look at the rearview mirror")
    }
    func turnSignal() {
        print("turn on left turn light")
    }
    func driveForward() {
        print("push pedal")
    }
}


let car = Car()
let bicycle = Bicycle()

car.startVehicle()
print("###########")
bicycle.startVehicle()

















