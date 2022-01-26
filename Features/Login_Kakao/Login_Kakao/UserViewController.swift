//
//  UserViewController.swift
//  Login_Kakao
//
//  Created by 민 on 2022/01/22.
//

import UIKit
import KakaoSDKUser

class UserViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserInfo()
    }

    // MARK: - @Functions
    
    // 사용자 정보 가져오기
    func getUserInfo() {
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                
                //do something
                _ = user
            }
        }
    }
}
