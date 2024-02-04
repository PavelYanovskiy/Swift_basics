import UIKit

enum Topping {
    case pepperoni
    case tomatoes
    case cheese
}

struct Pizza {
    let price: Double
    let type: PizzaType
    let dough: String
    let toppings: [Topping]
    
    enum PizzaType {
        case pepperoni
        case margherita
        case fourCheese
        case vegetarian
        case seafood
    }
}

struct FrenchFries {
    let price: Double
    let size: String
}

protocol MenuItem {
    var price: Double { get }
}

extension Pizza: MenuItem {}
extension FrenchFries: MenuItem {}

// 1: Создаем структуру работника пиццерии со свойствами: имя, зарплата и должность
struct PizzaEmployee {
    let name: String
    let salary: Double
    let position: Position
}
// 1.1: Создаем должности
enum Position {
    case cashier
    case cook
}

// 2: Создаем класс столика в котором содержится количество мест и функция, которая на вход принимает количество гостей, которое хотят посадить, а возвращает true, если места хватает и false, если места не хватает.
class Table {
    private var numberOfSeats: Int
    private var pizzeria: Pizzeria

    init(numberOfSeats: Int, pizzeria: Pizzeria) {
        self.numberOfSeats = numberOfSeats
        self.pizzeria = pizzeria
    }

    func canAccommodateGuests(_ count: Int) -> Bool {
        return count <= numberOfSeats
    }
}

// 3: Добавляем в класс пиццерии свойство, в котором хранится массив столиков.
class Pizzeria {
    private var menu: [MenuItem]
    private var employees: [PizzaEmployee] = [] //1.3 массив работников
    internal var tables: [Table] = [] //3.1 массив столиков

    init(menu: [MenuItem], employees: [PizzaEmployee]) {
        self.menu = menu
        self.employees = employees
        //прописываем количество мест за столиком
        self.tables = [Table(numberOfSeats: 4, pizzeria: self), Table(numberOfSeats: 6, pizzeria: self)]
    }

    func addMenuItem(_ item: MenuItem) {
        menu.append(item)
    }
}

protocol OpenAndClose {
    func open()
    func close()
}

extension Pizzeria: OpenAndClose {
    func open() {
        print("Пиццерия открыта")
    }

    func close() {
        print("Пиццерия закрыта")
    }
}

func subtract<T: Numeric>(_ a: T, _ b: T) -> T {
    return a - b
}

// Примеры использования
// Создаем пиццерию
let menu: [MenuItem] = [Pizza(price: 10.99, type: .pepperoni, dough: "тонкое", toppings: [.cheese, .pepperoni])]
let employees: [PizzaEmployee] = [PizzaEmployee(name: "Анна", salary: 2000, position: .cashier)]
let pizzeria = Pizzeria(menu: menu, employees: employees)

// Добавляем еще одну пиццу в меню
let newPizza = Pizza(price: 12.99, type: .vegetarian, dough: "тонкое", toppings: [.cheese, .tomatoes])
pizzeria.addMenuItem(newPizza)

// Открываем пиццерию
pizzeria.open()

// Создаем столики
let table1 = pizzeria.tables[0]
let table2 = pizzeria.tables[1]

// Проверяем, возможно ли разместить гостей
let canAccommodate1 = table1.canAccommodateGuests(4) // Результат: true
let canAccommodate2 = table2.canAccommodateGuests(7) // Результат: false

print("За первым столиком можно разместить гостей: \(canAccommodate1)")
print("За вторым столиком можно разместить гостей: \(canAccommodate2)")

// Закрываем пиццерию
pizzeria.close()
