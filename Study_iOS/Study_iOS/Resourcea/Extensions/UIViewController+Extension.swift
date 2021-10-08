//
//  UIViewController+Extension.swift
//  Study_iOS
//
//  Created by 민 on 2021/10/08.
//

import Foundation

extension UIViewController {
    
    var rootVC: RootStackTabViewController? {
        var selfVC = self
        while let parentVC = selfVC.parent {
            if let vc = parentVC as? RootStackTabViewController {
                return vc
            } else {
                selfVC = parentVC
            }
        }
        return nil
    }
    
}
