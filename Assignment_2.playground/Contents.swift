import UIKit

/* 1. შექმენით ცვლადი სახელად grade რომელიც იქნება შემთხვევითად შერჩეული რიცხვი 1-დან 100-მდე. switch statement-ის გამოყენებით დაწერეთ პროგრამა რომელიც კონსოლში გამოგვიტანს თუ რა შეფასებას მიიღებს სტუდენტი იმ შემთხვევაში თუ დაგენერირებულ ქულას მიიღებს გამოცდაზე. >90 => A; 80+ => B; >70 => C; >60 => D; >40 => E; <40 => F;
 */

var grade = Int.random(in: 1...100)

switch grade {
case 91...100: print("A")
case 81...90: print("B")
case 71...80: print("C")
case 61...70: print("D")
case 41...60: print("E")
case 1...40: print("F")
default: break
}

/* 2. ციკლის გამოყენებით დინამიურად დააგენერირეთ შემთხვევითი რიცხვების 10 მონაცემიანი ოფშენალ მასივი. იმ შემთხვევაში თუ დაგენერირებული მონაცემი იქნება ხუთის ჯერადი მასივს დავამატოთ nil სხვა შემთხვევაში დავამატოთ დაგენერირებული რიცხვი.
 */

var optionalArray = [Int?]()


for _ in 1...10 {
    let randomNumber = Int.random(in: 0...1000)
    if randomNumber % 5 == 0 {
        optionalArray.append(nil)
    } else {
        optionalArray.append(randomNumber)
    }
}

print(optionalArray)

/* 3. მეორე ამოცანაში დაგენერირებული მასივისგან შექმენით ახალი მასივი რომელშიც აღარ გვექნება optional მონაცემები. გამოიყენეთ optional unwrapping-ის თქვენთვის ცნობილი ყველა გზა.
 */

// 1
var nonOptionalArray = [Int]()

for item in optionalArray {
    if item != nil {
        nonOptionalArray.append(item!) //
    }
}

print(nonOptionalArray)

// 2
var nonOptionalArray2 = [Int]()

for item in optionalArray {
    if let item = item {
        nonOptionalArray2.append(item)
    }
}

print(nonOptionalArray2)

// 3
var nonOptionalArray3 = [Int]()

for item in optionalArray {
    guard let item = item else {
        continue
    }
    nonOptionalArray3.append(item)
}

print(nonOptionalArray3)



/* 4. მოცემული გვაქვს integer-ების მასივი [1, 7, 12, 15, 7, 13, 5, 7, 9, 12, 23, 7]. მოცემული მასივისგან შექმენით ახალი მასივი(Array) სადაც ყველა მონაცემი იქნება უნიკალური.
 */

// 1
var intArray = [1, 7, 12, 15, 7, 13, 5, 7, 9, 12, 23, 7]
var uniqueIntArray = Set(intArray)

print(uniqueIntArray)

// 2

var uniqueIntArray2 = [Int]()

for item in intArray {
    if !uniqueIntArray2.contains(item) {
        uniqueIntArray2.append(item)
    }
}

print(uniqueIntArray2)

// 3
var isInArray = false

for item in intArray {
    for checkItem in uniqueIntArray2 {
        if checkItem == item {
            isInArray = true
        }
    }
    if isInArray == false {
        uniqueIntArray2.append(item)
    }
}
print(uniqueIntArray2)



    /* 5. მოცემული გვაქვს ორი მასივი let names = [“გელა“, “ზაირა“, “შალვა“, “მურადი“, “მაყვალა“] და let grades = [80, 23, 71, 75, 100]. მოცემული მასივებისგან დინამიურად შექმენით Dictionary სადაც names პირველი ელემენტი იქნება dictionary-ის key ხოლო grades-ის ბოლო ელემენტი value. შესაბამისად names-ის მეორე ელემენტს უნდა შეესაბამებოდეს grades-ის ბოლოს წინა ელემენტი და ა.შ. დაბეჭდეთ სახელი რომელსაც ყველაზე მაღალი შეფასება აქვს.
     */

let names = ["გელა", "ზაირა", "შალვა", "მურადი", "მაყვალა"]
let grades = [80, 23, 71, 75, 100]

var orderedGrades = [Int]()

var dictionary = [String:Int]()

for index in stride(from: grades.count - 1, through: 0, by: -1) {
    orderedGrades.append(grades[index])
}

for (index, value) in names.enumerated() {
    dictionary[value] = orderedGrades[index]
}

print(dictionary)

var maxGrade = grades[0]

for grade in grades {
    if grade > maxGrade {
        maxGrade = grade
    }
}

if let key = dictionary.first(where: { $0.value == maxGrade })?.key {
    print(key)
}



/* 6. ციკლის გამოყენებით დინამიურად დააგენერირეთ 1-დან 10-მდე ინტერვალში შემთხვევითი რიცხვების 100 მონაცემიანი მასივი. დაბეჭდეთ ყველაზე ხშირად გამეორებადი რიცხვი.
 */

var array = [Int]()
var maxNumberCount = 0
var catchedNumber = 0

for _ in 1...100 {
    array.append(Int.random(in: 1...10))
}

for number in array {
    var numberCount = 0
    for checkNumber in array {
        if checkNumber == number {
            numberCount += 1
        }
    }
    if numberCount > maxNumberCount {
        maxNumberCount = numberCount
        catchedNumber = number
    }
}

print(catchedNumber)

// 7. დააგენერირეთ 2 შემთხვევითი რიცხვი 1-დან 100-მდე და დაბეჭდეთ ის რიცხვი რომლის გამყოფების ჯამიც მეტია.

let randomNumber = Int.random(in: 1...100)
let randomNumber2 = Int.random(in: 1...100)

var divisorsSum = 0
var divisorsSum2 = 0

for x in 1...100 {
    if randomNumber % x == 0 {
        divisorsSum += x
    }
    if randomNumber2 % x == 0{
        divisorsSum2 += x
    }
}

if divisorsSum > divisorsSum2 {
    print(randomNumber)
} else {
    print(randomNumber2)
}

if divisorsSum == divisorsSum2 {
    print("Sum of the divisors of the first number is equal to the sum of the divisors of the second number")
}


// 8. დააგენერირეთ 1- დან 1_000_000 მდე რიცხვი და დაბეჭდეთ რამდენნიშნაა.

// 1
var randNumber = Int.random(in: 1...1_000_000)

var intIntoString = "\(randNumber)"
print(intIntoString.count)

// 2
var digitsCount = 0
while (randNumber > 0) {
    digitsCount += 1
    randNumber /= 10
}
print(digitsCount)

