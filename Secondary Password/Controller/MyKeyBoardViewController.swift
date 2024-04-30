//
//  MyKeyBoardViewController.swift
//  Secondary Password
//
//  Created by 박다현 on 4/27/24.
//

import UIKit

class MyKeyBoardViewController: UIViewController {
    
    let keyBoardView = KeyBoardView()
    var secondaryPW:[String] = []
    var uerID:String = ""
    
    //view
    override func loadView() {
        super.loadView()
        view = keyBoardView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonTapped()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        keyBoardView.pwCircles.forEach { circle in
            circle.layer.cornerRadius = circle.bounds.width / 2
            circle.clipsToBounds = true
        }
    }
    
    //버튼 눌렀을때 이벤트
    func buttonTapped(){
        keyBoardView.keyButtons.forEach { button in
            button.addTarget(self, action: #selector(keyButtonTapped), for: .touchUpInside)
        }
        keyBoardView.keyButtton26.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - 키보드 눌렀을때 이벤트
    @objc func keyButtonTapped(_ sender:UIButton){
        //3개보다 적으면 배열에 비번 담기
        if secondaryPW.count < 3{
        keyBoardView.mainText.text = "비밀번호를 눌러주세요."
        secondaryPW.append(String(sender.tag))
        keyBoardView.pwCircles[secondaryPW.count - 1].backgroundColor = .white

        //3개면 키보드 전환
        }else if secondaryPW.count == 3{
            secondaryPW.append(String(sender.tag))
            keyBoardView.pwCircles[secondaryPW.count - 1].backgroundColor = .white
            keyBoardView.setButtonLabel(checkNumOrAlphbat: false)
            
        //3개보다 크면 알파벳 담은 후 비번 확인
        }else if  secondaryPW.count > 3{
            secondaryPW.append(sender.titleLabel?.text ?? "A")
            keyBoardView.pwCircles[secondaryPW.count - 1].backgroundColor = .white
            let secondPW = secondaryPW.joined()
            
            // 비번이 맞는지 확인
            if checkSecondPw(id: uerID, secondPW: secondPW){
                print("비번맞음")
                let mainVC = MainViewController()
                mainVC.modalPresentationStyle = .fullScreen
                present(mainVC, animated: true, completion: nil)
            }else{
                //비번 틀리면 리셋
                print("비번틀리다")
                keyBoardView.mainText.text = "비밀번호가 맞지 않아요"
                secondaryPW = []
                keyBoardView.pwCircles.forEach { circle in
                    circle.backgroundColor = .lightGray
                }
                keyBoardView.setButtonLabel(checkNumOrAlphbat: true)
            }
        }
    }
    
    // 지우기(back)버튼 눌렀을때
    @objc func backButtonTapped(){
        secondaryPW.removeLast()
        keyBoardView.pwCircles[secondaryPW.count].backgroundColor = .lightGray
        if secondaryPW.count <= 3{
            keyBoardView.setButtonLabel(checkNumOrAlphbat: true)
        }
        print(secondaryPW)
    }
}
