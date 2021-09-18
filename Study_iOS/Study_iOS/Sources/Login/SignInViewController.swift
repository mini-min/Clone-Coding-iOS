//
//  SignInViewController.swift
//  Study_iOS
//
//  Created by 민 on 2021/09/17.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKCommon

class SignInViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func singInButtonClicked(_ sender: Any) {
    }
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        guard let nextVC = UIStoryboard(name: "SignUpStoryboard", bundle: nil).instantiateViewController(identifier: "SignUpViewController") as? SignUpViewController else { return }
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func kakaoLoginButtonClicked(_ sender: Any) {
        // 카카오톡 설치 여부 확인 (카톡이 깔려있을 때)
        if (AuthApi.isKakaoTalkLoginAvailable()) {
            AuthApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                }
            }
        }

        
        // 웹 브라우저로 카카오 로그인
//        AuthApi.shared.loginWithKakaoAccount {(oauthToken, error) in
//            if let error = error {
//                print(error)
//            }
//            else {
//                print("loginWithKakaoAccount() success.")
//
//                //do something
//                _ = oauthToken
//            }
//        }
    }
    
}
