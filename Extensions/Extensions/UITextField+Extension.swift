//
//  UITextField+Extension.swift
//  Extensions
//
//  Created by 민 on 2022/01/20.
//

import Foundation
import UIKit

// MARK: - 텍스트 필드 안쪽 여백을 주는 Extension

extension UITextField {
    // 왼쪽에 여백 주기
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    // 오른쪽에 여백 주기
    func setRightPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
