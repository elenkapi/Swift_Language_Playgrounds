import UIKit

enum Color: String, CaseIterable {
  case red
  case yellow
  case brown
  case cyan
  case pink
  case black
  case blue
  case white
  case purple
}
var colors = (0...19).compactMap { _ in Color.allCases.randomElement() }

/* /1. colors მასივისგან შექმენი Dictionary, რომლის key იქნება ელემენტის ინდექსი მასივში და value case-ის String მნიშვნელობა.
 //2. დაბეჭდე მასივში yellow და red ელემენტების რაოდენობა.
 //3 გაიგე შეიცავს თუ არა colors მასივი ორივე ელემენტებს - white და purple.
 //4. შეადარე მასივში არსებული უნიკალური ელემენტების რაოდენობა დუბლირებული ელემენტების რაოდენობას. შედეგი დაბეჭდე.
 //5. შეადარე მასივის პირველ და მეორე ნახევარში ელემენტ black-ის რაოდენობები. თუ მათი რაოდენობა ტოლია დაბეჭდე რაოდენობა.
 //6. წაშალე ელემენტები რომელთა სახელწოდება იწყება “b” - სიმბოლოთი.
 //7. დაბეჭდე ელემენტები სანამ არ შეგხვდება ელემენტი რომლის სახელწოდება შეიცავს 4 სიმბოლოს.
 //8. გამოტოვე ელემენტები სანამ ორჯერ არ შეგხვდება ელემენტი რომლის სახელწოდება მთავრდება “e” სიმბოლოთი, დაბეჭდე დანარჩენი.
 //9. დაბეჭდე იმ ელემენტების ინდექსები რომლის სახელწოდება შეიცავს 4 და მეტ სიმბოლოს.*/

print(colors)

// 1

var dict = [Int:String]()

for (index, value) in colors.enumerated() {
    dict[index] = value.rawValue
}

print(dict)

//2

var yellowCount = 0
var redCount = 0

for item in colors {
    if item.rawValue == "yellow" {
        yellowCount += 1
    }
    if item.rawValue == "red" {
        redCount += 1
    }
}


print(yellowCount, redCount)

//3

func containsBoth(array: [Color]) -> Bool {
    return array.contains { $0.rawValue == "white" } && array.contains { $0.rawValue == "purple" }
}

print(containsBoth(array: colors))

//4
let uniqueElementsCount = Set(colors).count
let duplicatedElementsCount = colors.count - uniqueElementsCount

if uniqueElementsCount > duplicatedElementsCount {
    print("uniqe elements are greater than duplicated ones")
} else if uniqueElementsCount < duplicatedElementsCount {
    print("duplicated elements are greater than unique ones")
} else {
    print("equal")
}
 

//5
var firstHalfCount = 0
var secondHalfCount = 0

for i in 0...colors.count / 2 {
    if colors[i] == .black {
        firstHalfCount += 1
    }
}
for i in stride(from: colors.count - 1, to: colors.count / 2, by: -1) {
    if colors[i] == .black {
        secondHalfCount += 1
    }
}
if firstHalfCount == secondHalfCount {
    print(firstHalfCount)
}




//6
var newArr = colors
newArr.removeAll { $0.rawValue.hasPrefix("b") }
print(newArr)

//7
for elem in colors {
    if elem.rawValue.count == 4 {
        break
    }
    print(elem.rawValue)
}

//8
var metE = false
for elem in colors {
    if metE {
        print(elem)
    } else {
        if elem.rawValue.hasSuffix("e") {
            metE = true
        }
        continue
    }
    
}

// 9
for (index, value) in colors.enumerated() {
    if value.rawValue.count > 4 {
        print(index)
    }
}


