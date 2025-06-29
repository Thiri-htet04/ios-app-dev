//
//  DetailViewController.swift
//  Lesson 5
//
//  Created by Thiri Htet on 28/06/2025.
//

import UIKit

class DetailViewController: UIViewController {
    
    var contact = Contact()
    

    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pictureImageView.image = UIImage(named: contact.pictureName)
        nameLabel.text = contact.name
        numberLabel.text = contact.phoneNumber

    }
    

  

}
