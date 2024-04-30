//
//  MainViewController.swift
//  Secondary Password
//
//  Created by 박다현 on 4/27/24.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.alertButton.addTarget(self, action: #selector(alertButtonTapped), for: .touchUpInside)
    }
    
    //경고창 이벤트
    @objc func alertButtonTapped(){
            let alert = UIAlertController(title: "알림", message: "알림창입니다. 확인버튼을 눌러보세요.", preferredStyle: .alert)
            let success = UIAlertAction(title: "확인", style: .default) { action in
                print("확인되었습니다. ")
            }
            let cancel = UIAlertAction(title: "취소", style: .cancel) { cancel in
                print("취소되었습니다. ")
            }
            
            alert.addAction(success)
            alert.addAction(cancel)
            
            present(alert, animated: true, completion: nil)
        }
}
