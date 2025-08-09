//
//  Transaction.swift
//  quiz_1
//
//  Created by Thiri Htet on 26/07/2025.
//

import Foundation

enum TransactionType {
    case Expense
    case Income
}


class TransactionRecords{
    var transactionRecords : [Transactions]
    
    init(transactionRecords: [Transactions]) {
        self.transactionRecords = transactionRecords
    }
}

class Transactions{
    var name: String
    var emoji: String
    var amount : String
    var type: TransactionType
    
    init(name: String, emoji: String, amount: String, type: TransactionType) {
        self.name = name
        self.emoji = emoji
        self.amount = amount
        self.type = type
    }

}
