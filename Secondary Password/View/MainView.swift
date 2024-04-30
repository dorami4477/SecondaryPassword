//
//  MainView.swift
//  Secondary Password
//
//  Created by 박다현 on 4/30/24.
//

import UIKit

final class MainView: UIView {
    private let textLabel:UILabel = {
        let label = UILabel()
        label.text = "서비스 접속 성공"
        return label
    }()
    let alertButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("알림", for: .normal)
        btn.backgroundColor = .systemBlue
        return btn
    }()
    
    private lazy var stackView:UIStackView = {
        let sv = UIStackView(arrangedSubviews: [textLabel,alertButton])
        sv.axis = .vertical
        sv.spacing = 10
        sv.distribution = .fillEqually
        sv.alignment = .fill
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(stackView)
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupAutoLayout(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

}
