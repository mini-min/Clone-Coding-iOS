//
//  AnswerTableViewCell.swift
//  Study_iOS
//
//  Created by 민 on 2021/09/24.
//

import UIKit

class AnswerTableViewCell: UITableViewCell {

    static let identifier: String = "AnswerTableViewCell"
    
    @IBOutlet weak var answerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(title: String) {
        answerLabel.text = title
    }
}
