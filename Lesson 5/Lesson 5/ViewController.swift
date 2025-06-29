//
//  ViewController.swift
//  Lesson 5
//
//  Created by Thiri Htet on 28/06/2025.
//

import UIKit


struct Contact {
    var name = ""
    var pictureName =  ""
    var phoneNumber = ""
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var contacts = [
        Contact(name: "John Apple", pictureName: "john", phoneNumber: "081-234-5678"),
        Contact(name: "Jack Cisco", pictureName: "jack", phoneNumber: "089-876-5432"),
        Contact(name: "James Microsoft", pictureName: "james", phoneNumber: "091-112-2243"),
        Contact(name: "Joy Google", pictureName: "joy", phoneNumber: "086-445-5667")
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
//        cell.textLabel?.text = contacts[indexPath.row].name
//        cell.imageView?.image = UIImage(named: contacts[indexPath.row].pictureName)
//        cell.detailTextLabel?.text = contacts[indexPath.row].phoneNumber

        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ContactCell
        cell.name.text = contacts[indexPath.row].name
        cell.phoneNumber.text = contacts[indexPath.row].phoneNumber
        cell.picture.image = UIImage(named: contacts[indexPath.row].pictureName)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailViewController
        
        detailVC.contact = contacts[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }


}



