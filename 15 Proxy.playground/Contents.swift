//class User {
//    let id = "123"
//}
//
//protocol ServerProtocol {
//    func grandAccess(user: User)
//    func denyAccess(user: User)
//}
//
//class ServerSide: ServerProtocol {
//    func grandAccess(user: User) {
//        print("access granted to user with id = \(user.id)")
//    }
//    func denyAccess(user: User) {
//        print("access denied to user with id = \(user.id)")
//    }
//}
//// прокси- копия сервера
//class ServerProxy: ServerProtocol {
//    // здесь сервер
//    lazy private var server: ServerSide = ServerSide()
//    // доступ к серверу
//    func grandAccess(user: User) {
//        server.grandAccess(user: user)
//    }
//    func denyAccess(user: User) {
//        server.denyAccess(user: user)
//    }
//}
//
//let user = User()
//let proxy = ServerProxy()
//proxy.grandAccess(user: user)
//proxy.denyAccess(user: user)

class User {
    let name = "Petr"
    let password = "123"
}

protocol ServerProtocol {
    func grantAccess(user: User)
}
// реальный сервер
class ServerSide: ServerProtocol {
    func grantAccess(user: User) {
        print("access granted to user with name = \(user.name)")
    }
}
// прокси
class ServerProxy: ServerProtocol {
    // здесь сервер
    private var server: ServerSide!
    // метод протокола
    func grantAccess(user: User) {
        // проверяем сервер
        guard server != nil else {
            print("access can't be granted")
            return
        }
        // даем доступ
        server.grantAccess(user: user)
    }
    // проверяем логин
    func authenticate(user: User) {
        guard user.password == "123" else { return }
        print("user authenticated")
        // создаем сервер
        server = ServerSide()
    }
}

let user = User()
let proxy = ServerProxy()

proxy.grantAccess(user: user)
proxy.authenticate(user: user)
proxy.grantAccess(user: user)















