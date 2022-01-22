//
//  ViewController.swift
//  Login_Kakao
//
//  Created by 민 on 2022/01/22.
//

import UIKit

import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class ViewController: UIViewController {
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setKakaoLoginButton()
    }
    
    // MARK: - @Functions
    
    func setKakaoLoginButton() {
        let kakaoButton = UIButton()
        kakaoButton.setImage(UIImage(named: "kakao_login_large_narrow"), for: .normal)
        kakaoButton.addTarget(self, action: #selector(kakaoSignInButtonPress), for: .touchUpInside)
        view.addSubview(kakaoButton)
        
        // AutoLayout
        kakaoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            kakaoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            kakaoButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            kakaoButton.widthAnchor.constraint(equalToConstant: 200),
            kakaoButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    // 카카오 로그인 버튼 클릭 시
    @objc
    func kakaoSignInButtonPress() {
        // 카카오톡 설치 여부 확인
        if UserApi.isKakaoTalkLoginAvailable() {
            // 카카오톡 로그인. api 호출 결과를 클로저로 전달.
            loginWithApp()
        } else {
            // 만약, 카카오톡이 깔려있지 않을 경우에는 웹 브라우저로 카카오 로그인함.
            loginWithWeb()
        }
    }
}

// MARK: - Kakao Login Extensions

extension ViewController {
    
    // 카카오톡 앱으로 로그인
    func loginWithApp() {
        UserApi.shared.loginWithKakaoTalk {(_, error) in
            if let error = error {
                print(error)
            } else {
                print("loginWithKakaoTalk() success.")
                
                UserApi.shared.me {(user, error) in
                    if let error = error {
                        print(error)
                    } else {
                        
                    }
                }
            }
        }
    }
    
    // 카카오톡 웹으로 로그인
    func loginWithWeb() {
        UserApi.shared.loginWithKakaoAccount {(_, error) in
            if let error = error {
                print(error)
            } else {
                print("loginWithKakaoAccount() success.")
                
                UserApi.shared.me {(user, error) in
                    if let error = error {
                        print(error)
                    } else {
                        
                    }
                }
            }
        }
    }
}

