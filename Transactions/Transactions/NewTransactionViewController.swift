//
//  NewTransactionViewController.swift
//  Transactions
//
//  Created by Thiri Htet on 09/08/2025.
//

import UIKit

class NewTransactionViewController: UIViewController {
    
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var emojiTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func newTransactionClicked() {
        
        let isExpense = segmentControl.selectedSegmentIndex == 0
        if let name = nameTextField.text,
           let emoji = emojiTextField.text,
            let amount = Double(amountTextField.text ?? "0") {
            let newTransaction = Transaction(emoji: emoji, title: name, amount: amount, isExpense: isExpense)
            transactions.append(newTransaction)
            
            navigationController?.popViewController(animated: true)
            
        }else{
            //display alert to say "Some fields are empty"
        }
        
        
    }



}
