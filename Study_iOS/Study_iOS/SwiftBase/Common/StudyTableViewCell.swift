//
//  StudyTableViewCell.swift
//  Study_iOS
//
//  Created by 민 on 2021/12/08.
//

import UIKit

class StudyTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func nib() -> UINib {
        return UINib(nibName: Const.Xib.studyTableViewCell, bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
