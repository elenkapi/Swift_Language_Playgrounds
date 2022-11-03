import Foundation

/* 3. დააგენერირეთ წილადი რიცხვების 30 წევრიანი მასივი 20 დან 50 ის ჩათვლით.
 დაამრგვალეთ მასივის თითოეული წევრი და დატოვეთ მხოლოდ ლუწი რიცხვები.
*/

var doubleArray = [Double]()

for _ in 1...30 { doubleArray.append(Double.random(in: 20...50)) }
var newArray = doubleArray.map { Int(round($0)) }.filter { $0 % 2 == 0 }

print(doubleArray)
print(newArray)

