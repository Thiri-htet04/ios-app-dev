//
//  ViewController.swift
//  Lesson 2
//
//  Created by Thiri Htet on 14/06/2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var displayText: UILabel!
    @IBOutlet var displayImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonClicked(){
        displayText.text = "Hello, Fair 😳"
        displayText.backgroundColor = .yellow
        displayImage.image = #imageLiteral(resourceName: "classroom")
        
        view.backgroundColor = .black
    }

}

