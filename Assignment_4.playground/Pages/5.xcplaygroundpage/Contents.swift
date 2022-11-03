import Foundation

/* 5. მოცემულია tuple-ების მასივი let people = [(name: ვაჟა, age: 22),
 (name: მურთაზი, age: 12), (name: შუქური, age: 12),
 (name: დინარა, age:19), (name: ფრიდა, age:88)] სკოლის ასაკი არის 6 - 18 წლამდე.
 გამოითვალეთ სკოლის მოსწავლეების საშუალო ასაკი.
*/

let people = [(name: "ვაჟა", age: 22),
 (name: "მურთაზი", age: 12), (name: "შუქური", age: 12),
 (name: "დინარა", age:19), (name: "ფრიდა", age:88)]

var studentsAgeArray = people.map { $0.age }.filter { $0 >= 6 && $0 < 18 }
print(studentsAgeArray)

let studentsAverageAge = studentsAgeArray.reduce(0, +) / studentsAgeArray.count
print("Students' average age is \(studentsAverageAge)")

