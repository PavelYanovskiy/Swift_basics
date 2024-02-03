import UIKit


protocol Menu {
    var cost: Double { get set } //если только гет, то мы сможем только получать, если гет сет , то и сможем передавать
    var name: String { get }
}
struct Tea: Menu {
    var name: String {
        type.rawValue + " tea" //написали вычисляемое свойство, оно вычисляет свойство в процессе своего выполнения
    }
    
    
    enum TeaType: String { //создаем перечисление и все кейсы, которые есть Ти тайп теперь является вложенным в структуру
        case black
        case green
        case fruit
    }

    var type: TeaType
    var cost: Double
    
//    init(type: TeaType) {
//        self.type = type
//
//    }
    
    func getCost(sale: Double) -> Double {
        switch type {
        case .black: return 10
        case .green: return 9
        case .fruit: return 15
        }
        
        var myTea: Menu = Tea(type: .black, cost: 10)
        print (myTea.cost)
        myTea.cost = 15
//Создать класс Person, внутри которого должна быть структура Activity, внутри которой должно быть перечисление TypeOfActivity (тип активности) с тремя кейсами: pupil, student, employee. Создать переменную и явно указать ей тип “тип активности”.
class Person {
    struct Activity {
        enum TypeOfActivity {
            case pupil
            case student
            case employee
        }
    }
}

//var typeOfActivity: Person.Activity.TypeOfActivity //чтобы обратиться к тайпофактивити нужно пройтись по всем уровням

//Создать класс Cafe, в котором хранится массив с чаем. Переменная с массивом должна быть приватной. Значение в массив должно устанавливаться в инициализаторе

class Cafe {
    private var tea: [Tea] //имя переменной и передаваемого параметра совпадают
    
    init(tea: [Tea]) { //инициализатор
        self.tea = tea
    }
    
    func getCost(type: Tea.TeaType, sale: Double) -> Double? { //добавляем фукнцию, тип чая
//        guard let oneTea = tea.first(where: { $0.type == type }) else { //еи вээ ищем первый тип чая в массиве, тип чая доблжн полностью совпадать с типом, который мы передали в функции
            return nil
        }                                     //возвращаемся к чаю и возвращаем его стоимость
        //tea.first(where: { $0.type == type })?.getCost(sale: sale) //тоже самое что выше закоментили в одну строчку
    }
}
// если функция находится внутри класса, то и пишем ее внутри класса, а не отдельно.  чай может быть а может  и нет поэтому опционал
//    func getTea(activity: Person.Activity.TypeOfActivity, cost: Double, sale: Int) -> Tea? {
//        switch activity {
//        case .pupil:
//            let givenTea = tea.filter { $0.getCost(sale: sale) <= cost}
//                                .sorted { $0.getCost(sale: sale) > $1.getCost(sale: sale) }
//            return givenTea.first
//        case .student:                   //должно быть со скидкой и тип только черный и стоимость меньше лио равно той, которую мы получили на вход, затем сортируем и самый дорогой отдаем покупателю
//            let givenTea = tea.filter { $0.type == .black && $0.getCost(sale: sale) <= cost}
//                                .sorted { $0.getCost(sale: sale) > $1.getCost(sale: sale) }
//            return givenTea.first
//        case .employee:              //так как 2 чая - объединяем в одно условие
//            let givenTea = tea.filter { ($0.type == .black || $0.type == .fruit) && $0.getCost(sale: sale) <= cost}
//                                .sorted { $0.getCost(sale: sale) > $1.getCost(sale: sale) }
//            return givenTea.first
//        }
//    }
//
//    static func a() {
//
//    }
//}
//let teas: [Tea] = []
//let cafe = Cafe(tea: teas)
////let cafe1 = cafe
//cafe.getCost(type: .black, sale: 50)
//Cafe.a()

//Блок 1
//Задачи:
//Создать протокол для меню. Протокол должен содержать стоимость и наименование. Стоимость и название должны быть get-only
//protocol Menu {
//    var cost: Double { get set} //если только гет, то мы сможем только получать, если гет сет , то и сможем передавать
//    var name: String { get }
//}

//Создайте класс кафе, в нем должен быть массив с наименованиями меню  и инициализатор. Подпишите структуру чая с прошлого занятия на протокол из первого пункта. В качестве name должен быть вид чая и “tea”, то есть, например, для черного чая должно быть black tea, а для зеленого green tea
class Cafeteria {
    var menu: [Menu]
    
    init(_ menu: [Menu]) {
        self.menu = menu
    }
}

//Создайте еще 3 кафе, для которых класс Cafe будет родительским.
class MyCafe: Cafeteria {
    override func add(_ elem: Menu){
        super.add(elem)
        print(elem.cost)
    }
            
        }
class YourCafe: Cafeteria {
    
}
        
class HerCafe: Cafeteria {
            
        }
        
let mycaffe = HerCafe([])
//Добавить в родительский класс функцию (add) по добавлению новой позиции в меню. Саму переменную меню сделать приватной, если она еще таковой не является
//Сделать так, чтобы в первом из трех классов наследников(например, FirstCafe) функция add помимо того, что выполняла все тоже самое, что и в родительском классе, печатала в консоль стоимость добавляемой позиции.
//Создать класс автомата с едой, не реализовывать в нем ни методов, ни свойств, однако этот класс должен уметь делать все тоже самое, что и FirstCafe
//Сделать так, чтобы от класса автомата с напитками нельзя было наследоваться.
}
final class VendingMachine: MyCafe {
            
        }

//блок 2.
//Задачи:
//Создать две структуры: лимонад и салат. Сделать так, чтобы и то и то можно  добавить в меню кафе.
struct Lemonade: Menu {
    var cost: Double
    var name: String
}

struct Salad: Menu {
    var cost: Double
    var name: String
}
//Добавить в класс кафе функцию, которая возвращает все позиции меню
//Добавить в класс кафе функцию, которая на основе цены возвращает массив позиции которые можно купить (Например, есть черный чай за 50, зеленый за 60, лимонад за 100 и салат за 150. Функция получае 90, значит она должна вернуть черный чай и зеленый чай)
extension Cafeteria {
    func getMenu() -> [Menu] {
        menu
    }
    
    func youCanBuy(_ cost: Double) -> [Menu]
        menu.filter { $0.cost <= cost }
}




//Задать переменной с меню в классе Cafe уровень fileprivate
//class Cafeteria {
//   file private var menu: [Menu]
//
//    init(_ menu: [Menu]) {
//        self.menu = menu
//    }
//}

//Добавить в класс автомата с едой функцию, которая на основе полученного номера (номер элемента в массиве) и денег возвращает товар под необходимым номером, если денег хватает и nil, если денег не хватает. Если товар не найден, тоже вернуть nil
extension VendingMachine {
    func getGood(index: Int, money: Double) -> Menu? {
        guard index < menu.count else {
            return nil
        }
        return menu[index.cost].cost <= money ? menu[index]: nil

    }
}

//Создать протокол, в котором будет содержаться две функции: start и final.

protocol Machine {
    func start()
    func final()
}
//Для класса автомата с едой создать расширение, в котором будут содержаться функции из протокола из пункта 6 (класс должен быть подписан на протокол). В функции start должно печататься о начале работы автомата, а в final о завершении

extension VendeingMachine: Machine {
    func start() {
        print("start")
    }
    func final() {
        print("finish")
    }
}

extension Machine { // экстеншн и пишем протокол который хотим расширить
    func start() { //фукнцию которую мы хотим реализовать
        print("start") // и что она должна делать внутри
//если класс должен делать то что описано в методе, то можно его оттуда убрать, а если должен делать что-то отличное от дефолтной реадизации тогда мы можем реализовать метод и написать там другие действия
    
}
