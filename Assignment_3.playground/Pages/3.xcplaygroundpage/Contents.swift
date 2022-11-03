import UIKit

/* 3. დაითვალეთ მასივში არსებული სტრინგებიდან რამდენია პალინდრომი. პალინდრომი არის ტექსტი, რომელიც ორივე მხრიდან ერთნაირად იკითხება.
(მაგ.: let array = [“ABA”, “AKKA”, “0101”] ამ მასივში არის ორი პალინდრომი, “ABA” და “AKKA”).
 */

func numbersOfpalindromesinArray(array: [String]) {
    var numbersOfPalindromes = 0
    for word in array {
        if word.uppercased() == String(word.reversed()).uppercased() {
            numbersOfPalindromes += 1
        }
    }
    print(numbersOfPalindromes > 0 ? "This array contains \(numbersOfPalindromes) palindrome(s)" :
            "This array doesn't contain palindromes")
}

let array1 = ["Madam", "sayWhaat", "Level", "asdDsA", "12", "21277212", "abccba",]
let array2 = ["inchi", "bi", "inchi", "bu"]
numbersOfpalindromesinArray(array: array1 )
numbersOfpalindromesinArray(array: array2)


