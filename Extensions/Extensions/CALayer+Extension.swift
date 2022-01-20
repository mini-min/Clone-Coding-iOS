//
//  CALayer+Extension.swift
//  Extensions
//
//  Created by 민 on 2022/01/20.
//

import Foundation
import UIKit

// MARK: - 쉐도우 적용 함수

extension CALayer {
    // 예시: ImageView.layer.applyShadow(color: .black, alpha: 0.25, x: 0, y: 4, blur: 4)
    func applyShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0)
    {
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
