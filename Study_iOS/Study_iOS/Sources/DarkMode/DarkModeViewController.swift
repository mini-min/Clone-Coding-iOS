//
//  DarkModeViewController.swift
//  Study_iOS
//
//  Created by 민 on 2021/11/28.
//

import UIKit

class DarkModeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(ExampleTableViewCell.nib(), forCellReuseIdentifier: "ExampleTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    @objc func darkModeSwitchButton(_ sender: UISwitch) {
      
    }
}

// MARK: - TableView Delegate
extension DarkModeViewController: UITableViewDelegate {
    
}

// MARK: - TableView DataSource
extension DarkModeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let serviceCell = tableView.dequeueReusableCell(withIdentifier: "ExampleTableViewCell", for: indexPath) as? ExampleTableViewCell else { return UITableViewCell() }
        
        serviceCell.modeSwitch.addTarget(self, action: #selector(darkModeSwitchButton(_:)), for: .touchUpInside)
        
        if indexPath.row != 0 {
            serviceCell.modeSwitch.isHidden = true
        }
        
        return serviceCell
    }
}
