


import Foundation
// просит подписанный класс реализовать методы
protocol Subject {
    // этим методом добавляем наблюдателя
    func add(observer: PropertyObserver)
    // удаляем наблюдателя
    func remove(observer: PropertyObserver)
    // уведомляем наблюдателя
    func notify(withString string: String)
}

// основной класс, за которым наблюдают
class Teacher: Subject {
    // коллекция нужна, чтобы добавлять в нее наблюдателя
    var observerCollection = NSMutableSet()
    /*
     новое значение hometask помещаем в метод notify,
     который вызывает метод didGet у наблюдателя
    */
    var homeTask = "" {
        /*
         когда меняется значение hometask
         вызывается наблюдатель didSet
        */
        didSet {
            notify(withString: homeTask)
        }
    }
    // добавляем наблюдателя
    func add(observer: PropertyObserver) {
        observerCollection.add(observer)
    }
    // удаляем
    func remove(observer: PropertyObserver) {
        observerCollection.remove(observer)
    }
    // уведомляем
    func notify(withString string: String) {
        for observer in observerCollection {
            // кастим до экземпляра, подписанного на протокол
            (observer as! PropertyObserver).didGet(newTask: string)
        }
    }
}

// протокол, содержит метод получения инфо от основного класса
protocol PropertyObserver {
    func didGet(newTask task: String)
}
/*
 класс-наблюдатель, NSObject нужен для добавления
 этого объекта в NSMutableSet
*/
class Pupil: NSObject, PropertyObserver {
    
    var homeTask = ""
    // тк подписан на протокол, необходимо реализовать метод протокола
    func didGet(newTask task: String) {
        // присваиываем значение заданию
        homeTask = task
        print(homeTask)
        print("new homework to be done")
    }
}

let teacher = Teacher()
let pupil = Pupil()

teacher.add(observer: pupil)
teacher.homeTask = "задача #3 на странице 21"

pupil.homeTask












