//
//  ExampleSnapkitViewController.swift
//  Study_iOS
//
//  Created by 민 on 2021/11/15.
//

import UIKit
import SnapKit

class ExampleSnapkitViewController: UIViewController {

    // MARK: - Properties
    
    let tempColor = UIColor(red: 201/255, green: 48/255, blue: 52/255, alpha: 1.0)
    let tempImage = UIImage(named: "homeBtnOnClick")
    
    let literalColor: UIColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    let literalImage: UIImage = #imageLiteral(resourceName: "homeBtnOnClick")
    
    // 흐린 화면 뷰
    private let exampleView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.4445274472, green: 0.4969258904, blue: 0.9510256648, alpha: 1)
        return view
    }()
        
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setupUI()
    }
    
    // MARK: - @IBAction Properties
    
    // MARK: - @Functions
    // UI 세팅 작업
    private func setupUI() {
        view.addSubview(exampleView)
        
        setupLayout()
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        //        exampleView.translatesAutoresizingMaskIntoConstraints = false
        //        NSLayoutConstraint.activate([
        //            exampleView.topAnchor.constraint(equalTo: view.topAnchor),
        //            exampleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        //            exampleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        //            exampleView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        //        ])
        
        exampleView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().inset(additionalSafeAreaInsets.top + 20)
            make.left.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(20)
        }
    }
}
