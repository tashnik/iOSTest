//
//  ITLoginButton.swift
//  iOSTest
//
//  Created by Tashnik on 5/20/21.
//  Copyright © 2021 D&ATechnologies. All rights reserved.
//

import UIKit

class ITLoginButton: UIButton {

  let loginImageView = ITMainMenuImage(image: UIImage(named: "ic_login")!)
  let loginLabel = ITMainMenuLabel(textAlignment: .left, fontSize: 16, text: "LOGIN")
 

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init() {
    
    super.init(frame: .zero)
    self.backgroundColor = UIColor.white.withAlphaComponent(0.8)
    configure()
  }
  
  private func configure() {
    
    layer.cornerRadius = 10
    setTitleColor(.black, for: .normal)
    titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    translatesAutoresizingMaskIntoConstraints = false
    
    addImage()
    addLabel()
  }
  
  func addImage() {
    addSubview(loginImageView)
    
    NSLayoutConstraint.activate([
      loginImageView.leadingAnchor.constraint(equalTo: imageView!.leadingAnchor, constant: 22),
      loginImageView.heightAnchor.constraint(equalToConstant: 24),
      loginImageView.widthAnchor.constraint(equalToConstant: 24),
      loginImageView.topAnchor.constraint(equalTo: imageView!.topAnchor, constant: 15.5)
    ])
  }
  
  func addLabel() {
    addSubview(loginLabel)
    
    NSLayoutConstraint.activate([
      loginLabel.leadingAnchor.constraint(equalTo: loginImageView.trailingAnchor, constant: 16),
      loginLabel.centerYAnchor.constraint(equalTo: loginImageView.centerYAnchor)
    ])
  }
  
  
  
//  func configureNewChatButton() {
//
//    view.addSubview(newChatButton)
//    newChatButton.addTarget(self, action: #selector(pushChatViewController), for: .touchUpInside)
//
//    if #available(iOS 11.0, *) {
//      NSLayoutConstraint.activate([
//        newChatButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 227),
//        newChatButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
//        newChatButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
//        newChatButton.heightAnchor.constraint(equalToConstant: 55)
//      ])
//    } else {
//      // Fallback on earlier versions
//    }
//  }

}
