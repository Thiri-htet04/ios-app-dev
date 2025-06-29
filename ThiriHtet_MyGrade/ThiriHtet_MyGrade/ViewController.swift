//
//  ViewController.swift
//  ThiriHtet_MyGrade
//
//  Created by Thiri Htet on 28/06/2025.
//

import UIKit

struct Grade{
    var courseCode = ""
    var courseName = ""
    var credit = ""
    var grade = ""
}


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var grades = [
        Grade(courseCode: "C101", courseName: "COMPUTER PROGRAMMING", credit : "3.0 CR.", grade: "A"),
        Grade(courseCode: "S105", courseName: "SCIENCE AND BIOLOGY", credit: "3.0 CR.", grade: "B+"),
        Grade(courseCode: "M102", courseName: "MATHEMATIC", credit: "4.0 CR.", grade: "A-"),
        Grade(courseCode: "E112", courseName: "ENGLISH FOR SPEAKING", credit: "3.0 CR.", grade: "A")
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return grades.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! GradeCell
        
        cell.courseCode.text = grades[indexPath.row].courseCode
        cell.courseName.text = grades[indexPath.row].courseName
        cell.credit.text = grades[indexPath.row].credit
        cell.grade.text = grades[indexPath.row].grade
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailVC = storyboard?.instantiateViewController(identifier: "detail") as! DetailViewController
        
        detailVC.grade = grades[indexPath.row]
        
        navigationController?.pushViewController(detailVC, animated: true)
    }


}

