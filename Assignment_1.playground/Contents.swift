import UIKit

var greeting = "Hello, playground"

// 1. დაბეჭდეთ ყველა ლუწი რიცხვი 100-დან 400-ის ჩათვლით(სამივე ციკლის გამოყენებით)

// for in

for num1 in 100...400 {
    if num1 % 2 == 0 {
        print(num1, terminator: " ")
    }
}

// while

var num2 = 100

while num2 <= 400 {
    print(num2, terminator: " ")
    num2 += 2
}

// repeat while

var num3 = 100

repeat {
    print(num3, terminator: " ")
    num3 += 2
} while num3 <= 400


/* 2. ციკლების გამოყენებით, 10-დან 100-ის ჩათვლით, 10-ის ჯერადი და მეტი 50-ზე რიცხვები (ორივე პირობის ჭეშმარიტების შემთხვევაში), გაზარდეთ 2-ჯერ.
 */

// for in

var forNumnum = 0

for num4 in 10...100 {
    if num4 % 10 == 0 && num4 > 50 {
        forNumnum = num4
        forNumnum *= 2
        print(forNumnum)
    }
}

// while

var whileNumnum = 10
var numnum2 = 0

while whileNumnum <= 100 {
    if whileNumnum % 10 == 0 && whileNumnum > 50 {
        numnum2 = whileNumnum
        numnum2 *= 2
        whileNumnum += 10
        print(numnum2)
    } else {
        whileNumnum += 10
    }
}

// repeat while
var repeatNumnum = 10
repeat {
    if repeatNumnum % 10 == 0 && repeatNumnum > 50 {
        numnum2 = repeatNumnum
        numnum2 *= 2
        repeatNumnum += 10
        print(numnum2)
    } else {
        repeatNumnum += 10
    }
} while repeatNumnum <= 100


// 3. შექმენით ორი ინტეჯერის ცვლადი, შემთხვევითი რიცხვის გენერაციით. შეკრიბეთ და ჯამი დაბეჭდეთ თუ ის ლუწია ან მეტია 100-ზე.

var generatedNumber1 = Int.random(in: 0...500)
var generatedNumber2 = Int.random(in: 0...500)

var generatedNumbersSum = generatedNumber1 + generatedNumber2

if generatedNumbersSum % 2 == 0 || generatedNumbersSum > 100 {
    print(generatedNumbersSum)
}

/* 4. გამოაცხადეთ სტრინგი და ინტეჯერის ცვლადები, შეეცადეთ შეკრიბოთ ეს ორი მნიშვნელობა (მაგ.: პირველი ცვლადი: “სვიფტი“, მეორე: 5; დავალების შესრულების შემდგომ უნდა გქონდეთ ახალი ცვლადი, რომლის მნიშვნელობა იქნება: სვიფტი 5 )
 */

var str = "სვიფტი"
var integer = 5
var newVar = "\(str) \(integer)"
print(newVar)

/* 5. შექმენით ოფშენალ ინტეჯერების მასივი, საიდანაც ზოგიერთი ელემენტი იქნება ნილი, შემდგომ გამოაცხადეთ ახალი მასივი, სადაც, ნილისგან განსხვავებული მნიშვნელობები უნდა გადაიტანოთ, ნილის შემთხვევაში მასივის ელემენტებს მიანიჭეთ 0 მნიშვნელობა.
*/

var optionalInt = [5, 6, 12, 21, nil, 7, 13, nil, nil, 8, nil ]
var newArray = [Int]()

for a in optionalInt {
    if a != nil {
        newArray.append(a!)
    } else {
        newArray.append(0)
    }
}
print(newArray)


/* 6. შექმენით ასაკის აღმნიშვნელი ცვლადი და ტერინარული ოპერატორით შეამოწმეთ თუ მნიშვნელობა 18-ზე მეტია დაბეჭდეთ “Adult” თუ მნიშვნელობა 18-ზე ნაკლებია “Kid”
 */

var age = 91

print(age > 18 ? "Adult" : "Kid")

/* 7. შექმენით ასაკის აღმნიშვნელი ცვლადი, იმ შემთხვევაში თუ მისი მნიშვნელობა არის 6-დან 18 წლამდე დაბეჭდეთ “kid”, 18-65 შუალედში “adult”, ყველა სხვა დანარჩენ შემთხვევაში “old”
 */

var age2 = 23

if age2 >= 6 && age2 < 18 {
    print("kid")
} else if age2 >= 18 && age2 < 65 {
    print("adult")
} else {
    print("old")
}


