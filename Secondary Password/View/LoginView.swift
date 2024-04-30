//
//  LoginView.swift
//  Secondary Password
//
//  Created by 박다현 on 4/27/24.
//

import UIKit

class LoginView: UIView {
    // MARK: - UI변수 선언
    private lazy var textFieldStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [idTextFieldView, pwTextFieldView, warningLabel, loginButton])
        stview.spacing = 10
        stview.axis = .vertical
        stview.distribution = .fillEqually
        stview.alignment = .fill
        return stview
    }()
    
    private lazy var idTextFieldView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [idLabel, idTextField])
        stview.spacing = 0
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        return stview
    }()
    
    private let idLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "아이디"
        return label
    }()
    
    lazy var idTextField:UITextField = {
        let tf = UITextField()
        tf.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        tf.layer.cornerRadius = 5
        tf.clipsToBounds = true
        tf.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 0.0))
        tf.leftViewMode = .always
        tf.clearButtonMode = .always
        tf.layer.borderWidth = 1
        tf.frame.size.height = 48
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        return tf
    }()
    
    private lazy var pwTextFieldView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [pwLabel, pwTextField])
        stview.spacing = 0
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        return stview
    }()
    
    private let pwLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "비밀번호"
        return label
    }()
    
    lazy var pwTextField:UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 48
        tf.layer.cornerRadius = 5
        tf.clipsToBounds = true
        tf.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 0.0))
        tf.leftViewMode = .always
        tf.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        tf.layer.borderWidth = 1
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.isSecureTextEntry = true
        tf.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        return tf
    }()
    
     let warningLabel:UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .red
        label.textAlignment = .center
        return label
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 5
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isEnabled = true
        return button
    }()
    
    private let textViewHeight: CGFloat = 48
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        idTextField.delegate = self
        pwTextField.delegate = self
        addSubview(textFieldStackView)
        setupAutoLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //오토레이아웃
    private func setupAutoLayout(){
        textFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        pwLabel.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            idLabel.widthAnchor.constraint(equalToConstant: 70),
            pwLabel.widthAnchor.constraint(equalToConstant: 70),
            
            textFieldStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            textFieldStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            textFieldStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            textFieldStackView.heightAnchor.constraint(equalToConstant: textViewHeight*4 + 30),
            
            loginButton.heightAnchor.constraint(equalToConstant: textViewHeight),
        ])
    }
}

// MARK: - UITextFieldDelegate
extension LoginView:UITextFieldDelegate{
    //아이디 비번이 모두 적히면 버튼 활성화
    @objc private func textFieldEditingChanged(_ textField: UITextField) {
        warningLabel.text = ""
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        guard
            let id = idTextField.text, !id.isEmpty,
            let password = pwTextField.text, !password.isEmpty
        else {
            loginButton.backgroundColor = .gray
            loginButton.isEnabled = false
            return
        }
        loginButton.backgroundColor = .systemBlue
        loginButton.isEnabled = true
    }
}
