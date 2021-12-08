//
//  CommonViewController.swift
//  Study_iOS
//
//  Created by 민 on 2021/12/08.
//

import UIKit

class CommonViewController: UIViewController {

    // MARK: - Properties
    var studyList = ["1. 이미지 뷰(ImageView)"]
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var studyTableView: UITableView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
}

// MARK: - Extensions
extension CommonViewController {
    
    func setUI() {
        studyTableView.register(StudyTableViewCell.nib(), forCellReuseIdentifier: Const.Xib.studyTableViewCell)
        
        studyTableView.delegate = self
        studyTableView.dataSource = self
    }
    
    func presentToNextView(sb: String, vc: String) {
        let nextVC = UIStoryboard(name: sb, bundle: nil).instantiateViewController(withIdentifier: vc)
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
}

// MARK: - TableView Delegate
extension CommonViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        cell!.contentView.backgroundColor = .white
        
        switch indexPath.row {
        case 0: presentToNextView(sb: Const.Storyboard.Name.imageView,
                                  vc: Const.ViewController.Identifier.imageViewController)
        default: print("default!")
        }
    }
    
}

// MARK: - TableView DataSource
extension CommonViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let serviceCell = tableView.dequeueReusableCell(withIdentifier: Const.Xib.studyTableViewCell, for: indexPath) as? StudyTableViewCell else { return UITableViewCell() }
        
        serviceCell.titleLabel.text = studyList[indexPath.row]
        
        return serviceCell
    }
    
}
