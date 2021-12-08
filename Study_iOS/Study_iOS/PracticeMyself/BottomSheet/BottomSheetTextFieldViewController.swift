//
//  BottomSheetTextFieldViewController.swift
//  Study_iOS
//
//  Created by 민 on 2021/11/15.
//

import UIKit

class BottomSheetTextFieldViewController: UIViewController {

    // MARK: - Properties
    // 바텀 시트 높이
    let bottomHeight: CGFloat = 475
    
    // bottomSheet가 view의 상단에서 떨어진 거리
    private var bottomSheetViewTopConstraint: NSLayoutConstraint!
    
    // 기존 화면을 흐려지게 만들기 위한 뷰
    private let dimmedBackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        return view
    }()
    
    // 바텀 시트 뷰
    private let bottomSheetView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        view.layer.cornerRadius = 27
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = true
        
        return view
    }()
    
    // dismiss Indicator View UI 구성 부분
    private let dismissIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray2
        view.layer.cornerRadius = 3
        
        return view
    }()
    
    // 바텀 시트 메인 라벨
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "그룹 추가"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        
        return label
    }()
    
    // 그룹 추가 텍스트 필드
    private let addGroupTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "추가할 그룹명을 입력하세요."
        textField.borderStyle = .none
        textField.cornerRadius = 10
        textField.backgroundColor = UIColor(red: 241/255, green: 243/255, blue: 245/255, alpha: 1.0)
        
        return textField
    }()
    
    // 하단 버튼
    private let bottomButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "btnMainDone"), for: .normal)
        
        return button
    }()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupGestureRecognizer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showBottomSheet()
    }
    
    // MARK: - @IBAction Properties
    
    // MARK: - @Functions
    // UI 세팅 작업
    private func setupUI() {
        view.addSubview(dimmedBackView)
        view.addSubview(bottomSheetView)
        view.addSubview(dismissIndicatorView)
        view.addSubview(mainLabel)
        // view.addSubview(addGroupTextField)
        bottomSheetView.addSubview(bottomButton)
        
        dimmedBackView.alpha = 0.0
        setupLayout()
    }
    
    // GestureRecognizer 세팅 작업
    private func setupGestureRecognizer() {
        // 흐린 부분 탭할 때, 바텀시트를 내리는 TapGesture
        let dimmedTap = UITapGestureRecognizer(target: self, action: #selector(dimmedViewTapped(_:)))
        dimmedBackView.addGestureRecognizer(dimmedTap)
        dimmedBackView.isUserInteractionEnabled = true
        
        // 스와이프 했을 때, 바텀시트를 내리는 swipeGesture
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(panGesture))
        swipeGesture.direction = .down
        view.addGestureRecognizer(swipeGesture)
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        dimmedBackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dimmedBackView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmedBackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimmedBackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dimmedBackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        bottomSheetView.translatesAutoresizingMaskIntoConstraints = false
        let topConstant = view.safeAreaInsets.bottom + view.safeAreaLayoutGuide.layoutFrame.height
        bottomSheetViewTopConstraint = bottomSheetView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topConstant)
        NSLayoutConstraint.activate([
            bottomSheetView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomSheetView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomSheetView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomSheetViewTopConstraint
        ])
        
        dismissIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dismissIndicatorView.widthAnchor.constraint(equalToConstant: 102),
            dismissIndicatorView.heightAnchor.constraint(equalToConstant: 7),
            dismissIndicatorView.topAnchor.constraint(equalTo: bottomSheetView.topAnchor, constant: 12),
            dismissIndicatorView.centerXAnchor.constraint(equalTo: bottomSheetView.centerXAnchor)
        ])
       
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: dismissIndicatorView.bottomAnchor, constant: 28),
            mainLabel.widthAnchor.constraint(equalToConstant: 100),
            mainLabel.centerXAnchor.constraint(equalTo: bottomSheetView.centerXAnchor)
        ])
        
//        addGroupTextField.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            addGroupTextField.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 20),
//            addGroupTextField.centerXAnchor.constraint(equalTo: bottomSheetView.centerXAnchor),
//            addGroupTextField.heightAnchor.constraint(equalToConstant: 44),
//            addGroupTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24)
//        ])
        
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomButton.centerXAnchor.constraint(equalTo: bottomSheetView.centerXAnchor),
            bottomButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            bottomButton.heightAnchor.constraint(equalToConstant: 54),
            bottomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    // 바텀 시트 표출 애니메이션
    private func showBottomSheet() {
        let safeAreaHeight: CGFloat = view.safeAreaLayoutGuide.layoutFrame.height
        let bottomPadding: CGFloat = view.safeAreaInsets.bottom
        
        bottomSheetViewTopConstraint.constant = (safeAreaHeight + bottomPadding) - bottomHeight
        
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
            self.dimmedBackView.alpha = 0.5
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    // 바텀 시트 사라지는 애니메이션
    private func hideBottomSheetAndGoBack() {
        let safeAreaHeight = view.safeAreaLayoutGuide.layoutFrame.height
        let bottomPadding = view.safeAreaInsets.bottom
        bottomSheetViewTopConstraint.constant = safeAreaHeight + bottomPadding
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
            self.dimmedBackView.alpha = 0.0
            self.view.layoutIfNeeded()
        }) { _ in
            if self.presentingViewController != nil {
                self.dismiss(animated: false, completion: nil)
            }
        }
    }
    
    // UITapGestureRecognizer 연결 함수 부분
    @objc private func dimmedViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        hideBottomSheetAndGoBack()
    }
    
    // UISwipeGestureRecognizer 연결 함수 부분
    @objc func panGesture(_ recognizer: UISwipeGestureRecognizer) {
        if recognizer.state == .ended {
            switch recognizer.direction {
            case .down:
                hideBottomSheetAndGoBack()
            default:
                break
            }
        }
    }
}

// MARK: - Extensions
