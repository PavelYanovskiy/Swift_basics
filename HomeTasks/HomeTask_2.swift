import UIKit

//Условие:
//1. Написать функцию, которая на вход принимает число: сумма, которую пользователь хочет положить на вклад, следующий аргумент это годовой  процент, третий аргумент это срок. Функция возвращает сколько денег получит пользователь по итогу
func calcMoney(sum: Double, percent: Double, numOfMonth: Double) -> Double {
    sum + ((sum * percent / 100) / 12) * numOfMonth
}

print(calcMoney(sum: 10000, percent: 7.5, numOfMonth: 12))


//2.Создать перечисление, которое содержит 3 вида пиццы и создать  переменные с каждым видом пиццы.

enum Pizza: String {
    case moko = "Моко"
    case diMare = "Ди маре"
    case marinara = "Маринара"
}

var pizzaMoko = Pizza.moko
var pizzaDiMare = Pizza.diMare
var pizzaMarinara: Pizza = .marinara

print(pizzaMoko, pizzaDiMare, pizzaMarinara)


//3. Добавить возможность получения названия пиццы через  rawValue

print(pizzaMoko.rawValue, pizzaDiMare.rawValue, pizzaMarinara.rawValue)

// с помощью функции

func printPizzaName(pizza: Pizza) {
    print(pizza.rawValue)
}

printPizzaName(pizza: .moko)