import UIKit
import Foundation

/* დაწერეთ პროტოკოლი DataFetcher რომელსაც ექნება associatedtype APIData და ფუნქცია getData() -> [APIData] გააკეთეთ კლასები CarFetcher, VideoGameFetcher და BookFetcher რომელიც დაეთანხმება პროტოკოლს და დააბრუნებს შესაბამის მონაცემებს(dummy data). */

protocol DataFetcher {
    associatedtype APIData
    func getData() -> [APIData]
}

// enum car marks
enum CarMark: String {
    case Mercedes
    case BMW
    case Toyota
}

class CarFetcher: DataFetcher {
    typealias APIData = Car
    func getData() -> [Car] {
        return [
            Car(id: 1214, rating: 5.0, price: 20000, mark: .Mercedes),
            Car(id: 1215, rating: 4.7, price: 35789, mark: .BMW),
            Car(id: 1216, rating: 2.5, price: 13242, mark: .Toyota),
            Car(id: 1217, rating: 3.6, price: 45627, mark: .BMW),
            Car(id: 1218, rating: 4.9, price: 2456372, mark: .Mercedes)
        ]
    }
}

class BookFetcher: DataFetcher {
    typealias APIData = Book
    func getData() -> [Book] {
        return [
            Book(id: 1314, rating: 5.0, price: 12.5, title: "One Hundred Years of Solitude"),
            Book(id: 1315, rating: 4.9, price: 13.7, title: "The Brothers Karamazov"),
            Book(id: 1316, rating: 4.6, price: 7.8, title: "The Stranger"),
            Book(id: 1317, rating: 4.7, price: 10.9, title: "Kafka on the Shore"),
            Book(id: 1318, rating: 1.0, price: 5.0, title: "Flight from the USSR")
        ]
    }
}

class VideoGameFetcher: DataFetcher {
    typealias APIData = VideoGame
    func getData() -> [VideoGame] {
        return [
            VideoGame(id: 1415, rating: 4.5, price: 126, name: "League of Legends :'("),
            VideoGame(id: 1416, rating: 4.3, price: 79, name: "Call of Duty"),
            VideoGame(id: 1417, rating: 5.0, price: 139, name: "Minecraft"),
            VideoGame(id: 1418, rating: 4.8, price: 120, name: "Grand Theft Auto"),
            VideoGame(id: 1419, rating: 4.7, price: 200, name: "The Last of Us"),
        ]
    }
}

/* მონაცემები უნდა ეთანხმებოდნენ პროტოკოლს Model რომელსაც თავის მხრივ ეჭირება პარამეტრები id, rating, price (მონაცემებს უნდა ჰქოდეთ განსხავებული ტიპის პარამეტრები Book - title, Car - mark, VideoGame - name). */
protocol Model {
    var id: Int { get set }
    var rating: Double { get set }
    var price: Double { get set }
    func toString()
}

class Car: Model {
    var id: Int
    var rating: Double
    var price: Double
    var mark: CarMark
    
    init(id: Int, rating: Double, price: Double, mark: CarMark) {
        self.id = id
        self.rating = rating
        self.price = price
        self.mark = mark
    }
    
    func toString() {
        print(self.mark)
    }
}

class Book: Model {
    var id: Int
    var rating: Double
    var price: Double
    var title: String
    
    init(id: Int, rating: Double, price: Double, title: String) {
        self.id = id
        self.rating = rating
        self.price = price
        self.title = title
    }
    
    func toString() {
        print(self.title)
    }
}

class VideoGame: Model {
    var id: Int
    var rating: Double
    var price: Double
    var name: String
    
    init(id: Int, rating: Double, price: Double, name: String) {
        self.id = id
        self.rating = rating
        self.price = price
        self.name = name
    }
    
    func toString() {
        print(self.name)
    }
}

/* დაწერეთ კლასი DataProcessor რომელსაც ეჭირება generic პარამეტრი data და ექნება მეთოდები calculateTotalPriceOfAllElements(), calculateAveragePrice(), getItemById(), highestRating(), lowestRating(). */

class DataProcessor<data: Model> {
    var dataCollection: [data]
    
    init(dataCollection: [data]) {
        self.dataCollection = dataCollection
    }
    
    func calculateTotalPriceOfAllElements() -> Double {
        self.dataCollection.reduce(0) { partialResult, element in
            partialResult + element.price
        }
    }
    
    func calculateAveragePrice() -> Double {
        self.calculateTotalPriceOfAllElements() / Double(self.dataCollection.count)
    }
    
    func getItemById(id: Int) -> data? {
        let filteredArray =  self.dataCollection.filter { $0.id == id }
        return filteredArray.count > 0 ? filteredArray[0] : nil
    }
    
    func highestRating() -> Double {
        self.dataCollection.max { $0.rating < $1.rating }!.rating
        
    }
    
    func lowestRating() -> Double {
        self.dataCollection.max { $0.rating > $1.rating }!.rating
    }
}

//let videoGameProcessor = DataProcessor(dataCollection: VideoGameFetcher.getData())
//print(videoGameProcessor.calculateTotalPriceOfAllElements())
//print(videoGameProcessor.calculateAveragePrice())
//print(videoGameProcessor.getItemById(id: 1))
//print(videoGameProcessor.highestRating())
//print(videoGameProcessor.lowestRating())


/* დაწერეთ კლასები CarProccessor, BookProccessor და VideoGameProccessor რომელიც იქნებიან DataProcessor() კლასის შვილობილი კლასები ეჭირებათ შესაბამისი fetcher(car - carFetcher და ა.შ.) და დაუსეტავენ მშობელ კლასებს დატას. */

class CarProccessor: DataProcessor<Car> {
    var fetcher: CarFetcher
    
    init() {
        self.fetcher = CarFetcher()
        super.init(dataCollection: self.fetcher.getData())
    }
}

//let testing = CarProccessor()
//print(testing.calculateTotalPriceOfAllElements())

class BookProccessor: DataProcessor<Book> {
    var fetcher: BookFetcher
    
    init() {
        self.fetcher = BookFetcher()
        super.init(dataCollection: self.fetcher.getData())
    }
}

class VideoGameProccessor: DataProcessor<VideoGame> {
    var fetcher: VideoGameFetcher
    
    init() {
        self.fetcher = VideoGameFetcher()
        super.init(dataCollection: self.fetcher.getData())
    }
}

/* დაწერეთ generic კლასი Controller რომელსაც ეჭირება T ტიპის DataProcessor და ფუნქცია printInfo() რომლის მოვალეობა იქნება დაბეჭდოს შესაბამისი მოდელის პარამეტრები (Book - title, Car - mark, VideoGame - name). */

class Controller<T: Model> {
    var processor:  DataProcessor<T>
    
    init(processor: DataProcessor<T>) {
        self.processor = processor
    }
    
    func printInfo() {
        self.processor.dataCollection.forEach { $0.toString() }
    }
}

let b = BookFetcher()
let a = DataProcessor(dataCollection: b.getData())
let x = Controller<Book>(processor: a)
x.printInfo()


