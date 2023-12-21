//
//  UIView+.swift
//  Clone-Weather
//
//  Created by 민 on 12/20/23.
//

import UIKit

extension UIView {
    // 여러개의 addSubView 추가하기
    func addSubViews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
