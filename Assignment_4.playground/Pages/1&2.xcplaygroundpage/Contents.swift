import UIKit

/* 1. მოცემულია მასივი let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]. დააგენერირეთ 5 წევრიანი მასივი 1-დან 30-ის ჩათვლით. შექმენით სტრინგების ორ განზომილებიანი მასივი სადაც თითოეული ქვემასივი შეიცავს იმ რაოდენობის ინგლისური ანბანის ასოს რა მნიშვნელობაც ექნება დაგენერირებული მასივის ელემენტებს. ასევე დაგენერირებული მასივის წევრის მნიშვნელობა უნდა შეესაბამებოდეს ქვემასივში დამატებული ელემენტის პოზიციას ანბანში. მაგ. 2 - ის შემთხვევაში ქვემასივი უნდა შეიცავდეს 2 ცალ "B"-ს. იმ შემთხვევაში თუ დაგენერირებული რიცხვი ცდება ანბანის რაოდენობას დაამატეთ შემთხვევითი სიმბოლო ანბანიდან იგივე პრინციპით.
 */

let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

var intArray = [Int]()
for _ in 1...5 { intArray.append(Int.random(in: 1...30)) }

var twoDimensionalArray = [[String]]()
var arrayInArray = [String]()

for number in intArray  {
    for _ in 0...number - 1 {
        arrayInArray.append(number <= alphabet.count ? alphabet[number - 1] : alphabet[number-alphabet.count-1])
    }
    twoDimensionalArray.append(arrayInArray)
    arrayInArray.removeAll()
}


print(intArray)
print(twoDimensionalArray)


/* 2. პირველ ამოცანაში მიღებული ორგანზომილებიანი მასივისგან შექმენით ანბანის
 მიხედვით სორტირებული სტრინგი სადაც ყველა სიმბოლო იქნება უნიკალური.
 */

let newArray = Set(twoDimensionalArray.flatMap { $0 }).sorted(by: < )
var finalString = ""

newArray.forEach { char in finalString += char }
//newArray.reduce("", +)
    

print(newArray)
print(finalString)







