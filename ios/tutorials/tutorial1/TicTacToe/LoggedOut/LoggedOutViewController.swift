//
//  LoggedOutViewController.swift
//  TicTacToe
//
//  Created by 정연문 on 2022/01/11.
//  Copyright © 2022 Uber. All rights reserved.
//

import RIBs
import RxSwift
import UIKit
import SnapKit

protocol LoggedOutPresentableListener: AnyObject {
  // TODO: Declare properties and methods that the view controller can invoke to perform
  // business logic, such as signIn(). This protocol is implemented by the corresponding
  // interactor class.
  
  func login(player1Name: String?, player2Name: String?)
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {
  
  // MARK: - Properties
  weak var listener: LoggedOutPresentableListener?
  
  let player1Field: UITextField = {
    let textField = UITextField()
    textField.layer.borderWidth = 1
    textField.layer.borderColor = UIColor.orange.cgColor
    textField.placeholder = " Player 1 Name"
    return textField
  }()
  
  let player2Field: UITextField = {
    let textField = UITextField()
    textField.layer.borderWidth = 1
    textField.layer.borderColor = UIColor.orange.cgColor
    textField.placeholder = " Player 2 Name"
    return textField
  }()
  
  let loginButton: UIButton = {
    let button = UIButton()
    button.setTitle("로그인", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
    button.setTitleColor(UIColor.white, for: .normal)
    button.setTitleColor(UIColor.white.withAlphaComponent(0.3), for: .highlighted)
    button.layer.cornerRadius = 4
    button.backgroundColor = UIColor.orange
    button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    return button
  }()
  
  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
}

// MARK: - Configure UI
extension LoggedOutViewController {
  func configureUI() {
    view.backgroundColor = UIColor.white
    
    view.addSubview(player1Field)
    player1Field.snp.makeConstraints { (make) in
      make.top.equalToSuperview().offset(100)
      make.leading.trailing.equalToSuperview().inset(40)
      make.height.equalTo(40)
    }
    
    view.addSubview(player2Field)
    player2Field.snp.makeConstraints { (make) in
      make.top.equalTo(player1Field.snp.bottom).offset(20)
      make.leading.trailing.height.equalTo(player1Field)
    }
    
    view.addSubview(loginButton)
    loginButton.snp.makeConstraints { (make) in
      make.top.equalTo(player2Field.snp.bottom).offset(20)
      make.leading.trailing.height.equalTo(player1Field)
    }
  }
  
  @objc private func didTapLoginButton() {
    listener?.login(player1Name: player1Field.text, player2Name: player2Field.text)
  }
}
