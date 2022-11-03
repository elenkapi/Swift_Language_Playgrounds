import Foundation

/* 4. დაწერეთ ფუნქცია, რომელიც მიიღებს სამ პარამეტრს: ორი მთელი რიცხვების მასივს და  ქლოჟერს, ქლოჟერის მეშვეობით დაბეჭდეთ ამ მასივების გაერთიანება.
*/

func unificationOfArrays(firstArray: [Int], secondArray: [Int], closure: ([Int], [Int]) -> Void) {
    closure(firstArray, secondArray)
}

let first = [1, 2, 5, 53, 6, 7, 2]
let second = [6, 8, 3, 45, 2, 5]

unificationOfArrays(firstArray: first, secondArray: second) { (array1, array2) in
    let arraySet = Set(array1 + array2)
    print(arraySet)
}

