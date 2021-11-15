//
//  GroupChoiceBottomSheetViewController.swift
//  Study_iOS
//
//  Created by 민 on 2021/11/15.
//

import UIKit

class GroupChoiceBottomSheetViewController: CommonBottomSheetViewController {
    
    // MARK: - Properties
    var pickerList = ["가가가가", "나나나나", "다다다다", "라라라라", "마마마마", "바바바바", "사사사사"]
    var selectedRow: Int {
        return groupPickerView.selectedRow(inComponent: 0)
    }
    
    // 완료 버튼
    private let completeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "btnMainDone"), for: .normal)
        button.addTarget(self, action: #selector(completeAction(_:)), for: .touchUpInside)
        return button
    }()
    
    // 그룹 선택을 위한 피커 뷰
    private let groupPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        return pickerView
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        groupPickerView.delegate = self
        groupPickerView.dataSource = self
    }
    
    // MARK: - @IBAction Properties
    
    // MARK: - @Functions
    // UI 세팅 작업
    private func setupUI() {
        view.addSubview(completeButton)
        view.addSubview(groupPickerView)
        
        setupLayout()
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        completeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            completeButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            completeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            completeButton.heightAnchor.constraint(equalToConstant: 54),
            completeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
        groupPickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            groupPickerView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            groupPickerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            groupPickerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            groupPickerView.bottomAnchor.constraint(equalTo: completeButton.topAnchor, constant: -5)
        ])
    }
    
    @objc private func completeAction(_ sender: UIButton) {
        hideBottomSheetAndGoBack()
    }
}

// MARK: - Extensions
extension GroupChoiceBottomSheetViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 44
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadComponent(component)
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var color = UIColor.gray
        var font = UIFont.systemFont(ofSize: 16)
        
        if row == selectedRow {
            color = UIColor(red: 246/255, green: 112/255, blue: 102/255, alpha: 1.0)
            font = UIFont.systemFont(ofSize: 16, weight: .bold)
        }
        
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): color,
            NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue): font
        ]
        
        return NSAttributedString(string: pickerList[row], attributes: attributes)
    }
}

extension GroupChoiceBottomSheetViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerList.count
    }
}
