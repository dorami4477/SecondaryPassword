//
//  ViewController.swift
//  Secondary Password
//
//  Created by 박다현 on 4/27/24.
//

import UIKit

class ViewController: UIViewController {
    
    let loginView = LoginView()

    override func loadView() {
        view = loginView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTarget()
    }


    func setupAddTarget(){
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc func loginButtonTapped(){
        print("ddd")
        //아이디 있는지 확인
        guard let idText = loginView.idTextField.text else { return }
        guard let pwText = loginView.pwTextField.text else { return }
        if findId(id: idText){
            loginView.warningLabel.text = ""
            if matchingIdPw(id: idText, pw: pwText){
                loginView.warningLabel.text = ""
                
                let mainVC = MainViewController()
                mainVC.modalPresentationStyle = .fullScreen
                present(mainVC, animated: true, completion: nil)
                
            }else{
                loginView.warningLabel.text = "패스워드가 일치하지 않습니다"
            }
        }else{
            loginView.warningLabel.text = "존재하지 않는 ID입니다"
        }
    }
    
}



