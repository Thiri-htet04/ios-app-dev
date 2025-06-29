//
//  DetailViewController.swift
//  ThiriHtet_MyGrade
//
//  Created by Thiri Htet on 28/06/2025.
//

import UIKit

class DetailViewController: UIViewController {
    
    var grade = Grade()
    
    
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var courseCodeLabel: UILabel!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var creditLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = grade.courseCode

        gradeLabel.text = grade.grade
        courseCodeLabel.text = grade.courseCode
        courseNameLabel.text = grade.courseName
        creditLabel.text = grade.credit
        
        
    }
    


}
