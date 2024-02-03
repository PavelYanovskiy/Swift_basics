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

// 1.1 Создаем структуру картошки фри
struct FrenchFries {
    let price: Double
    let size: String
}

// 1.2 Расширяем Меню для пиццы и картошки фри
protocol MenuItem {
    var price: Double { get }
}

extension Pizza: MenuItem {}
extension FrenchFries: MenuItem {}

class Pizzeria {
    // 1.3 Делаем так, чтобы в классе пиццерии была одна переменная, в которую можно было бы класть и пиццу, и картошку фри.

    private var menu: [MenuItem]

    init(menu: [MenuItem]) {
        self.menu = menu
    }

    // 2. Добавляем в класс пиццерии функцию, которая будет добавлять новую позицию в меню

    func addMenuItem(_ item: MenuItem) {
        menu.append(item)
    }
}

// 3. Создаем протокол, в котором будут содержаться функции открытия и закрытия
protocol OpenAndClose {
    func open()
    func close()
}

// 4. Создаем расширение для класса пиццерии, в  котором будет реализован протокол из пункта 3

extension Pizzeria: OpenAndClose {
    func open() {
        print("Пиццерия открыта")
    }

    func close() {
        print("Пиццерия закрыта")
    }
}

// 5. Пишем фукнцию, в которой происходит вычитание одного числа из другого, так, чтобы работала с Int и Double и возвращала результат вычитатния
func subtract<T: BinaryInteger>(_ a: T, _ b: T) -> T {
    return a - b
}

func subtract<T: BinaryFloatingPoint>(_ a: T, _ b: T) -> T {
    return a - b
}

// Пример использования функции
let resultInt = subtract(10, 5) // Результат: 5
let resultDouble = subtract(10.5, 3.2) // Результат: 7.3