//
//  ViewController.swift
//  quiz_1
//
//  Created by Thiri Htet on 26/07/2025.
//

import UIKit

//struct Transaction{
//    var name = ""
//    var amount = ""
//    var emoji = ""
//
//}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var transaction = [Transactions(name: "Breakfast at Café Amazon", emoji: "🥐", amount: "-75", type: .Expense),
                        Transactions(name: "Grab ride to meeting", emoji: "🚓", amount: "-120", type: .Expense),
                        Transactions(name: "Netflix subscription", emoji: "🍿", amount: "-349", type: .Expense),
                        
                        Transactions(name: "Monthly salary deposit", emoji: "💰", amount: "50000", type: .Income),
                        Transactions(name: "Lunch with colleagues", emoji: "🍔", amount: "-200", type: .Expense),
                        Transactions(name: "Electricity bill", emoji: "🧾", amount: "-1250", type: .Expense),
                        Transactions(name: "MRT top-up", emoji: "🚨", amount: "-300", type: .Expense),
                        Transactions(name: "Dividend received", emoji: "💰", amount: "1100", type: .Income),
                    
                        Transactions(name: "New iPhone case", emoji: "📱", amount: "-200", type: .Expense)
               
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTransaction))

    }
    
    @objc func addTransaction(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let transactionViewController = storyboard.instantiateViewController(withIdentifier: "transactionVC")as? TransactionViewController{
            
//            TransactionViewController.onSave = {name, date in
//                if let dayMeal = self.dayMeals.first(where: {Calendar.current.isDate($0.date, inSameDayAs: date)}){
//                    dayMeal.meals.append(meal)
//                } else{
//                    self.dayMeals.append(DayMeal(date: date, meals: [meal]))
//                }
//                self.tableView.reloadData()
//            }
            
            navigationController?.pushViewController(transactionViewController, animated: true)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transaction.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell") as? TransactionCell {
//                let transactions = transaction[indexPath.row]
                
                return cell
            }
        
            return UITableViewCell()
  
    }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        tableView.deselectRow(at: indexPath, animated: true)
//        
//        let transactionVC = storyboard?.instantiateViewController(withIdentifier: "transactionVC") as! TransactionViewController
//        
////        transactionVC = transactions[indexPath.row]
//        navigationController?.pushViewController(transactionVC, animated: true)
//    }


}

