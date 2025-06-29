//
//  ViewController.swift
//  Lesson 4
//
//  Created by Thiri Htet on 21/06/2025.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameInput: UITextField!
    
    @IBOutlet weak var ageInput : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func nextClicked(_ sender: Any) {
        
        // 1. Present the second vc
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "second") as? SecondViewController{
            
            //optional binding
            if let name = nameInput.text, !name.isEmpty{
                vc.name  = name
                vc.age = Int(ageInput.text!) ?? 0
                
                navigationController?.pushViewController(vc, animated: true)
                
            }
            
        }
        
        
        
        
        
        // 2. Carry over the value from nameInput
    }
    
}

