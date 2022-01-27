//
//  SnippetUIPickerView.swift
//  CodeSnippet
//
//  Created by 민 on 2022/01/27.
//

import Foundation

/**
 피커 뷰를 만들 때, 공통으로 활용할 수 있도록 만든 코드 스니펫입니다.
 <필수사항> UIPickerViewDelegate와 UIPickerViewDataSource를 뷰 생명주기에 넣고 난 후, 이 스니펫을 사용해야 합니다.
*/

extension <#ViewController#>: UIPickerViewDelegate {
    
}

extension <#ViewController#>: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        <#code#>
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        <#code#>
    }
}
