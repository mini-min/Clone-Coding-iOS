//
//  OutletViewController.swift
//  Study_iOS
//
//  Created by 민 on 2021/11/19.
//

import UIKit

class OutletViewController: UIViewController {

    @IBOutlet var tmiLabelCollection: [UILabel]!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        setLabelColor()
    }
    
    func setLabelColor() {
        for lb in tmiLabelCollection {
            lb.textColor = .red
        }
    }

}
