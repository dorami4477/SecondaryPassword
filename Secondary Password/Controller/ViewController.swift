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
    
    //로그인 버튼 이벤트
    @objc func loginButtonTapped(){
        guard let idText = loginView.idTextField.text else { return }
        guard let pwText = loginView.pwTextField.text else { return }
        //아이디 있는지 확인
        if findId(id: idText){
            loginView.warningLabel.text = ""
            
            //아이디 있다면 아이디와 비번 확인
            if matchingIdPw(id: idText, pw: pwText){
                loginView.warningLabel.text = ""
                
                let mainVC = MyKeyBoardViewController()
                mainVC.uerID = idText
                mainVC.modalPresentationStyle = .popover
                present(mainVC, animated: true, completion: nil)
                
            }else{
                print("\(idText)&\(pwText)")
                loginView.warningLabel.text = "패스워드가 일치하지 않습니다"
            }
        }else{
            loginView.warningLabel.text = "존재하지 않는 ID입니다"
        }
    }
    
}



