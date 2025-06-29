//
//  ViewController.swift
//  Week5_Exercise
//
//  Created by Thiri Htet on 28/06/2025.
//

import UIKit

struct Contact {
    var name = ""
    var pictureName =  ""
    var phoneNumber = ""
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var contacts = [
        Contact(name: "Sam Yati", pictureName: "sam", phoneNumber: "0812345678"),
        Contact(name: "Swan Htet Aung", pictureName: "swan", phoneNumber: "0898765432"),
        Contact(name: "Wyne Nadi", pictureName: "wyne", phoneNumber: "0911122233"),
        Contact(name: "Thiri Htet", pictureName: "thiri", phoneNumber: "0864455667"),
        Contact(name: "Win Yu Maung", pictureName: "win", phoneNumber: "0894109109")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = contacts[indexPath.row].name
        cell.imageView?.image = UIImage(named: contacts[indexPath.row].pictureName)
        cell.detailTextLabel?.text = contacts[indexPath.row].phoneNumber
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }


}

