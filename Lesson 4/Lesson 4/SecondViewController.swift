//
//  SecondViewController.swift
//  Lesson 4
//
//  Created by Thiri Htet on 21/06/2025.
//

import UIKit

class SecondViewController: UIViewController {
    
    var name = ""
    var age = 0

    @IBOutlet weak var outputLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputLabel.text = "Hello, \(name). You're \(age*2) years old."
    }
    
    @IBAction func changeModeToggle(_ sender: Any) {
        let isOn  = (sender as! UISwitch).isOn
        if isOn {
            view.backgroundColor = .black
            outputLabel.textColor = .white
        
        }else{
            view.backgroundColor = .white
            outputLabel.textColor = .black
        }
    }
    

}
