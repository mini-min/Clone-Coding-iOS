//
//  TestBottomSheetViewController.swift
//  Study_iOS
//
//  Created by 민 on 2021/11/08.
//

import UIKit

class TestBottomSheetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func bottomSheetButtonClicked(_ sender: Any) {
        let bottomSheetVC = BottomSheetViewController()
        bottomSheetVC.modalPresentationStyle = .overFullScreen
        self.present(bottomSheetVC, animated: false, completion: nil)
    }
}
