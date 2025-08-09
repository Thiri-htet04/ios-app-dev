//
//  ViewController.swift
//  Exercise2_practice
//
//  Created by Thiri Htet on 25/07/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayImage: UIImageView!
    
    @IBOutlet weak var displayText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func laodGiraffe() {
        displayText.text = "A giraffe has yellow color"
        displayText.textColor = .systemYellow
        displayImage.image = #imageLiteral(resourceName: "Image.png")
    }
    
    @IBAction func laodPig() {
        displayText.text = "A pig has pink color"
//        displayText.textColor = .systemPink
        displayText.textColor = UIColor(red: 1.0, green: 0.4, blue: 0.8, alpha: 1.0)
        displayImage.image = #imageLiteral(resourceName: "Image.png")
    }
    
    
    @IBAction func loadCrocodile() {
        displayText.text = "A crocodile has green color"
        displayText.textColor = .systemGreen
        displayImage.image = #imageLiteral(resourceName: "Image.png")
    }
    
    
    @IBAction func laodShark() {
        displayText.text = "A shark has blue color"
        displayText.textColor = .systemCyan
        displayImage.image = #imageLiteral(resourceName: "Image.png")
    }
}

