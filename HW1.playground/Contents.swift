//: Playground - noun: a place where people can play

import UIKit

/*
 1 Use and understand Swift's basic types like Bool, Int, String, and Double
 Створіть константи із вказаними значеннями двома способами (явно вказуючи тип і неявно)
 Перевірте себе функцією type(of: тут вкажіть назву константи)
 а) ціле число 1
 b) дійсне число 1.0
 с) рядок, що містить фразу Hello world!
 d) рядок, що містить фразу The number is та константу з числом 42
 e) хибне значення
 f) істинне значення
 */

let aImplicit = 1
type(of: aImplicit)
let aObvious: Int = 1
type(of: aObvious)

let bImplicit = 1.0
type(of: bImplicit)
let bObvious: Float = 1.0
type(of: bObvious)

let cImplicit = "Hello world!"
type(of: cImplicit)
let cObvious: String = "Hello world!"
type(of: cObvious)

let const42 = 42
let eImplicit = "The number is " + String(const42)
type(of: eImplicit)
let eObvious: String = "The number is " + String(const42)
type(of: eObvious)

let dImplicit = true
type(of: dImplicit)
let dObvious: Bool = true
type(of: dObvious)

let fImplicit = false
type(of: fImplicit)
let fObvious: Bool = false
type(of: fObvious)

/*
 2 Declare and use variables and constants (var let)
 a) Зробіть константу цілого типу зі значенням 3
 b) Зробіть змінну типу рядок зі значенням "The three is "
 c) Змініть значення змінної на таке, що містить раніше створену константу
 */

let intValue = 3
var strValue = "The three is "
strValue = String(intValue)

/*
 3 Handle flow control and looping constructs (if for while switch)
 a) Створіть розгалуження яке до змінної b додасть число 1 якщо b додатнє і відніме 1 - якщо від'ємне
 b) Пройдіть циклом по числам від 1 до 10 і виведіть їх (використайте спочатку for потім while)
 c) Використайте switch із цілочисельною змінною який виведе фразу "Low" для значень від 1 до 18, "High" для 19-36, "Zero" для 0 та "Unknown" для решти значень
 */

//a
let b = 0
if b > 0 {
    b + 1
} else {
    b - 1
}
//b
for index in 1..<10 {
    print(index)
}

var index = 0
while index < 10 {
    print(index)
    index+=1
}

//c
let switchValue = 100
switch switchValue {
case 0:
    print("Zero")
case 1..<19:
    print("Low")
case 19..<37:
    print("High")
default:
    print("Unknown")
}

/*
 4 Create and use collections (Array Set Dictionary)
 a) Створіть масив (Array) цілих чисел та посортуйте його
 b) Створіть дві множини (Set) цілих чисел та знайдіть їх перетин
 с) Створіть Dictionary в якому ключем виступає рядок а значенням будь-який тип і заповніть його
 */

//a
let intArray = [1,9,4,6,8,10,2,7,3,5]
print(intArray.sorted())

//b
let setA: Set = [1,4,5,7,8]
let setB: Set = [2,3,9,4,5]
setA.intersection(setB)

//c
var dictionary : [String: Double] = ["One": 1.0, "Two:": 2.0, "Three": 3.0]
dictionary["Four"] = 4.0
dictionary

/*
 5 Develop and use simple functions ( inout ->  )
 а) Створіть функцію яка приймає на вхід масив і віддає найчастіше повторюване значення в ньому
 b) Створіть функцію яка приймає на вхід масив і змінює його ж, додаючи до кожного значення 1
 */

//a
var array = [1,2,3,1,4,5,3,1,7,5,5,2,9,1,0,7]

func findTheSameValue(array: [Int]) -> Int {
    let countedSet = NSCountedSet(array: array)
    let mostFrequent = countedSet.max {
        countedSet.count(for: $0) < countedSet.count(for: $1)
    }
    return mostFrequent as! Int
}

findTheSameValue(array: array)

//b
func addOneForValueArray(array: inout [Int]) {
    var insideArray: [Int] = []
    for value in array {
        insideArray.append(value + 1)
    }
    array = insideArray
}

addOneForValueArray(array: &array)
array

/*
 6-7 Cast objects safely from one type to another ( as! as? as init). Handle optionals and unwrap them safely (if let ; guard let ; != nil)
 Створіть функцію яка приймає на вхід змінну типу Any? і вертає рядок в якому міститься тип значення переданої змінної.
 (!) Для виконання цього завдання НЕ використовуйте метод type(of: ).
 (!!) Для виконання цього завдання МОЖНА використовувати наступні конструкції (спробуйте кожну з них в окремії функції)
 a) `if let`
 b) `guard let`
 c) switch.
 */

//a
func findTypeValueIfLet(val: Any?) -> String {
    if let a = val as? String {
        return "String"
    }
    if let b = val as? Float {
        return "Float"
    }
    if let c = val as? Double {
        return "Double"
    }
    if let d = val as? Int {
        return "Integer"
    }
    if let e = val as? Bool {
        return "Boolean"
    }
    return "Unknown type"
}
let aValue = 1.0
findTypeValueIfLet(val: aValue)

//b

//с
func findTypeValueSwitch(val: Any?) -> String {
    switch val {
    case is String:
        return "String"
    case is Float:
        return "Float"
    case is Double:
        return "Double"
    case is Int:
        return "Int"
    case is Bool:
        return "Boolean"
    default:
        return "Unknown type"
    }
}
let bValue = "Hello"
findTypeValueSwitch(val: bValue)
