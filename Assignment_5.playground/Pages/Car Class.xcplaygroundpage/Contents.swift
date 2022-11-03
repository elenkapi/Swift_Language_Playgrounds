import UIKit

/* შექმენით კლასი Car 🚗, რომელსაც ექნება შემდეგი თვისებები:
 - ბრენდი
 - ფერი
 - კარებების რაოდენობა
 - საწვავის ავზის მოცულობა და საწვავის საჭირო რაოდენობა 100 კმ-ზე (FuelExpenses)
 საწვავის ავზის მოცულობა და საწვავის საჭირო რაოდენობთვის შექმენი სტრუქტურა FuelExpenses, რომელშიც შეინახავათ აღნიშნულ მნიშვნელობებს.
 ბრენდისთვის შემოიტანე ენამი, რომელიც 5 განსხვავებულ მოდელს აღწერს. აქვს 5 ქეისი.
 შექმენით მასივი, რომელსაც შეავსებ 15 Car-ით. (როგორც გაგიხარდებათ ისე შეავსეთ)
 */

class Car {
    var brand: Brand
    var color: Color
    var numberOfDoors: Int
    var fuel: FuelExpenses
    
    init(brand: Brand, color: Color, numberOfDoors: Int, fuel: FuelExpenses) {
        self.brand = brand
        self.color = color
        self.numberOfDoors = numberOfDoors
        self.fuel = fuel
    }
    
    func toString() -> String {
        return "Brand: \(self.brand), Color: \(self.color), Number of doors: \(self.numberOfDoors), Fuel consumption per 100 km: \(self.fuel.fuelConsumptionPer100Km) "
    }
}

struct FuelExpenses {
    var fuelCapacity: Double
    var fuelConsumptionPer100Km: Double
}

enum Brand: String, CaseIterable {
    case Toyota
    case Hyundai
    case MercedesBenz
    case BMW
    case Chevrolet
}

enum Color: String, CaseIterable {
    case Black
    case White
    case Red
    case Silver
}

var carsArray = [
    Car(brand: .BMW, color: .Black, numberOfDoors: 4, fuel: .init(fuelCapacity: 80, fuelConsumptionPer100Km: 15)),
    Car(brand: .BMW, color: .White, numberOfDoors: 4, fuel: .init(fuelCapacity: 97.5, fuelConsumptionPer100Km: 10.9)),
    Car(brand: .Hyundai, color: .Red, numberOfDoors: 2, fuel: .init(fuelCapacity: 100, fuelConsumptionPer100Km: 7.8)),
    Car(brand: .Toyota, color: .Silver, numberOfDoors: 4, fuel: .init(fuelCapacity: 60, fuelConsumptionPer100Km: 9.2)),
    Car(brand: .Chevrolet, color: .White, numberOfDoors: 4, fuel: .init(fuelCapacity: 52, fuelConsumptionPer100Km: 7.47)),
    Car(brand: .MercedesBenz, color: .Red, numberOfDoors: 2, fuel: .init(fuelCapacity: 79, fuelConsumptionPer100Km: 10.4)),
    Car(brand: .Hyundai, color: .Black, numberOfDoors: 2, fuel: .init(fuelCapacity: 57, fuelConsumptionPer100Km: 7.3)),
    Car(brand: .Toyota, color: .White, numberOfDoors: 4, fuel: .init(fuelCapacity: 90, fuelConsumptionPer100Km: 16.7)),
    Car(brand: .MercedesBenz, color: .White, numberOfDoors: 4, fuel: .init(fuelCapacity: 112, fuelConsumptionPer100Km: 15)),
    Car(brand: .Chevrolet, color: .Silver, numberOfDoors: 2, fuel: .init(fuelCapacity: 47, fuelConsumptionPer100Km: 6.7)),
    Car(brand: .BMW, color: .Red, numberOfDoors: 4, fuel: .init(fuelCapacity: 69, fuelConsumptionPer100Km: 8.7)),
    Car(brand: .MercedesBenz, color: .Silver, numberOfDoors: 4, fuel: .init(fuelCapacity: 78, fuelConsumptionPer100Km: 14)),
    Car(brand: .Hyundai, color: .Black, numberOfDoors: 2, fuel: .init(fuelCapacity: 56, fuelConsumptionPer100Km: 6.5)),
    Car(brand: .Chevrolet, color: .Black, numberOfDoors: 4, fuel: .init(fuelCapacity: 54, fuelConsumptionPer100Km: 7.27)),
    Car(brand: .MercedesBenz, color: .Black, numberOfDoors: 2, fuel: .init(fuelCapacity: 57, fuelConsumptionPer100Km: 7.55))
]

carsArray.count

// MARK: - Problems

// 1. იპოვეთ მანქანა, რომელიც ყველაზე ცოტას წვავს
print("1")
let carsSortedByFuelConsumption = carsArray.sorted (by: { $0.fuel.fuelConsumptionPer100Km < $1.fuel.fuelConsumptionPer100Km})
print("Most Fuel-Efficient Car - \(carsSortedByFuelConsumption[0].toString())")



// 2. დააჯგუფეთ მანქანები ბრენდების მიხედვით
print("2")
var brandsGroup = [String:[Car]]()

Brand.allCases.forEach { element in
    brandsGroup[element.rawValue] = carsArray.filter({$0.brand == element})
}

brandsGroup.forEach { key, value in
    print("\(key): \(value.map({$0.toString()}))")
}f


// 3. დაალაგეთ მანქანები კარების რაოდენობის მიხედვით
print("3")
let carsSortedByNumberofDoors = carsArray.sorted(by: { $0.numberOfDoors > $1.numberOfDoors})
print(carsSortedByNumberofDoors.map({$0.toString()}))

// 4. იპოვეთ ის მანქანა, რომლიც ერთი მთლიანად სავზე ავზით ყველაზე მეტი მანძილის გავლას შეძლებს
print("4")
let sortedCars = carsArray.sorted( by: { $0.fuel.fuelCapacity * 100 / $0.fuel.fuelConsumptionPer100Km > $1.fuel.fuelCapacity * 100 / $1.fuel.fuelConsumptionPer100Km })

print("\(sortedCars[0].toString()), Kilometers covered on a full tank of fuel: \(sortedCars[0].fuel.fuelCapacity * 100 / sortedCars[0].fuel.fuelConsumptionPer100Km)" )

// 5. ყველაზე მეტი რომელი ფერის მანქანა არის მასივში
print("5")
var colorsCount = [String:Int]()

Color.allCases.forEach { element in
    colorsCount[element.rawValue] = carsArray.filter( { $0.color == element}).count
}

let colorResult = colorsCount.sorted(by: { $0.value > $1.value} ).first!
print( "Most occured color is \(colorResult.key) (occures \(colorResult.value) times)")


/* 6. იპოვეთ ის ბრენდი, რომელსაც საშუალო საწვავის ხარჯი ყველაზე ცოტა აქვს
 (მაგალითად თუ მასივში არის “ა” ბრენდი-ის 2 მანქანა “ა” ბრენდის საშიალო ხარჯი იქნება ამ მანქანების ხარჯის ჯამი გაყოფილი 2-ზე)
 */
print("6")

func fuelExpenses(carsArray: [Car]) -> [String?:Double] {
    return  [carsArray.first?.brand.rawValue:  carsArray.reduce(0) { partialResult, fuelConsumption in
        fuelConsumption.fuel.fuelConsumptionPer100Km } / Double(carsArray.count)]
}

var fuelExpensesAverageArray = [[String?:Double]]()
brandsGroup.forEach { key, value in
    fuelExpensesAverageArray.append(fuelExpenses(carsArray: value))
}

let averageFuelResult = fuelExpensesAverageArray.flatMap({ $0 }).sorted(by: { $0.value < $1.value})
print("\(averageFuelResult[0].key!) has a minimum average fuel expense")





