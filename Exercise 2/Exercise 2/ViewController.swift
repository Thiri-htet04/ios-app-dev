//
//  ViewController.swift
//  Exercise 2
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
    
    @IBAction func loadGiraffe(){
        displayText.text = "A giraffe has yellow color"
        displayText.textColor = .systemYellow
        displayImage.image = #imageLiteral(resourceName: "Giraffe")

    }
    
    @IBAction func loadPig()
    {
        displayText.text = "A pig has pink color"
//        displayText.textColor = .systemPink
        displayText.textColor = UIColor(red: 1.0, green: 0.4, blue: 0.8, alpha: 1.0)

        displayImage.image = #imageLiteral(resourceName: "Pig")
    }
    
    @IBAction func loadCrocodile()
    {
        displayText.text = "A crocodile has green color"
        displayText.textColor = .systemGreen
        displayImage.image = #imageLiteral(resourceName: "Crocodile")
        
    }
    
    @IBAction func loadShark(){
        displayText.text = "A shark has blue color"
        displayText.textColor = .systemCyan
        displayImage.image = #imageLiteral(resourceName: "Shark")
    }
}

