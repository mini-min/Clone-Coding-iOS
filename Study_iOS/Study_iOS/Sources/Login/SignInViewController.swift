//
//  SignInViewController.swift
//  Study_iOS
//
//  Created by 민 on 2021/09/17.
//

import UIKit

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
    
}
