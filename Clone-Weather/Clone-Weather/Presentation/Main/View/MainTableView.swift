//
//  MainTableView.swift
//  Clone-Weather
//
//  Created by 민 on 12/21/23.
//

import UIKit
import SnapKit
import Then

final class MainTableView: UIView {

    // MARK: - Properties
    
    // MARK: - UI Components
    lazy var mainTableView = UITableView(frame: .zero, style: .insetGrouped).then {
        $0.backgroundColor = .black
    }
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        setAddTarget()
        setRegisterCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension MainTableView {
    func setUI() {
        
    }
    
    func setHierarchy() {
        addSubview(mainTableView)
    }
    
    func setLayout() {
        mainTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setAddTarget() {

    }
    
    @objc
    func buttonTapped() {
        
    }
    
    func setRegisterCell() {
        MainLocationTableViewCell.register(tableView: mainTableView)
    }
    
    func setDataBind() {
        
    }
}
