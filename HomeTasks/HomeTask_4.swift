import UIKit

//1 Создать перечисление с видами пиццы (хотя бы 4 - 5 кейсов)
enum PizzaType {
    case pepperoni
    case margherita
    case fourCheese
    case vegetarian
    case seafood
}


//2 Создать структуру пиццы, она должна содержать стоимость, вид пиццы, толстое или тонкое тесто и добавки (например, дополнительно добавить пепперони, помидоры, сыр). Вид пиццы должен быть вложенным типом для структуры пиццы. Подсказка: добавки лучше также сделать перечислением.
enum Topping { //добавки в пиццу
    case pepperoni
    case tomatoes
    case cheese
}

struct Pizza { //создаем структуру пиццы
    let price: Double
    let type: PizzaType
    let dough: String
    let toppings: [Topping]
}

//3 Создать класс пиццерии, добавить массив с возможными пиццами. Переменная с массивом должна быть приватной. Массив задается в инициализаторе.
//4 Написать в классе пиццерии функции для добавления новой пиццы и для получения всех доступных пицц.

class Pizzeria { //создаем класс пиццерия
    private var menu: [Pizza] //переменная с массивом приватная

    init(menu: [Pizza]) { //инициализируем массив с пиццами
        self.menu = menu
    }

    func addPizza(_ pizza: Pizza) { //функция добавления новой пиццы
        menu.append(pizza)
    }

    func getAllPizzas() -> [Pizza] { //функция получение всех доступных пицц
        self.menu
    }
}

//5 Создать экземпляр класса пиццерии и добавить в него несколько пицц.
let pizzeria = Pizzeria(menu: [Pizza(price: 110.50, type: .pepperoni, dough: "тонкое", toppings: [.cheese, .pepperoni]), Pizza(price: 90.99, type: .margherita, dough: "толстое", toppings: [.cheese, .tomatoes])])

pizzeria.addPizza(Pizza(price: 150, type: .seafood, dough: "толстое", toppings: [.cheese, .tomatoes]))

var allPizzas = pizzeria.getAllPizzas();

for pizza in allPizzas {
    print("Тип пиццы: \(pizza.type), стоимость \(pizza.price), тесто " + (pizza.dough == "тонкое" ? "тонкое" : "толстое") + ", добавки: \(pizza.toppings.map { "\($0)" }.joined(separator: ", "))")

}