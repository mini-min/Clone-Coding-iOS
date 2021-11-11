//
//  BackgroundCollectionViewCell.swift
//  Study_iOS
//
//  Created by 민 on 2021/11/11.
//

import UIKit

class BackgroundCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
}

extension BackgroundCollectionViewCell {
    private func setUI() {
        bgView.backgroundColor = .white
//        bgView.isHidden = true
        bgView.layer.cornerRadius = bgView.frame.height / 2
        bgView.layer.cornerRadius = 30
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.layer.cornerRadius = 28
    }
    func initCell(image: String) {
        if let image = UIImage(named: image) {
            imageView.image = image
        }
    }
    func cellSelected() {
        bgView.isHidden = false
    }
    func cellUnselected() {
        bgView.isHidden = true
    }
    static func nib() -> UINib {
        return UINib(nibName: "BackgroundCollectionViewCell", bundle: nil)
    }
}
