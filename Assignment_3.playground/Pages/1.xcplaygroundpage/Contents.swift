import Foundation

/* 1. დაწერეთ ფუნქცია რომელიც პარამეტრად მიიღებს მთელი რიცხვების მასივს და დააბრუნებს რამდენი განსხვავებული ელემენტია მასში (სორტირების გამოყენების გარეშე)
*/

// 1 - Using Dictionary
func numbOfUniqueElements(in array: [Int]) -> Int {
    var dictionary = [Int:String]()
    for number in array {
        if dictionary[number] == nil {
            dictionary[number] = "Unique"
        }
    }
    return dictionary.keys.count
}

let numberOfUniqueElements = numbOfUniqueElements(in: [1, 2, 4, 2, 3, 5, 5, 2])
print("Number of unique elements is this array is \(numberOfUniqueElements)")




// 2 - Using Set

func numberOfUniqueElements(in array: [Int]) -> Int {
    let arrayIntoSet = Set(array)
    return arrayIntoSet.count
}

let uniqueElementsCount = numberOfUniqueElements(in: [1, 2, 4, 2, 3, 5, 5, 2])
print("Number of unique elements is this array is \(uniqueElementsCount)")

