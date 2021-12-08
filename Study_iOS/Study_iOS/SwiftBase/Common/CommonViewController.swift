//
//  CommonViewController.swift
//  Study_iOS
//
//  Created by 민 on 2021/12/08.
//

import UIKit

class CommonViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var studyTableView: UITableView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    // MARK: - @IBAction Properties
    
}

// MARK: - Extensions
extension CommonViewController {
    func setUI() {
        studyTableView.register(StudyTableViewCell.nib(), forCellReuseIdentifier: Const.Xib.studyTableViewCell)
        
        studyTableView.delegate = self
        studyTableView.dataSource = self
    }
}

// MARK: - TableView Delegate
extension CommonViewController: UITableViewDelegate {
    
}

// MARK: - TableView DataSource
extension CommonViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let serviceCell = tableView.dequeueReusableCell(withIdentifier: Const.Xib.studyTableViewCell, for: indexPath) as? StudyTableViewCell else { return UITableViewCell() }
        
        return serviceCell
    }
}

