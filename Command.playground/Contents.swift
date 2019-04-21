

class Bank {
    var money = 0
    static let shared = Bank()
    private init () {}
}

let bank = Bank.shared
bank.money = 1000

print(bank.money)


let moneyGram = Bank.shared

print(moneyGram.money)


