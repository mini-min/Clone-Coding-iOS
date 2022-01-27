//
//  SnippetUICollectionView.swift
//  CodeSnippet
//
//  Created by 민 on 2022/01/27.
//

import Foundation

/**
 컬렉션 뷰를 만들 때, 공통으로 활용할 수 있도록 만든 코드 스니펫입니다.
 <필수사항> UICollectionViewDataSource와 UICollectionViewDelegate를 뷰 생명주기에 넣고 난 후, 이 스니펫을 사용해야 합니다.
*/

// MARK: - CollectionView Delegate

extension <#ViewController#>: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#Code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#Code#>
    }
}

// MARK: - CollectionView DataSource

extension <#ViewController#>: UICollectionViewDelegate {
    
}

// MARK: - CollectionView Delegate Flow Layout

extension <#ViewController#>: UICollectionViewDelegateFlowLayout {
    
    /// sizeForItemAt: 각 Cell의 크기를 CGSize 형태로 return
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        <#Code#>
    }
    
    /// ContentInset: Cell에서 Content 외부에 존재하는 Inset의 크기를 결정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return <#Size#>
    }
    
    /// minimumLineSpacing: Cell 들의 위, 아래 간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return <#Int#>
    }
    
    /// minimumInteritemSpacing: Cell 들의 좌,우 간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return <#Int#>
    }
}
