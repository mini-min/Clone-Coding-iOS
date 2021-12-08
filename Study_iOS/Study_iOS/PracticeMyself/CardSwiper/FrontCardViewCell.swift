//
//  FrontCardViewCell.swift
//  Study_iOS
//
//  Created by 민 on 2021/10/13.
//

import UIKit
import VerticalCardSwiper

class FrontCardViewCell: CardCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "FrontCardViewCell", bundle: nil)
    }

}
