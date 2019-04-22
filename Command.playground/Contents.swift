
class Account {
    var accountName: String
    var balance: Int
    init(accountName: String, balance: Int) {
        self.accountName = accountName
        self.balance = balance
    }
}


protocol Command {
    func execute()
    var isComplete: Bool { get set}
}


class Deposit: Command {
    private var _account: Account
    private var _amount: Int
    var isComplete = false
    
    init(account: Account, amount: Int) {
        self._account = account
        self._amount = amount
    }
    
    func execute() {
        _account.balance += _amount
        isComplete = true
    }
}

class Withdrow: Command {
    private var _account: Account
    private var _amount: Int
    var isComplete = false
    
    init(account: Account, amount: Int) {
        self._account = account
        self._amount = amount
    }
    
    func execute() {
        if _account.balance >= _amount {
            _account.balance -= _amount
            isComplete = true
        } else {
            print("Not money")
        }
       
    }
}

// Singleton
class TransactionManager {
    static let shared = TransactionManager()
    private init () {}
    private var _transactions: [Command] = []
    var pendingTransactions: [Command] {
        get {
            return self._transactions.filter { $0.isComplete == false }
        }
    }
    func addTransactions(command: Command) {
        self._transactions.append(command)
    }
    func processingTransactions() {
        self._transactions.filter { $0.isComplete == false }.forEach { $0.execute() }
    }
}


let account = Account(accountName: "Spiridonov Maxim", balance: 2000)
let transactionsManager = TransactionManager.shared
transactionsManager.addTransactions(command: Deposit(account: account, amount: 150))
transactionsManager.addTransactions(command: Withdrow(account: account, amount: 1150))
transactionsManager.pendingTransactions
account.balance
transactionsManager.processingTransactions()
account.balance
