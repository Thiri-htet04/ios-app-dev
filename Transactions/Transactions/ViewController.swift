//
//  ViewController.swift
//  Transactions
//
//  Created by Thiri Htet on 09/08/2025.
//

import UIKit

struct Transaction {
    var emoji : String
    var title : String
    var amount : Double
    var isExpense : Bool
    
}

var transactions : [Transaction] = []


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var expenseLabel: UILabel!
    
    @IBOutlet weak var incomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let t1 = Transaction(emoji: "✈️", title: "Flight ticket", amount: -2500, isExpense: true)
        transactions.append(t1)
        let t2 = Transaction(emoji: "⚡️", title: "Electricity Bill", amount: -1250, isExpense: true)
        transactions.append(t2)
        let t3 = Transaction(emoji: "💰", title: "Salary", amount: 50000, isExpense: false)
        transactions.append(t3)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        calculateTotal()
    }
    
    func calculateTotal(){
        var totalExpense = 0.0
        var totalIncome = 0.0
        
        
        transactions.forEach{i in
            if i.isExpense{
                totalExpense += i.amount
            }else{
                totalIncome += i.amount
            }
            
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        expenseLabel.text = formatter.string(from: NSNumber(value: totalExpense))
        incomeLabel.text = formatter.string(from: NSNumber(value: totalIncome))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let transaction = transactions[indexPath.row]
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        if transaction.isExpense{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell)") as! TransactionCell
            cell.emojiLabel.text = transaction.emoji
            cell.titleLabel.text = transaction.title
            
            cell.emojiView.backgroundColor = .lightGray
            cell.amountLabel.text = "-\(formatter.string(from: NSNumber(value: transaction.amount))!)"
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2)") as! TransactionCell
            cell.emojiLabel.text = transaction.emoji
            cell.titleLabel.text = transaction.title
            
            cell.amountLabel.textColor = .systemGreen
            cell.amountLabel.text = formatter.string(from: NSNumber(value: transaction.amount))!
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            transactions.remove(at: indexPath.row)
            calculateTotal()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    


}

