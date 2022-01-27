//
//  SnippetUITableView.swift
//  CodeSnippet
//
//  Created by 민 on 2022/01/27.
//

import Foundation

/**
 테이블 뷰를 만들 때, 공통으로 활용할 수 있도록 만든 코드 스니펫입니다.
 <필수사항> UITableViewDelegate와 UITableViewDataSource를 뷰 생명주기에 넣고 난 후, 이 스니펫을 사용해야 합니다.
*/

// MARK: - TableView Delegate

extension <#ViewController#>: UITableViewDelegate {
    
}

// MARK: - TableView DataSource

extension <#ViewController#>: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
