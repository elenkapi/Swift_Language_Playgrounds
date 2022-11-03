import Foundation

/* 4. დააგენერირეთ ანბანის მასივის შემთხვევითი წევრებისგან 30 წევრიანი მასივი სადაც
 არ იქნება შემდეგი ასოები: - D, E, და Q და დააბრუნეთ true თუ მასივი შეიცავს C-ს.
 */

var alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
let lettersToBeRemoved = ["D", "E", "Q"]

alphabet.removeAll { lettersToBeRemoved.contains($0) }
print(alphabet)

var randomCharArray = [String]()

for _ in 1...30 { randomCharArray.append(alphabet.randomElement()!) }
var containsC = randomCharArray.contains("C")

print(randomCharArray)

print(containsC)
