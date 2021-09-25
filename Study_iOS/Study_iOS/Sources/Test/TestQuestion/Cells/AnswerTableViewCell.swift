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

        // 셀 선택시 테두리 색 변함
        if selected {
            contentView.layer.borderWidth = 2
            contentView.layer.borderColor = UIColor(named: "SpoTBlue")?.cgColor
        } else {
            contentView.layer.borderWidth = 1
            contentView.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    // Cell 사이에 간격 inset
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 16.0, left: 16, bottom: 16, right: 16))
    }

    func setData(title: String) {
        answerLabel.text = title
    }
}
