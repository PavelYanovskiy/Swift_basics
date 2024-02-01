import UIKit

//блок 1
//Задачи:
//Написать функцию, которая будет решать квадратное уравнение. На вход функция получает коэффициенты a, b, c, d (ax^2 + bx+ c = d), а возвращает корни уравнения.
print(sqrt(16))
print(pow(5, 3))

func kvadrat(a: Int, b: Int, c: Int, d: Int) -> (Double?, Double?) { //возвращаем кортеж или tuple, каждое значение еще и опционал, то есть корень может быть, а может и быть
    let finalC = c - d
    let discr = b * b - 4 * a * c
    let xSqrt = sqrt(Double(discr)) //корень из дискриминанта
    if (discr < 0) {
        return (nil, nil)
    } else if (discr == 0) {
        let x1 = Double((-b + Int(xSqrt)))/Double((2 * a))
        return (x1, nil)
    } else {
        let x1 = Double((-b + Int(xSqrt)))/Double((2 * a))
        let x2 = Double((-b - Int(xSqrt)))/Double((2 * a))
        return (x1,x2)
    }
   return (nil , nil) //ретёрн нужен так как конструкиця иф эл иф
}

//Создать перечисление с видами чая (black, fruit, green), далее создать структуру, в которой будет хранится вид чая и его стоимость.
struct Tea {
    
    enum TeaType { //создаем перечисление и все кейсы, которые есть Ти тайп теперь является вложенным в структуру
        case black
        case green
        case fruit
    }

    var type: TeaType
    private var cost: Double
    
    init(type: TeaType, costtt: Double) {
        self.type = type
        cost = costtt
    }
    
    func getCost(sale: Int) -> Double {
//        if sale >= 50 { //можно через иф
//            return cost * Double(sale) / 100
//        } else {
//            print("Невозможно применить скидку")
//            return cost
//        }
        
        guard sale <= 50 else { //тоже самое что и через иф, только тут через гард, так он используется чаще
            print("Невозможно применить скидку")
            return cost
        }
        return cost * Double(sale) / 100
        
    }
}

let tea1 = Tea(type: .black, costtt: 20)
let tea2 = tea1
tea1.getCost(sale: 50)

//Создать класс Cafe, в котором хранится массив с чаем. Переменная с массивом должна быть приватной. Значение в массив должно устанавливаться в инициализаторе

class Cafe {
    private var tea: [Tea] //имя переменной и передаваемого параметра совпадают
    
    init(tea: [Tea]) { //инициализатор
        self.tea = tea
    }
    
    func getCost(type: Tea.TeaType, sale: Int) -> Double? { //добавляем фукнцию, тип чая
//        guard let oneTea = tea.first(where: { $0.type == type }) else { //еи вээ ищем первый тип чая в массиве, тип чая доблжн полностью совпадать с типом, который мы передали в функции
//            return nil
//        }                                     //возвращаемся к чаю и возвращаем его стоимость
        tea.first(where: { $0.type == type })?.getCost(sale: sale) //тоже самое что выше закоментили в одну строчку
    }
// если функция находится внутри класса, то и пишем ее внутри класса, а не отдельно.  чай может быть а может  и нет поэтому опционал
    func getTea(activity: Person.Activity.TypeOfActivity, cost: Double, sale: Int) -> Tea? {
        switch activity {
        case .pupil:
            let givenTea = tea.filter { $0.getCost(sale: sale) <= cost}
                                .sorted { $0.getCost(sale: sale) > $1.getCost(sale: sale) }
            return givenTea.first
        case .student:                   //должно быть со скидкой и тип только черный и стоимость меньше лио равно той, которую мы получили на вход, затем сортируем и самый дорогой отдаем покупателю
            let givenTea = tea.filter { $0.type == .black && $0.getCost(sale: sale) <= cost}
                                .sorted { $0.getCost(sale: sale) > $1.getCost(sale: sale) }
            return givenTea.first
        case .employee:              //так как 2 чая - объединяем в одно условие
            let givenTea = tea.filter { ($0.type == .black || $0.type == .fruit) && $0.getCost(sale: sale) <= cost}
                                .sorted { $0.getCost(sale: sale) > $1.getCost(sale: sale) }
            return givenTea.first
        }
    }
    
    static func a() {
        
    }
}
let teas: [Tea] = []
let cafe = Cafe(tea: teas) 
let cafe1 = cafe
cafe.getCost(type: .black, sale: 50)
Cafe.a()

//Добавить в структуру чая функцию getCost, которая будет возвращать стоимость чая. На вход функция принимает процент скидки (только целое число), который необходимо применить к стоимости. Если скидка больше 50% напечатать в консоль о невозможности применить скидку и вернуть изначальную стоимость чая.
//struct Tea {
//    var type: TeaType
//    var cost: Double
//
//    func getCost(sale: Int) -> Double {
//        guard sale <= 50 else {
//            print("Невозможно применить скидку")
//            return cost
//        }
//        return cost * Double(sale) / 100
//    }
//}

//Добавить в класс функцию, которая на вход принимает тип чая и скидку, которую нужно применить. Функция должна вернуть стоимость, которую должен заплатить покупатель. Если данного вида чая нет в массиве(меню) - вернуть nil.
//
//class Cafe{
//    private var tea: [Tea]
//
//    init(tea: [Tea]) {
//        self.tea = tea
//    }
//
//    func getCost(type: TeaType, sale: Int) -> Double? {
//        guard let oneTea = tea.first { $0.type == type } else {
//            return nil
//        }
//        return oneTea.getCost(sale: sale)
//    }
//}


// блок 2
//Задачи:
//Сделать тип чая вложенным типом для структуры чая.
//Добавили выше
//struct Tea {
//    enum TeaType {
//        case black
//        case green
//        case fruit
//    }
//
//    var type: TeaType
//    var cost: Double
//
//    func getCost(sale: Int) -> Double {
//        guard sale <= 50 else {
//            print("РќРµРІРѕР·РјРѕР¶РЅРѕ РїСЂРёРјРµРЅРёС‚СЊ СЃРєРёРґРєСѓ")
//            return cost
//        }
//        return cost - cost * Double(sale) / 100
//    }
//}


//Сделать так, чтобы в структуре чая можно было получить стоимость только через функцию getCost, то есть чтобы извне функции не было доступа к переменной со стоимостью чая.

//private var cost: Double

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

var typeOfActivity: Person.Activity.TypeOfActivity //чтобы обратиться к тайпофактивити нужно пройтись по всем уровням

//Добавить в класс Cafe функцию, которая на основе типа активности, предложенной суммы и возможной скидки возвращает доступный чая. Чай выбирается по следующим критериям: если это pupil, то доступен и черный, и зеленый, и фруктовый чай. Если это student, то только черный, а если employee, то черный и фруктовый. Если предложенной суммы хватает на все доступные виды чая, то вернуть самый дорогой. Если суммы хватает только на один, то вернуть его. Если суммы хватает на несколько доступных  видов чая, но у них одинаковая стоимость, то вернуть любой из них. Если суммы не хватает ни на один вид чая, то вернуть nil.

//func getTea(activity: Person.Activity.TypeOfActivity, cost: Double, sale: Int) -> Tea? {
//    switch activity {
//    case .pupil:
//        let givenTea = tea.filter { $0.getCost(sale: sale) <= cost}.sorted { $0.getCost(sale: sale) > $1.getCost(sale: sale) }
//        return givenTea.first
//    case .student:
//        let givenTea = tea.filter { $0.type == .black && $0.getCost(sale: sale) <= cost}.sorted { $0.getCost(sale: sale) > $1.getCost(sale: sale) }
//        return givenTea.first
//    case .employee:
//        let givenTea = tea.filter { ($0.type == .black || $0.type == .fruit) && $0.getCost(sale: sale) <= cost}.sorted { $0.getCost(sale: sale) > $1.getCost(sale: sale) }
//        return givenTea.first
//    }
//}