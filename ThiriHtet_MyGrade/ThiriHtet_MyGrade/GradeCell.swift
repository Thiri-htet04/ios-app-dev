//
//  GradeCell.swift
//  ThiriHtet_MyGrade
//
//  Created by Thiri Htet on 28/06/2025.
//

import UIKit

class GradeCell: UITableViewCell {
    
    
    @IBOutlet weak var courseCode: UILabel!
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var credit: UILabel!
    @IBOutlet weak var grade: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
