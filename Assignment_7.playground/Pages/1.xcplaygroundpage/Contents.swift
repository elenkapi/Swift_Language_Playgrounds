import Foundation

/* დავალება #1
 შექმენით extension String ტიპისთვის, რომელიც აბრუნებს მნიშვნელობებს:
 რამდენი ხმოვანია
 რამდენი თანხმოვანია
 შებრუნებულ სტრიქონს
 isUppercasedMore
 */

extension String {
    func numberOfVowels() -> Int {
        let vowels = ["a", "e", "i", "o", "u"]
        var vowelsCount = 0
        for char in self.lowercased() {
            if vowels.contains(String(char)) {
                vowelsCount += 1
            }
        }
        return vowelsCount
    }
    
    func numberOfConsonants() -> Int {
        var spaceCount = 0
        for char in self {
            if char == " " {
                spaceCount += 1
            }
        }
        return self.count - self.numberOfVowels() - spaceCount
    }
    
    func reversedString() -> String {
        var reverseString = ""
        for char in self {
            reverseString.insert(char, at: reverseString.startIndex)
        }
        return reverseString
    }
    
    func isUppercasedMore() -> Bool {
        var uppercaseCount = 0
        self.forEach { char in
            if char.isUppercase {
                uppercaseCount += 1
            }
        }
        return self.count / 2 < uppercaseCount
    }
    
}

    
let eleneKargiGogoa = "Mas ar unda qeba"
eleneKargiGogoa.numberOfVowels()
eleneKargiGogoa.numberOfConsonants()
eleneKargiGogoa.reversedString()
eleneKargiGogoa.isUppercasedMore()
