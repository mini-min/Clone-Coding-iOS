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
         let bottomSheetVC = GroupChoiceBottomSheetViewController()
                                .setHeight(406)
                                .setTitle("그룹 선택")
//        let bottomSheetVC = CommonBottomSheetViewController()
//                            .setHeight(406)
//                            .setTitle("그룹 선택")
        bottomSheetVC.modalPresentationStyle = .overFullScreen
        self.present(bottomSheetVC, animated: false, completion: nil)
    }
}
