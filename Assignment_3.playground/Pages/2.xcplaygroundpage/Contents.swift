import Foundation

// 2. დაწერეთ ფუნქცია რომელიც პარამეტრად მიიღებს ორი მთელი რიცხვების მასივს და დააბრუნებს მათ თანაკვეთას

func intersectionOfArrays(firstArray: [Int], secondArray: [Int]) -> Set<Int> {
    var intersection = [Int]()
    for number in firstArray {
        if secondArray.contains(number) {
            intersection.append(number)
        }
    }
    return Set(intersection)
}

let inchi = [1, 2, 5, 53, 6, 7, 2]
let bi = [6, 8, 3, 45, 2, 5, 2]

var intersection = intersectionOfArrays(firstArray: inchi, secondArray: bi)
print("Intersection of those two arrays is \(intersection)")

// MARK: - Using .intersection - from some student's homework
 
func showIntersection(firstArr x: [Int], secondArr y: [Int]) -> [Int] {  Array(Set(x).intersection(Set(y)))
}

let testArr1 = [12,14,15,26,78,58]
let testArr2 = [12,33,15,78,78,90]

print(showIntersection(firstArr: testArr1, secondArr: testArr2))
