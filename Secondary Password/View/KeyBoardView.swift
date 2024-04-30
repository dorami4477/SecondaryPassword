//
//  keyBoardView.swift
//  Secondary Password
//
//  Created by 박다현 on 4/27/24.
//

import UIKit

final class KeyBoardView:UIView{
    
    var mainText:UILabel = {
        let label = UILabel()
        label.text = "비밀번호를 눌러주세요."
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        return label
    }()
    private let mainText02:UILabel = {
        let label = UILabel()
        label.text = "숫자 4자리 + 영문자 1자리"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .gray
        return label
    }()
    //두번째 비번 동그라미
    var pwCircle0:UIView = UIView()
    var pwCircle1:UIView = UIView()
    var pwCircle2:UIView = UIView()
    var pwCircle3:UIView = UIView()
    let pwCircle4:UILabel = UILabel()
    var pwCircle5:UIView = UIView()
    
    //비번 입력 키보드
    var keyButtton0:UIButton = UIButton()
    var keyButtton1:UIButton = UIButton()
    var keyButtton2:UIButton = UIButton()
    var keyButtton3:UIButton = UIButton()
    var keyButtton4:UIButton = UIButton()
    var keyButtton5:UIButton = UIButton()
    var keyButtton6:UIButton = UIButton()
    var keyButtton7:UIButton = UIButton()
    var keyButtton8:UIButton = UIButton()
    var keyButtton9:UIButton = UIButton()
    var keyButtton10:UIButton = UIButton()
    var keyButtton11:UIButton = UIButton()
    var keyButtton12:UIButton = UIButton()
    var keyButtton13:UIButton = UIButton()
    var keyButtton14:UIButton = UIButton()
    var keyButtton15:UIButton = UIButton()
    var keyButtton16:UIButton = UIButton()
    var keyButtton17:UIButton = UIButton()
    var keyButtton18:UIButton = UIButton()
    var keyButtton19:UIButton = UIButton()
    var keyButtton20:UIButton = UIButton()
    var keyButtton21:UIButton = UIButton()
    var keyButtton22:UIButton = UIButton()
    var keyButtton23:UIButton = UIButton()
    var keyButtton24:UIButton = UIButton()
    var keyButtton25:UIButton = UIButton()
    var keyButtton26:UIButton = UIButton()

    //동그라미와 키보드 버튼 배열에 담기
    lazy var pwCircles:[UIView] = [pwCircle0, pwCircle1, pwCircle2, pwCircle3, pwCircle5]
    lazy var keyButtons:[UIButton] = [keyButtton0, keyButtton1,keyButtton2,keyButtton3,keyButtton4,keyButtton5,keyButtton6,keyButtton7,keyButtton8, keyButtton9,keyButtton10, keyButtton11,keyButtton12,keyButtton13,keyButtton14,keyButtton15,keyButtton16,keyButtton17,keyButtton18, keyButtton19,keyButtton20, keyButtton21,keyButtton22,keyButtton23,keyButtton24,keyButtton25]
    
    //스택뷰
    private lazy var textStactView:UIStackView = {
        let stview = UIStackView(arrangedSubviews: [mainText, mainText02, pWstackView])
        stview.spacing = 5
        stview.axis = .vertical
        stview.distribution = .equalSpacing
        stview.alignment = .center
        return stview
    }()
    
    private lazy var pWstackView:UIStackView = {
        let stview = UIStackView(arrangedSubviews: [pwCircle0, pwCircle1, pwCircle2, pwCircle3, pwCircle4, pwCircle5])
        stview.spacing = 5
        stview.axis = .horizontal
        stview.distribution = .equalSpacing
        stview.alignment = .center
        return stview
    }()
    
    
    private lazy var stackViewRow1:UIStackView = {
        let stview = UIStackView(arrangedSubviews: [keyButtton0, keyButtton1, keyButtton2,keyButtton3, keyButtton4, keyButtton5, keyButtton6])
        stview.spacing = 10
        stview.axis = .horizontal
        stview.distribution = .fillEqually
        stview.alignment = .fill
        return stview
    }()
    
    private lazy var stackViewRow2:UIStackView = {
        let stview = UIStackView(arrangedSubviews: [keyButtton7, keyButtton8, keyButtton9,keyButtton10, keyButtton11, keyButtton12, keyButtton13])
        stview.spacing = 10
        stview.axis = .horizontal
        stview.distribution = .fillEqually
        stview.alignment = .fill
        return stview
    }()
    
    private lazy var stackViewRow3:UIStackView = {
        let stview = UIStackView(arrangedSubviews: [keyButtton14, keyButtton15, keyButtton16,keyButtton17, keyButtton18, keyButtton19, keyButtton20])
        stview.spacing = 10
        stview.axis = .horizontal
        stview.distribution = .fillEqually
        stview.alignment = .fill
        return stview
    }()
    
    private lazy var stackViewRow4:UIStackView = {
        let stview = UIStackView(arrangedSubviews: [keyButtton21, keyButtton22, keyButtton23,keyButtton24, keyButtton25, keyButtton26])
        stview.spacing = 10
        stview.axis = .horizontal
        stview.distribution = .fillEqually
        stview.alignment = .fill
        return stview
    }()
    
    private lazy var allWrapStackView:UIStackView = {
        let stview = UIStackView(arrangedSubviews: [stackViewRow1, stackViewRow2, stackViewRow3, stackViewRow4])
        stview.spacing = 10
        stview.axis = .vertical
        stview.distribution = .fillEqually
        stview.alignment = .fill
        return stview
    }()

    // 키자판 label
    let numbers:Set<Int> = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
    let alphbat:Set<String> = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupAutoLayout()
        setButtonLabel(checkNumOrAlphbat:true)
    }
    
    
    override func layoutSubviews(){
        super.layoutSubviews()
        pwCircles.forEach { circle in
            circle.layer.cornerRadius = circle.bounds.width / 2
            circle.clipsToBounds = true
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //UI셋팅
    func setupUI(){
        backgroundColor = UIColor(red: 0.10, green: 0.13, blue: 0.21, alpha: 1.00)
        [textStactView, allWrapStackView].forEach{addSubview($0)}
        keyButtton26.setImage(UIImage(systemName: "arrowshape.backward.fill"), for: .normal)
        keyButtton26.tintColor = .white

        keyButtons.forEach { button in
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 50).isActive = true
            button.setTitleColor(.black, for: .normal)
            button.isEnabled = false
        }
        pwCircles.forEach { circle in
            circle.backgroundColor = .lightGray
            circle.translatesAutoresizingMaskIntoConstraints = false
            circle.widthAnchor.constraint(equalToConstant: 15).isActive = true
            circle.heightAnchor.constraint(equalToConstant: 15).isActive = true
        }
        pwCircle4.text = "+"
        pwCircle4.textColor = .white
    }
    

    //키보드가 숫자 또는 알파벳으로 셋팅
    func setButtonLabel(checkNumOrAlphbat:Bool){
        var i = 0
        var j = 0
        if checkNumOrAlphbat{
            keyButtons.forEach {
                $0.isEnabled = false
                $0.setTitle("", for: .normal)
            }
            numbers.forEach { number in
                keyButtons[i].setTitle(String(number), for: .normal)
                keyButtons[i].setTitleColor(.white, for: .normal)
                keyButtons[i].tag = number
                keyButtons[i].isEnabled = true
                i += 1
            }
        }else{
            alphbat.forEach { alphbat in
                keyButtons[j].setTitle(alphbat, for: .normal)
                keyButtons[j].setTitleColor(.white, for: .normal)
                keyButtons[j].isEnabled = true
                j += 1
            }
        }
    }
    
    //오토레이아웃
    func setupAutoLayout(){
        textStactView.translatesAutoresizingMaskIntoConstraints = false
        allWrapStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textStactView.widthAnchor.constraint(equalToConstant: 200),
            textStactView.centerXAnchor.constraint(equalTo: centerXAnchor),
            textStactView.bottomAnchor.constraint(equalTo: allWrapStackView.topAnchor, constant: -40),
            allWrapStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            allWrapStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            allWrapStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

    }
    
}
