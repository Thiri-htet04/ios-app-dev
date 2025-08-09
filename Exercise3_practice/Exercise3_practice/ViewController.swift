//
//  ViewController.swift
//  Exercise3_practice
//
//  Created by Thiri Htet on 25/07/2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNameInput: UITextField!
    
    @IBOutlet weak var lastNameInput: UITextField!
    
    @IBOutlet weak var ageInput: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var letsGoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateButton(_ sender: Any) {
        let firstName = firstNameInput.text
        let lastName = lastNameInput.text
        let age = ageInput.text
        
        letsGoButton.isEnabled = !(firstName ?? "").isEmpty &&
                                !(lastName ?? "").isEmpty &&
                                !(age ?? "").isEmpty
    }
    

    
    @IBAction func letsGoClicked(_ sender: Any) {
        
        if let firstName = firstNameInput.text, !firstName.isEmpty,
           let lastName = lastNameInput.text, !lastName.isEmpty,
           let age = ageInput.text, !age.isEmpty {
            
            nameLabel.text = "Your name is \(firstName) \(lastName)"
            ageLabel.text = "You are \(age) years old"
            
        }
    }
    

}

