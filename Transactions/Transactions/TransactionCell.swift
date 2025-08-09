//
//  TransactionCell.swift
//  Transactions
//
//  Created by Thiri Htet on 09/08/2025.
//

import UIKit

class TransactionCell: UITableViewCell {

    @IBOutlet weak var emojiView: UIView!
    
    @IBOutlet weak var emojiLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
