import UIKit

//Условие:
//1. Есть словарь с видами чая и их стоимостью. Есть очередь людей, которые хотят заказать чай (можно представить ее в виде массива видов чая, которые хотят заказать). Необходимо последовательно выводить в консоль сколько заплатит покупатель ( необходимо вывести его номер по порядку, чай, который он заказал и стоимость)

// Создаем словарь с видами чая и их стоимостью
let teaPrices = [
    "Зеленый чай": 150,
    "Черный чай": 120,
    "Травяной чай": 100
]

// Очередь людей с заказами чая
let orders = ["Зеленый чай", "Черный чай", "Травяной чай", "Зеленый чай"]

// Последовательно выводим информацию о заказах
for (index, order) in orders.enumerated() {
    if let price = teaPrices[order] {
        print("Покупатель №\(index + 1) заказал \(order) за \(price) рублей")
    } else {
        print("Извините, у нас нет такого чая как \(order)")
    }
}
/*
 Получается следующее
 Покупатель №1 заказал Зеленый чай за 150 рублей
 Покупатель №2 заказал Черный чай за 120 рублей
 Покупатель №3 заказал Травяной чай за 100 рублей
 Покупатель №4 заказал Зеленый чай за 150 рублей
*/

//2. Есть массив [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil]. Необходимо создать новый массив, который будет состоять из элементов старого, но не должно быть nil, не должно быть 0 и 4, а также массив должен быть отсортирован по возрастанию

// Создаем массив
let array = [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil]

// Очищаем массив от nil, нулей и четверок, а также сортируем
let newArray = array.compactMap { $0 }.filter { $0 != 0 && $0 != 4 }.sorted(by: <)

// Вывод результата в консоль
print(newArray)


//3. Написать функцию, которая на вход принимает целое число, а возвращает массив, который сформирован по следующим правилам: количество элементов соответствует переданному числу, массив начинается с 1, каждый последующий элемент больше предыдущего в 2 раза.

func generateArray (_ number: Int) -> [Int] {
    var result = [Int]() //создаем пустой массив, куда будем добавлять элементы
    var value = 1 // начинаем с 1
    for _ in 1...number { //используем цикл, чтобы добавить нужное количество элементов
        result.append(value)  // Добавляем текущее значение в массив
        value *= 2 // Удваиваем текущее значение для следующего элемента
    }
    return result // Возвращаем сформированный массив в качестве результата
}
let resultArray = generateArray(6) //вызываем функцию
print(resultArray)

