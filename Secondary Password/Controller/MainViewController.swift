//
//  MainViewController.swift
//  Secondary Password
//
//  Created by 박다현 on 4/27/24.
//

import UIKit

class MainViewController: UIViewController {
    var textLabel:UILabel = {
        let label = UILabel()
        label.text = "서비스 접속 성공"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(textLabel)
        setupAutoLayout()
    }
    
    private func setupAutoLayout(){
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }


}
