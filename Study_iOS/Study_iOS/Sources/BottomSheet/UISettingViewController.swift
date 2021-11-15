//
//  UISettingViewController.swift
//  Study_iOS
//
//  Created by 민 on 2021/11/15.
//

import UIKit

class UISettingViewController: UIViewController {

    // MARK: - Properties
    
    // 기존 화면을 흐려지게 만들기 위한 뷰
    private let exampleView: UIView = {
        let view = UIView()
        //        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        //        view.layer.cornerRadius = 27
        //        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        //        view.clipsToBounds = true
        
        return view
    }()
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupGestureRecognizer()
    }
    
    // MARK: - @IBAction Properties
    
    // MARK: - @Functions
    // UI 세팅 작업
    private func setupUI() {
        // view.addSubview(exampleView)
        
        setupLayout()
    }
    
    // GestureRecognizer 세팅 작업
    private func setupGestureRecognizer() {
        //        let dimmedTap = UITapGestureRecognizer(target: self, action: #selector(dimmedViewTapped(_:)))
        //        blackView.addGestureRecognizer(dimmedTap)
        //        exampleView.isUserInteractionEnabled = true
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
    }
    
    // UITapGestureRecognizer 연결 함수 부분
    @objc private func dimmedViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        
    }
    
}

// MARK: - Extensions


