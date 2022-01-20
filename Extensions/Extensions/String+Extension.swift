//
//  String+Extension.swift
//  Extensions
//
//  Created by 민 on 2022/01/20.
//

import Foundation

// MARK: - Swift String 인덱싱을 편리하게 하는 Extension

extension String {
    func getChar(at index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}
