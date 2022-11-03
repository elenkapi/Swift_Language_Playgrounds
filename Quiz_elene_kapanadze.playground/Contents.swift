import UIKit

enum Corner: String, CaseIterable {
case left
case right
case top
case bottom
case topLeft
case topRight
case bottomLeft
case bottomRight
case middle
}
var corners = (1...10).compactMap { _ in Corner.allCases.randomElement() }
print(corners)

// 1. corners მასივი გარდაქმენი ახალი სტრინგების მასივად.

var stringCorners = corners.map ({ $0.rawValue })
print(stringCorners)

// 2. გაიგე არის თუ არა ყველა ელემენტი top ან middle ან bottom.
var topCount = 0
var middleCount = 0
var bottomCount = 0
for element in stringCorners {
    if element == "top" { topCount += 1 }
    if element == "middle" { middleCount += 1 }
    if element == "bottom" { bottomCount += 1 }
}

if topCount != stringCorners.count { print("'top' is not  name for all the elements in stringCorners")}
if middleCount != stringCorners.count { print("'middle' is not  name for all the elements in stringCorners")}
if bottomCount != stringCorners.count { print("'bottom' is not  name for all the elements in stringCorners")}

// 3. გაიგე შეიცავს თუ არა corners-ი მინიმუმ ორ left-ს.
var leftCount = 0

stringCorners.forEach({ if $0 == "left" { leftCount += 1 } })

if leftCount >= 2 { print("'left' iterates \(leftCount) times ") }

// 4. გაიგე corners-ში არსებული უნიკალური ელემენტების რაოდენობა.
let uniqueCornersCount = Set(stringCorners).count
print(uniqueCornersCount)

// 5. გაიგე მასივის პირველ ნახევარში უფრო მეტი right არის თუ მეორე ნახევარში.
var firstHalfRightCount = 0
var secondHalfRightCount = 0

// first half
for index in 0 ... (stringCorners.count - 1) / 2 {
    if stringCorners[index] == "right" { firstHalfRightCount += 1}
}

for index in stride(from: stringCorners.count - 1, through: 5, by: -1) {
    if stringCorners[index] == "right" { secondHalfRightCount += 1}
}

print(firstHalfRightCount)
 print(secondHalfRightCount)
if firstHalfRightCount > secondHalfRightCount { print("number of 'right' in the first half of the corners array is greater than number of 'right' in the second half of the corners array") } else if firstHalfRightCount < secondHalfRightCount { print("number of 'right' in the second half of the corners array is greater than number of 'right' in the first half of the corners array") } else { print("Number of 'right' is equal in both of the parts of the array")}

// 6. წაშალე ყველა ელემენტი, რომელიც არ არის bottomRight

stringCorners.removeAll { $0 != "bottomRight" }
print(stringCorners)

// 7. დაბეჭდე ელემენტები მანამ სანამ არ შეგვხვდება bottom.

var secondStringCorners = corners.map ({ $0.rawValue })
//secondStringCorners.forEach { if $0 == "bottom" { break } print($0) }

for element in secondStringCorners {
    if element == "bottom" {
        break
    }
    print(element)
}
print("...........")
// 8. გამოტოვე ელემენტები მანამ სანამ არ შეგვხვდება bottomRight და დაბეჭდეთ დანარჩენი.

var metBottomRight = false

for element in secondStringCorners {
    if metBottomRight {
        print(element)
    } else {
        if element == "bottomRight" {
            metBottomRight = true
        }
        continue
    }
}
print("...........")


// 9. გაიგე ყველა bottom ელემენტის ინდექსი.
var bottomIndexArray = [Int]()
for (index, element) in secondStringCorners.enumerated() {
    if element == "bottom" {
        bottomIndexArray.append(index)
    }
}

print(bottomIndexArray)



