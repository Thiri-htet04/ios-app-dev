//
//  TransactionViewController.swift
//  quiz_1
//
//  Created by Thiri Htet on 26/07/2025.
//

import UIKit

class TransactionViewController: UIViewController {
    

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emojiTextField: UITextField!
    
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    
    var onSave : ((Transactions) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "New Transaction"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTransaction))

    }
    
    
    @objc func saveTransaction() {
        let name = nameTextField.text ?? ""
        let emoji = emojiTextField.text ?? ""
        let amount = amountTextField.text ?? ""
        var type = TransactionType.Expense
        
        if typeSegmentedControl.selectedSegmentIndex == 0 {
            type = TransactionType.Expense
        } else if typeSegmentedControl.selectedSegmentIndex == 1 {
            type = TransactionType.Income
        }
        let newTransaction = Transactions(name: name, emoji: emoji, amount: amount, type: type)
        onSave?(newTransaction)
        navigationController?.popViewController(animated: true)
    }
    


}
