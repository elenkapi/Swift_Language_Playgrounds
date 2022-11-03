import UIKit

@propertyWrapper struct Capitalized {
    var wrappedValue: String {
        didSet{
            wrappedValue = wrappedValue.capitalized
        }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}

enum CardType {
    case creditCard
    case debitCard
}

class Bank {
    var customers = [Customer]()
    let creditCard: CreditCard
    let debitCard: DebitCard
    let atm: ATM
    
    init(atm: ATM) {
        self.atm = atm
        creditCard = CreditCard(cardId: 1, inLaris: AccountInLaris(), inUsds: AccountInUsds(), inEuros: AccountInEuros())
        debitCard = DebitCard(cardId: 2, inLaris: AccountInLaris(), inUsds: AccountInUsds(), inEuros: AccountInEuros())
    }
    
    
    
    // კლიენტის რეგისტრაცია (სახელი, გვარი, პირადი ნომერი).
    func registration(name: String, surname: String, idNumber: Int) {
        let custumer1 = Customer(name: name, surname: surname, idNumber: idNumber)
        customers.append(custumer1)
        print("You have successfully registered")
    }
    
    // ბარათის მოთხოვნა
    func request(idNumber: Int, cardType: CardType) {
        customers.forEach { customer in
            if customer.idNumber == idNumber {
                if cardType == .creditCard {
                    customer.cards.append(creditCard)
                } else {
                    customer.cards.append(debitCard)
                }
            }
        }
    }
    
    // ანგარიშიდან თანხის გატანის მოთხოვნა
    func withdrawMoney(idNumber: Int, cardId: Int, amount: Double) -> Double {
        var returnedMoney: Double = 0
        guard atm.cashInATM >= amount else { return returnedMoney }
        customers.forEach { customer in
            if customer.idNumber == idNumber {
                if let card = customer.cards.first(where: { $0.cardId == cardId }) {
                    if card.inLaris.balance >= amount {
                        returnedMoney = amount
                        card.inLaris.balance -= amount
                        atm.cashInATM -= amount
                    }
                }
            }
        }
        
        return returnedMoney
    }
    
    // ანგარიშზე ნაშთის შემოწმება
    func getBalance(idNumber: Int) -> Double {
        var balance: Double = 0
        customers.forEach { customer in
            if customer.idNumber == idNumber {
                customer.cards.forEach { card in
                    balance += card.inLaris.balance
                }
            }
        }
        return balance
    }
    
    // ანგარიშზე თანხის შეტანა
    func depositMoney(idNumber: Int, cardId: Int, amount: Double) {
        customers.forEach { customer in
            if customer.idNumber == idNumber {
                if let card = customer.cards.first(where: { $0.cardId == cardId }) {
                    card.inLaris.balance += amount
                    atm.cashInATM += amount
                }
            }
        }
    }
    
    // უფლების მოთხოვნა პირადი ინფორმაციის გადამოწმებაზე
    func requestPrivateInfo(idNumber: Int) -> Customer? {
        var returnedCustomer: Customer? = nil
        customers.forEach { customer in
            if customer.idNumber == idNumber {
                returnedCustomer = customer
            }
        }
        return returnedCustomer
    }
}

class Customer {
    @Capitalized  var name: String
    @Capitalized  var surname: String
    var idNumber: Int
    var cards = [Card]()
    
    init(name: String, surname: String, idNumber: Int) {
        self.name = name
        self.surname = surname
        self.idNumber = idNumber
    }
}

class businessCustomer: Customer {
    var personalBanker: Int // by idNumber
    var revenue: Double
    var debtLimit: Double {
        revenue * 15 / 100
    }
    
    init(personalBanker: Int, revenue: Double, name: String, surname: String, idNumber: Int) {
        self.personalBanker = personalBanker
        self.revenue = revenue
        super.init(name: name, surname: surname, idNumber: idNumber)
    }
    
}

class standardCustomer: Customer {
    var status: Status
    var riskRate: Double
    var debtLimit: Double {
        100_000 * riskRate
    }
    
    init(status: Status, riskRate: Double, name: String, surname: String, idNumber: Int) {
        self.status = status
        self.riskRate = riskRate
        super.init(name: name, surname: surname, idNumber: idNumber)
    }
    
    
    enum Status {
        case minor
        case resident
        case nonResident
    }
}

extension Card {
    func getAccountNumbers() -> [String] {
        var accNumbArray = [String]()
        
        accNumbArray.append(contentsOf: [inLaris.accountNumber, inUsds.accountNumber, inEuros.accountNumber])
        return accNumbArray
    }
}


class ATM {
    var cashInATM: Double
    init(cashInATM: Double) {
        self.cashInATM = cashInATM
    }
}

class Card {
    var cardId: Int
    var inLaris: AccountInLaris
    var inUsds: AccountInUsds
    var inEuros: AccountInEuros
    
    init(
        cardId: Int,
        inLaris: AccountInLaris,
        inUsds: AccountInUsds,
        inEuros: AccountInEuros
    ) {
        self.cardId = cardId
        self.inLaris = inLaris
        self.inUsds = inUsds
        self.inEuros = inEuros
    }
}

class DebitCard: Card {}

class CreditCard: Card {}

class AccountInLaris {
    var accountNumber = "001GE\(Int.random(in: 1...999))GEL"
    var balance: Double = 0
}

class AccountInUsds {
    var accountNumber = "002GE\(Int.random(in: 1...999))USD"
    var balance: Double = 0
}

class AccountInEuros {
    var accountNumber = "003GE\(Int.random(in: 1...999))EURO"
    var balance: Double = 0
}



